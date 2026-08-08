import type { Metadata } from "next";
import Link from "next/link";

import { SiteHeader } from "@/components/SiteHeader";
import { WHATSAPP } from "@/lib/site";

// Title and description kept verbatim from the live page — it earns 218 clicks
// and titles are a CTR surface. See research/utility-pages.json.
export const metadata: Metadata = {
  title: { absolute: "About Us | Best Kitchen Appliance Distributor | VATTI Malaysia" },
  description:
    "VATTI, a global-listed corporation in kitchen appliances. We distribute high-quality kitchen appliances worldwide, anytime, anywhere.",
  alternates: { canonical: "/about-us/" },
};

const VALUES = [
  "Customer First",
  "Enterprising Spirit",
  "Mutual Sharing & Win-win Corporation",
  "Efficient Collaboration",
  "Craftsman Spirit",
];

const MISSION = [
  "We, VATTI, hope to bring the best products into the kitchen of every family and give cooks the best product experience.",
  "We have high requirements on the quality of each VATTI product. It is our responsibility to bring the best products to consumers.",
  "Our development team is constantly developing products with the latest technology, and strives to create good looking, user friendly and clean products.",
  "Create the safest and most comfortable kitchen for consumers.",
];

// The source page renders these as three certificate JPEGs with no alt text.
// Named in markup instead — an image of a certificate is not a certificate.
const CERTIFICATIONS = [
  "Occupational Health & Safety Management System certification",
  "Quality Management System certification",
  "VATTI Malaysia sole distributorship certificate",
];

export default function AboutPage() {
  return (
    <>
      <SiteHeader />

      <main id="main">
        <section className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20">
          <h1 className="max-w-[16ch] text-balance text-[clamp(2.25rem,1.2rem+4vw,4.5rem)] font-semibold leading-[1.02] tracking-[-0.04em]">
            About VATTI Malaysia
          </h1>
          <p className="mt-6 max-w-[62ch] text-lg leading-relaxed text-ink-muted">
            Since 1992, VATTI has pioneered the industry of premium kitchen appliances, keeping
            innovation as a corporate strategy. It has grown from a locally listed company to a
            world-class corporation.
          </p>
          <p className="mt-4 max-w-[62ch] text-lg leading-relaxed text-ink-muted">
            We distribute our high quality kitchen appliances to anywhere at anytime.
          </p>
        </section>

        {/* The one hard number on the page, so it gets the readout treatment. */}
        <section aria-labelledby="innovation-heading" className="border-y border-line bg-surface">
          <div className="mx-auto grid max-w-6xl gap-10 px-5 py-14 sm:px-8 sm:py-20 lg:grid-cols-[minmax(0,1fr)_minmax(0,1.4fr)] lg:items-center lg:gap-16">
            <div>
              <p className="readout text-[clamp(3rem,2rem+4vw,5rem)] font-semibold leading-none text-teal">
                838
              </p>
              <p className="mt-3 text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ink-muted">
                Valid patents, as of 10 May 2018
              </p>
            </div>
            <div>
              <h2
                id="innovation-heading"
                className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl"
              >
                VATTI product innovation
              </h2>
              <p className="mt-5 max-w-[62ch] leading-relaxed text-ink-muted">
                The VATTI Group adheres to innovation and has been authorised to make 838 valid
                patents. The number is among the highest in the industry, and has won two honours:
                the National Industrial Design Center and the Nationally Recognized Enterprise
                Technology Center.
              </p>
            </div>
          </div>
        </section>

        <section
          aria-labelledby="values-heading"
          className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20"
        >
          <div className="grid gap-10 lg:grid-cols-[minmax(0,1fr)_minmax(0,1.4fr)] lg:gap-16">
            <div>
              <h2
                id="values-heading"
                className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl"
              >
                Our vision &amp; core values
              </h2>
              <p className="mt-5 max-w-[52ch] leading-relaxed text-ink-muted">
                Leading global provider of high-end kitchen appliances.
              </p>
            </div>
            <ul className="self-start">
              {VALUES.map((v) => (
                <li key={v} className="border-b border-line py-4 first:border-t">
                  {v}
                </li>
              ))}
            </ul>
          </div>
        </section>

        <section aria-labelledby="mission-heading" className="border-y border-line bg-surface">
          <div className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20">
            <h2
              id="mission-heading"
              className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl"
            >
              Our mission
            </h2>
            <div className="mt-8 grid gap-6 [grid-template-columns:repeat(auto-fit,minmax(240px,1fr))]">
              {MISSION.map((m) => (
                <p key={m} className="max-w-[46ch] leading-relaxed text-ink-muted">
                  {m}
                </p>
              ))}
            </div>
          </div>
        </section>

        <section
          aria-labelledby="certifications-heading"
          className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20"
        >
          <div className="grid gap-10 lg:grid-cols-[minmax(0,1fr)_minmax(0,1.4fr)] lg:gap-16">
            <div>
              <h2
                id="certifications-heading"
                className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl"
              >
                Our certifications
              </h2>
              <p className="mt-5 max-w-[52ch] leading-relaxed text-ink-muted">
                VATTI Malaysia is the appointed national distributor, supplying 75 authorised
                dealers across the country.
              </p>
              <div className="mt-8 flex flex-wrap gap-3">
                <a
                  href={WHATSAPP}
                  className="rounded-sm bg-teal px-6 py-3 font-semibold text-void transition-opacity hover:opacity-90"
                >
                  WhatsApp us
                </a>
                <Link
                  href="/store-locations/"
                  className="rounded-sm border border-line-strong px-6 py-3 font-medium text-ink transition-colors hover:border-teal hover:text-teal"
                >
                  Find a dealer
                </Link>
              </div>
            </div>
            <ul className="self-start">
              {CERTIFICATIONS.map((c) => (
                <li key={c} className="border-b border-line py-4 text-ink-muted first:border-t">
                  {c}
                </li>
              ))}
            </ul>
          </div>
        </section>
      </main>
    </>
  );
}
