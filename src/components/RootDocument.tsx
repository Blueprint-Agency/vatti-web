import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import { GoogleTagManager } from "@next/third-parties/google";

import { SiteFooter } from "@/components/SiteFooter";
import { OG_LOCALE, TAG, t, type Locale } from "@/i18n";
import { cdn } from "@/lib/cdn";
import { SITE_ORIGIN, isLiveSite } from "@/lib/deployment";

/**
 * The <html> document every page is drawn in, shared by the three root layouts:
 * src/app/(en)/layout.tsx, (ms)/ms/layout.tsx and (zh)/zh/layout.tsx.
 *
 * Three root layouts rather than one because <html lang> belongs on <html>, and
 * a root layout cannot see the URL to choose it. Each edition's layout passes
 * its own locale; everything else about the document is this one component, so
 * the three cannot drift. Moving between editions crosses root layouts, which
 * Next makes a full page load; for a language switch that is fine.
 */

// Geist carries display, UI and body. It replaced Archivo, whose case rested on
// a width axis this site never once used; what matters here instead is that the
// mono below is the same design. The readouts sit beside sans labels everywhere
// on the site, and drawn on one skeleton they read as one system rather than
// two families agreeing to share a page.
//
// Latin subset only. Chinese falls through to the CJK system fonts named in
// globals.css under :lang(zh); shipping a CJK webfont would cost megabytes.
const geist = Geist({
  subsets: ["latin"],
  display: "swap",
  variable: "--font-geist",
});

// Measured values ONLY. Never body copy, headings or nav.
const geistMono = Geist_Mono({
  subsets: ["latin"],
  display: "swap",
  variable: "--font-geist-mono",
});

// Every page here is static HTML, and it ships with the dark ground baked in —
// that is the brand surface, so it is the right default and the right thing to
// have in the file. A visitor who has chosen light would otherwise get one dark
// frame before React booted, so this re-applies their choice synchronously, as
// the first thing in <body> and therefore before anything is painted. It is the
// only inline script on the site; keep it to this one job.
const GROUND_BOOT = `try{var g=localStorage.getItem("vatti-theme");if(g==="light"||g==="dark")document.documentElement.dataset.theme=g}catch(e){}`;

/**
 * One container, added in the Google Tag Manager UI — GA4, Google Ads, Meta and
 * anything else go in as tags there rather than as more code here. That is the
 * whole reason to load GTM instead of gtag.js directly: the next tag is a change
 * the marketer makes in a web console, not a deploy.
 *
 * The id is written here rather than read from the environment. It is not a
 * secret — it ships in the HTML of every page and anyone can read it out of
 * the source — so the usual reason to put a value in the environment does not
 * apply, and a literal is one less thing that has to be right in the Vercel
 * dashboard for analytics to work. Same reasoning as CDN_HOST in
 * scripts/cdn.mjs: a public constant is code.
 *
 * Still gated on isLiveSite for the same reason robots.ts is:
 * vatti-web-seven.vercel.app is already a production alias, so without the gate
 * every preview build would load the real container and fill the property with
 * staging traffic before cutover.
 *
 * @next/third-parties, not a hand-rolled <script>: it seeds the dataLayer and
 * loads gtm.js through next/script, so the loader is placed and preloaded the
 * way Next wants rather than blocking the head, and it exposes sendGTMEvent()
 * for any page that later needs to push to the dataLayer. It is versioned with
 * Next itself and pinned to the 15.x line to match.
 *
 * What it does NOT emit is the <noscript> iframe half of Google's snippet, so
 * that is written out below by hand, from the same id. It only matters to a
 * visitor with JavaScript off — GA4 cannot run for them at all, and only
 * image-pixel tags fire — but it is one element and it is what the container
 * was issued with, so the install is the whole install rather than most of it.
 */
const GTM_ID = "GTM-TWBK2JSG";
const gtmEnabled = isLiveSite;

/** Each root layout exports `metadata = rootMetadata(locale)`. */
export function rootMetadata(locale: Locale): Metadata {
  const d = t(locale).doc;
  return {
    metadataBase: new URL(SITE_ORIGIN),
    title: { default: d.titleDefault, template: d.titleTemplate },
    description: d.description,

    /**
     * Share-card defaults for every page that does not state its own. Product and
     * article pages override title, description and image with their own; the
     * static pages, the blog archives and the home page inherit all of this.
     *
     * No `url` key on purpose: og:url must be the page's own, and a value here
     * would put the home page's URL on all of them. `alternates.canonical` on
     * each page is the address of record.
     *
     * The image is a 1200x630 crop of the V929 hero — the ratio Facebook,
     * WhatsApp and LinkedIn all render without cropping, which matters on a site
     * whose every conversion path ends in a WhatsApp message.
     */
    openGraph: {
      type: "website",
      siteName: "VATTI Malaysia",
      locale: OG_LOCALE[locale],
      images: [
        { url: cdn("2026/09/vatti-og-default.webp"), width: 1200, height: 630, alt: d.ogImageAlt },
      ],
    },
    twitter: { card: "summary_large_image" },

    // Search Console ownership. The meta-tag method is worth having even though
    // the domain is also verifiable by DNS TXT, because it travels with the
    // deployment rather than the registrar.
    //
    // The token is in code, not only in the environment: it is printed in every
    // page's HTML, so it is no secret, and the env-only version shipped with the
    // variable never set on Vercel, which is how the agency's account sat as
    // siteUnverifiedUser. Claimed 2026-10-03 for https://vattimalaysia.com/ (URL
    // prefix, HTML tag). GOOGLE_SITE_VERIFICATION still overrides it. Do not
    // remove the tag once verified: Google re-checks, and the account drops back
    // to unverified when the tag disappears. Every edition carries it.
    verification: {
      google: process.env.GOOGLE_SITE_VERIFICATION || "gmTGGmarVz1xW4GfC6zQbq5jSa_GjwOHsv-vHHQXXc8",
    },
  };
}

export function RootDocument({ locale, children }: { locale: Locale; children: React.ReactNode }) {
  return (
    // suppressHydrationWarning: the boot script below rewrites data-theme on
    // this element before React sees it. It is scoped to this one tag.
    <html
      lang={TAG[locale]}
      data-theme="dark"
      suppressHydrationWarning
      className={`${geist.variable} ${geistMono.variable}`}
    >
      {gtmEnabled && <GoogleTagManager gtmId={GTM_ID} />}
      <body className="min-h-dvh bg-void text-ink antialiased">
        <script dangerouslySetInnerHTML={{ __html: GROUND_BOOT }} />
        {gtmEnabled && (
          <noscript>
            <iframe
              src={`https://www.googletagmanager.com/ns.html?id=${GTM_ID}`}
              height="0"
              width="0"
              style={{ display: "none", visibility: "hidden" }}
              title="Google Tag Manager"
            />
          </noscript>
        )}
        <a
          href="#main"
          className="sr-only focus:not-sr-only focus:fixed focus:left-4 focus:top-4 focus:z-[var(--z-toast)] focus:rounded-sm focus:bg-teal focus:px-4 focus:py-2 focus:font-semibold focus:text-void"
        >
          {t(locale).doc.skipToContent}
        </a>
        {children}
        <SiteFooter locale={locale} />
      </body>
    </html>
  );
}
