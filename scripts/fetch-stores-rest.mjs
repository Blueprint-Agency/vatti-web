// WP REST `store` CPT  ->  research/stores-rest.json
//
// The only authoritative source for dealer slugs and permalinks. The
// /store-locations/ page scrape in research/stores.json records stale
// root-level permalinks that 301 to the homepage, and its slugs agree with
// WordPress on just 14 of 75 rows.
//
//   node scripts/fetch-stores-rest.mjs
//
// Two calls: the CPT, then the featured-media source_urls it points at. The
// image filename is what import-stores.mjs joins the two files on — the CPT
// exposes no address, and two dealers share a name across two branches, so the
// image is the only field that separates them.

import { writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");
const API = "https://vattimalaysia.com/wp-json/wp/v2";

const get = async (url) => {
  const res = await fetch(url);
  if (!res.ok) throw new Error(`${res.status} ${url}`);
  return res.json();
};

const stores = await get(`${API}/store?per_page=100&_fields=id,slug,link,title,featured_media`);

const ids = stores.map((s) => s.featured_media).filter(Boolean);
const media = {};
for (let i = 0; i < ids.length; i += 50) {
  const batch = ids.slice(i, i + 50);
  for (const m of await get(`${API}/media?include=${batch.join(",")}&per_page=100&_fields=id,source_url`)) {
    media[m.id] = m.source_url;
  }
}

const out = stores.map((s) => ({
  id: s.id,
  slug: s.slug,
  link: s.link,
  title: s.title.rendered,
  featured_image: media[s.featured_media] ?? null,
}));

// The join has no fallback key, so a missing image is a store we cannot place.
const blind = out.filter((s) => !s.featured_image);
if (blind.length) throw new Error(`no featured image on: ${blind.map((s) => s.slug).join(", ")}`);

writeFileSync(join(root, "research/stores-rest.json"), JSON.stringify(out, null, 1) + "\n");
console.log(`stores        ${out.length}`);
console.log(`images        ${Object.keys(media).length} featured-media URLs resolved`);
console.log(`wrote         research/stores-rest.json`);
