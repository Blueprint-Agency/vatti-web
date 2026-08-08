/** The sales line. Every conversion path on this site ends here — there is no
 *  cart, no checkout, and (by the owner's decision) no forms. */
export const WHATSAPP = "https://wa.me/60123366082";

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
