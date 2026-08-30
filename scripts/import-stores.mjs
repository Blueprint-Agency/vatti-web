// research/stores-rest.json + research/stores.json + research/stores-local.json
//   ->  data/sql/stores.sql
//
// Run this when the scrape changes or a dealer is added. The generated SQL is the
// committed source of truth and is what gets reviewed in PRs; nothing reads any
// of the JSON at build.
//
//   node scripts/import-stores.mjs
//
// TWO sources for the scraped dealers, because neither is complete on its own:
//
//   research/stores-rest.json  the authoritative slug and permalink, straight
//                              from WordPress, plus each record's featured-media
//                              source_url. Refresh with scripts/fetch-stores-rest.mjs.
//                              It carries no address or phone — `acf` is empty on
//                              all 75 and `content` on 74 of 75.
//   research/stores.json       the /store-locations/ page scrape, which has all
//                              the rich fields and STALE root-level permalinks.
//
// research/stores.json's slugs are wrong: they agree with WordPress on only 14
// of 75 rows, and the root paths they imply (/adamas/) 301 to the homepage
// rather than 404, so probing them reads as success. Building routes from them
// would ship 61 URLs that 404 — see CLAUDE.md § The one rule.
//
// The join key is the FEATURED IMAGE FILENAME: 75 distinct basenames, no
// collisions, 75/75 matched. Name is not the key — two dealers (UNION MOTORS,
// EUROTAN ENTERPRISE) each trade from two branches under one name, and the CPT
// pages are empty stubs with no address to break the tie. Slug is never used to
// match, since the two files disagree on it 61 times.
//
// The eWarranty form's 80 hardcoded dealer options are a third list that was
// never scraped, so nothing here flags which stores appear in it.
//
//   research/stores-local.json  dealers appointed since the scrape. Not in
//                               WordPress, so they have no wp_id and no legacy
//                               permalink; hand-maintained, and the only file
//                               here you edit to add a dealer.

