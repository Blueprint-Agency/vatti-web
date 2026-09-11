/**
 * The public read host for R2 media, app side.
 *
 * Re-exported from scripts/cdn.mjs rather than restated, so the host is written
 * down exactly once in the whole project. next.config.ts already imports that
 * file; this is the same import for code that ships to the browser.
 *
 * The rule it enforces: **never write the CDN host into a component.** Product
 * and page imagery is data and its URLs belong in data/sql, read through the
 * DB. The handful of URLs that are genuinely code — the catalogue PDF, the
 * header wordmark, a manual, the one decorative backdrop on a page that has no
 * row of its own — go through `cdn()` and name only their bucket key.
 *
 * Before this existed the host was a literal at four call sites and a comment
 * asking whoever does the cutover to remember all of them. Four is already more
 * than a comment can keep track of. At cutover, edit scripts/cdn.mjs.
 *
 * Keys are bucket paths with no leading slash, matching a file's path inside
 * old-media/: `cdn("2026/08/vatti-logo-header.webp")`.
 *
 * Give a changed picture a NEW key. R2 is served with a long max-age and the
 * image optimizer caches by path, so replacing the bytes under an existing key
 * serves the old picture to everyone who has already seen the page.
 */
import { CDN, CDN_HOST } from "../../scripts/cdn.mjs";

export { CDN, CDN_HOST };

export function cdn(key: string): string {
  return `${CDN}/${key}`;
}
