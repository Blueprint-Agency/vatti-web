import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";

import { ScaleAxis } from "@/components/ScaleAxis";
import { SiteHeader } from "@/components/SiteHeader";
import { getBestsellers, getCategoryRows, getScale } from "@/lib/queries/home";

const WHATSAPP = "https://wa.me/60123366082";

/** research/stores.json — 75 dealers, counted by region. No store table yet. */
const DEALERS = [
  { region: "Klang Valley", count: 30 },
  { region: "Southern", count: 24 },
  { region: "Sabah & Sarawak", count: 9 },
  { region: "Northern", count: 6 },
  { region: "East Coast", count: 6 },
];

const AWARDS = [
  {
    name: "Red Dot Design Award",
    year: "2017",
    body: "German international design prize awarded by Red Dot GmbH & Co. KG, won for product design.",
  },
  {
    name: "iF Design Award",
    year: "since 1954",
    body: "One of the longest-running design marks in the world, and a recurring one for VATTI product design.",
  },
  {
    name: "AWE Award",
    year: "China",
    body: "Presented by the China Household Electrical Appliances Association after market and customer testing.",
  },
];

/** Editorial, from the source homepage — there is no sales data in the DB. */
const BESTSELLER_SLUGS = [
  "vatti-magic-series-cooker-hood-v919",
  "vatti-magic-series-cooker-hob-c861g",
  "vatti-magic-series-combi-oven-va06",
  "built-in-combi-oven-va05",
];

// The legacy title and description are kept verbatim: this page earns the
// brand-term traffic and titles are a CTR surface. See PRODUCT.md.
export const metadata: Metadata = {
  title: { absolute: "Kitchen Appliances Supplier in Malaysia | VATTI" },
  description:
    "Explore the Best Kitchen Appliances Supplier in Malaysia: Combi Ovens, Cooker Hoods, Cooker Hobs & Built-In Ovens by VATTI. Enhance Your Cooking Now!",
  alternates: { canonical: "/" },
};

