// Adds V959 (hood) and VH IC09AL (hob) as new, image-only products — folders
// present in the 2026-08 photo shoot with no matching product page. Same
// pattern as the DWID3 addition in generate-product-images-2026-08.mjs:
// name + gallery only, no specs/features/description.
//
//   node scripts/add-new-products-2026-08.mjs
import { mkdirSync, readdirSync, writeFileSync } from "node:fs";
import { DatabaseSync } from "node:sqlite";
import path from "node:path";
import sharp from "sharp";

const ROOT = "C:/Users/danie/vatti-web";
const SRC = "C:/Users/danie/Downloads/vatti product images/Vatti Product Image";
const CDN = "https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/";
const SQL_OUT = path.join(ROOT, "data/sql/new-products-2026-08.sql");

const db = new DatabaseSync(path.join(ROOT, ".data/vatti.db"), { readOnly: true });
const nextImageId = { n: (db.prepare("SELECT max(id) m FROM image").get().m ?? 9000) + 1 };
const nextProductId = (db.prepare("SELECT max(id) m FROM product").get().m ?? 0) + 1;

const NEW_PRODUCTS = [
  {
    folder: "Cooker Hood/V959",
    id: nextProductId,
    slug: "vatti-cooker-hood-v959",
    name: "Vatti Cooker Hood V959",
    model_code: "V959",
    kind: "range hood",
    categorySlug: "kitchen-hood-in-malaysia",
  },
  {
    folder: "Cooker Hob/VH IC09AL",
    id: nextProductId + 1,
    slug: "vatti-cooker-hob-vh-ic09al",
    name: "Vatti Cooker Hob VH IC09AL",
    model_code: "VH IC09AL",
    kind: "hob",
    categorySlug: "cooker-hob-in-malaysia",
  },
];

const TABLE = {
  F: "front", F_OP: "front-open", QF: "quarter-front", QF_OP: "quarter-front-open",
  QF_02: "quarter-front-2", S: "side", S_OP: "side-open", OF_OP: "open-detail",
};
function suffixFor(basename) {
  const key = basename.trim().toUpperCase().replace(/\s+/g, "_");
  if (TABLE[key]) return { suffix: TABLE[key], role: key === "F" ? "hero" : "gallery" };
  const slug = basename.normalize("NFKD").replace(/[^a-zA-Z0-9]+/g, "-").replace(/^-+|-+$/g, "").toLowerCase();
  return { suffix: slug || "detail", role: "gallery" };
}
const ALT_LABEL = {
  front: "front view", "front-open": "front view, canopy open",
  "quarter-front": "angled view", "quarter-front-open": "angled view, open",
  "quarter-front-2": "angled view", side: "side view", "side-open": "side view, open",
  "open-detail": "detail view",
};
const PRIORITY = ["front", "front-open", "quarter-front", "quarter-front-open", "quarter-front-2", "side", "side-open"];

const q = (v) => (v === null || v === undefined ? "NULL" : `'${String(v).replace(/'/g, "''")}'`);

async function convertFolder(folder, slug) {
  const abs = path.join(SRC, folder);
  const files = readdirSync(abs).filter((f) => /\.(png|jpe?g|webp)$/i.test(f));
  const items = files.map((f) => {
    const base = path.basename(f, path.extname(f));
    const { suffix, role } = suffixFor(base);
    return { file: f, suffix, role };
  });
  const seen = new Map();
  for (const it of items) {
    const n = seen.get(it.suffix) ?? 0;
    if (n > 0) it.suffix = `${it.suffix}-${n + 1}`;
    seen.set(it.suffix, n + 1);
  }
  items.sort((a, b) => {
    if (a.role === "hero") return -1;
    if (b.role === "hero") return 1;
    const ai = PRIORITY.indexOf(a.suffix), bi = PRIORITY.indexOf(b.suffix);
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
    await sharp(path.join(abs, it.file)).webp({ quality: 90, effort: 6 }).toFile(dest);
    const meta = await sharp(dest).metadata();
    out.push({ key, role: it.role, suffix: it.suffix, width: meta.width, height: meta.height });
  }
  return out;
}

const imageLines = [];
const productLines = [];
const productImageLines = [];

for (const def of NEW_PRODUCTS) {
  console.log(`${def.folder}  ->  NEW ${def.slug}`);
  const images = await convertFolder(def.folder, def.slug);
  let heroId = null;
  let position = 900;
  const rows = [];
  for (const img of images) {
    const id = nextImageId.n++;
    const url = CDN + img.key;
    const alt = `${def.name}, ${ALT_LABEL[img.suffix] ?? "detail view"}`;
    imageLines.push(
      `INSERT INTO image (id, url, legacy_url, alt, width, height) VALUES (${id}, ${q(url)}, NULL, ${q(alt)}, ${img.width}, ${img.height});`
    );
    if (img.role === "hero") heroId = id;
    rows.push({ id, role: img.role, position: position++ });
  }
  productLines.push(
    `INSERT INTO product (id, slug, category_id, kind, model_code, secondary_model, name, series, colour_variant, variant_group, intro_md, seo_title, meta_description, hero_image_id, sort_order) VALUES (${def.id}, ${q(def.slug)}, (SELECT id FROM product_category WHERE slug = ${q(def.categorySlug)}), ${q(def.kind)}, ${q(def.model_code)}, NULL, ${q(def.name)}, NULL, NULL, NULL, NULL, NULL, NULL, ${heroId ?? "NULL"}, (SELECT COALESCE(max(sort_order), -1) + 1 FROM product WHERE category_id = (SELECT id FROM product_category WHERE slug = ${q(def.categorySlug)})));`
  );
  for (const r of rows) {
    productImageLines.push(
      `INSERT INTO product_image (product_id, image_id, position, role) VALUES ((SELECT id FROM product WHERE slug = ${q(def.slug)}), ${r.id}, ${r.position}, '${r.role}');`
    );
  }
}

// Hood and hob both carry a series taxonomy (category-content.sql), and
// db:check fails any published product in a category that has one but sits
// in no term — same problem category-content.sql already solved once for
// V936/V991 (filed under Family Daily Cooking for lack of a clean fit).
// With no specs yet to judge these two by, the general/everyday term in each
// category is the pick least likely to claim a feature they may not have.
const collectionLines = [
  `INSERT INTO product_collection_member (collection_id, product_id) VALUES ((SELECT id FROM product_collection WHERE slug = 'family-daily-cooking-series' AND category_id = (SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia')), (SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v959'));`,
  `INSERT INTO product_collection_member (collection_id, product_id) VALUES ((SELECT id FROM product_collection WHERE slug = 'family-everyday-cooking' AND category_id = (SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia')), (SELECT id FROM product WHERE slug = 'vatti-cooker-hob-vh-ic09al'));`,
];

const sql = `-- V959 (hood) and VH IC09AL (hob): folders from the 2026-08 shoot with no
-- existing product page. New products, image-only — name + gallery, no
-- specs/features/description, same as the DWID3 addition.
--
-- Runs after products.sql and category-content.sql (see db-build.mjs ORDER
-- plus alphabetical fallback); image ids continue past the 9001-9073 range
-- used there.

${imageLines.join("\n")}

${productLines.join("\n")}

${productImageLines.join("\n")}

${collectionLines.join("\n")}
`;

writeFileSync(SQL_OUT, sql);
console.log(`\nwrote ${SQL_OUT}`);
db.close();
