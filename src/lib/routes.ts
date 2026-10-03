import { prefix, type Locale } from "@/i18n/config";
import { archives, sectionInfo, type Archive } from "@/lib/queries/article";
import { localCategoryPath } from "@/lib/queries/category";

/**
 * Where a menu link goes in each edition.
 *
 * The rule: the edition's own page when it has been built, the English page
 * when it has not. A Malay menu therefore never links to a 404 while the
 * rollout is part-way through, and each link moves over by itself the day its
 * page is translated — for database-backed pages because the rows appear, for
 * the hand-written pages because their edition is added to the lists below in
 * the same change that adds the route file.
 */

/** Editions that have a home page: all three since Phase 2 (3 Oct 2026). */
const HOME: readonly Locale[] = ["en", "ms", "zh"];

/** Hand-written pages, by their English path segment, and the editions they exist in. */
const STATIC: Record<string, readonly Locale[]> = {
  "about-us": ["en"],
  "contact-us": ["en"],
  "store-locations": ["en"],
  "vatti-ewarranty": ["en"],
  "vatti-pay": ["en"],
  "instruction-manual": ["en"],
};

export function homeHref(locale: Locale): string {
  return HOME.includes(locale) ? `${prefix(locale)}/` : "/";
}

export function staticHref(locale: Locale, page: string): string {
  return STATIC[page]?.includes(locale) ? `${prefix(locale)}/${page}/` : `/${page}/`;
}

/** The category in this edition once it is translated (product_category_i18n), else English. */
export function categoryHref(locale: Locale, enSlug: string): string {
  return localCategoryPath(locale, enSlug);
}

const archiveCache = new Map<Locale, Archive[]>();
function archivesOf(locale: Locale): Archive[] {
  if (!archiveCache.has(locale)) archiveCache.set(locale, archives(locale));
  return archiveCache.get(locale)!;
}

/** An archive page's URL. Page 1 is the bare archive; the rest carry WordPress's /page/N/. */
export function archivePageHref(locale: Locale, slug: string, page: number): string {
  const base = `${prefix(locale)}/category/${slug}/`;
  return page <= 1 ? base : `${base}page/${page}/`;
}

/** The section's archive in this edition if it has one, else the English archive. */
export function archiveHref(locale: Locale, section: string): string {
  const own = archivesOf(locale).find((a) => a.section === section);
  return own ? archivePageHref(locale, own.slug, 1) : archivePageHref("en", section, 1);
}

/** A section's menu label: always in the visitor's language, wherever it links. */
export function sectionLabel(locale: Locale, section: string): string {
  return sectionInfo(section, locale).name;
}
