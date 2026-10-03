import type { Locale } from "./config";
import { en, type Dict } from "./en";
import { ms } from "./ms";
import { zh } from "./zh";

export * from "./config";
export type { Dict };

const DICTS: Record<Locale, Dict> = { en, ms, zh };

/** The chrome strings for one edition. */
export function t(locale: Locale): Dict {
  return DICTS[locale];
}
