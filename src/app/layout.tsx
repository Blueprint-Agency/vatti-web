import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";

import { SiteFooter } from "@/components/SiteFooter";
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

export const metadata: Metadata = {
  metadataBase: new URL("https://vattimalaysia.com"),
  title: {
    default: "VATTI Malaysia — Kitchen Hoods, Hobs & Built-in Ovens",
    template: "%s | VATTI Malaysia",
  },
  description:
    "Built-in kitchen appliances engineered for high-heat Asian cooking. Available through 76 authorised dealers across Malaysia.",
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
      <body className="min-h-dvh bg-void text-ink antialiased">
        <script dangerouslySetInnerHTML={{ __html: GROUND_BOOT }} />
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
