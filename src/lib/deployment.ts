/**
 * Is this build the one that actually serves the live domain?
 *
 * Stated once, here, because three things must agree about it: robots.txt
 * (allow vs disallow), the analytics tags (fire vs stay silent), and anything
 * else that must not run on a preview. Two files answering this question
 * separately is how a preview deployment ends up in the index, or how six
 * months of staging traffic ends up in GA.
 *
 * `VERCEL_ENV` alone is not enough: `vatti-web-seven.vercel.app` IS this
 * project's production alias, so a push to main already reports "production".
 * `VERCEL_PROJECT_PRODUCTION_URL` is Vercel's shortest production custom
 * domain, falling back to the *.vercel.app one when there is none. Both are
 * available at build time, which is when every consumer of this file runs.
 *
 * The `www.` strip is not cosmetic, it is the bug this file already caused
 * once. Vercel was configured with `www.vattimalaysia.com` as the primary
 * production domain, so VERCEL_PROJECT_PRODUCTION_URL read `www.…`, an exact
 * comparison against the bare apex returned false, and the real site went live
 * serving `Disallow: /` to every crawler with the analytics tag switched off.
 * Nothing failed loudly; the build was green and the pages were perfect.
 *
 * So this deliberately does not care which of the two Vercel considers
 * primary. A domain setting in a dashboard must not be able to silently
 * deindex the site again. Which host is CANONICAL is a separate question and
 * is answered by SITE_HOST below, which is what the sitemap, the canonical
 * tags and robots.txt all state.
 */
export const SITE_HOST = "vattimalaysia.com";

export const SITE_ORIGIN = `https://${SITE_HOST}`;

/** `www.vattimalaysia.com` and `vattimalaysia.com` are the same site here. */
const bare = (host: string | undefined) => (host ?? "").replace(/^www\./, "");

export const isLiveSite =
  process.env.VERCEL_ENV === "production" &&
  bare(process.env.VERCEL_PROJECT_PRODUCTION_URL) === SITE_HOST;