export default function HomePage() {
  const categories = getCategoryRows();
  const airflow = getScale("airflow");
  const bestsellers = getBestsellers(BESTSELLER_SLUGS);

  const totalModels = categories.reduce((n, c) => n + c.model_count, 0);
  const hoods = categories.find((c) => c.slug === "kitchen-hood-in-malaysia");

  return (
    <>
      <SiteHeader />

      <main id="main">
        {/* Hero — the lineup plotted on its own axis. Copy left, instrument right. */}
        <section className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20 lg:py-24">
          <div className="grid gap-12 lg:grid-cols-[minmax(0,1fr)_minmax(0,1fr)] lg:items-center lg:gap-16">
            <div>
              {/* Not .readout: Martian Mono is for measured values, and a brand
                  line is not one. See DESIGN.md § Typography. */}
              <p className="text-xs font-semibold uppercase tracking-[0.18em] text-teal">
                VATTI Malaysia · since 1992
              </p>
              <h1 className="mt-5 max-w-[15ch] text-balance text-[clamp(2.25rem,1.2rem+4vw,4.5rem)] font-semibold leading-[1.02] tracking-[-0.04em]">
                Kitchen appliances measured for wok heat.
              </h1>
              <p className="mt-6 max-w-[54ch] text-lg leading-relaxed text-ink-muted">
                Cooker hoods, cooker hobs, built-in and combi steam ovens, dishwashers and water
                purifiers. {totalModels} models, sold and serviced through 75 authorised dealers
                across Malaysia.
              </p>
              <div className="mt-9 flex flex-wrap gap-3">
                <Link
                  href="/kitchen-hood-in-malaysia/"
                  className="rounded-sm bg-teal px-6 py-3 font-semibold text-void transition-opacity hover:opacity-90"
                >
                  Compare {hoods?.model_count ?? ""} cooker hoods
                </Link>
                <Link
                  href="/store-locations/"
                  className="rounded-sm border border-line-strong px-6 py-3 font-medium text-ink transition-colors hover:border-teal hover:text-teal"
                >
                  Find a dealer
                </Link>
              </div>
            </div>

            <ScaleAxis
              label="Cooker hood airflow"
              unit="m³/h"
              ticks={airflow}
              footnote="Every rated cooker hood, plotted on its own airflow axis. Figures as published on VATTI spec sheets."
            />
          </div>
        </section>

        {/* Catalogue — a register, not icon boxes. Each row carries its range. */}
        <section
          aria-labelledby="catalogue-heading"
          className="mx-auto max-w-6xl px-5 pb-14 sm:px-8 sm:pb-20"
        >
          <div className="flex items-baseline justify-between gap-4 border-b border-line pb-4">
            <h2
              id="catalogue-heading"
              className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl"
            >
              The catalogue
            </h2>
            <p className="readout shrink-0 text-sm text-ink-muted">
              {categories.length} categories
            </p>
          </div>

          <ul>
            {categories.map((c) => (
              <li key={c.slug}>
                <Link
                  href={`/${c.slug}/`}
                  className="group flex flex-wrap items-baseline gap-x-6 gap-y-2 border-b border-line py-6 transition-colors hover:bg-raised sm:px-3"
                >
                  <span className="text-xl font-semibold tracking-[-0.02em] transition-colors group-hover:text-teal sm:text-2xl">
                    {c.name}
                  </span>
                  <span className="readout text-sm text-ink-muted">
                    {c.model_count} {c.model_count === 1 ? "model" : "models"}
                  </span>
                  {c.range && (
                    <span className="readout w-full text-sm text-teal sm:ml-auto sm:w-auto">
                      {c.range.lo === c.range.hi
                        ? fmt(c.range.lo)
                        : `${fmt(c.range.lo)} – ${fmt(c.range.hi)}`}{" "}
                      {c.range.unit}
                      <span className="text-ink-muted"> {c.range.label.toLowerCase()}</span>
                    </span>
                  )}
                </Link>
              </li>
            ))}
          </ul>
        </section>

        {/* Bestsellers */}
        {bestsellers.length > 0 && (
          <section
            aria-labelledby="bestsellers-heading"
            className="mx-auto max-w-6xl px-5 pb-14 sm:px-8 sm:pb-20"
          >
            <h2
              id="bestsellers-heading"
              className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl"
            >
              Our bestsellers
            </h2>
            <ul className="mt-8 grid gap-5 [grid-template-columns:repeat(auto-fit,minmax(150px,1fr))]">
              {bestsellers.map((p) => (
                <li key={p.slug}>
                  <Link
                    href={`/${p.slug}/`}
                    className="group flex h-full flex-col gap-4 rounded-sm border border-line bg-surface p-4 transition-colors hover:border-line-strong"
                  >
                    {p.url && (
                      <div className="relative aspect-square overflow-hidden rounded-sm bg-void">
                        <Image
                          src={p.url}
                          alt=""
                          fill
                          sizes="(max-width: 640px) 50vw, 260px"
                          className="object-contain"
                        />
                      </div>
                    )}
                    <div>
                      <p className="readout text-xs text-teal">{p.model_code}</p>
                      <p className="mt-1 text-sm font-medium leading-snug transition-colors group-hover:text-teal">
                        {p.name}
                      </p>
                    </div>
                    {p.facets.length > 0 && (
                      <dl className="mt-auto flex flex-wrap gap-x-4 gap-y-1 border-t border-line pt-3">
                        {p.facets.slice(0, 3).map((f) => (
                          <div key={f.facet}>
                            <dt className="text-[0.625rem] uppercase tracking-[0.12em] text-ink-muted">
                              {f.label}
                            </dt>
                            <dd className="readout text-sm text-ink">
                              {fmt(f.value)}
                              <span className="text-ink-muted"> {f.unit}</span>
                            </dd>
                          </div>
                        ))}
                      </dl>
                    )}
                  </Link>
                </li>
              ))}
            </ul>
          </section>
        )}

        {/* Credentials */}
        <section aria-labelledby="about-heading" className="border-y border-line bg-surface">
          <div className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20">
            <div className="grid gap-10 lg:grid-cols-[minmax(0,1fr)_minmax(0,1.4fr)] lg:gap-16">
              <div>
                <h2
                  id="about-heading"
                  className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl"
                >
                  Engineering since 1992
                </h2>
                <p className="mt-5 max-w-[52ch] leading-relaxed text-ink-muted">
                  VATTI has built premium kitchen appliances for more than three decades, growing
                  from a locally listed company into a manufacturer sold worldwide. In Malaysia we
                  supply the Klang Valley, Northern, Southern and East Coast regions, plus Sabah and
                  Sarawak.
                </p>
                <Link
                  href="/about-us/"
                  className="mt-6 inline-block text-teal transition-opacity hover:opacity-80"
                >
                  About VATTI Malaysia →
                </Link>
              </div>

              <dl className="grid gap-px self-start bg-line sm:grid-cols-3">
                {AWARDS.map((a) => (
                  <div key={a.name} className="bg-surface p-5">
                    <dt className="font-semibold leading-snug">{a.name}</dt>
                    <dd className="readout mt-1 text-xs text-teal">{a.year}</dd>
                    <dd className="mt-3 text-sm leading-relaxed text-ink-muted">{a.body}</dd>
                  </div>
                ))}
              </dl>
            </div>
          </div>
        </section>

        {/* Dealers */}
        <section
          aria-labelledby="dealers-heading"
          className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20"
        >
          <div className="grid gap-10 lg:grid-cols-[minmax(0,1fr)_minmax(0,1.4fr)] lg:gap-16">
            <div>
              <h2
                id="dealers-heading"
                className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl"
              >
                75 authorised dealers
              </h2>
              <p className="mt-5 max-w-[52ch] leading-relaxed text-ink-muted">
                Every model is sold, installed and serviced through an authorised dealer. Find the
                nearest showroom, see it running, and buy from someone who can come back and service
                it.
              </p>
              <Link
                href="/store-locations/"
                className="mt-6 inline-block rounded-sm bg-teal px-6 py-3 font-semibold text-void transition-opacity hover:opacity-90"
              >
                Find your nearest showroom
              </Link>
            </div>

            <dl className="self-start">
              {DEALERS.map((d) => (
                <div
                  key={d.region}
                  className="flex items-center gap-4 border-b border-line py-4 first:border-t"
                >
                  <dt className="shrink-0">{d.region}</dt>
                  {/* Bar is the share of the largest region, so the column reads
                      as a distribution rather than five loose figures. */}
                  <dd className="h-1 min-w-8 flex-1 bg-line">
                    <span
                      className="block h-full bg-teal-core"
                      style={{ width: `${(d.count / DEALERS[0].count) * 100}%` }}
                    />
                  </dd>
                  <dd className="readout w-8 shrink-0 text-right text-2xl font-semibold text-teal">
                    {d.count}
                  </dd>
                </div>
              ))}
            </dl>
          </div>
        </section>

        {/* Enquiry */}
        <section aria-labelledby="contact-heading" className="border-t border-line bg-surface">
          <div className="mx-auto grid max-w-6xl gap-10 px-5 py-14 sm:px-8 sm:py-20 lg:grid-cols-[minmax(0,1fr)_minmax(0,1fr)] lg:gap-16">
            <div>
              <h2
                id="contact-heading"
                className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl"
              >
                Drop us a message
              </h2>
              <p className="mt-3 max-w-[54ch] text-ink-muted">
                Tell us your kitchen layout — hob width, ceiling height, whether you cook with a wok
                daily — and we will point you at the right model and the dealer who stocks it.
                Replies within 48 hours.
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

            <dl className="self-start">
              <div className="flex flex-wrap items-baseline justify-between gap-x-6 gap-y-1 border-b border-line py-4 first:border-t">
                <dt className="text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ink-muted">
                  Phone
                </dt>
                <dd>
                  <a
                    href="tel:+60123366082"
                    className="readout text-lg text-teal transition-opacity hover:opacity-80"
                  >
                    012-3366082
                  </a>
                </dd>
              </div>
              <div className="flex flex-wrap items-baseline justify-between gap-x-6 gap-y-1 border-b border-line py-4">
                <dt className="text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ink-muted">
                  Open
                </dt>
                <dd className="readout text-lg">10am – 8pm daily</dd>
              </div>
              <div className="flex flex-wrap items-baseline justify-between gap-x-6 gap-y-1 border-b border-line py-4">
                <dt className="text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ink-muted">
                  Showroom
                </dt>
                <dd className="text-right text-ink-muted">
                  Atria Shopping Gallery, Damansara Jaya, Petaling Jaya
                </dd>
              </div>
            </dl>
          </div>
        </section>
      </main>
    </>
  );
}

function fmt(n: number): string {
  return Number.isInteger(n) ? n.toLocaleString("en-MY") : String(n);
}
