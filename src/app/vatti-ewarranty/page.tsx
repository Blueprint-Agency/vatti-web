import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";

import { EWarrantyForm } from "@/components/EWarrantyForm";
import { SiteHeader } from "@/components/SiteHeader";
import { categoryBackdrops } from "@/lib/queries/category";
import { warrantyDealers, warrantyTypes } from "@/lib/queries/warranty";
import {
  EXCLUSIONS,
  EXCLUSIONS_HEADING,
  PAID_SERVICE,
  PERIODS,
  TERMS,
} from "@/lib/warranty-terms";
import { WHATSAPP } from "@/lib/site";

export const metadata: Metadata = {
  title: { absolute: "VATTI eWarranty | Product Quality Can be Compromised" },
  description:
    "Unlock the full benefits of VATTI eWarranty. Register your products here for quality assurance and comprehensive warranty coverage.",
  alternates: { canonical: "/vatti-ewarranty/" },
};

/** What to have in front of you before starting. Every one of these is on the
 *  invoice or the plate on the appliance, and hunting for them halfway through
 *  is what makes people abandon the form. */
const BEFORE_YOU_START = [
  "Warranty card no. / serial no.",
  "Date of purchase",
  "Invoice no.",
  "The authorised dealer you bought from",
  "A photograph of the invoice or receipt",
];

