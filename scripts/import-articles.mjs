// research/articles.json  ->  data/sql/articles.sql
//
// Run this when the scrape changes. The generated SQL is the committed source of
// truth and is what gets reviewed in PRs; nothing reads articles.json at build.
//
//   node scripts/import-articles.mjs
//
// Two fields listed in the scrape are deliberately NOT imported: `wp_tags` is
// empty on all 107 records (the tag-like strings elsewhere are Rank Math focus
// keywords, not a taxonomy) and `faqs` is null on all 107 — the FAQ content the
// audit found lives on category pages, not here.

import { readFileSync, writeFileSync, mkdirSync, openSync, readSync, closeSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

import { required } from "./env.mjs";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");
const all = JSON.parse(readFileSync(join(root, "research/articles.json"), "utf8"));
const TABLES = JSON.parse(readFileSync(join(root, "research/article-tables.json"), "utf8"));

const q = (v) =>
  v === null || v === undefined || v === "" ? "NULL" : `'${String(v).replace(/'/g, "''")}'`;

// `oven/recipe` is an empty indexable stub, not an article: is_article false,
// word_count 0. It stays a URL (redirect), never a row.
const articles = all.filter((a) => a.is_article);

// ── categories ─────────────────────────────────────────────────────────────
// Only 3 exist. Sorted by the blog nav order, not alphabetically.
const CATEGORIES = [
  { slug: "buying-guide", name: "Buying Guide" },
  { slug: "tips-tricks", name: "Tips & Tricks" },
  { slug: "recipe", name: "Recipe" },
];
const catId = Object.fromEntries(CATEGORIES.map((c, i) => [c.slug, i + 1]));

// The URL wins. 10 posts sit under /tips-tricks/ while WordPress files them as
// Buying Guide; the section is what readers and Google see, so it becomes the
// primary category and the WordPress one is kept as a secondary row.
// `uncategorized` is a single live legacy URL with no category at all — the plan
// folds that post into the induction-vs-ceramic merge, which lives in
// buying-guide, so that is its primary. See docs/REBUILD-PLAN.md § defects.
const SECTION_PRIMARY = { ...catId, uncategorized: catId["buying-guide"] };

// ── media ──────────────────────────────────────────────────────────────────
// Articles are served through Jetpack's image CDN, so almost every src is an
// i0.wp.com wrapper around the real upload path, with resize params attached:
//   https://i0.wp.com/vattimalaysia.com/wp-content/uploads/x.webp?fit=1024%2C576&ssl=1
// Unwrap to the origin path first, then the same prefix swap products.sql uses.
// Neither host may survive into the DB — see CLAUDE.md § Conventions.
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

// ── image dimensions ───────────────────────────────────────────────────────
// The scrape records only `src` and `alt`, so every article image would land
// with a NULL width/height and the renderer would have to reserve a nominal box
// — layout shift on the highest-traffic pages. Every file is in the old-media
// export, so the real numbers are readable from the file header.
//
// Read here rather than with a library: `sharp` is a transitive dependency of
// Next and pnpm does not link transitive deps at the root, so a script cannot
// import it without adding it to package.json. Four container formats, all
// fixed-offset, is less code than that is worth. The corpus is 334 webp, 3 png,
// 3 jpg; an unknown format throws rather than silently returning NULL.
const OLD_MEDIA = join(root, "old-media");

function readHeader(file, bytes = 65536) {
  let fd;
  try {
    fd = openSync(file, "r");
  } catch {
    return null;
  }
  try {
    const buf = Buffer.alloc(bytes);
    return buf.subarray(0, readSync(fd, buf, 0, bytes, 0));
  } finally {
    closeSync(fd);
  }
}

function parseDimensions(b) {
  // PNG — IHDR is always the first chunk, at a fixed offset.
  if (b.length > 24 && b.readUInt32BE(0) === 0x89504e47)
    return { width: b.readUInt32BE(16), height: b.readUInt32BE(20) };

  // WebP — RIFF container; the size lives in the first chunk, whose four-byte
  // tag says which of the three encodings packed it.
  if (b.length > 30 && b.toString("latin1", 0, 4) === "RIFF" && b.toString("latin1", 8, 12) === "WEBP") {
    const tag = b.toString("latin1", 12, 16);
    const d = 20; // chunk payload: 12 header + 4 tag + 4 length
    if (tag === "VP8 " && b[d + 3] === 0x9d && b[d + 4] === 0x01 && b[d + 5] === 0x2a)
      return { width: b.readUInt16LE(d + 6) & 0x3fff, height: b.readUInt16LE(d + 8) & 0x3fff };
    if (tag === "VP8L" && b[d] === 0x2f) {
      const bits = b.readUInt32LE(d + 1);
      return { width: (bits & 0x3fff) + 1, height: ((bits >> 14) & 0x3fff) + 1 };
    }
    if (tag === "VP8X")
      return {
        width: b.readUIntLE(d + 4, 3) + 1,
        height: b.readUIntLE(d + 7, 3) + 1,
      };
  }

  // JPEG — walk the segment chain to the start-of-frame. C4/C8/CC share the
  // C0-CF range but are Huffman/arithmetic tables, not frames.
  if (b.length > 4 && b[0] === 0xff && b[1] === 0xd8) {
    for (let i = 2; i + 9 < b.length; ) {
      if (b[i] !== 0xff) {
        i++;
        continue;
      }
      const marker = b[i + 1];
      if (marker === 0xd8 || marker === 0x01 || (marker >= 0xd0 && marker <= 0xd7)) {
        i += 2;
        continue;
      }
      if (marker === 0xda) break; // start of scan: no frame header found
      if (marker >= 0xc0 && marker <= 0xcf && marker !== 0xc4 && marker !== 0xc8 && marker !== 0xcc)
        return { width: b.readUInt16BE(i + 7), height: b.readUInt16BE(i + 5) };
      i += 2 + b.readUInt16BE(i + 2);
    }
  }

  return null;
}

let sized = 0;
const unsized = [];
function dimensionsFor(legacy) {
  if (!legacy.startsWith(UPLOADS)) {
    unsized.push(`${legacy} (not an uploads path)`);
    return { width: null, height: null };
  }
  const file = join(OLD_MEDIA, legacy.slice(UPLOADS.length));
  const head = readHeader(file);
  const d = head && parseDimensions(head);
  if (!d || !d.width || !d.height) {
    unsized.push(`${legacy} (${head ? "unreadable header" : "not in old-media"})`);
    return { width: null, height: null };
  }
  sized++;
  return d;
}

// products.sql writes image rows with literal ids 1..401 and runs first, and 14
// article images are the same file as a product image. So: no explicit id (the
// rowid continues past the product rows), and OR IGNORE + a lookup by the UNIQUE
// legacy_url makes the shared rows resolve to the product's row instead of
// duplicating it. db-build.mjs pins the file order.
const imageRows = [];
const seenImage = new Set();
function imageFor(url, alt) {
  const legacy = unwrapJetpack(url);
  if (!seenImage.has(legacy)) {
    seenImage.add(legacy);
    const { width, height } = dimensionsFor(legacy);
    imageRows.push(
      `INSERT OR IGNORE INTO image (url, legacy_url, alt, width, height) VALUES ` +
        `(${q(toCdn(legacy))}, ${q(legacy)}, ${q(alt)}, ${width ?? "NULL"}, ${height ?? "NULL"});`
    );
  }
  return `(SELECT id FROM image WHERE legacy_url = ${q(legacy)})`;
}

// Body markdown is rendered as-is, so the same two hosts have to go. Uploads
// become CDN URLs; every other vattimalaysia.com link becomes site-relative so
// the rebuild does not hand its readers back to the WordPress site.
let bodyImageUrls = 0,
  bodyPageUrls = 0;
function rewriteBody(md) {
  return md
    .replace(/https?:\/\/(?:i[0-9]\.wp\.com\/)?vattimalaysia\.com\/wp-content\/uploads\/[^\s)"'\]]+/g,
      (m) => {
        bodyImageUrls++;
        return toCdn(unwrapJetpack(m));
      })
    .replace(/https?:\/\/vattimalaysia\.com\//g, () => {
      bodyPageUrls++;
      return "/";
    });
}

