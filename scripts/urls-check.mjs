// The launch gate. Replays every legacy URL against a deployment.
//
//   node scripts/urls-check.mjs http://localhost:3000
//   node scripts/urls-check.mjs https://vatti-web-git-main.vercel.app
//
// Reads research/url-inventory.json and requests every recorded path. A path
// fails if it 404s, 5xxs, or redirects into something that does. Failures are
// listed worst-first by Search Console clicks, so the most expensive breakage is
// the first line you read. Exits non-zero on any failure — it is a gate, not a
// report, and it does not soften anything.

import { readFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const base = process.argv[2]?.replace(/\/$/, "");
if (!base) {
  console.error("usage: node scripts/urls-check.mjs <base-url>");
  process.exit(2);
}

const root = join(dirname(fileURLToPath(import.meta.url)), "..");
const inventory = JSON.parse(readFileSync(join(root, "research/url-inventory.json"), "utf8"));
const CONCURRENCY = 8;
const HOPS = 6;

// /wp-content/uploads/** 301s to the R2 CDN — a different host, but still part of
// the production surface, and several PDFs rank on their own. Follow it there and
// require a 200: a redirect into a missing object is a 404 with extra steps.
const UPLOADS = "/wp-content/uploads/";

// A bot filter answering HEAD with 428/429 would read as a lost URL. Send a UA
// and retry once with GET before believing an infrastructure status.
const UA = { "user-agent": "Mozilla/5.0 (compatible; vatti-urls-check/1.0)" };
const FLAKY = new Set([408, 425, 428, 429, 500, 502, 503]);
const sleep = (ms) => new Promise((r) => setTimeout(r, ms));

async function check(path) {
  let url = base + path.split("#")[0];
  let status = 0;
  for (let hop = 0; hop < HOPS; hop += 1) {
    let res;
    try {
      res = await fetch(url, { method: "HEAD", redirect: "manual", headers: UA });
      if (res.status === 405 || res.status === 501 || FLAKY.has(res.status)) {
        await sleep(1000);
        res = await fetch(url, { method: "GET", redirect: "manual", headers: UA });
      }
    } catch (err) {
      return { status, final: url, ok: false, why: String(err.cause?.code ?? err.message) };
    }
    if (hop === 0) status = res.status;
    const location = res.headers.get("location");
    if (res.status >= 300 && res.status < 400 && location) {
      const next = new URL(location, url);
      if (next.origin !== new URL(base).origin && !path.startsWith(UPLOADS)) {
        return { status, final: next.toString(), ok: true };
      }
      url = next.toString();
      continue;
    }
    return { status, final: url, final_status: res.status, ok: res.status === 200, why: `ends in ${res.status}` };
  }
  return { status, final: url, ok: false, why: "redirect loop" };
}

async function pool(items, worker) {
  const out = new Array(items.length);
  let next = 0;
  await Promise.all(
    Array.from({ length: CONCURRENCY }, async () => {
      for (;;) {
        const i = next++;
        if (i >= items.length) return;
        out[i] = await worker(items[i]);
      }
    }),
  );
  return out;
}

const results = await pool(inventory.urls, async (u) => ({ ...u, ...(await check(u.path)) }));

const failures = results.filter((r) => !r.ok).sort((a, b) => b.clicks - a.clicks || b.impressions - a.impressions);
const ok200 = results.filter((r) => r.ok && r.status === 200).length;
const ok3xx = results.filter((r) => r.ok && r.status >= 300 && r.status < 400).length;

if (failures.length) {
  console.error(`\n${failures.length} legacy URL(s) broken on ${base}, worst first:\n`);
  for (const f of failures) {
    console.error(`  ${String(f.clicks).padStart(6)} clicks  ${f.status || "ERR"}  ${f.path}  (${f.why})`);
  }
  const lost = failures.reduce((n, f) => n + f.clicks, 0);
  console.error(`\n  ${lost} Search Console clicks (${inventory.gsc_range.start}..${inventory.gsc_range.end}) at risk.`);
}

console.log(
  `\nchecked ${results.length} · 200: ${ok200} · 3xx: ${ok3xx} · failed: ${failures.length}  (${base})`,
);
process.exit(failures.length ? 1 : 0);
