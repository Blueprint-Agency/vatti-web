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
 * domain, falling back to the *.vercel.app one when there is none — it reads
 * `vatti-web-seven.vercel.app` today and flips to `vattimalaysia.com` by
 * itself the moment the domain is attached. Both are available at build time,
 * which is when every consumer of this file runs. No flag to remember at
 * cutover.
 */
export const SITE_HOST = "vattimalaysia.com";

export const SITE_ORIGIN = `https://${SITE_HOST}`;

export const isLiveSite =
  process.env.VERCEL_ENV === "production" &&
  process.env.VERCEL_PROJECT_PRODUCTION_URL === SITE_HOST;
