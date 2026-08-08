// GSC + sitemaps + WP REST + research/*.json  ->  research/url-inventory.json
//
// The definitive record of every front-facing URL on the legacy WordPress site,
// with its live status today. This replaces the Rank Math redirect export as the
// migration's proof-of-no-loss. Re-run it against the live site any time; it hits
// the network for ~600 URLs, so it is not part of the build.
//
//   node scripts/build-url-inventory.mjs
//
// GSC cannot be reached from Node (it is an MCP tool), so its export is committed
// as research/gsc-pages.json and read from disk here.

import { readFileSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");
const ORIGIN = "https://vattimalaysia.com";
const CONCURRENCY = 8;
const UPLOADS = "/wp-content/uploads/";
// Same host as next.config.ts. Kept literal here for the same reason it is there.
const CDN = "https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev";

const read = (f) => JSON.parse(readFileSync(join(root, f), "utf8"));

// ── source collection ──────────────────────────────────────────────────────
// path -> Set<source>. Paths keep their query and fragment exactly as the source
// recorded them: GSC ranks V938-Dimensions.pdf#page=2 as its own URL.
const sources = new Map();
const add = (url, source) => {
  if (!url) return;
  let path;
  try {
    const u = new URL(url, ORIGIN);
    if (u.hostname !== "vattimalaysia.com" && u.hostname !== "www.vattimalaysia.com") return;
    path = u.pathname + u.search + u.hash;
  } catch {
    return;
  }
  if (!sources.has(path)) sources.set(path, new Set());
  sources.get(path).add(source);
};

// (a) Search Console — the only source that sees URLs nothing links to.
const gsc = read("research/gsc-pages.json");
const clicks = new Map();
const impressions = new Map();
for (const [path, c, i] of gsc.rows) {
  add(path, "gsc");
  clicks.set(path, c);
  impressions.set(path, i);
}

// (b) sitemaps
const locs = (xml) => [...xml.matchAll(/<loc>([^<]+)<\/loc>/g)].map((m) => m[1].trim());
const index = await (await fetch(`${ORIGIN}/sitemap_index.xml`)).text();
const children = locs(index);
for (const child of children) {
  const xml = await (await fetch(child)).text();
  for (const loc of locs(xml)) add(loc, "sitemap");
}

// (c) WP REST — open, no auth. The CPT permalinks are the ones nothing links to.
const WP_TYPES = [
  "posts",
  "pages",
  "store",
  "kitchen-hood-categor",
  "cooker-hob-category",
  "combine-oven-cate",
  "dishwasher-cate",
  "water-purifier-cate",
];
const wpCounts = {};
for (const type of WP_TYPES) {
  let page = 1;
  let n = 0;
  for (;;) {
    const res = await fetch(`${ORIGIN}/wp-json/wp/v2/${type}?per_page=100&page=${page}&_fields=slug,link`);
    if (!res.ok) break;
    const items = await res.json();
    if (!items.length) break;
    for (const item of items) add(item.link, `wp:${type}`);
    n += items.length;
    if (items.length < 100) break;
    page += 1;
  }
  wpCounts[type] = n;
}

// (d) the committed scrape
for (const a of read("research/articles.json")) add(a.url, "research:articles");
for (const p of read("research/products.json")) add(p.url, "research:products");
const categories = read("research/categories.json");
for (const key of Object.keys(categories.redirectMap)) add(key, "research:categories");
for (const p of categories.pages) add(p.requestedUrl, "research:categories");
for (const s of read("research/stores.json").stores) add(s.permalink, "research:stores");
for (const u of Object.values(read("research/utility-pages.json"))) add(u.url, "research:utility-pages");

// Known-suspect paths that no source lists but that the rebuild must answer for.
// Probing them is how we learn whether they are live, redirected or already gone.
for (const path of [
  "/vatti-built-in-air-fryer-oven-o7559/", // letter O — the correct spelling of the live 0-digit slug
  "/contact/",
  "/home-2/",
  "/category/uncategorized/",
  "/vatti-oylimpic-hob-m821g/",
  "/vatti-range-hood-v997/",
]) {
  add(path, "probe");
}

// Category pagination: walk /page/N/ until it stops resolving, so the new archive
// pagination can match the real page count rather than a guess.
for (const slug of ["tips-tricks", "buying-guide", "recipe", "uncategorized"]) {
  for (let n = 2; n <= 12; n += 1) add(`/category/${slug}/page/${n}/`, "probe:pagination");
}

// ── live probing ───────────────────────────────────────────────────────────
// HEAD, following redirects by hand so both the first status and the final
// destination are recorded. Fragments are stripped for the request only.
const HOPS = 6;

// The host sits behind a bot filter that answers HEAD with 428 often enough to
// poison a run. Send a browser UA and retry those once with GET before believing
// the status — a false 428 would show up as a lost URL.
const UA = { "user-agent": "Mozilla/5.0 (compatible; vatti-url-inventory/1.0)" };
const FLAKY = new Set([408, 425, 428, 429, 500, 502, 503]);
const sleep = (ms) => new Promise((r) => setTimeout(r, ms));

async function probe(path) {
  const start = ORIGIN + path.split("#")[0];
  let url = start;
  let status = 0;
  const chain = [];
  for (let hop = 0; hop < HOPS; hop += 1) {
    let res;
    try {
      res = await fetch(url, { method: "HEAD", redirect: "manual", headers: UA });
      if (res.status === 405 || res.status === 501 || FLAKY.has(res.status)) {
        await sleep(1000);
        res = await fetch(url, { method: "GET", redirect: "manual", headers: UA });
      }
    } catch (err) {
      return { status: status || null, final_url: url, error: String(err.cause?.code ?? err.message), chain };
    }
    if (hop === 0) status = res.status;
    const location = res.headers.get("location");
    if (res.status >= 300 && res.status < 400 && location) {
      chain.push(res.status);
      url = new URL(location, url).toString();
      continue;
    }
    return {
      status,
      final_status: res.status,
      final_url: url,
      content_type: res.headers.get("content-type")?.split(";")[0] ?? null,
      chain,
    };
  }
  return { status, final_status: null, final_url: url, error: "redirect loop", chain };
}

// rel=canonical, for the duplicate-URL-family judgement. HTML only, and only
// where the page actually resolves — a 404 has no canonical worth reading.
async function canonicalOf(url) {
  const res = await fetch(url, { headers: { ...UA, accept: "text/html" } });
  if (!res.ok) return null;
  const html = await res.text();
  const m = html.match(/<link[^>]+rel=["']canonical["'][^>]*>/i);
  return m ? (m[0].match(/href=["']([^"']+)["']/i)?.[1] ?? null) : null;
}

async function pool(items, worker) {
  const out = new Array(items.length);
  let next = 0;
  const run = async () => {
    for (;;) {
      const i = next++;
      if (i >= items.length) return;
      out[i] = await worker(items[i], i);
    }
  };
  await Promise.all(Array.from({ length: CONCURRENCY }, run));
  return out;
}

const paths = [...sources.keys()].sort();
process.stderr.write(`probing ${paths.length} URLs at concurrency ${CONCURRENCY}...\n`);

const urls = await pool(paths, async (path) => {
  const live = await probe(path);
  const row = {
    path,
    sources: [...sources.get(path)].sort(),
    clicks: clicks.get(path) ?? 0,
    impressions: impressions.get(path) ?? 0,
    status: live.status,
    final_status: live.final_status ?? null,
    final_path: live.final_url.startsWith(ORIGIN) ? live.final_url.slice(ORIGIN.length) : live.final_url,
    content_type: live.content_type ?? null,
  };
  if (live.chain?.length > 1) row.hops = live.chain;
  if (live.error) row.error = live.error;
  if (live.status === 200 && row.content_type === "text/html") {
    row.canonical = await canonicalOf(ORIGIN + path.split("#")[0]);
  }
  // Media moves to R2 and next.config 301s the whole /wp-content/uploads/ prefix
  // there, so "does the bucket actually have it" is the real question for assets.
  if (path.startsWith(UPLOADS)) {
    const key = path.split("#")[0].split("?")[0].slice(UPLOADS.length);
    row.cdn_status = (await fetch(`${CDN}/${key}`, { method: "HEAD", headers: UA })).status;
  }
  return row;
});

// Drop the pagination probes that turned out not to exist — they were guesses,
// not legacy URLs, and a 404 guess is not part of the contract.
const kept = urls.filter((u) => !(u.sources.length === 1 && u.sources[0] === "probe:pagination" && u.status === 404));

// ── duplicate URL families ─────────────────────────────────────────────────
// Many articles are indexed at BOTH /<slug>/ and /<section>/<slug>/, and both
// earn clicks. Pair them up and work out which side wins.
//
// rel=canonical is NO help here: Rank Math emits a self-referencing canonical on
// every single 200 page, so it never points across a pair. The direction comes
// from which side the live site still serves — in all cases so far the sectioned
// path is the 200 and the root path is a 301 or a 404.
const SECTIONS = ["tips-tricks", "buying-guide", "recipe", "uncategorized"];
const byPath = new Map(kept.map((u) => [u.path, u]));
const families = [];
for (const u of kept) {
  const m = u.path.match(/^\/([^/]+)\/([^/]+)\/$/);
  if (!m || !SECTIONS.includes(m[1])) continue;
  const side = (row) => ({
    path: row.path,
    clicks: row.clicks,
    impressions: row.impressions,
    status: row.status,
    final_path: row.final_path,
    canonical: row.canonical ? new URL(row.canonical).pathname : null,
  });
  const rootRow = byPath.get(`/${m[2]}/`);
  if (!rootRow) continue;
  const live = [u, rootRow].filter((r) => r.status === 200);
  families.push({
    slug: m[2],
    sectioned: side(u),
    root: side(rootRow),
    canonical_path: live.length === 1 ? live[0].path : null,
    evidence:
      live.length === 1
        ? `${live[0].path} is the only member the live site still serves (${live[0] === u ? rootRow.path : u.path} is ${(live[0] === u ? rootRow : u).status})`
        : "ambiguous — needs an owner decision",
    root_outranks_sectioned: rootRow.clicks > u.clicks,
  });
}
families.sort((a, b) => b.root.clicks + b.sectioned.clicks - (a.root.clicks + a.sectioned.clicks));

const bySource = {};
for (const u of kept) for (const s of u.sources) bySource[s] = (bySource[s] ?? 0) + 1;

const byStatus = {};
for (const u of kept) byStatus[u.status ?? "error"] = (byStatus[u.status ?? "error"] ?? 0) + 1;

writeFileSync(
  join(root, "research/url-inventory.json"),
  JSON.stringify(
    {
      generated: new Date().toISOString().slice(0, 10),
      origin: ORIGIN,
      gsc_range: gsc.date_range,
      note: "Every front-facing legacy URL, merged from Search Console, the four sitemaps, the WP REST API and the committed scrape, each probed against the live site. scripts/urls-check.mjs replays `path` against a new deployment.",
      totals: { urls: kept.length, by_source: bySource, by_status: byStatus, wp_rest: wpCounts },
      duplicate_families: families,
      urls: kept,
    },
    null,
    2,
  ) + "\n",
);

process.stderr.write(`wrote research/url-inventory.json — ${kept.length} URLs\n`);
process.stderr.write(`  status: ${JSON.stringify(byStatus)}\n`);
process.stderr.write(`  duplicate families: ${families.length}\n`);
