#!/usr/bin/env node
/**
 * The language gate, run against a live build:
 *
 *   pnpm build && pnpm start -p 3900
 *   node scripts/i18n-check.mjs http://localhost:3900
 *
 * For every URL in the sitemap it asserts:
 *   1. it answers 200;
 *   2. <html lang> matches the edition its path is in (/ms/ ms-MY, /zh/ zh-MY,
 *      everything else en-MY);
 *   3. its hreflang set is reciprocal: every page it names as a translation
 *      names it back, with the same tag, and the set includes itself.
 *
 * urls:check guards the legacy URL contract; this guards the editions. Both
 * gate a push. The sitemap is fetched from the server rather than built here,
 * so the check covers exactly what crawlers will be handed.
 */
const base = (process.argv[2] ?? "").replace(/\/$/, "");
if (!base) {
  console.error("usage: node scripts/i18n-check.mjs <base-url>");
  process.exit(2);
}

const PROD = "https://vattimalaysia.com";
const local = (u) => u.replace(PROD, base);
const pathOf = (u) => new URL(u).pathname;
const editionOf = (path) => (path.startsWith("/ms/") ? "ms-MY" : path.startsWith("/zh/") ? "zh-MY" : "en-MY");

const xml = await (await fetch(`${base}/sitemap.xml`)).text();
const urls = [...xml.matchAll(/<loc>([^<]+)<\/loc>/g)].map((m) => m[1]);
console.log(`checking ${urls.length} sitemap URLs against ${base}`);

const pages = new Map(); // path -> { status, lang, alternates: Map(tag -> path) }
let i = 0;
const worker = async () => {
  while (i < urls.length) {
    const u = urls[i++];
    const path = pathOf(u);
    const res = await fetch(local(u), { redirect: "manual" });
    const html = res.status === 200 ? await res.text() : "";
    const lang = /<html[^>]*\slang="([^"]+)"/.exec(html)?.[1] ?? null;
    const alternates = new Map();
    for (const m of html.matchAll(/<link[^>]+rel="alternate"[^>]*>/g)) {
      const tag = /hrefLang="([^"]+)"|hreflang="([^"]+)"/i.exec(m[0]);
      const href = /href="([^"]+)"/.exec(m[0]);
      if (tag && href) alternates.set(tag[1] ?? tag[2], pathOf(new URL(href[1], PROD).href));
    }
    pages.set(path, { status: res.status, lang, alternates });
  }
};
await Promise.all(Array.from({ length: 8 }, worker));

const failures = [];
for (const [path, p] of pages) {
  if (p.status !== 200) {
    failures.push(`${p.status}  ${path}`);
    continue;
  }
  if (p.lang !== editionOf(path)) failures.push(`lang ${p.lang} on ${path} (expected ${editionOf(path)})`);
  if (p.alternates.size === 0) continue;
  const own = [...p.alternates].find(([tag, href]) => tag !== "x-default" && href === path);
  if (!own) failures.push(`hreflang set on ${path} does not include itself`);
  else if (own[0] !== editionOf(path)) failures.push(`hreflang ${own[0]} names ${path}, which is ${editionOf(path)}`);
  for (const [tag, href] of p.alternates) {
    if (tag === "x-default" || href === path) continue;
    const other = pages.get(href);
    if (!other) {
      failures.push(`${path} names ${href} (${tag}), which is not in the sitemap`);
      continue;
    }
    const back = [...other.alternates].some(([t, h]) => t !== "x-default" && h === path);
    if (!back) failures.push(`${path} -> ${href} (${tag}) is not reciprocated`);
  }
}

const counts = {};
for (const path of pages.keys()) counts[editionOf(path)] = (counts[editionOf(path)] ?? 0) + 1;
console.log(
  Object.entries(counts)
    .map(([k, v]) => `${k}: ${v}`)
    .join(" · ")
);
if (failures.length) {
  console.log(`\n${failures.length} failure(s):`);
  for (const f of failures) console.log(`  ${f}`);
  process.exit(1);
}
console.log("all editions consistent");
