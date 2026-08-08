// WordPress REST  ->  research/article-tables.json
//
// The scrape in research/articles.json flattened every `<table>` into a stream
// of `|` separators and cell text, one token per line, with the rows gone. The
// live REST API still serves the intact markup, so the structure is recoverable
// from the source rather than guessed at from the wreckage.
//
//   node scripts/fetch-article-tables.mjs
//
// Run this only when the scrape changes. The output is committed and is what
// import-articles.mjs reads; nothing here runs at build time, and the importer
// never touches the network.

import { readFileSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");
const all = JSON.parse(readFileSync(join(root, "research/articles.json"), "utf8"));

// Only the articles whose body actually lost a table need refetching.
const targets = all.filter((a) => a.is_article && a.body_markdown.includes("|"));

const ENTITIES = { amp: "&", lt: "<", gt: ">", quot: '"', apos: "'", nbsp: " ", "#8217": "’", "#8216": "‘", "#8220": "“", "#8221": "”", "#8211": "–", "#8212": "—", "#038": "&", "#039": "'", hellip: "…" };
const decode = (s) =>
  s.replace(/&(#x?[0-9a-f]+|[a-z]+);/gi, (m, e) => {
    const key = e.toLowerCase();
    if (ENTITIES[key] !== undefined) return ENTITIES[key];
    if (/^#x/i.test(e)) return String.fromCodePoint(parseInt(e.slice(2), 16));
    if (/^#/.test(e)) return String.fromCodePoint(Number(e.slice(1)));
    return m;
  });

// Cell text only. The Stratum table widget wraps every cell in two divs and a
// span and the odd <br>; none of that survives into markdown, and a cell that
// contained a link keeps it as markdown so the importer's URL rewrite still sees
// it. Nothing else in the corpus has inline markup inside a cell.
// Emphasis is converted before links so that a link label wrapping an <em> keeps
// its markers inside the label, which is how the scrape recorded it.
const cellText = (html) =>
  decode(
    html
      .replace(/<(strong|b)\b[^>]*>([\s\S]*?)<\/\1>/gi, (m, t, x) => `**${x.replace(/<[^>]+>/g, "").trim()}**`)
      .replace(/<(em|i)\b[^>]*>([\s\S]*?)<\/\1>/gi, (m, t, x) => `*${x.replace(/<[^>]+>/g, "").trim()}*`)
      .replace(/<a\b[^>]*\bhref=["']([^"']*)["'][^>]*>([\s\S]*?)<\/a>/gi, (m, href, label) =>
        `[${label.replace(/<[^>]+>/g, "").trim()}](${href})`
      )
      .replace(/<br\s*\/?>/gi, " ")
      .replace(/<[^>]+>/g, "")
  )
    .replace(/\s+/g, " ")
    .trim();

function parseTables(html) {
  const tables = [];
  for (const t of html.match(/<table[\s\S]*?<\/table>/gi) || []) {
    const rows = [];
    for (const tr of t.match(/<tr[\s\S]*?<\/tr>/gi) || []) {
      const cells = [...tr.matchAll(/<(th|td)\b[^>]*>([\s\S]*?)<\/\1>/gi)].map((m) => cellText(m[2]));
      if (cells.length) rows.push(cells);
    }
    if (rows.length) tables.push(rows);
  }
  return tables;
}

const out = {};
let fetched = 0;
for (const a of targets) {
  const url =
    `https://vattimalaysia.com/wp-json/wp/v2/posts?slug=${encodeURIComponent(a.slug)}&_fields=slug,content`;
  const res = await fetch(url);
  if (!res.ok) throw new Error(`${a.path}: HTTP ${res.status}`);
  const [post] = await res.json();
  if (!post) throw new Error(`${a.path}: no post for slug ${a.slug}`);
  const tables = parseTables(post.content.rendered);
  if (!tables.length) throw new Error(`${a.path}: no <table> upstream`);
  out[a.path] = tables;
  fetched++;
  console.log(
    `${a.path}  ${tables.length} table(s)  ${tables.map((t) => `${t.length}x${t[0].length}`).join(" ")}`
  );
}

writeFileSync(join(root, "research/article-tables.json"), JSON.stringify(out, null, 2) + "\n");
console.log(`\nfetched ${fetched} articles -> research/article-tables.json`);
