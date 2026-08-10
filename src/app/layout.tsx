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

export const metadata: Metadata = {
  metadataBase: new URL("https://vattimalaysia.com"),
  title: {
    default: "VATTI Malaysia — Kitchen Hoods, Hobs & Built-in Ovens",
    template: "%s | VATTI Malaysia",
  },
  description:
    "Built-in kitchen appliances engineered for high-heat Asian cooking. Available through 75 authorised dealers across Malaysia.",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en-MY" className={`${geist.variable} ${geistMono.variable}`}>
      <body className="min-h-dvh bg-void text-ink antialiased">
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
