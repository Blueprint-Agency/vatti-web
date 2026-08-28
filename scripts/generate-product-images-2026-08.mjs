// Converts the new studio photography into old-media/ webp keys, and writes
// data/sql/product-images-2026-08.sql to wire them into the DB.
//
//   node generate-product-images.mjs
//
// Read-only against .data/vatti.db (just built) to resolve product ids/names
// for alt text. Does not touch the DB itself — db:build re-runs the SQL file
// this script writes.
import { existsSync, mkdirSync, readdirSync, writeFileSync } from "node:fs";
import { DatabaseSync } from "node:sqlite";
import path from "node:path";
import sharp from "sharp";

const ROOT = "C:/Users/danie/vatti-web";
const SRC = "C:/Users/danie/Downloads/vatti product images/Vatti Product Image";
const OUT_DIR = path.join(ROOT, "old-media/2026/08");
const CDN = "https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/";
const SQL_OUT = path.join(ROOT, "data/sql/product-images-2026-08.sql");

mkdirSync(OUT_DIR, { recursive: true });

const db = new DatabaseSync(path.join(ROOT, ".data/vatti.db"), { readOnly: true });
const productBySlug = new Map(
  db.prepare("SELECT id, slug, name FROM product").all().map((r) => [r.slug, r])
);

// folder (relative to SRC) -> existing product slug
const EXISTING = [
  ["Cooker Hood/V993", "athena-series-lifting-type-range-hood-v993"],
  ["Cooker Hood/V999", "athena-series-lifting-type-range-hood-v999"],
  ["Cooker Hood/V991", "athena-series-lifting-type-range-hood-v991"],
  ["Cooker Hood/V931", "artemis-series-t-type-range-hood-v931"],
  ["Cooker Hood/V995", "slim-series-type-range-hood-v995"],
  ["Cooker Hood/V996", "vatti-slim-series-type-range-hood-v996"],
  ["Cooker Hood/V919", "vatti-magic-series-cooker-hood-v919"],
  ["Cooker Hood/V929", "vatti-aetheris-series-cooker-hood-v929"],
  ["Cooker Hood/V997 (Black)", "vatti-range-hood-v997"],
  ["Cooker Hood/V998", "vatti-smart-oxygen-range-hood-v998"],
  ["Cooker Hood/V938", "vatti-hidden-series-range-hood-v938"],
  ["Cooker Hood/V960", "vatti-stellar-series-cooker-hood-v960"],
  ["Cooker Hood/V917/Carbon Black", "vatti-cooker-hood-v917-carbon-grey"],

  ["Cooker Hob/C720S", "professional-series-c720s"],
  ["Cooker Hob/C821G", "professional-series-c821g"],
  ["Cooker Hob/C822G", "vatti-flexi-hob-c822g"],
  ["Cooker Hob/C823G", "vatti-flexi-hob-c823g"],
  ["Cooker Hob/C830G", "vatti-3-burner-gas-hob-c830g"],
  ["Cooker Hob/C835G", "vatti-ai-hob-c835g"],
  ["Cooker Hob/C836 (AG Grey)", "vatti-flexi-hob-c836g"],
  ["Cooker Hob/C861G", "vatti-magic-series-cooker-hob-c861g"],
  ["Cooker Hob/M822G", "vatti-oylimpic-hob-m822g"],

  ["Combi Oven/M626", "built-in-microwave-m626"],
  ["Combi Oven/VA05", "built-in-combi-oven-va05"],
  ["Combi Oven/VA06", "vatti-magic-series-combi-oven-va06"],

  ["Water Filter/DWHG01 & V818WD", "vatti-one-tap-water-purifier-wdhg01-with-v818wd"],
];

// folder -> brand-new product definition (dishwasher DWID3, two colourways)
const NEW_PRODUCTS = [
  {
    folder: "Dishwasher/DWID3 (AG Grey)",
    id: 40,
    slug: "vatti-dishwasher-dwid3-ag-grey",
    name: "Vatti Dishwasher DWID3 (AG Grey)",
    model_code: "DWID3",
    colour_variant: "AG Grey",
    variant_group: "dwid3",
    sort_order: 38,
  },
  {
    folder: "Dishwasher/DWID3 (White)",
    id: 41,
    slug: "vatti-dishwasher-dwid3-white",
    name: "Vatti Dishwasher DWID3 (White)",
    model_code: "DWID3",
    colour_variant: "White",
    variant_group: "dwid3",
    sort_order: 39,
  },
];

