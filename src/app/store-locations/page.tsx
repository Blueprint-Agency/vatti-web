import type { Metadata } from "next";
import Link from "next/link";

import { SiteHeader } from "@/components/SiteHeader";
import { storesByRegion, telHref } from "@/lib/queries/store";
import { WHATSAPP } from "@/lib/site";

// Title and description kept verbatim from the live page — it earns 1,413
// clicks and ranks top-10. See research/utility-pages.json. The description
// still says "via the map below"; the map is gone, replaced by a per-dealer
// directions link, so the trailing clause is dropped and nothing else changes.
export const metadata: Metadata = {
  title: { absolute: "Store Locations | Authorized Dealers in Malaysia" },
  description:
    "Purchase authentic VATTI Malaysia products from the store from our authorized dealers. Find the nearest store location, address and phone number below.",
  alternates: { canonical: "/store-locations/" },
};

export default function StoreLocationsPage() {
  const regions = storesByRegion();
  const total = regions.reduce((n, r) => n + r.stores.length, 0);

  return (
    <>
      <SiteHeader />

      <main id="main">
        <div className="mx-auto max-w-6xl px-5 py-8 sm:px-8 sm:py-12">
          <h1 className="max-w-[16ch] text-balance text-[clamp(2.25rem,1.2rem+4vw,4.5rem)] font-semibold leading-[1.02] tracking-[-0.04em]">
            Locate Us
          </h1>
          <p className="readout mt-4 text-sm text-ink-muted">
            {total} authorised dealers, {regions.length} regions
          </p>
          <p className="mt-6 max-w-[62ch] text-lg leading-relaxed text-ink-muted">
            Every dealer below is appointed by VATTI Malaysia. Buying from one is the only way to
            get a unit that is ST and SIRIM certified, covered by the Malaysian warranty, and
            serviceable with official spare parts.
          </p>

          {/* The legacy page runs this as a red "IMPORTANT NOTICE" block. It is a
              real trading warning, so it keeps its prominence — ember is the
              warning token and this is exactly what it is rationed for. */}
          <div className="mt-8 max-w-[68ch] rounded-sm border border-line bg-surface p-5 sm:p-6">
            <h2 className="text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ember">
              Important notice
            </h2>
            <p className="mt-3 leading-relaxed text-ink-muted">
              We have identified unauthorised sellers promoting VATTI products inaccurately. Some
              units bought directly from China are <strong className="text-ink">not the same
              models</strong> as those officially imported — components, specifications and spare
              parts differ, and they are not ST or SIRIM certified. Those units cannot be serviced
              by VATTI Malaysia, are not covered by our warranty, and cannot receive official spare
              parts or technical support.
            </p>
          </div>

          {/* Jump links: 76 entries is a long scroll on the phones that are 64%
              of this page's traffic. */}
          <nav aria-label="Regions" className="mt-10">
            <ul className="flex flex-wrap gap-2">
              {regions.map((r) => (
                <li key={r.slug}>
                  <a
                    href={`#${r.slug}`}
                    className="block rounded-sm border border-line px-3.5 py-2 text-sm text-ink-muted transition-colors hover:border-teal hover:text-teal"
                  >
                    {r.name}
                    <span className="readout ml-2 text-xs text-ink-muted">{r.stores.length}</span>
                  </a>
                </li>
              ))}
            </ul>
          </nav>
        </div>

        {regions.map((region) => (
          <section
            key={region.slug}
            id={region.slug}
            aria-labelledby={`${region.slug}-heading`}
            className="mx-auto max-w-6xl scroll-mt-8 px-5 pb-14 sm:px-8 sm:pb-20"
          >
            <h2
              id={`${region.slug}-heading`}
              className="border-b border-line pb-4 text-2xl font-semibold tracking-[-0.025em] sm:text-3xl"
            >
              {region.name}
            </h2>

            <ul className="mt-8 grid gap-5 [grid-template-columns:repeat(auto-fit,minmax(280px,1fr))]">
              {region.stores.map((s) => (
                <li
                  key={s.slug}
                  className="flex flex-col gap-3 rounded-sm border border-line bg-surface p-5"
                >
                  <h3 className="font-medium leading-snug">
                    <Link
                      href={`/store/${s.slug}/`}
                      className="transition-colors hover:text-teal focus-visible:text-teal"
                    >
                      {s.name}
                    </Link>
                  </h3>

                  {/* Address and phone inline: the page has to answer "where is
                      my nearest dealer" without a click-through. */}
                  <address className="text-sm not-italic leading-relaxed text-ink-muted">
                    {s.address}
                  </address>

                  <div className="mt-auto flex flex-wrap items-center gap-x-4 gap-y-2 border-t border-line pt-3 text-sm">
                    {s.phone && (
                      <a
                        href={`tel:${telHref(s.phone)}`}
                        className="readout text-teal transition-opacity hover:opacity-80"
                      >
                        {s.phone}
                      </a>
                    )}
                    {s.directions_url && (
                      <a
                        href={s.directions_url}
                        target="_blank"
                        rel="noopener"
                        className="text-ink-muted transition-colors hover:text-ink"
                      >
                        Directions
                      </a>
                    )}
                  </div>
                </li>
              ))}
            </ul>
          </section>
        ))}

        <section aria-labelledby="locations-cta" className="border-t border-line bg-surface">
          <div className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20">
            <div className="max-w-2xl">
              <h2 id="locations-cta" className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl">
                Not sure which dealer stocks the model you want?
              </h2>
              <p className="mt-3 max-w-[62ch] text-ink-muted">
                Tell us the model and your area and we will confirm which of the {total} dealers has
                it on the floor.
              </p>
              <div className="mt-8 flex flex-wrap gap-3">
                <a
                  href={WHATSAPP}
                  className="rounded-sm bg-teal px-6 py-3 font-semibold text-void transition-opacity hover:opacity-90"
                >
                  WhatsApp us
                </a>
                <Link
                  href="/contact-us/"
                  className="rounded-sm border border-line-strong px-6 py-3 font-medium text-ink transition-colors hover:border-teal hover:text-teal"
                >
                  Send an enquiry
                </Link>
              </div>
            </div>
          </div>
        </section>
      </main>
    </>
  );
}
