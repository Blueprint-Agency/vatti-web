/** The sales line. Every conversion path on this site ends here — there is no
 *  cart, no checkout, and (by the owner's decision) no forms. */
export const WHATSAPP = "https://wa.me/60123366082";

/** The "Catalog" menu item. WordPress links the raw /wp-content/ path; that
 *  path 301s to R2 via next.config.ts, but Vercel's firewall currently denies
 *  /wp-content/* before the redirect runs, so link the CDN object directly.
 *  Host is duplicated from next.config.ts CDN_HOST — swap both at cutover. */
export const CATALOGUE =
  "https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/07/Vatti-Catalogue_260718.pdf";

/**
 * Article dates. Locale and time zone are pinned rather than left to the host so
 * the static HTML is identical whichever machine runs the build — `published_at`
 * is stored with a +08:00 offset and a Vercel builder runs in UTC.
 */
export function formatDate(iso: string): string {
  return new Date(iso).toLocaleDateString("en-MY", {
    day: "numeric",
    month: "long",
    year: "numeric",
    timeZone: "Asia/Kuala_Lumpur",
  });
}
