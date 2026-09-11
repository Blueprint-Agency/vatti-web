import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import { GoogleTagManager } from "@next/third-parties/google";

import { SiteFooter } from "@/components/SiteFooter";
import { cdn } from "@/lib/cdn";
import { SITE_ORIGIN, isLiveSite } from "@/lib/deployment";
import "./globals.css";

// Geist carries display, UI and body. It replaced Archivo, whose case rested on
// a width axis this site never once used; what matters here instead is that the
// mono below is the same design. The readouts sit beside sans labels everywhere
// on the site, and drawn on one skeleton they read as one system rather than
// two families agreeing to share a page.
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
 * Gated on isLiveSite for the same reason robots.ts is: vatti-web-seven.vercel.app
 * is already a production alias, so without this every preview build would ship
 * the real container and pollute the property with staging traffic before
 * cutover. The id is read from the environment rather than baked into git; set
 * NEXT_PUBLIC_GTM_ID in the Vercel project. It must carry the NEXT_PUBLIC_
 * prefix — the tag is client side, so the value is public by definition, and a
 * container id is not a secret.
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
const GTM_ID = process.env.NEXT_PUBLIC_GTM_ID;
const gtmEnabled = isLiveSite && !!GTM_ID;

export const metadata: Metadata = {
  metadataBase: new URL(SITE_ORIGIN),
  title: {
    default: "VATTI Malaysia | Kitchen Hoods, Hobs & Built-in Ovens",
    template: "%s | VATTI Malaysia",
  },
  description:
    "Built-in kitchen appliances engineered for high-heat Asian cooking. Available through 76 authorised dealers across Malaysia.",

  /**
   * Share-card defaults for every page that does not state its own. Product and
   * article pages override title, description and image with their own; the
   * static pages, the blog archives and the home page inherit all of this.
   *
   * It lives here rather than being pasted into nine files because the parts
   * that vary per page — the title and the description — are the two Next
   * already fills in from each page's own `title` and `description`. What is
   * left is genuinely site-wide.
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
    locale: "en_MY",
    images: [
      {
        url: cdn("2026/09/vatti-og-default.webp"),
        width: 1200,
        height: 630,
        alt: "VATTI cooker hood with a lit control panel, installed in a kitchen",
      },
    ],
  },
  twitter: { card: "summary_large_image" },

  // Search Console ownership. The meta-tag method is worth having even though
  // the domain is also verifiable by DNS TXT, because it travels with the
  // deployment rather than the registrar. Unset => Next omits the tag entirely,
  // which is the correct state until the property is claimed. Paste the token
  // from Search Console → Add property → URL prefix → HTML tag into
  // GOOGLE_SITE_VERIFICATION (the content="…" value only, not the whole tag).
  verification: process.env.GOOGLE_SITE_VERIFICATION
    ? { google: process.env.GOOGLE_SITE_VERIFICATION }
    : undefined,
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    // suppressHydrationWarning: the boot script below rewrites data-theme on
    // this element before React sees it. It is scoped to this one tag.
    <html
      lang="en-MY"
      data-theme="dark"
      suppressHydrationWarning
      className={`${geist.variable} ${geistMono.variable}`}
    >
      {gtmEnabled && <GoogleTagManager gtmId={GTM_ID!} />}
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
          Skip to content
        </a>
        {children}
        <SiteFooter />
      </body>
    </html>
  );
}