// ── source chrome ──────────────────────────────────────────────────────────
// Three blocks of WordPress furniture came through the scrape as body text. They
// are stripped here, not at render, so the committed SQL is the clean copy and
// every consumer of body_md — the page, a future search index — sees the same
// thing. Each pattern was measured against every affected article before it was
// written; anything that does not match exactly throws rather than guessing.

// 1. The Jetpack sharing tail. Present on all 106 articles in one identical
//    shape, and "Like Loading…" is the last non-blank line of every single body,
//    so there is never content past it and slicing to the end loses nothing.
let strippedShare = 0;
function stripShare(lines) {
  const at = lines.findIndex((l) => l.trim() === "### Share this:");
  if (at === -1) return lines;
  strippedShare++;
  return lines.slice(0, at);
}

// 2. The recipe-card widget on the 16 recipe posts — a duplicate hero image, a
//    Pinterest button, `[Print](#)`, then the name, ingredients and steps
//    repeated as prose. The page renders all of that from the `recipe`,
//    `recipe_ingredient` and `recipe_step` tables, so leaving the copy in the
//    body prints the whole recipe twice.
//
//    The card ends at the second `## ` after the button: the first is the
//    recipe's own name, the second is the article resuming. Verified on all 16 —
//    every one has exactly two `## ` after the button and the second is
//    "## Final thoughts" — so the count is asserted rather than assumed.
//    The card also carries a `### Note` that exists nowhere else — not in the
//    JSON-LD, not in the prose — so stripping the card alone loses it. It is
//    read off the raw body before the strip and stored on `recipe.notes`.
//    All 15 that have one are a single bullet; a second line means the shape
//    changed upstream, so it throws rather than silently dropping copy.
//    (cream-puff-with-custard-filing-recipe has no Note at all -> NULL.)
let capturedNotes = 0;
function recipeNote(md, path) {
  const lines = md.split("\n");
  const print = lines.findIndex((l) => l.trim() === "[Print](#)");
  if (print === -1) return null;
  const at = lines.findIndex((l, i) => i > print && l.trim() === "### Note");
  if (at === -1) return null;

  const note = [];
  for (let i = at + 1; i < lines.length && !/^#{1,6} /.test(lines[i]); i++)
    if (lines[i].trim()) note.push(lines[i].trim().replace(/^-\s+/, ""));
  if (note.length !== 1)
    throw new Error(`${path}: recipe note has ${note.length} lines, expected 1`);
  capturedNotes++;
  return note[0];
}

let strippedCards = 0;
function stripRecipeCard(lines, path) {
  const print = lines.findIndex((l) => l.trim() === "[Print](#)");
  if (print === -1) return lines;

  const headings = [];
  for (let i = print + 1; i < lines.length; i++) if (/^## /.test(lines[i])) headings.push(i);
  if (headings.length !== 2)
    throw new Error(`${path}: recipe card has ${headings.length} following '## ' headings, expected 2`);

  // The card's hero image and Pinterest button sit immediately above the button.
  let from = print;
  while (from > 0) {
    const previous = lines[from - 1].trim();
    if (previous && !/^!\[[^\]]*\]\([^)\s]+\)$/.test(previous) && !previous.startsWith("[Pin]("))
      break;
    from--;
  }
  strippedCards++;
  return [...lines.slice(0, from), ...lines.slice(headings[1])];
}