// Folders present on disk with no home in the DB — reported, not touched.
const UNMAPPED_FOLDERS = [
  "Cooker Hood/V917/Batik",
  "Cooker Hood/V959",
  "Cooker Hob/M821G",
  "Cooker Hob/VH IC09AL",
];

// DB products with no matching folder at all — leave their current images alone.
const UNTOUCHED_PRODUCTS = [
  "athena-series-lifting-type-range-hood-v936",
  "triple-intake-series-t-type-cooker-hood-v937",
  "vatti-cooker-hood-v917-white",
  "ceramic-cooker-hob-er3601t",
  "ceramic-cooker-hob-er5902t",
  "vatti-built-in-oven-o7549",
  "vatti-built-in-oven-o755p",
  "vatti-built-in-air-fryer-oven-07559",
  "free-standing-combi-oven-va01",
  "built-in-combi-oven-va03",
  "built-in-combi-oven-va04",
  "built-in-steam-oven-z4501",
  "vatti-dishwasher-dwbb7",
];

const PRIORITY = ["front", "front-open", "quarter-front", "quarter-front-open", "quarter-front-2", "side", "side-open"];

function suffixFor(basename) {
  const key = basename.trim().toUpperCase().replace(/\s+/g, "_");
  const table = {
    F: "front",
    F_OP: "front-open",
    QF: "quarter-front",
    QF_OP: "quarter-front-open",
    QF_02: "quarter-front-2",
    S: "side",
    S_OP: "side-open",
    OF_OP: "open-detail",
  };
  if (table[key]) return { suffix: table[key], role: key === "F" ? "hero" : "gallery" };
  const slug = basename
    .normalize("NFKD")
    .replace(/[^a-zA-Z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "")
    .toLowerCase();
  return { suffix: slug || "detail", role: "gallery" };
}

const ALT_LABEL = {
  front: "front view",
  "front-open": "front view, canopy open",
  "quarter-front": "angled view",
  "quarter-front-open": "angled view, open",
  "quarter-front-2": "angled view",
  side: "side view",
  "side-open": "side view, open",
  "open-detail": "detail view",
};

async function convertFolder(folder, slug) {
  const abs = path.join(SRC, folder);
  const files = readdirSync(abs).filter((f) => /\.(png|jpe?g|webp)$/i.test(f));
  const items = files.map((f) => {
    const base = path.basename(f, path.extname(f));
    const { suffix, role } = suffixFor(base);
    return { file: f, base, suffix, role };
  });

  // dedupe suffixes within a folder
  const seen = new Map();
  for (const it of items) {
    const n = seen.get(it.suffix) ?? 0;
    if (n > 0) it.suffix = `${it.suffix}-${n + 1}`;
    seen.set(it.suffix, n + 1);
  }

  items.sort((a, b) => {
    const ai = PRIORITY.indexOf(a.suffix);
    const bi = PRIORITY.indexOf(b.suffix);
    if (a.role === "hero") return -1;
    if (b.role === "hero") return 1;
    if (ai === -1 && bi === -1) return 0;
    if (ai === -1) return 1;
    if (bi === -1) return -1;
    return ai - bi;
  });

  const out = [];
  for (const it of items) {
    const key = `2026/08/${slug}-${it.suffix}.webp`;
    const dest = path.join(ROOT, "old-media", key);
    mkdirSync(path.dirname(dest), { recursive: true });
    const src = path.join(abs, it.file);
    const img = sharp(src).webp({ quality: 90, effort: 6 });
    await img.toFile(dest);
    const meta = await sharp(dest).metadata();
    out.push({ key, role: it.role, suffix: it.suffix, width: meta.width, height: meta.height });
  }
  return out;
}

let nextImageId = 9001;
const q = (v) => (v === null || v === undefined ? "NULL" : `'${String(v).replace(/'/g, "''")}'`);

const imageLines = [];
const productLines = [];
const productImageLines = [];
const heroUpdateLines = [];
const report = { touched: [], newProducts: [], unmapped: UNMAPPED_FOLDERS, untouched: [...UNTOUCHED_PRODUCTS] };

async function processTarget(folder, slug, name) {
  const images = await convertFolder(folder, slug);
  if (!images.length) {
    console.warn(`  (no files found in ${folder})`);
    return { heroId: null, rows: [] };
  }
  const rows = [];
  let heroId = null;
  let position = 900;
  for (const img of images) {
    const id = nextImageId++;
    const url = CDN + img.key;
    const alt = `${name}, ${ALT_LABEL[img.suffix] ?? "detail view"}`;
    imageLines.push(
      `INSERT INTO image (id, url, legacy_url, alt, width, height) VALUES (${id}, ${q(url)}, NULL, ${q(alt)}, ${img.width}, ${img.height});`
    );
    if (img.role === "hero") heroId = id;
    rows.push({ id, role: img.role, position: position++ });
  }
  return { heroId, rows };
}

for (const [folder, slug] of EXISTING) {
  const product = productBySlug.get(slug);
  if (!product) {
    console.warn(`SKIP (no such product) ${slug}`);
    continue;
  }
  console.log(`${folder}  ->  ${slug}`);
  const { heroId, rows } = await processTarget(folder, slug, product.name);
  if (!heroId) continue;
  productImageLines.push(
    `DELETE FROM product_image WHERE product_id = (SELECT id FROM product WHERE slug = ${q(slug)}) AND role IN ('hero','gallery');`
  );
  for (const r of rows) {
    productImageLines.push(
      `INSERT INTO product_image (product_id, image_id, position, role) VALUES ((SELECT id FROM product WHERE slug = ${q(slug)}), ${r.id}, ${r.position}, '${r.role}');`
    );
  }
  heroUpdateLines.push(`UPDATE product SET hero_image_id = ${heroId} WHERE slug = ${q(slug)};`);
  report.touched.push({ slug, images: rows.length });
}

for (const def of NEW_PRODUCTS) {
  console.log(`${def.folder}  ->  NEW ${def.slug}`);
  const { heroId, rows } = await processTarget(def.folder, def.slug, def.name);
  productLines.push(
    `INSERT INTO product (id, slug, category_id, kind, model_code, secondary_model, name, series, colour_variant, variant_group, intro_md, seo_title, meta_description, hero_image_id, sort_order) VALUES (${def.id}, ${q(def.slug)}, (SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 'dishwasher', ${q(def.model_code)}, NULL, ${q(def.name)}, NULL, ${q(def.colour_variant)}, ${q(def.variant_group)}, NULL, NULL, NULL, ${heroId ?? "NULL"}, ${def.sort_order});`
  );
  for (const r of rows) {
    productImageLines.push(
      `INSERT INTO product_image (product_id, image_id, position, role) VALUES ((SELECT id FROM product WHERE slug = ${q(def.slug)}), ${r.id}, ${r.position}, '${r.role}');`
    );
  }
  report.newProducts.push({ slug: def.slug, images: rows.length });
}

const sql = `-- New studio photography, 2026-08. Generated by generate-product-images.mjs.
-- Runs after products.sql (see db-build.mjs ORDER — anything not explicitly
-- ordered follows products.sql/articles.sql/stores.sql, sorted).
--
-- Image ids start at 9001, well clear of the scraper's range (max 398 as of
-- this writing), so a future research/products.json re-import cannot collide
-- with them. See schema.sql's note on product_feature for why that matters.

${imageLines.join("\n")}

${productLines.join("\n")}

${productImageLines.join("\n")}

${heroUpdateLines.join("\n")}
`;

writeFileSync(SQL_OUT, sql);
console.log(`\nwrote ${SQL_OUT}`);
console.log(`\n${imageLines.length} images, ${report.touched.length} existing products touched, ${report.newProducts.length} new products`);
writeFileSync(
  "C:/Users/danie/AppData/Local/Temp/claude/c--Users-danie-vatti-web/8b3f6e4f-3e78-4e5a-88fd-e7dab4b24470/scratchpad/report.json",
  JSON.stringify(report, null, 2)
);
db.close();
