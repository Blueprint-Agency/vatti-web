import { LOCALES, TAG, type Locale } from "@/i18n/config";

/** A page's URL in each edition it exists in, keyed by locale. Paths, not absolute URLs. */
export type Editions = Partial<Record<Locale, string>>;

/**
 * `alternates.languages` for a page's metadata: one hreflang per edition that
 * exists, plus x-default on the English page (or the only edition there is).
 *
 * Built only from editions that are published, so during the rollout a page
 * never declares a translation that 404s. A page with one edition gets none:
 * hreflang pointing only at itself says nothing.
 *
 * Paths stay relative; metadataBase in RootDocument makes them absolute.
 */
export function hreflang(editions: Editions): Record<string, string> | undefined {
  const present = LOCALES.filter((l) => editions[l]);
  if (present.length < 2) return undefined;
  const languages: Record<string, string> = {};
  for (const l of present) languages[TAG[l]] = editions[l]!;
  languages["x-default"] = editions.en ?? editions[present[0]]!;
  return languages;
}