import { readFileSync, writeFileSync, mkdirSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

import { CDN } from "./cdn.mjs";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");
const rest = JSON.parse(readFileSync(join(root, "research/stores-rest.json"), "utf8"));
const { stores, regions } = JSON.parse(readFileSync(join(root, "research/stores.json"), "utf8"));
const local = JSON.parse(readFileSync(join(root, "research/stores-local.json"), "utf8")).stores;

const q = (v) =>
  v === null || v === undefined || v === "" ? "NULL" : `'${String(v).replace(/'/g, "''")}'`;

// ── name matching ──────────────────────────────────────────────────────────
// WordPress returns titles HTML-encoded ("&#8211;", "&amp;") while the page
// scrape has them decoded, so the two disagree on punctuation, not on words.
const NAMED = { amp: "&", lt: "<", gt: ">", quot: '"', apos: "'", nbsp: " ", ndash: "-", mdash: "-" };
const decode = (s) =>
  String(s)
    .replace(/&#(\d+);/g, (_, d) => String.fromCharCode(+d))
    .replace(/&#x([0-9a-f]+);/gi, (_, h) => String.fromCharCode(parseInt(h, 16)))
    .replace(/&([a-z]+);/gi, (m, n) => NAMED[n.toLowerCase()] ?? m);

// Fold every dash variant and drop punctuation entirely. Deliberately keeps the
// words: "EASTONE GALLERY & MARKETING" and "Eastone Gallery Sdn Bhd - Tunjung"
// are two different dealers and must not collapse onto each other.
const norm = (s) =>
  decode(s)
    .toLowerCase()
    .replace(/[‐-―]/g, "-")
    .replace(/[^a-z0-9]+/g, " ")
    .trim();

// Jetpack params and URL-encoding have to come off before the filenames compare.
const basename = (u) =>
  decodeURIComponent(String(u).split("?")[0].split("/").pop()).toLowerCase();

const restByImage = new Map();
for (const r of rest) {
  const k = basename(r.featured_image);
  if (restByImage.has(k)) throw new Error(`two WordPress stores share image ${k}`);
  restByImage.set(k, r);
}

const matched = [];
const unmatched = [];
for (const store of stores) {
  const wp = restByImage.get(basename(store.image));
  if (!wp) unmatched.push(`${store.name} (image: ${basename(store.image)})`);
  else matched.push({ store, wp });
}

// Never silently drop a dealer — a missing store is a 404 on a live URL.
if (unmatched.length) {
  throw new Error(`store join failed for ${unmatched.length} of ${stores.length}:\n  ${unmatched.join("\n  ")}`);
}
if (matched.length !== rest.length) {
  throw new Error(`joined ${matched.length} stores, WordPress has ${rest.length}`);
}

// Independent cross-check. The image filename is what pairs the rows; if the
// names then disagree, the pairing is wrong and the URLs would be wrong with it.
const crossed = matched.filter(({ store, wp }) => norm(store.name) !== norm(wp.title));
if (crossed.length) {
  throw new Error(
    `image join disagrees with the name on ${crossed.length} store(s):\n  ` +
      crossed.map(({ store, wp }) => `${store.name} -> ${wp.title} (${wp.slug})`).join("\n  ")
  );
}

// The invariant that actually holds: every live dealer page is /store/<slug>/,
// with the slug from WordPress. (The earlier version of this script asserted the
// opposite — that permalinks were flat at root — and passed, because it was
// checking research/stores.json against itself.)
for (const { wp } of matched) {
  if (wp.link !== `https://vattimalaysia.com/store/${wp.slug}/`) {
    throw new Error(`unexpected store permalink: ${wp.link}`);
  }
}

// ── media ──────────────────────────────────────────────────────────────────
// Same rules as the article importer: store photos come through Jetpack's CDN
// with resize params, so unwrap to the origin upload path, then prefix-swap to
// R2. Neither host may survive into the DB — see CLAUDE.md § Conventions.
const UPLOADS = "https://vattimalaysia.com/wp-content/uploads/";
const toCdn = (url) =>
  url.startsWith(UPLOADS) ? `${CDN}/${url.slice(UPLOADS.length)}` : url;

let unwrappedJetpack = 0;
const unwrapJetpack = (url) => {
  const s = String(url).replace(/^https?:\/\/i[0-9]\.wp\.com\//, () => {
    unwrappedJetpack++;
    return "https://";
  });
  return s.split("?")[0].split("#")[0];
};

// Once per store: unwrapJetpack counts what it rewrites, so calling it twice for
// the same photo would double the tally in the summary.
const scrapedImage = (url) => {
  const legacy = unwrapJetpack(url);
  return { cdn: toCdn(legacy), legacy };
};

// products.sql writes image rows with literal ids and runs first, so no explicit
// id here. OR IGNORE + a lookup on the UNIQUE legacy_url keeps a shared file on
// one row. db-build.mjs pins the file order.
//
// A locally added dealer's photo never lived on WordPress, so it has no
// legacy_url to 301 and nothing to key the lookup on but `url`. Both shapes go
// through here so the dedupe set is shared.
const imageRows = [];
const seenImage = new Set();
function imageFor({ cdn, legacy }, alt) {
  const key = legacy ?? cdn;
  if (!seenImage.has(key)) {
    seenImage.add(key);
    imageRows.push(
      `INSERT OR IGNORE INTO image (url, legacy_url, alt) VALUES ` +
        `(${q(cdn)}, ${q(legacy)}, ${q(alt)});`
    );
  }
  return legacy
    ? `(SELECT id FROM image WHERE legacy_url = ${q(legacy)})`
    : `(SELECT id FROM image WHERE url = ${q(cdn)})`;
}

// ── build ──────────────────────────────────────────────────────────────────
const L = [];
L.push("-- GENERATED by scripts/import-stores.mjs — do not hand-edit.");
L.push("-- Regenerate with: node scripts/import-stores.mjs\n");

// Grouped by region, then alphabetical inside it — the order the directory
// renders in, so sort_order needs no work at query time.
const REGION_ORDER = [
  "klang-valley-malaysia",
  "southern-region-malaysia",
  "northern-region-malaysia",
  "east-coast-malaysia",
  "sabah-sarawak",
];
// Display names come from the taxonomy list, NOT from each store's `region`
// field. The two disagree: the per-store field flattens "Sabah & Sarawak" to
// "Sabah Sarawak", while stores.json's `regions` array and the live
// /store-locations/ headings both keep the ampersand. Templates render this
// value verbatim, so the ampersand has to be in the data. Verified against the
// live page 9 Aug 2026 — the other four names are byte-identical in both.
const REGION_NAME = Object.fromEntries(
  regions.map((r) => {
    const name = r.replace(/\s*\(\d+\)\s*$/, "").trim(); // 'Sabah & Sarawak (9)'
    return [name.toLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, ""), name];
  })
);
// One shape for both sources, so the sort, the region checks and the emitted
// row are written once. `image.legacy` is null for a local dealer — see imageFor.
const rows = [
  ...matched.map(({ store: s, wp }) => ({
    slug: wp.slug,
    wpId: wp.id,
    // the decoded WordPress title is the canonical name; the scrape agrees
    // on 74 of 75 and differs only by an en-dash entity on the last
    name: decode(wp.title),
    regionSlug: s.regionSlug,
    address: s.address,
    phone: s.phone,
    directionsUrl: s.directionsUrl,
    image: s.image ? scrapedImage(s.image) : null,
  })),
  ...local.map((s) => ({
    slug: s.slug,
    wpId: null,
    name: s.name,
    regionSlug: s.regionSlug,
    address: s.address,
    phone: s.phone ?? null,
    directionsUrl: s.directionsUrl ?? null,
    // an R2 bucket key, not a URL: the file never existed under /wp-content/
    image: s.image ? { cdn: `${CDN}/${s.image}`, legacy: null } : null,
  })),
];

for (const r of rows) {
  if (!REGION_ORDER.includes(r.regionSlug)) {
    throw new Error(`unmapped region "${r.regionSlug}" on ${r.name}`);
  }
  if (!REGION_NAME[r.regionSlug]) {
    throw new Error(`no taxonomy display name for region "${r.regionSlug}"`);
  }
}

// slug is UNIQUE and is the URL. A local addition reusing a WordPress slug would
// fail the build far from here, with nothing pointing at the file to fix.
const bySlug = new Map();
for (const r of rows) {
  if (bySlug.has(r.slug)) throw new Error(`two stores share the slug "${r.slug}"`);
  bySlug.set(r.slug, r);
}

const ordered = [...rows].sort(
  (a, b) =>
    REGION_ORDER.indexOf(a.regionSlug) - REGION_ORDER.indexOf(b.regionSlug) ||
    a.name.localeCompare(b.name)
);

const body = [];
const noDirections = [];

ordered.forEach((r, i) => {
  if (!r.directionsUrl) noDirections.push(r.slug);
  body.push(
    `INSERT INTO store (id, slug, path, wp_id, name, region, region_slug, address, phone, ` +
      `directions_url, image_id, sort_order) VALUES (` +
      [
        i + 1,
        q(r.slug),
        q(`store/${r.slug}`),
        r.wpId ?? "NULL",
        q(r.name),
        q(REGION_NAME[r.regionSlug]),
        q(r.regionSlug),
        q(r.address),
        q(r.phone),
        q(r.directionsUrl),
        r.image ? imageFor(r.image, r.name) : "NULL",
        i,
      ].join(", ") +
      `);`
  );
});

const sql = [...L, ...imageRows, "", ...body, ""].join("\n");
mkdirSync(join(root, "data/sql"), { recursive: true });
writeFileSync(join(root, "data/sql/stores.sql"), sql);

const byRegion = {};
ordered.forEach((r) => (byRegion[r.regionSlug] = (byRegion[r.regionSlug] || 0) + 1));
const slugAgrees = matched.filter(({ store, wp }) => store.slug === wp.slug).length;

console.log(`stores        ${ordered.length} (${matched.length} scraped + ${local.length} local)`);
console.log(`join          ${matched.length}/${stores.length} matched on featured-image filename, 0 dropped`);
console.log(`              names cross-check: ${matched.length}/${matched.length} agree`);
console.log(`slugs         ${slugAgrees}/${matched.length} of the stores.json slugs agreed with WordPress`);
console.log(`              (the other ${matched.length - slugAgrees} would have 404'd — WordPress wins)`);
console.log(`regions       ${Object.entries(byRegion).map(([k, v]) => `${k}=${v}`).join("  ")}`);
console.log(`images        ${seenImage.size} unique`);
console.log(`jetpack       ${unwrappedJetpack} i0.wp.com URLs unwrapped`);
console.log(`no directions ${noDirections.length}${noDirections.length ? " -> " + noDirections.join(", ") : ""}`);
console.log(`wrote         data/sql/stores.sql`);
