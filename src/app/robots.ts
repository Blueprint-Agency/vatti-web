import type { MetadataRoute } from "next";

const HOST = "vattimalaysia.com";

/**
 * Indexing is allowed only on the deployment that actually serves the live
 * domain. Today that is still WordPress and this app sits on
 * vatti-web-seven.vercel.app, so it must stay out of the index — a preview
 * carrying the same 248 pages would compete with the site it is replacing.
 *
 * `VERCEL_ENV` alone is not enough: `vatti-web-seven.vercel.app` IS this
 * project's production alias, so a push to main already reports "production".
 * `VERCEL_PROJECT_PRODUCTION_URL` is Vercel's shortest production custom
 * domain, falling back to the *.vercel.app one when there is none — it reads
 * `vatti-web-seven.vercel.app` today and flips to `vattimalaysia.com` by
 * itself the moment the domain is attached. Both are available at build time,
 * which is when this file runs. No flag to remember at cutover.
 */
const live =
  process.env.VERCEL_ENV === "production" &&
  process.env.VERCEL_PROJECT_PRODUCTION_URL === HOST;

export default function robots(): MetadataRoute.Robots {
  if (!live) return { rules: { userAgent: "*", disallow: "/" } };

  return {
    rules: { userAgent: "*", allow: "/" },
    sitemap: `https://${HOST}/sitemap.xml`,
    host: HOST,
  };
}
