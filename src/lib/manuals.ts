/**
 * Instruction manuals the site hands out as PDFs.
 *
 * Each entry is one card on /instruction-manual/ and one page at
 * /instruction-manual/<slug>/. The per-model page exists to be printed as a QR
 * code on the appliance or its box, so it is deliberately kept out of the index
 * (see its `robots` metadata) and out of the sitemap: someone standing at the
 * hood with a phone is the reader, not a search engine.
 *
 * The PDF is on R2 like every other file on this site. To add a manual: stage the
 * PDF under old-media/ at its bucket key, `pnpm media:upload`, then add a row here.
 * Nothing else changes. Host is duplicated from CATALOGUE in site.ts — swap both
 * at cutover.
 */
export type Manual = {
  /** URL segment under /instruction-manual/. Lower case model code. */
  slug: string;
  model: string;
  title: string;
  /** What the manual covers, one line, shown on the card. */
  summary: string;
  pdf: string;
  /** Product page slug, if the model is sold on this site. */
  product?: string;
};

export const MANUALS: Manual[] = [
  {
    slug: "v959",
    model: "V959",
    title: "VATTI Cooker Hood V959",
    summary: "Installation, operation, cleaning and troubleshooting for the V959 cooker hood.",
    pdf: "https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/09/vatti-v959-instruction-manual.pdf",
    product: "vatti-cooker-hood-v959",
  },
];

export function manualBySlug(slug: string): Manual | undefined {
  return MANUALS.find((m) => m.slug === slug);
}
