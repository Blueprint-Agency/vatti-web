// Adds V917 Batik as a third colourway (Carbon Black/Grey + White already
// existed). Image-only, same pattern as the other 2026-08 additions — the
// "Finish" switcher on the product page picks it up automatically via
// variant_group, no code change needed there.
import { mkdirSync, readdirSync, writeFileSync } from "node:fs";
import { DatabaseSync } from "node:sqlite";
import path from "node:path";
import sharp from "sharp";

const ROOT = "C:/Users/danie/vatti-web";
const SRC = "C:/Users/danie/Downloads/vatti product images/Vatti Product Image/Cooker Hood/V917/Batik";
const CDN = "https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/";
const SLUG = "vatti-cooker-hood-v917-batik";
const NAME = "VATTI Cooker Hood V917 (Batik)";
const SQL_OUT = path.join(ROOT, "data/sql/v917-batik-2026-08.sql");

const db = new DatabaseSync(path.join(ROOT, ".data/vatti.db"), { readOnly: true });
let nextImageId = (db.prepare("SELECT max(id) m FROM image").get().m ?? 9000) + 1;
const nextProductId = (db.prepare("SELECT max(id) m FROM product").get().m ?? 0) + 1;
db.close();

const TABLE = { F: "front", QF: "quarter-front" };
function suffixFor(basename) {
  const key = basename.trim().toUpperCase();
  if (TABLE[key]) return { suffix: TABLE[key], role: key === "F" ? "hero" : "gallery" };
  const slug = basename.normalize("NFKD").replace(/[^a-zA-Z0-9]+/g, "-").replace(/^-+|-+$/g, "").toLowerCase();
  return { suffix: slug || "detail", role: "gallery" };
}
const ALT_LABEL = { front: "front view", "quarter-front": "angled view" };
const q = (v) => (v === null || v === undefined ? "NULL" : `'${String(v).replace(/'/g, "''")}'`);

const files = readdirSync(SRC).filter((f) => /\.(png|jpe?g|webp)$/i.test(f));
const items = files.map((f) => {
  const base = path.basename(f, path.extname(f));
  const { suffix, role } = suffixFor(base);
  return { file: f, suffix, role };
});
items.sort((a, b) => (a.role === "hero" ? -1 : b.role === "hero" ? 1 : 0));

const imageLines = [];
const productImageLines = [];
let heroId = null;
let position = 900;
for (const it of items) {
  const key = `2026/08/${SLUG}-${it.suffix}.webp`;
  const dest = path.join(ROOT, "old-media", key);
  mkdirSync(path.dirname(dest), { recursive: true });
  await sharp(path.join(SRC, it.file)).webp({ quality: 90, effort: 6 }).toFile(dest);
  const meta = await sharp(dest).metadata();
  const id = nextImageId++;
  const url = CDN + key;
  const alt = `${NAME}, ${ALT_LABEL[it.suffix] ?? "detail view"}`;
  imageLines.push(`INSERT INTO image (id, url, legacy_url, alt, width, height) VALUES (${id}, ${q(url)}, NULL, ${q(alt)}, ${meta.width}, ${meta.height});`);
  if (it.role === "hero") heroId = id;
  productImageLines.push(`INSERT INTO product_image (product_id, image_id, position, role) VALUES ((SELECT id FROM product WHERE slug = ${q(SLUG)}), ${id}, ${position++}, '${it.role}');`);
}

const sql = `-- V917's third colourway: Batik. Carbon Grey/White already existed; this
-- shoot only supplied Batik and "Carbon Black" (see the rename in
-- v917-colors-2026-08.sql — the existing "Carbon Grey" product is the same
-- unit, renamed to match the real finish name). Image-only, same as the
-- other 2026-08 additions: name + gallery, specs/features pending from Vatti.
--
-- Runs after products.sql and category-content.sql (see db-build.mjs ORDER
-- plus alphabetical fallback — needs product_collection to already exist).

${imageLines.join("\n")}

INSERT INTO product (id, slug, category_id, kind, model_code, secondary_model, name, series, colour_variant, variant_group, intro_md, seo_title, meta_description, hero_image_id, sort_order) VALUES (${nextProductId}, ${q(SLUG)}, (SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'range hood', 'V917', NULL, ${q(NAME)}, NULL, 'Batik', 'V917', NULL, ${q(NAME)}, NULL, ${heroId}, (SELECT COALESCE(max(sort_order), -1) + 1 FROM product WHERE category_id = (SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia')));

${productImageLines.join("\n")}

-- Same series term as the other two V917 colourways (category-content.sql).
INSERT INTO product_collection_member (collection_id, product_id) VALUES ((SELECT id FROM product_collection WHERE slug = 'family-daily-cooking-series' AND category_id = (SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia')), (SELECT id FROM product WHERE slug = ${q(SLUG)}));
`;

writeFileSync(SQL_OUT, sql);
console.log(`wrote ${SQL_OUT}`);
