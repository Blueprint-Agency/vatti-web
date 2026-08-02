// Integrity assertions over .data/vatti.db. Run before commit.
//   node scripts/db-check.mjs            structural checks only (fast, offline)
//   node scripts/db-check.mjs --assets   also HEAD every image and PDF (network)

import { existsSync } from "node:fs";
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

check("orphan images (in image, unused)", `
  SELECT i.url FROM image i
   LEFT JOIN product_image pi ON pi.image_id = i.id
   LEFT JOIN product p ON p.hero_image_id = i.id
   WHERE pi.image_id IS NULL AND p.id IS NULL`);

check("facets pointing at a missing spec row", `
  SELECT f.product_id, f.facet FROM product_facet f
   LEFT JOIN product_spec s
     ON s.product_id = f.product_id AND s.position = f.source_position
   WHERE s.id IS NULL`);

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
