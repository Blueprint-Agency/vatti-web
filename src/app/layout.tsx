import type { Metadata } from "next";
import { Archivo, Martian_Mono } from "next/font/google";
import "./globals.css";

// Archivo carries display, UI and body — its width axis supplies
// condensed-through-expanded from one family, so the contrast comes from one
// voice rather than a mismatched pair.
const archivo = Archivo({
  subsets: ["latin"],
  axes: ["wdth"],
  display: "swap",
  variable: "--font-archivo",
});

// Measured values ONLY. Never body copy, headings or nav.
const martian = Martian_Mono({
  subsets: ["latin"],
  weight: ["400", "600"],
  display: "swap",
  variable: "--font-martian",
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
    <html lang="en-MY" className={`${archivo.variable} ${martian.variable}`}>
      <body className="min-h-dvh bg-void text-ink antialiased">
        <a
          href="#main"
          className="sr-only focus:not-sr-only focus:fixed focus:left-4 focus:top-4 focus:z-[var(--z-toast)] focus:rounded-sm focus:bg-teal focus:px-4 focus:py-2 focus:font-semibold focus:text-void"
        >
          Skip to content
        </a>
        {children}
      </body>
    </html>
  );
}