// 3. Tables. The scrape flattened every `<table>` into a stream of `|`
//    separators and cell text, one token per line, with the rows gone — the
//    column count is not recorded anywhere in the markdown. Rather than guess a
//    grid back out of that, scripts/fetch-article-tables.mjs re-reads the intact
//    markup from the REST API into research/article-tables.json, and the rows
//    are spliced back in here as GitHub-flavoured markdown.
//
//    The span to replace is not guessed either: cells are consumed forward from
//    the first `|` until as many have been collected as the upstream table has,
//    and the two lists must then match exactly. All 24 articles reconcile
//    cell-for-cell, including buying-guide/how-water-filters-work, whose pipes
//    sit mid-line and whose 2-column shape is unrecoverable from the flattening.
const norm = (s) => s.replace(/\s+/g, " ").trim();
let restoredTables = 0;
function restoreTables(lines, path) {
  const tables = TABLES[path];
  if (!tables) {
    if (lines.some((l) => l.includes("|")))
      throw new Error(`${path}: body has '|' but no upstream table was fetched`);
    return lines;
  }
  if (tables.length !== 1) throw new Error(`${path}: ${tables.length} upstream tables, splice handles 1`);

  const start = lines.findIndex((l) => l.includes("|"));
  const want = tables[0].flat();
  const got = [];
  let end = start;
  for (let i = start; i < lines.length && got.length < want.length; i++) {
    for (const part of lines[i].split("|")) if (part.trim()) got.push(part.trim());
    end = i;
  }
  if (got.length !== want.length || got.some((c, i) => norm(c) !== norm(want[i])))
    throw new Error(`${path}: flattened cells do not match the upstream table (${got.length}/${want.length})`);

  const [head, ...rows] = tables[0];
  const row = (cells) => `| ${cells.join(" | ")} |`;
  restoredTables++;
  return [
    ...lines.slice(0, start),
    row(head),
    row(head.map(() => "---")),
    ...rows.map(row),
    ...lines.slice(end + 1),
  ];
}

