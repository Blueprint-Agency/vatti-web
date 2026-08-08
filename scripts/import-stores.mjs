// research/stores-rest.json + research/stores.json  ->  data/sql/stores.sql
//
// Run this when the scrape changes. The generated SQL is the committed source of
// truth and is what gets reviewed in PRs; nothing reads either JSON at build.
//
//   node scripts/import-stores.mjs
//
// TWO sources, because neither is complete on its own:
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

import { readFileSync, writeFileSync, mkdirSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

import { required } from "./env.mjs";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");
const rest = JSON.parse(readFileSync(join(root, "research/stores-rest.json"), "utf8"));
const { stores, regions } = JSON.parse(readFileSync(join(root, "research/stores.json"), "utf8"));

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
const CDN = required("R2_PUBLIC_HOST").replace(/\/$/, "");
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

// products.sql writes image rows with literal ids and runs first, so no explicit
// id here. OR IGNORE + a lookup on the UNIQUE legacy_url keeps a shared file on
// one row. db-build.mjs pins the file order.
const imageRows = [];
const seenImage = new Set();
function imageFor(url, alt) {
  const legacy = unwrapJetpack(url);
  if (!seenImage.has(legacy)) {
    seenImage.add(legacy);
    imageRows.push(
      `INSERT OR IGNORE INTO image (url, legacy_url, alt) VALUES ` +
        `(${q(toCdn(legacy))}, ${q(legacy)}, ${q(alt)});`
    );
  }
  return `(SELECT id FROM image WHERE legacy_url = ${q(legacy)})`;
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
for (const { store } of matched) {
  if (!REGION_ORDER.includes(store.regionSlug)) {
    throw new Error(`unmapped region "${store.regionSlug}" on ${store.name}`);
  }
  if (!REGION_NAME[store.regionSlug]) {
    throw new Error(`no taxonomy display name for region "${store.regionSlug}"`);
  }
}
const ordered = [...matched].sort(
  (a, b) =>
    REGION_ORDER.indexOf(a.store.regionSlug) - REGION_ORDER.indexOf(b.store.regionSlug) ||
    a.store.name.localeCompare(b.store.name)
);

const body = [];
const noDirections = [];

ordered.forEach(({ store: s, wp }, i) => {
  if (!s.directionsUrl) noDirections.push(wp.slug);
  body.push(
    `INSERT INTO store (id, slug, path, wp_id, name, region, region_slug, address, phone, ` +
      `directions_url, image_id, sort_order) VALUES (` +
      [
        i + 1,
        q(wp.slug),
        q(`store/${wp.slug}`),
        wp.id,
        // the decoded WordPress title is the canonical name; the scrape agrees
        // on 74 of 75 and differs only by an en-dash entity on the last
        q(decode(wp.title)),
        q(REGION_NAME[s.regionSlug]),
        q(s.regionSlug),
        q(s.address),
        q(s.phone),
        q(s.directionsUrl),
        s.image ? imageFor(s.image, decode(wp.title)) : "NULL",
        i,
      ].join(", ") +
      `);`
  );
});

const sql = [...L, ...imageRows, "", ...body, ""].join("\n");
mkdirSync(join(root, "data/sql"), { recursive: true });
writeFileSync(join(root, "data/sql/stores.sql"), sql);

const byRegion = {};
ordered.forEach(({ store: s }) => (byRegion[s.regionSlug] = (byRegion[s.regionSlug] || 0) + 1));
const slugAgrees = matched.filter(({ store, wp }) => store.slug === wp.slug).length;

console.log(`stores        ${ordered.length}`);
console.log(`join          ${matched.length}/${stores.length} matched on featured-image filename, 0 dropped`);
console.log(`              names cross-check: ${matched.length}/${matched.length} agree`);
console.log(`slugs         ${slugAgrees}/${matched.length} of the stores.json slugs agreed with WordPress`);
console.log(`              (the other ${matched.length - slugAgrees} would have 404'd — WordPress wins)`);
console.log(`regions       ${Object.entries(byRegion).map(([k, v]) => `${k}=${v}`).join("  ")}`);
console.log(`images        ${seenImage.size} unique`);
console.log(`jetpack       ${unwrappedJetpack} i0.wp.com URLs unwrapped`);
console.log(`no directions ${noDirections.length}${noDirections.length ? " -> " + noDirections.join(", ") : ""}`);
console.log(`wrote         data/sql/stores.sql`);
