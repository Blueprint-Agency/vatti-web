import type { MetadataRoute } from "next";

import { LOCALES, localeFromTag } from "@/i18n/config";
import { hreflang, type Editions } from "@/lib/alternates";
import { SITE_ORIGIN } from "@/lib/deployment";
import { archives, articleDates } from "@/lib/queries/article";
import { categorySlugs } from "@/lib/queries/category";
import { productSlugs } from "@/lib/queries/product";
import { redirectPaths } from "@/lib/queries/redirect";
import { storeSlugs } from "@/lib/queries/store";
import { archivePageHref } from "@/lib/routes";

/**
 * Read from the database at build time, exactly like the routes themselves, so
 * the sitemap cannot drift from what actually builds. Never a hardcoded list.
 *
 * Every edition is in the one sitemap, and each entry that has translations
 * carries them as hreflang alternates — the same sets the pages declare in
 * their <head>, built by the same `hreflang()`, so the two cannot disagree.
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
function entry(path: string, lastModified?: string | null, editions?: Editions) {
  const languages = editions && hreflang(editions);
  return {
    url: `${SITE_ORIGIN}${path}`,
    ...(lastModified ? { lastModified } : {}),
    ...(languages
      ? {
          alternates: {
            languages: Object.fromEntries(
              Object.entries(languages).map(([tag, p]) => [tag, `${SITE_ORIGIN}${p}`])
            ),
          },
        }
      : {}),
  };
}

export default function sitemap(): MetadataRoute.Sitemap {
  // Articles, grouped into their translation sets.
  const articles = articleDates();
  const sets = new Map<string, Editions>();
  for (const a of articles) {
    if (!a.translation_key) continue;
    const set = sets.get(a.translation_key) ?? {};
    set[localeFromTag(a.lang)] = a.href;
    sets.set(a.translation_key, set);
  }

  // Archives: the same section and page number across editions.
  const archiveEntries = LOCALES.flatMap((locale) =>
    archives(locale).flatMap((a) =>
      Array.from({ length: a.pages }, (_, i) => {
        const page = i + 1;
        const editions: Editions = {};
        for (const l of LOCALES) {
          const other = archives(l).find((x) => x.section === a.section);
          if (other && page <= other.pages) editions[l] = archivePageHref(l, other.slug, page);
        }
        return entry(archivePageHref(locale, a.slug, page), a.last_modified, editions);
      })
    )
  );

  const all: MetadataRoute.Sitemap = [
    entry("/"),
    entry("/about-us/"),
    entry("/contact-us/"),
    entry("/vatti-ewarranty/"),
    entry("/vatti-pay/"),
    entry("/store-locations/"),
    // /instruction-manual/<model>/ is deliberately absent: those are noindex
    // QR-code landing pages. See src/lib/manuals.ts.
    entry("/instruction-manual/"),
    ...productSlugs().map((slug) => entry(`/${slug}/`)),
    ...categorySlugs().map((slug) => entry(`/${slug}/`)),
    ...articles.map((a) =>
      entry(a.href, a.last_modified, a.translation_key ? sets.get(a.translation_key) : undefined)
    ),
    ...archiveEntries,
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