export default function EWarrantyPage() {
  const dealers = warrantyDealers();
  const types = warrantyTypes();

  /**
   * The hero backdrop, drawn at random from the five category heroes.
   *
   * This page belongs to no one category — a hood, a hob and a purifier are all
   * registered through it — so there is no single right kitchen to stand it in,
   * and picking one would quietly promote that category over the other four.
   * Rotating is the honest answer to that, and the five are interchangeable
   * here because none of them is illustrating anything: the heading says what
   * the page is, and the photograph is ground.
   *
   * The draw happens once, at build. It is NOT per visitor and cannot be: every
   * page here is static HTML, so what this picks is baked into the file until
   * the next deploy. The practical consequence is that the same commit built
   * twice produces two different heroes, which is a nondeterministic build. It
   * is contained to one decorative `src` on one page and nothing is compared
   * against it, so the cost is a line of noise in a diff of built output. If
   * that ever stops being acceptable, seed this off something stable — the
   * deploy SHA, the day — rather than reaching for Math.random.
   */
  const backdrops = categoryBackdrops();
  const backdrop = backdrops[Math.floor(Math.random() * backdrops.length)];

  return (
    <>
      <SiteHeader />

      <main id="main">
        {/* Full bleed, so the width constraint sits on the inner div rather
            than the section: a backdrop stopping at the 6xl gutter reads as a
            floating panel instead of the ground the heading stands on. Same
            treatment as the category hero — the photograph at half strength,
            then a wash of --void that carries the text contrast in both
            themes.

            The clip goes on this frame and never on the section: an
            overflow-hidden ancestor silently kills `position: sticky`, and the
            registration column below this one is sticky. */}
        <section className="hero-scene relative isolate">
          <div aria-hidden className="absolute inset-0 -z-10 overflow-hidden">
            {/* .category-hero-drift is the shallow variant, scaled 1.25. It is
                the right one here: this hero is only as tall as its own copy,
                which is the shape that class was tuned against. The deep
                variant is for a viewport-tall banner and would spend its travel
                on a frame with no room for it. */}
            <div className="category-hero-drift absolute inset-0">
              <Image
                src={backdrop}
                alt=""
                fill
                priority
                sizes="100vw"
                className="object-cover opacity-50"
              />
            </div>
            <div className="absolute inset-0 bg-void/45" />
          </div>

          <div className="relative mx-auto max-w-6xl px-5 py-16 sm:px-8 sm:py-24">
            <div className="max-w-2xl">
              <h1 className="text-balance text-[clamp(2.25rem,1.2rem+4vw,4.5rem)] font-semibold leading-[1.02] tracking-[-0.04em]">
                VATTI eWarranty
              </h1>
              <p className="mt-6 text-lg leading-relaxed text-ink-muted">
                Guarantee the security of your products with VATTI eWarranty. Registration must be
                submitted within 14 days of purchase, and the warranty policy is valid only for
                products bought from authorised dealers and retailers throughout Malaysia.
              </p>
              {/* The warranty periods and the terms sit between the top of this
                  page and the form, which is the right reading order and the
                  wrong scroll for someone who arrived holding a receipt. */}
              <a
                href="#register"
                className="mt-8 inline-block rounded-sm bg-teal px-6 py-3 font-semibold text-void transition-opacity hover:opacity-90"
              >
                Register a product
              </a>
            </div>
          </div>
        </section>

        {/* The warranty periods, as a readout — this is what the visitor came for. */}
        <section aria-labelledby="period-heading" className="border-y border-line bg-surface">
          <div className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20">
            <h2
              id="period-heading"
              className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl"
            >
              Warranty period
            </h2>
            <dl className="mt-8 grid gap-px bg-line sm:grid-cols-3">
              {PERIODS.map((p) => (
                <div key={p.label} className="bg-surface px-5 py-6 sm:px-7 sm:py-8">
                  <dt className="flex items-baseline gap-1.5">
                    <span className="readout text-3xl font-semibold leading-none text-teal sm:text-4xl">
                      {p.value}
                    </span>
                    {p.unit && <span className="readout text-sm text-ink-muted">{p.unit}</span>}
                  </dt>
                  <dd className="mt-3 text-sm leading-relaxed text-ink-muted">{p.label}</dd>
                </div>
              ))}
            </dl>
          </div>
        </section>

        {/* Registration. The one real form on the site — see EWarrantyForm for
            why this page is the exception. The dealer list and the model codes
            behind its selects are data, from `warranty_dealer` and
            `warranty_model`, so signing a dealer is a SQL edit. */}
        <section
          id="register"
          aria-labelledby="register-heading"
          className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20"
        >
          <div className="grid gap-10 lg:grid-cols-[minmax(0,0.75fr)_minmax(0,1.25fr)] lg:gap-16">
            <div className="lg:sticky lg:top-24 lg:self-start">
              <h2
                id="register-heading"
                className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl"
              >
                Register your product
              </h2>
              <p className="mt-5 max-w-[46ch] leading-relaxed text-ink-muted">
                Within 14 days of purchase. Register every appliance on the same invoice in one
                go, and the confirmation comes back by email.
              </p>

              <p className="mt-8 text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ink-muted">
                Have these to hand
              </p>
              <ol className="mt-3">
                {BEFORE_YOU_START.map((f, i) => (
                  <li key={f} className="flex gap-4 border-b border-line py-3.5 first:border-t">
                    <span className="readout text-sm text-teal">{i + 1}</span>
                    {f}
                  </li>
                ))}
              </ol>

              <p className="mt-6 text-sm leading-relaxed text-ink-muted">
                Stuck on any of it?{" "}
                <a href={WHATSAPP} className="text-teal transition-opacity hover:opacity-80">
                  Message us on WhatsApp
                </a>{" "}
                or{" "}
                <Link href="/contact-us/" className="text-teal transition-opacity hover:opacity-80">
                  find another way to reach us
                </Link>
                .
              </p>
            </div>

            <EWarrantyForm dealers={dealers} types={types} />
          </div>
        </section>

        <section aria-labelledby="terms-heading" className="border-t border-line bg-surface">
          <div className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20">
            <h2 id="terms-heading" className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl">
              Terms &amp; conditions
            </h2>

            <ul className="mt-8 max-w-[68ch]">
              {TERMS.map((t) => (
                <li key={t} className="border-b border-line py-4 leading-relaxed first:border-t">
                  {t}
                </li>
              ))}
            </ul>

            <h3 className="mt-12 max-w-[68ch] text-lg font-semibold text-ember">
              {EXCLUSIONS_HEADING}
            </h3>
            <ul className="mt-4 max-w-[68ch]">
              {EXCLUSIONS.map((t) => (
                <li
                  key={t}
                  className="border-b border-line py-4 leading-relaxed text-ink-muted first:border-t"
                >
                  {t}
                </li>
              ))}
            </ul>

            <p className="mt-8 max-w-[68ch] leading-relaxed text-ink-muted">{PAID_SERVICE}</p>
          </div>
        </section>
      </main>
    </>
  );
}