function cleanBody(a) {
  let lines = a.body_markdown.split("\n");
  lines = stripShare(lines);
  lines = stripRecipeCard(lines, a.path);
  lines = restoreTables(lines, a.path);
  return lines.join("\n").replace(/\n{3,}/g, "\n\n").trim();
}

// The Jetpack buttons are the only thing pointing at `?share=`, so the link rows
// they produced go with the body copy they came from.
const isShareLink = (href) => String(href).includes("?share=");

// ── titles ─────────────────────────────────────────────────────────────────
// Five titles end with a bare WordPress separator — the leftover of a
// "%title% %sep% %sitename%" template that lost its site name. This is the
// <title> Google renders, so it is trimmed. Only a *trailing* separator goes;
// punctuation inside the title is left alone.
const cleanedTitles = [];
function cleanTitle(t) {
  const trimmed = String(t).replace(/\s+[-–—|]\s*$/, "").trim();
  if (trimmed !== t) cleanedTitles.push(`${t}  ->  ${trimmed}`);
  return trimmed;
}

// ── parsing ────────────────────────────────────────────────────────────────
// '5 minutes of reading' -> 5
const readingMinutes = (s) => {
  const m = String(s || "").match(/(\d+)/);
  return m ? Number(m[1]) : null;
};
// ISO 8601 duration -> minutes. PT1H20M, PT30M, PT45S all appear upstream.
const isoMinutes = (s) => {
  const m = String(s || "").match(/^PT(?:(\d+)H)?(?:(\d+)M)?(?:(\d+)S)?$/);
  if (!m) return null;
  const mins = (+(m[1] || 0)) * 60 + +(m[2] || 0) + Math.round(+(m[3] || 0) / 60);
  return mins || null;
};
// recipeCategory / recipeCuisine are arrays with 0-2 entries and stray spaces.
const joinList = (v) =>
  (Array.isArray(v) ? v : [v]).map((s) => String(s || "").trim()).filter(Boolean).join(", ") || null;

const isInternal = (href) => /^https?:\/\/vattimalaysia\.com\//.test(String(href));

