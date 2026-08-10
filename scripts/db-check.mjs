// Integrity assertions over .data/vatti.db. Run before commit.
//   node scripts/db-check.mjs            structural checks only (fast, offline)
//   node scripts/db-check.mjs --assets   also HEAD every image and PDF (network)

import { existsSync, readFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import { DatabaseSync } from "node:sqlite";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");
const file = join(root, ".data/vatti.db");
if (!existsSync(file)) {
  console.error("no .data/vatti.db — run `pnpm db:build` first");
  process.exit(1);
}

const db = new DatabaseSync(file, { readOnly: true });
const failures = [];
const check = (name, sql, explain) => {
  const rows = db.prepare(sql).all();
  if (rows.length) {
    failures.push({ name, rows, explain });
    console.log(`FAIL  ${name} (${rows.length})`);
    for (const r of rows.slice(0, 8)) console.log(`        ${JSON.stringify(r)}`);
    if (rows.length > 8) console.log(`        ...and ${rows.length - 8} more`);
  } else {
    console.log(`ok    ${name}`);
  }
};

// SQLite's own FK verification
const fk = db.prepare("PRAGMA foreign_key_check").all();
if (fk.length) {
  failures.push({ name: "foreign keys", rows: fk });
  console.log(`FAIL  foreign keys (${fk.length})`);
} else {
  console.log("ok    foreign keys");
}

check("duplicate product slugs", `
  SELECT slug, count(*) n FROM product GROUP BY slug HAVING n > 1`);

check("duplicate category slugs", `
  SELECT slug, count(*) n FROM product_category GROUP BY slug HAVING n > 1`);

check("products with no category", `
  SELECT p.slug FROM product p
   LEFT JOIN product_category c ON c.id = p.category_id WHERE c.id IS NULL`);

check("products with no images", `
  SELECT p.slug FROM product p
   LEFT JOIN product_image pi ON pi.product_id = p.id
   WHERE pi.product_id IS NULL GROUP BY p.slug`);

check("self-referencing related products", `
  SELECT product_id FROM product_related WHERE product_id = related_id`);

// Every owner of an image_id has to appear here or its rows read as orphans.
check("orphan images (in image, unused)", `
  SELECT i.url FROM image i WHERE i.id NOT IN (
    SELECT image_id FROM product_image
    UNION SELECT hero_image_id FROM product WHERE hero_image_id IS NOT NULL
    UNION SELECT image_id FROM article_image
    UNION SELECT featured_image_id FROM article WHERE featured_image_id IS NOT NULL
    UNION SELECT hero_image_id FROM recipe WHERE hero_image_id IS NOT NULL
    UNION SELECT image_id FROM store WHERE image_id IS NOT NULL)`);

check("facets pointing at a missing spec row", `
  SELECT f.product_id, f.facet FROM product_facet f
   LEFT JOIN product_spec s
     ON s.product_id = f.product_id AND s.position = f.source_position
   WHERE s.id IS NULL`);

// The category page fronts this model. A signature filed under another
// category renders a hood at the top of the dishwasher page.
check("signature product outside its own category", `
  SELECT c.slug, p.slug AS product
    FROM product_category c JOIN product p ON p.id = c.signature_product_id
   WHERE p.category_id <> c.id OR p.is_published = 0`);

// The series filter is the primary way the grid is browsed, so a published
// model in no term is a model that disappears whichever chip is pressed. Only
// enforced on categories that HAVE a taxonomy — four of the five do not.
check("published product missing from its category's series taxonomy", `
  SELECT p.slug FROM product p
   WHERE p.is_published = 1
     AND EXISTS (SELECT 1 FROM product_collection c WHERE c.category_id = p.category_id)
     AND NOT EXISTS (
       SELECT 1 FROM product_collection_member m
         JOIN product_collection c ON c.id = m.collection_id
        WHERE m.product_id = p.id AND c.category_id = p.category_id)`);

// A term borrowed across categories would put a hood in the hob filter.
check("series member filed under another category", `
  SELECT c.slug AS series, p.slug AS product
    FROM product_collection_member m
    JOIN product_collection c ON c.id = m.collection_id
    JOIN product p ON p.id = m.product_id
   WHERE p.category_id <> c.category_id`);

check("category content for a category with no products", `
  SELECT c.slug FROM product_category c
   WHERE (SELECT count(*) FROM product p WHERE p.category_id = c.id AND p.is_published = 1) = 0
     AND ((SELECT count(*) FROM category_guide g WHERE g.category_id = c.id) > 0
       OR (SELECT count(*) FROM category_faq f WHERE f.category_id = c.id) > 0)`);

check("duplicate article slugs", `
  SELECT slug, count(*) n FROM article GROUP BY slug HAVING n > 1`);

check("duplicate article paths", `
  SELECT path, count(*) n FROM article GROUP BY path HAVING n > 1`);

// path is the URL that must resolve 200; section is what the route matches on.
check("article path not under its section", `
  SELECT slug, section, path FROM article WHERE path <> section || '/' || slug`);

check("articles with no primary category", `
  SELECT a.slug FROM article a
   LEFT JOIN article_category ac ON ac.article_id = a.id AND ac.is_primary = 1
   WHERE ac.article_id IS NULL`);

// The whole point of article_category: the URL wins over the WordPress filing.
check("primary category disagreeing with the URL section", `
  SELECT a.slug, a.section, c.slug AS primary_category
    FROM article a
    JOIN article_category ac ON ac.article_id = a.id AND ac.is_primary = 1
    JOIN blog_category c ON c.id = ac.category_id
   WHERE a.section <> c.slug AND a.section <> 'uncategorized'`);

check("recipes hanging off a non-recipe article", `
  SELECT a.slug FROM recipe r JOIN article a ON a.id = r.article_id
   WHERE a.section <> 'recipe'`);

check("recipes with no ingredients or no steps", `
  SELECT r.id FROM recipe r
   LEFT JOIN recipe_ingredient i ON i.recipe_id = r.id
   LEFT JOIN recipe_step s ON s.recipe_id = r.id
   GROUP BY r.id HAVING count(DISTINCT i.position) = 0 OR count(DISTINCT s.position) = 0`);

// Keyed on the href, not on kind: the scrape files some offsite links (YouTube,
// Pinterest share buttons) as 'other-page', and 'home' has no slug by design.
check("internal article links with no target slug", `
  SELECT article_id, href FROM article_link
   WHERE kind <> 'home'
     AND href LIKE 'https://vattimalaysia.com/_%'
     AND target_slug IS NULL`);

check("duplicate store slugs", `
  SELECT slug, count(*) n FROM store GROUP BY slug HAVING n > 1`);

check("stores with no image", `
  SELECT slug FROM store WHERE image_id IS NULL`);

// Dealer pages live under /store/, from the WP REST slug. research/stores.json's
// root-level permalinks are stale and 301 to the homepage — building from them
// would 404 61 of 75. See the note on `store` in schema.sql.
check("store path not /store/<slug>", `
  SELECT slug, path FROM store WHERE path <> 'store/' || slug`);

// wp_id is provenance from the scrape, so it is the evidence that the join in
// import-stores.mjs produced this row. Dealers appointed since the scrape have
// no CPT page and legitimately have none — every OTHER row must still carry one.
const localSlugs = JSON.parse(
  readFileSync(join(root, "research/stores-local.json"), "utf8")
).stores.map((s) => `'${s.slug.replace(/'/g, "''")}'`);
check("stores missing their WordPress id", `
  SELECT slug FROM store
   WHERE wp_id IS NULL AND slug NOT IN (${localSlugs.join(", ") || "''"})`);

// Products and categories share one root [slug] route segment, so a collision
// is a page that silently shadows another. Stores are NOT in this namespace.
check("slug collisions across the root namespace", `
  SELECT slug, count(*) n FROM (
    SELECT slug FROM product
    UNION ALL SELECT slug FROM product_category)
   GROUP BY slug HAVING n > 1`);

// Hand-authored copy is the one place a link is typed rather than derived, and
// a 404 inside an FAQ answer is invisible until somebody clicks it. Checked
// here rather than by the crawler because the crawler needs a built site.
{
  const paths = new Set([
    ...db.prepare("SELECT slug FROM product WHERE is_published = 1").all().map((r) => r.slug),
    ...db.prepare("SELECT slug FROM product_category").all().map((r) => r.slug),
    ...db.prepare("SELECT path FROM article WHERE is_published = 1").all().map((r) => r.path),
    ...db.prepare("SELECT path FROM store").all().map((r) => r.path),
    ...db.prepare("SELECT from_path FROM redirect").all().map((r) => r.from_path),
    // Static routes, which have no table.
    "about-us", "contact-us", "store-locations", "vatti-ewarranty", "vatti-pay",
  ]);
  const broken = [];
  const rows = [
    ...db.prepare("SELECT category_id, question AS ctx, answer_md AS md FROM category_faq").all(),
    ...db.prepare("SELECT category_id, heading AS ctx, body_md AS md FROM category_guide").all(),
    ...db.prepare("SELECT category_id, title AS ctx, body_md AS md FROM category_reason").all(),
  ];
  for (const row of rows) {
    for (const m of row.md.matchAll(/\]\((\/[^)\s]*)\)/g)) {
      const path = m[1].replace(/^\/|\/$/g, "");
      if (!paths.has(path)) broken.push({ ctx: row.ctx, href: m[1] });
    }
  }
  if (broken.length) {
    failures.push({ name: "category copy linking to a page that does not exist", rows: broken });
    console.log(`FAIL  category copy linking to a page that does not exist (${broken.length})`);
    for (const b of broken) console.log(`        ${JSON.stringify(b)}`);
  } else {
    console.log("ok    category copy linking to a page that does not exist");
  }
}

