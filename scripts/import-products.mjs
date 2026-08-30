// research/products.json  ->  data/sql/products.sql
//
// Run this when the scrape changes. The generated SQL is the committed source of
// truth and is what gets reviewed in PRs; nothing reads products.json at build.
//
//   node scripts/import-products.mjs

import { readFileSync, writeFileSync, mkdirSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

import { CDN } from "./cdn.mjs";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");
const products = JSON.parse(readFileSync(join(root, "research/products.json"), "utf8"));
const categoryPages = JSON.parse(readFileSync(join(root, "research/categories.json"), "utf8")).pages;

const q = (v) =>
  v === null || v === undefined || v === "" ? "NULL" : `'${String(v).replace(/'/g, "''")}'`;

// ── categories ─────────────────────────────────────────────────────────────
// The 5 live category pages. oven / combi-steam oven / microwave share one.
const CATEGORIES = [
  { slug: "kitchen-hood-in-malaysia", name: "Kitchen Hood", h1: "Compare VATTI Kitchen Hood Models" },
  { slug: "cooker-hob-in-malaysia", name: "Cooker Hob", h1: "Compare VATTI Cooker Hob Models" },
  { slug: "combi-and-steam-oven-in-malaysia", name: "Oven", h1: "Compare VATTI Oven Models" },
  { slug: "dishwasher-in-malaysia", name: "Dishwasher", h1: "Compare VATTI Dishwasher Models" },
  { slug: "one-tap-purifier-in-malaysia", name: "Water Purifier", h1: "Compare VATTI Water Purifier Models" },
];

// The legacy <title>/<meta description> these five pages rank on, plus the lead
// paragraph, straight out of the scrape — keyed by canonical URL, which is the
// slug. Nothing here is written by hand: losing "One Tap Purifier" from the
// water-purifier title is a ranking regression, not a wording preference.
// The intro is the first section's text-editor widget; Elementor has no
// dedicated intro field and CategoryView renders intro_md as one paragraph.
function legacyMeta(slug) {
  const page = categoryPages.find(
    (p) => !p.isRedirect && p.meta.canonical === `https://vattimalaysia.com/${slug}/`
  );
  if (!page) throw new Error(`no scraped category page for ${slug}`);
  const intro = page.sections[0]?.widgets.find((w) => w.type === "text-editor.default");
  return {
    seo_title: page.meta.title,
    meta_description: page.meta.description,
    intro_md: intro?.text ?? null,
  };
}

const KIND_TO_CATEGORY = {
  "range hood": "kitchen-hood-in-malaysia",
  hob: "cooker-hob-in-malaysia",
  oven: "combi-and-steam-oven-in-malaysia",
  "combi-steam oven": "combi-and-steam-oven-in-malaysia",
  microwave: "combi-and-steam-oven-in-malaysia",
  dishwasher: "dishwasher-in-malaysia",
  "water purifier": "one-tap-purifier-in-malaysia",
};

// ── facet extraction ───────────────────────────────────────────────────────
// 72% of the numbers live in UNKEYED bullets ("Low noise level 53db"), so these
// run over raw text. Percent means different things per kind, hence the scoping:
// on a hood it is oil filtration, on a hob it is energy efficiency.
const num = (s) => Number(String(s).replace(/,/g, ""));
const FACETS = {
  airflow:    { re: /(\d[\d.,]*)\s*m(?:3|³)\s*\/\s*h/i, unit: "m³/h", label: "Airflow",     kinds: ["range hood"] },
  pressure:   { re: /(\d[\d.,]*)\s*pa\b/i,              unit: "Pa",   label: "Pressure",    kinds: ["range hood"] },
  noise:      { re: /(\d[\d.,]*)\s*db/i,                unit: "dB",   label: "Noise",       kinds: ["range hood"] },
  filtration: { re: /(\d[\d.,]*)\s*%/,                  unit: "%",    label: "Oil capture", kinds: ["range hood"] },
  efficiency: { re: /(\d[\d.,]*)\s*%/,                  unit: "%",    label: "Efficiency",  kinds: ["hob"] },
  power:      { re: /(\d[\d.,]*)\s*kw/i,                unit: "kW",   label: "Power",       kinds: ["hob"] },
  flow:       { re: /(\d[\d.,]*)\s*l\s*\/\s*min/i,      unit: "L/min", label: "Flow rate",  kinds: ["water purifier"] },
  capacity:   { re: /(\d[\d.,]*)\s*(?:litres?|liters?|l)\b/i, unit: "L", label: "Capacity",
                kinds: ["oven", "combi-steam oven", "microwave", "dishwasher"] },
};
// Order drives display order in the readout strip.
const FACET_ORDER = ["airflow", "pressure", "noise", "filtration", "power", "efficiency", "capacity", "flow"];

function extractFacets(kind, specs) {
  const out = [];
  for (const name of FACET_ORDER) {
    const def = FACETS[name];
    if (!def.kinds.includes(kind)) continue;
    for (let i = 0; i < specs.length; i++) {
      const text = specs[i].raw || "";
      // flow (L/min) would otherwise be swallowed by the capacity (L) pattern
      if (name === "capacity" && /l\s*\/\s*min/i.test(text)) continue;
      const m = text.match(def.re);
      if (!m) continue;
      const value = num(m[1]);
      if (!Number.isFinite(value)) continue;
      out.push({
        facet: name,
        value,
        unit: def.unit,
        label: def.label,
        position: out.length,
        source_position: i,
      });
      break;
    }
  }
  return out;
}

// Dead on the live site AND absent from the old-media export — permanently
// lost, so they are dropped rather than shipped as broken <img>. Verified
// 2 Aug 2026; re-check with scripts/db-check.mjs.
const DEAD_IMAGES = new Set([
  "2023/07/8.jpeg",
  "2023/07/Slide6-1.jpg",
  "2023/11/VATTI-C720S-Cooker-Hob_9.webp",
  "2023/02/Slide6-2.jpg",
  "2023/02/O755P-4.gif",
  "2023/07/Slide6-5.jpg",
  "2023/07/Slide8-3.jpg",
]);
const isDead = (url) =>
  [...DEAD_IMAGES].some((p) => url.endsWith(p));

// Four slides the owner pulled as defects. Keyed by "<slug>|<path>", NOT by URL
// alone like DEAD_IMAGES: 2026/04/V998-PG8.webp is V998's own asset and belongs
// there — it is only wrong on V938, whose 3650m³/h / 1600Pa it contradicts with
// V998's 2850m³/h / 1250Pa. Transcribed, that contradiction is now indexable
// text rather than pixels. The three V998 slides carry VIOMI (competitor)
// branding. Owner reviewed and KEPT V998 PG4/9/10/12/14/15 (unreadable logo) and
// vatti-range-hood-v997 position 5 (clipped lorem ipsum) — do not add them here.
//
// position is the post-filter array index, so a drop renumbers every later image
// on that product. data/sql/product-captions.sql keys its UPDATEs on position
// and was renumbered in the same commit. Never land one without the other.
const DEFECT_IMAGES = new Set([
  "vatti-hidden-series-range-hood-v938|2026/04/V998-PG8.webp",
  "vatti-smart-oxygen-range-hood-v998|2026/04/V998-PG3.webp",
  "vatti-smart-oxygen-range-hood-v998|2026/04/V998-PG6.webp",
  "vatti-smart-oxygen-range-hood-v998|2026/04/V998-PG2.webp",
]);
const isDefect = (slug, url) =>
  [...DEFECT_IMAGES].some((k) => {
    const [s, path] = k.split("|");
    return s === slug && url.endsWith(path);
  });

// Media lives on R2 now. Bucket keys drop the /wp-content/uploads/ prefix and
// keep the YYYY/MM/file.ext tail, so this is a straight prefix swap. The old
// path survives in image.legacy_url and in the next.config redirect.
const UPLOADS = "https://vattimalaysia.com/wp-content/uploads/";
const toCdn = (url) =>
  url.startsWith(UPLOADS) ? `${CDN}/${url.slice(UPLOADS.length)}` : url;

// ── build ──────────────────────────────────────────────────────────────────
const L = [];
L.push("-- GENERATED by scripts/import-products.mjs — do not hand-edit.");
L.push("-- Regenerate with: node scripts/import-products.mjs\n");

CATEGORIES.forEach((c, i) => {
  const m = legacyMeta(c.slug);
  L.push(
    `INSERT INTO product_category (id, slug, name, h1, seo_title, meta_description, intro_md, sort_order) VALUES ` +
      `(${i + 1}, ${q(c.slug)}, ${q(c.name)}, ${q(c.h1)}, ${q(m.seo_title)}, ` +
      `${q(m.meta_description)}, ${q(m.intro_md)}, ${i});`
  );
});
L.push("");

const catId = Object.fromEntries(CATEGORIES.map((c, i) => [c.slug, i + 1]));
const productId = Object.fromEntries(products.map((p, i) => [p.slug, i + 1]));

// images are deduplicated by URL across the whole catalogue
const imageId = new Map();
let imgSeq = 0;
const imageRows = [];
function imageFor(url, alt, width, height) {
  if (imageId.has(url)) return imageId.get(url);
  const id = ++imgSeq;
  imageId.set(url, id);
  // url -> R2 CDN, legacy_url -> the WordPress path we keep 301-ing.
  imageRows.push(
    `INSERT INTO image (id, url, legacy_url, alt, width, height) VALUES ` +
      `(${id}, ${q(toCdn(url))}, ${q(url)}, ${q(alt)}, ${width ?? "NULL"}, ${height ?? "NULL"});`
  );
  return id;
}

const body = [];
let facetCount = 0,
  rejectedSelfRefs = 0,
  droppedImages = 0,
  droppedDefects = 0,
  noFacets = [];

products.forEach((p, i) => {
  const id = i + 1;
  const kind = p.category;
  const category = KIND_TO_CATEGORY[kind];
  if (!category) throw new Error(`unmapped kind "${kind}" on ${p.slug}`);

  const images = (p.images || []).filter((im) => {
    if (isDead(im.url)) {
      droppedImages++;
      return false;
    }
    if (isDefect(p.slug, im.url)) {
      droppedDefects++;
      return false;
    }
    return true;
  });
  const hero = images.find((im) => im.role === "hero") || images[0];
  const heroId = hero ? imageFor(hero.url, hero.alt, hero.width, hero.height) : null;

  body.push(
    `INSERT INTO product (id, slug, category_id, kind, model_code, secondary_model, name, series, ` +
      `colour_variant, variant_group, intro_md, seo_title, meta_description, hero_image_id, sort_order) VALUES (` +
      [
        id,
        q(p.slug),
        catId[category],
        q(kind),
        q(p.model_code),
        q(p.secondary_model),
        q(cleanName(p.h1)),
        q(p.series),
        q(p.colour_variant),
        q(variantGroup(p)),
        q(p.intro),
        q(p.title),
        q(p.meta_description),
        heroId ?? "NULL",
        i,
      ].join(", ") +
      `);`
  );

  const specs = p.specs || [];
  specs.forEach((s, n) =>
    body.push(
      `INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text) VALUES ` +
        `(${id}, ${n}, ${q(s.key)}, ${q(s.value)}, ${q(s.raw)});`
    )
  );

  const facets = extractFacets(kind, specs);
  if (!facets.length) noFacets.push(p.slug);
  facetCount += facets.length;
  facets.forEach((f) =>
    body.push(
      `INSERT INTO product_facet (product_id, facet, value, unit, label, position, source_position) VALUES ` +
        `(${id}, ${q(f.facet)}, ${f.value}, ${q(f.unit)}, ${q(f.label)}, ${f.position}, ${f.source_position});`
    )
  );

  images.forEach((im, n) =>
    body.push(
      `INSERT INTO product_image (product_id, image_id, position, role) VALUES ` +
        `(${id}, ${imageFor(im.url, im.alt, im.width, im.height)}, ${n}, ${q(im.role || "feature")});`
    )
  );

  (p.downloads || []).forEach((d, n) =>
    body.push(
      `INSERT INTO product_download (product_id, position, label, url, kind) VALUES ` +
        `(${id}, ${n}, ${q(d.label)}, ${q(toCdn(d.url))}, ${q(d.kind || "other")});`
    )
  );

  (p.videos || []).forEach((v, n) =>
    body.push(`INSERT INTO product_video (product_id, position, video_id) VALUES (${id}, ${n}, ${q(v)});`)
  );
});

// related last, so every product row already exists for the FK
products.forEach((p, i) => {
  let pos = 0;
  for (const slug of p.related_products || []) {
    if (slug === p.slug) {
      rejectedSelfRefs++;
      continue;
    }
    const target = productId[slug];
    if (!target) continue;
    body.push(
      `INSERT INTO product_related (product_id, related_id, position) VALUES (${i + 1}, ${target}, ${pos++});`
    );
  }
});

function cleanName(h1) {
  return String(h1 || "").replace(/[“”"]/g, "").replace(/\s+/g, " ").trim();
}
function variantGroup(p) {
  return p.colour_variant ? p.model_code : null;
}

const sql = [...L, ...imageRows, "", ...body, ""].join("\n");
mkdirSync(join(root, "data/sql"), { recursive: true });
writeFileSync(join(root, "data/sql/products.sql"), sql);

console.log(`products      ${products.length}`);
console.log(`images        ${imgSeq} unique`);
console.log(`facets        ${facetCount} across ${products.length - noFacets.length} products`);
console.log(`self-refs     ${rejectedSelfRefs} rejected`);
console.log(`dead images   ${droppedImages} dropped (404 on source, absent from old-media)`);
console.log(`defect images ${droppedDefects} dropped (wrong product / competitor branding)`);
console.log(`no facets     ${noFacets.length}${noFacets.length ? " -> " + noFacets.join(", ") : ""}`);
console.log(`wrote         data/sql/products.sql`);