// ── unpublished ────────────────────────────────────────────────────────────
// A true duplicate of clean-baking-sheets, and already a 301 source in
// redirects.sql — see CLAUDE.md § Gotchas. The row stays so the content is still
// in the DB, but it must not build a page: the redirect runs first, so that HTML
// would be unreachable output. Swept against all 177 redirects — this is the
// only article whose own path is also a redirect source.
const UNPUBLISHED = new Set(["tips-tricks/clean-baking-sheets-2"]);

// ── build ──────────────────────────────────────────────────────────────────
const L = [];
L.push("-- GENERATED by scripts/import-articles.mjs — do not hand-edit.");
L.push("-- Regenerate with: node scripts/import-articles.mjs\n");

CATEGORIES.forEach((c, i) =>
  L.push(
    `INSERT INTO blog_category (id, slug, name, sort_order) VALUES ` +
      `(${i + 1}, ${q(c.slug)}, ${q(c.name)}, ${i});`
  )
);
L.push("");

const body = [];
let recipeSeq = 0,
  recipeCount = 0,
  stepCount = 0,
  ingredientCount = 0,
  linkCount = 0,
  externalLinks = 0,
  droppedBlanks = 0,
  imageLinks = 0,
  unpublished = [],
  correctedCategories = [];

articles.forEach((a, i) => {
  const id = i + 1;

  const featured = a.featured_image ? imageFor(a.featured_image, a.featured_image_alt) : "NULL";

  body.push(
    `INSERT INTO article (id, slug, path, section, title, h1, meta_description, body_md, ` +
      `word_count, reading_minutes, author, featured_image_id, published_at, modified_at, ` +
      `schema_disabled, is_published) VALUES (` +
      [
        id,
        q(a.slug),
        q(a.path),
        q(a.section),
        q(cleanTitle(a.title)),
        q(a.h1),
        q(a.meta_description),
        q(rewriteBody(cleanBody(a))),
        a.word_count ?? 0,
        readingMinutes(a.reading_time) ?? "NULL",
        q(a.author),
        featured,
        q(a.date_published),
        q(a.date_modified),
        a.schema_disabled ? 1 : 0,
        UNPUBLISHED.has(a.path) ? 0 : 1,
      ].join(", ") +
      `);`
  );
  if (UNPUBLISHED.has(a.path)) unpublished.push(a.path);

  // primary = the URL section; the WordPress categories follow as secondary
  const primary = SECTION_PRIMARY[a.section];
  const wp = (a.wp_categories || []).map((c) => c.slug).filter((s) => catId[s]);
  if (wp.length && !wp.includes(a.section)) correctedCategories.push(`${a.path} (wp: ${wp.join(",")})`);

  body.push(
    `INSERT INTO article_category (article_id, category_id, is_primary) VALUES ` +
      `(${id}, ${primary}, 1);`
  );
  for (const slug of wp) {
    if (catId[slug] === primary) continue;
    body.push(
      `INSERT INTO article_category (article_id, category_id, is_primary) VALUES ` +
        `(${id}, ${catId[slug]}, 0);`
    );
  }

  (a.inline_images || []).forEach((im, n) => {
    imageLinks++;
    body.push(
      `INSERT INTO article_image (article_id, image_id, position) VALUES ` +
        `(${id}, ${imageFor(im.src, im.alt)}, ${n});`
    );
  });

  (a.links || []).filter((l) => !isShareLink(l.href)).forEach((l, n) => {
    linkCount++;
    if (!isInternal(l.href)) externalLinks++;
    body.push(
      `INSERT INTO article_link (article_id, position, kind, href, target_slug, anchor) VALUES ` +
        `(${id}, ${n}, ${q(l.kind)}, ${q(l.href)}, ` +
        // the scrape derives `slug` from the path even for offsite hrefs, where
        // it comes out as 'https:/www.pinterest.com/pin/create/button'
        `${q(isInternal(l.href) ? l.slug : null)}, ${q((l.anchors || [])[0])});`
    );
  });

  const r = a.recipe;
  if (!r) return;
  recipeCount++;
  const rid = ++recipeSeq;
  body.push(
    `INSERT INTO recipe (id, article_id, position, name, description, prep_minutes, ` +
      `cook_minutes, total_minutes, yield_qty, yield_label, cuisine, meal_category, ` +
      `calories, notes, hero_image_id) VALUES (` +
      [
        rid,
        id,
        1,
        q(r.name),
        q(r.description),
        isoMinutes(r.prepTime) ?? "NULL",
        isoMinutes(r.cookTime) ?? "NULL",
        isoMinutes(r.totalTime) ?? "NULL",
        q((r.recipeYield || [])[0]),
        q((r.recipeYield || [])[1]),
        q(joinList(r.recipeCuisine)),
        q(joinList(r.recipeCategory)),
        q(r.nutrition && r.nutrition.calories),
        q(recipeNote(a.body_markdown, a.path)),
        (r.image || [])[0] ? imageFor(r.image[0], r.name) : "NULL",
      ].join(", ") +
      `);`
  );
  // simple-chicken-lasagna-recipe has one blank list item; a row of empty string
  // is worse than no row, and positions only have to be unique, not contiguous.
  const nonBlank = (v) => String(v || "").trim() !== "";
  (r.ingredients || []).filter(nonBlank).forEach((text, n) => {
    ingredientCount++;
    body.push(
      `INSERT INTO recipe_ingredient (recipe_id, position, text) VALUES (${rid}, ${n}, ${q(text)});`
    );
  });
  (r.instructions || []).filter((s) => nonBlank(s.text)).forEach((s, n) => {
    stepCount++;
    body.push(`INSERT INTO recipe_step (recipe_id, position, text) VALUES (${rid}, ${n}, ${q(s.text)});`);
  });
  droppedBlanks += (r.ingredients || []).length - (r.ingredients || []).filter(nonBlank).length;
});