check("redirect loops", `
  SELECT r.from_path FROM redirect r JOIN redirect r2
    ON r.to_path = r2.from_path AND r2.to_path = r.from_path`);

check("redirect pointing at itself", `
  SELECT from_path FROM redirect WHERE from_path = to_path`);

// Post-migration guard. Fails once Phase 2 has repointed media at the CDN and
// any legacy WordPress URL reappears in image.url.
if (process.env.MEDIA_MIGRATED === "1") {
  check("legacy media URLs surviving into the DB", `
    SELECT url FROM image
     WHERE url LIKE '%/wp-content/uploads/%' OR url LIKE '%i0.wp.com%'`);

  // Article bodies are rendered as-is, so the same two hosts must be gone there
  // too — a surviving i0.wp.com src bypasses the CDN and the R2 migration.
  check("legacy media URLs surviving into article bodies", `
    SELECT slug FROM article
     WHERE body_md LIKE '%/wp-content/uploads/%' OR body_md LIKE '%i0.wp.com%'`);
}

if (process.argv.includes("--assets")) {
  const targets = [
    ...db.prepare("SELECT url FROM image").all().map((r) => ({ url: r.url, kind: "image" })),
    ...db.prepare("SELECT DISTINCT url FROM product_download").all().map((r) => ({ url: r.url, kind: "pdf" })),
  ];
  console.log(`\nchecking ${targets.length} assets over the network...`);
  const broken = [];
  let i = 0;
  const worker = async () => {
    while (i < targets.length) {
      const t = targets[i++];
      try {
        const res = await fetch(t.url, { method: "HEAD", headers: { "User-Agent": "vatti-db-check" } });
        if (res.status !== 200) broken.push(`${res.status} ${t.kind} ${t.url}`);
      } catch {
        broken.push(`ERR ${t.kind} ${t.url}`);
      }
    }
  };
  await Promise.all(Array.from({ length: 12 }, worker));
  if (broken.length) {
    failures.push({ name: "broken assets", rows: broken });
    console.log(`FAIL  broken assets (${broken.length})`);
    broken.forEach((b) => console.log(`        ${b}`));
  } else {
    console.log("ok    all assets resolve 200");
  }
}

db.close();
console.log(failures.length ? `\n${failures.length} check(s) failed` : "\nall checks passed");
process.exit(failures.length ? 1 : 0);
