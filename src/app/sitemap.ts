import type { MetadataRoute } from "next";

import { archives, articleDates } from "@/lib/queries/article";
import { categorySlugs } from "@/lib/queries/category";
import { productSlugs } from "@/lib/queries/product";
import { redirectPaths } from "@/lib/queries/redirect";
import { storeSlugs } from "@/lib/queries/store";

/**
 * Read from the database at build time, exactly like the routes themselves, so
 * the sitemap cannot drift from what actually builds. Never a hardcoded list.
 *
 * `metadataBase` does not apply here — sitemap entries must be absolute, and
 * Next emits the `url` string verbatim, so every path carries the trailing
 * slash that `trailingSlash: true` serves. Without it every entry would 308 and
 * the sitemap would be worthless.
 *
 * lastModified is set only where a real date exists: `article` has
 * published_at/modified_at, and a blog archive inherits the newest date among
 * its members. Products, categories, dealers and the static pages carry no
 * date column, so they ship without one rather than with an invented build
 * timestamp — <lastmod> is optional, a wrong <lastmod> is a lie Google learns
 * to ignore.
 */
const ORIGIN = "https://vattimalaysia.com";

function entry(path: string, lastModified?: string | null) {
  return { url: `${ORIGIN}${path}`, ...(lastModified ? { lastModified } : {}) };
}

export default function sitemap(): MetadataRoute.Sitemap {
  const all: MetadataRoute.Sitemap = [
    entry("/"),
    entry("/about-us/"),
    entry("/contact-us/"),
    entry("/vatti-ewarranty/"),
    entry("/vatti-pay/"),
    entry("/store-locations/"),
    ...productSlugs().map((slug) => entry(`/${slug}/`)),
    ...categorySlugs().map((slug) => entry(`/${slug}/`)),
    ...articleDates().map((a) => entry(`/${a.path}/`, a.last_modified)),
    ...archives().flatMap((a) => [
      entry(`/category/${a.slug}/`, a.last_modified),
      ...Array.from({ length: a.pages - 1 }, (_, i) =>
        entry(`/category/${a.slug}/page/${i + 2}/`, a.last_modified)
      ),
    ]),
    ...storeSlugs().map((slug) => entry(`/store/${slug}/`)),
  ];

  // A URL that 301s must never be listed, and next.config.ts's redirects() runs
  // before static routes — so wherever a route and a redirect claim the same
  // path, the redirect is what a crawler gets. Filtered against the same table
  // that generates those 301s rather than maintained as an exception list.
  //
  // Exactly one path is dropped today: /tips-tricks/clean-baking-sheets-2/,
  // still `is_published = 1` in the article table even though CLAUDE.md rules
  // it a duplicate of clean-baking-sheets. Its prerendered HTML is unreachable
  // behind the 301; the fix belongs in data/sql, not here.
  const redirected = new Set(redirectPaths());
  return all.filter((e) => !redirected.has(new URL(e.url).pathname));
}
