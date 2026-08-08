// research/url-inventory.json  ->  data/sql/redirects.sql
//
// Run this when the inventory is rebuilt. The generated SQL is the committed
// source of truth and is what gets reviewed in PRs; nothing reads the inventory
// at build time.
//
//   node scripts/build-url-inventory.mjs   # refresh the evidence first
//   node scripts/import-redirects.mjs
//
// Every row here is justified by one of four things, and nothing else:
//   observed  — the live site answers this path with a 301 today
//   family    — a duplicate URL family; the member the live site no longer serves
//               points at the one it does
//   cpt       — a WordPress CPT permalink that duplicates a product page
//   owner     — confirmed by the site owner, or a slug typo with an obvious target

import { readFileSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");
const inventory = JSON.parse(readFileSync(join(root, "research/url-inventory.json"), "utf8"));
const byPath = new Map(inventory.urls.map((u) => [u.path, u]));

const q = (v) => `'${String(v).replace(/'/g, "''")}'`;

// from_path -> { to, why, note }. Later writes lose to earlier ones, so the
// order of the passes below is the precedence order.
const redirects = new Map();
const put = (from, to, why, note) => {
  if (!redirects.has(from)) redirects.set(from, { to, why, note });
};

// ── owner-confirmed ────────────────────────────────────────────────────────
// These four are instructions, not observations. /oven/ and /oven/recipe/ are
// still 200 on the live site; the owner wants them folded away.
for (const [from, to, note] of [
  ["/oven/", "/combi-and-steam-oven-in-malaysia/", "empty orphan stub; owner-confirmed"],
  ["/oven/recipe/", "/category/recipe/", "empty orphan stub; owner-confirmed"],
  ["/tips-tricks/clean-baking-sheets-2/", "/tips-tricks/clean-baking-sheets/", "true duplicate; owner-confirmed"],
  [
    "/vatti-built-in-air-fryer-oven-o7559/",
    "/vatti-built-in-air-fryer-oven-07559/",
    "letter O -> the live slug's digit zero; 404 today",
  ],
  ["/contact/", "/contact-us/", "404 today; /contact-us/ is the live contact page"],
  [
    "/buying-guide/is-an-infrared-stove-worth-it/",
    "/buying-guide/is-an-infrared-gas-stove-worth-it/",
    "404 today; slug is the live post's minus one word",
  ],
  [
    "/buying-guide/is-infrared-gas-stove-worth-it/",
    "/buying-guide/is-an-infrared-gas-stove-worth-it/",
    "404 today; slug is the live post's minus one word",
  ],
  [
    "/how-to-unstick-aluminum-foil-handy-tips/",
    "/tips-tricks/how-to-unstick-food-from-aluminum-foil-handy-tips/",
    "404 today; slug is the live post's minus one word",
  ],
  // The one inference in this file. The post is gone from WordPress entirely (no
  // REST hit, no sitemap entry) and 151 impressions still land on the 404, so it
  // goes to the category page its slug is about. Repoint it if a better target
  // turns up.
  [
    "/best-kitchen-hoods-for-modern-malaysian-cooking/",
    "/kitchen-hood-in-malaysia/",
    "deleted post, 404 today; nearest live page by topic — the one inferred target here",
  ],
]) {
  put(from, to, "owner", note);
}

// ── duplicate URL families ─────────────────────────────────────────────────
// Both members of each pair earned clicks. The live site keeps exactly one of
// them (see url-inventory.json § duplicate_families for the evidence per pair);
// the other becomes a 301 to it. rel=canonical is useless here — Rank Math
// self-canonicals every page — so "which one still answers 200" is the signal.
//
// This pass runs BEFORE the observed-301 pass on purpose. Six root paths are
// live 301s to the HOMEPAGE even though the sectioned article is alive and
// serving the same content; reproducing that would keep dumping readers on the
// home page. The family target is strictly better and is the direction the owner
// asked for.
for (const f of inventory.duplicate_families) {
  if (!f.canonical_path) continue;
  const loser = f.canonical_path === f.sectioned.path ? f.root : f.sectioned;
  if (loser.status === 301 && loser.final_path === f.canonical_path) continue; // already correct
  put(loser.path, f.canonical_path, "family", f.evidence);
}

// ── observed live 301s ─────────────────────────────────────────────────────
// Reproduce what the live site does today, exactly. One exception: a 301 whose
// destination is itself a 404 is a broken chain, and the one rule does not allow
// shipping it. There is one, and its intended target is unambiguous.
const BROKEN_TARGET = {
  "/which-is-better-induction-or-ceramic-cooker/": "/buying-guide/which-is-better-induction-or-ceramic-cooker/",
};
for (const u of inventory.urls) {
  if (u.status !== 301) continue;
  const fixed = BROKEN_TARGET[u.final_path];
  put(
    u.path,
    fixed ?? u.final_path,
    "observed",
    fixed ? `live 301 lands on a 404 (${u.final_path}); repointed at the live article` : undefined,
  );
}

// ── CPT permalinks ─────────────────────────────────────────────────────────
// 32 WordPress custom-post-type permalinks serving duplicate copies of the
// product pages. All 200 today, none in the sitemap, none earning a click.
// Written out literally: they are fixed legacy strings, and a table is easier to
// review in a PR than a slug-matching heuristic that has to special-case o7559.
const CPT = {
  "/kitchen-hood-categor/aetheris-series-v929/": "/vatti-aetheris-series-cooker-hood-v929/",
  "/kitchen-hood-categor/artemis-series-v931/": "/artemis-series-t-type-range-hood-v931/",
  "/kitchen-hood-categor/artemis-series-v999/": "/athena-series-lifting-type-range-hood-v999/",
  "/kitchen-hood-categor/athena-series-v993/": "/athena-series-lifting-type-range-hood-v993/",
  "/kitchen-hood-categor/cooker-hood-v917-carbon-grey/": "/vatti-cooker-hood-v917-carbon-grey/",
  "/kitchen-hood-categor/cooker-hood-v917-white/": "/vatti-cooker-hood-v917-white/",
  "/kitchen-hood-categor/magic-series-v919/": "/vatti-magic-series-cooker-hood-v919/",
  "/kitchen-hood-categor/range-hood-v997/": "/vatti-range-hood-v997/",
  "/kitchen-hood-categor/slim-series-type-v995/": "/slim-series-type-range-hood-v995/",
  "/kitchen-hood-categor/slim-series-type-v996/": "/vatti-slim-series-type-range-hood-v996/",
  "/kitchen-hood-categor/smart-oxygen-v998/": "/vatti-smart-oxygen-range-hood-v998/",
  "/kitchen-hood-categor/stellar-series-v960/": "/vatti-stellar-series-cooker-hood-v960/",
  "/kitchen-hood-categor/triple-intake-series-v937/": "/triple-intake-series-t-type-cooker-hood-v937/",
  "/kitchen-hood-categor/vatti-stellar-series-cooker-hood-v960/": "/vatti-stellar-series-cooker-hood-v960/",
  "/cooker-hob-category/3-burner-gas-hob-c830g/": "/vatti-3-burner-gas-hob-c830g/",
  "/cooker-hob-category/ai-hob-c835g/": "/vatti-ai-hob-c835g/",
  "/cooker-hob-category/ceramic-cooker-hob-er3601t/": "/ceramic-cooker-hob-er3601t/",
  "/cooker-hob-category/ceramic-cooker-hob-er5902t/": "/ceramic-cooker-hob-er5902t/",
  "/cooker-hob-category/cooker-hob-c821g/": "/professional-series-c821g/",
  "/cooker-hob-category/flexi-hob-c822g/": "/vatti-flexi-hob-c822g/",
  "/cooker-hob-category/flexi-hob-c823g/": "/vatti-flexi-hob-c823g/",
  "/cooker-hob-category/magic-series-c861g/": "/vatti-magic-series-cooker-hob-c861g/",
  "/cooker-hob-category/olympic-hob-m822g/": "/vatti-oylimpic-hob-m822g/",
  "/cooker-hob-category/professional-series-c720s/": "/professional-series-c720s/",
  "/cooker-hob-category/vatti-flexi-hob-c836g/": "/vatti-flexi-hob-c836g/",
  "/combine-oven-cate/combi-oven-va03/": "/built-in-combi-oven-va03/",
  "/combine-oven-cate/combi-oven-va05/": "/built-in-combi-oven-va05/",
  "/combine-oven-cate/magic-series-va06/": "/vatti-magic-series-combi-oven-va06/",
  "/combine-oven-cate/vatti-built-in-air-fryer-oven-o7559/": "/vatti-built-in-air-fryer-oven-07559/",
  "/combine-oven-cate/vatti-built-in-microwave-m626/": "/built-in-microwave-m626/",
  "/dishwasher-cate/vatti-dishwasher-dwbb7/": "/vatti-dishwasher-dwbb7/",
  "/water-purifier-cate/vatti-one-tap-water-purifier-wdhg01-v818wd/": "/vatti-one-tap-water-purifier-wdhg01-with-v818wd/",
};
for (const [from, to] of Object.entries(CPT)) put(from, to, "cpt");

// ── assertions ─────────────────────────────────────────────────────────────
// A redirect that lands on a 404, on another redirect, or on itself is worse
// than no redirect at all. Fail loudly rather than write one.
const problems = [];
for (const [from, r] of redirects) {
  if (from === r.to) problems.push(`self-redirect: ${from}`);
  if (redirects.has(r.to)) problems.push(`chained: ${from} -> ${r.to} -> ${redirects.get(r.to).to}`);
  const target = byPath.get(r.to);
  if (r.to !== "/" && target && target.status !== 200) {
    problems.push(`target is ${target.status} on the live site: ${from} -> ${r.to}`);
  }
  if (r.to !== "/" && !target && !CPT[from]) problems.push(`target not in the inventory: ${from} -> ${r.to}`);
}
// Every CPT permalink the REST API lists must be accounted for.
const cptLive = inventory.urls.filter((u) =>
  /^\/(kitchen-hood-categor|cooker-hob-category|combine-oven-cate|dishwasher-cate|water-purifier-cate)\//.test(u.path),
);
for (const u of cptLive) if (!CPT[u.path]) problems.push(`CPT permalink with no mapping: ${u.path}`);
// So must every legacy URL that is a 404 today — the whole point of the exercise.
for (const u of inventory.urls) {
  if (u.status === 404 && !redirects.has(u.path) && !u.path.startsWith("/wp-content/uploads/")) {
    problems.push(`404 today with no redirect: ${u.path} (${u.clicks} clicks)`);
  }
}
if (problems.length) {
  console.error(problems.map((p) => `  ${p}`).join("\n"));
  process.exit(1);
}

// ── emit ───────────────────────────────────────────────────────────────────
const WHY = {
  owner: "Owner-confirmed, and slug typos with one obvious target",
  family: "Duplicate URL families — the member the live site dropped, pointed at the one it kept",
  observed: "Live 301s on vattimalaysia.com today, reproduced as-is",
  cpt: "WordPress CPT permalinks duplicating a product page",
};

const clicks = (from) => byPath.get(from)?.clicks ?? 0;
const lines = [
  "-- Generated by scripts/import-redirects.mjs from research/url-inventory.json.",
  "-- Do not edit by hand: re-run the importer.",
  "--",
  "-- Every legacy URL resolves 200 or 301, never 404 (CLAUDE.md § The one rule).",
  "-- /wp-content/uploads/** is NOT in here: next.config.ts 301s that whole prefix to",
  "-- the R2 CDN before routing, so a row here would never fire.",
  "--",
  `-- ${redirects.size} redirects, from an inventory of ${inventory.urls.length} URLs probed on ${inventory.generated}.`,
  "",
  "DELETE FROM redirect;",
];

for (const why of ["owner", "family", "observed", "cpt"]) {
  const rows = [...redirects]
    .filter(([, r]) => r.why === why)
    .sort((a, b) => clicks(b[0]) - clicks(a[0]) || a[0].localeCompare(b[0]));
  lines.push("", "-- " + "─".repeat(76), `-- ${WHY[why]} (${rows.length})`, "-- " + "─".repeat(76));
  for (const [from, r] of rows) {
    if (r.note) lines.push(`-- ${r.note}`);
    lines.push(`INSERT INTO redirect (from_path, to_path, code) VALUES (${q(from)}, ${q(r.to)}, 301);`);
  }
}

writeFileSync(join(root, "data/sql/redirects.sql"), lines.join("\n") + "\n");
console.log(`data/sql/redirects.sql — ${redirects.size} redirects`);
for (const why of ["owner", "family", "observed", "cpt"]) {
  console.log(`  ${why}: ${[...redirects.values()].filter((r) => r.why === why).length}`);
}
