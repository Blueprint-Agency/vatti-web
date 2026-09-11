import type { MetadataRoute } from "next";

import { SITE_HOST, isLiveSite } from "@/lib/deployment";

/**
 * Indexing is allowed only on the deployment that actually serves the live
 * domain — see src/lib/deployment.ts, which states that test once for robots
 * and the analytics tags together. Today the live domain is still WordPress
 * and this app sits on vatti-web-seven.vercel.app, so it must stay out of the
 * index: a preview carrying the same 248 pages would compete with the site it
 * is replacing.
 *
 * The disallow-everything branch deliberately ships NO sitemap line. Naming a
 * sitemap while disallowing the whole site is a mixed signal, and Google will
 * happily fetch and queue the URLs it lists.
 *
 * On the live branch: nothing is disallowed by path. Every route on this site
 * is meant to be crawled, and the handful that must not be indexed
 * (/instruction-manual/<model>/) carry a `noindex` meta tag instead — which is
 * the correct tool, because a robots.txt disallow would stop the crawler
 * reading that very tag. /api/ is listed as a courtesy, not a security
 * boundary: it holds one POST-only endpoint with nothing to crawl.
 */
export default function robots(): MetadataRoute.Robots {
  if (!isLiveSite) {
    return { rules: { userAgent: "*", disallow: "/" } };
  }

  return {
    rules: [
      {
        userAgent: "*",
        allow: "/",
        // POST-only route handler; a GET returns 405. Keeps it out of crawl
        // budget rather than out of reach.
        disallow: ["/api/"],
      },
    ],
    sitemap: `https://${SITE_HOST}/sitemap.xml`,
    host: SITE_HOST,
  };
}
