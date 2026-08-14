/** The sales line. Every conversion path on this site ends here — there is no
 *  cart, no checkout, and (by the owner's decision) no forms. */
export const WHATSAPP = "https://wa.me/60123366082";

/**
 * The same line, with `message` already typed into the chat. Nothing is sent:
 * wa.me only fills the composer, and the visitor still presses send inside
 * WhatsApp. Use it wherever the page knows what the enquiry is about, so the
 * sales team reads the model code instead of asking for it.
 */
export function whatsappLink(message: string): string {
  return `${WHATSAPP}?text=${encodeURIComponent(message)}`;
}

/** The "Catalog" menu item. WordPress links the raw /wp-content/ path; that
 *  path 301s to R2 via next.config.ts, but Vercel's firewall currently denies
 *  /wp-content/* before the redirect runs, so link the CDN object directly.
 *  Host is duplicated from next.config.ts CDN_HOST — swap both at cutover. */
export const CATALOGUE =
  "https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/07/Vatti-Catalogue_260718.pdf";

/**
 * How many Google reviews the service has. A dated snapshot of the aggregate
 * the Trustindex widget prints on the live site (read 10 Aug 2026), not a
 * derived count — the widget rotates ten reviews and only four of them are in
 * the `review` table, so counting rows there would understate it by an order
 * of magnitude. Re-read the widget when this is refreshed.
 */
export const GOOGLE_REVIEWS = 67;

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
