/**
 * The three editions of the site. English is the original and owns the bare
 * URLs, which the URL contract freezes; Malay and Chinese live under /ms/ and
 * /zh/. See CLAUDE.md § Languages.
 *
 * `tag` is the BCP 47 value used everywhere a language is written down: the
 * `lang` columns in the database, <html lang>, hreflang and schema inLanguage.
 * One value per edition, so those four can never disagree. zh-MY rather than
 * zh-Hans-MY: Malaysian Chinese is written in Simplified script, so the region
 * already implies it, and hreflang takes language-region pairs.
 */
export const LOCALES = ["en", "ms", "zh"] as const;
export type Locale = (typeof LOCALES)[number];

export const TAG: Record<Locale, string> = { en: "en-MY", ms: "ms-MY", zh: "zh-MY" };
export const OG_LOCALE: Record<Locale, string> = { en: "en_MY", ms: "ms_MY", zh: "zh_MY" };

/** What the language switcher shows: each edition in its own language. */
export const NATIVE_NAME: Record<Locale, string> = {
  en: "English",
  ms: "Bahasa Melayu",
  zh: "中文",
};

/** '' for English, '/ms' or '/zh' otherwise. Paths are built as `${prefix(l)}/x/`. */
export function prefix(locale: Locale): string {
  return locale === "en" ? "" : `/${locale}`;
}

export function localeFromTag(tag: string): Locale {
  const hit = LOCALES.find((l) => TAG[l] === tag);
  if (!hit) throw new Error(`Unknown language tag ${tag}`);
  return hit;
}

/** 'a', 'a and b', 'a, b and c', in the locale's own words. */
export function listJoin(locale: Locale, items: string[]): string {
  if (items.length <= 1) return items.join("");
  if (locale === "zh") return `${items.slice(0, -1).join("、")}和${items.at(-1)}`;
  const and = locale === "ms" ? "dan" : "and";
  return `${items.slice(0, -1).join(", ")} ${and} ${items.at(-1)}`;
}