const sql = [...L, ...imageRows, "", ...body, ""].join("\n");
mkdirSync(join(root, "data/sql"), { recursive: true });
writeFileSync(join(root, "data/sql/articles.sql"), sql);

const bySection = {};
articles.forEach((a) => (bySection[a.section] = (bySection[a.section] || 0) + 1));

console.log(`articles      ${articles.length} (${all.length - articles.length} stub skipped)`);
console.log(`sections      ${Object.entries(bySection).map(([k, v]) => `${k}=${v}`).join("  ")}`);
console.log(`images        ${seenImage.size} unique, ${imageLinks} inline placements`);
console.log(`jetpack       ${unwrappedJetpack} i0.wp.com URLs unwrapped`);
console.log(`body urls     ${bodyImageUrls} media -> CDN, ${bodyPageUrls} page links -> site-relative`);
console.log(`recipes       ${recipeCount} with ${ingredientCount} ingredients, ${stepCount} steps (${droppedBlanks} blank dropped)`);
console.log(`links         ${linkCount} (${externalLinks} external), share buttons dropped`);
console.log(`chrome        ${strippedShare} share tails, ${strippedCards} recipe cards stripped`);
console.log(`recipe notes  ${capturedNotes}/${recipeCount} '### Note' captured before the strip`);
console.log(`tables        ${restoredTables} restored from research/article-tables.json`);
console.log(`dimensions    ${sized}/${seenImage.size} images sized from old-media`);
unsized.forEach((u) => console.log(`                ${u}`));
console.log(`unpublished   ${unpublished.length} kept as rows, no page: ${unpublished.join(", ")}`);
console.log(`titles        ${cleanedTitles.length} trailing separators trimmed`);
cleanedTitles.forEach((t) => console.log(`                ${t}`));
console.log(`categories    ${correctedCategories.length} corrected to match the URL`);
correctedCategories.forEach((c) => console.log(`                ${c}`));
console.log(`wrote         data/sql/articles.sql`);
