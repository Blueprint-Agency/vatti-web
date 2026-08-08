import type { Metadata } from "next";
import Link from "next/link";

import { SiteHeader } from "@/components/SiteHeader";
import { WHATSAPP } from "@/lib/site";

export const metadata: Metadata = {
  title: { absolute: "VATTI eWarranty | Product Quality Can be Compromised" },
  description:
    "Unlock the full benefits of VATTI eWarranty. Register your products here for quality assurance and comprehensive warranty coverage.",
  alternates: { canonical: "/vatti-ewarranty/" },
};

/** The three figures the 4-step WPForms wizard never showed you until the end. */
const PERIODS = [
  {
    value: "2",
    unit: "years",
    label: "Cooker hood, cooker hob, combi oven, built-in oven and built-in steam oven",
  },
  { value: "10", unit: "years", label: "Cooker hood motor, all models" },
  { value: "Lifetime", unit: "", label: "Cooker hob glass top" },
];

/** Verbatim from the live page's Terms & Conditions panel. */
const TERMS = [
  "Warranty is effective only for the original buyer, and VATTI products must be purchased from an authorised dealer.",
  "For a warranty claim, the eWarranty registration must be filled in properly and completely at the time of purchase.",
  "A VATTI product warranty claim is based on manufacturing defect or poor workmanship under normal use.",
  "Product warranty period and maintenance are as per VATTI Malaysia policy.",
  "Where home service is provided, visit charges apply as per policy.",
];

const EXCLUSIONS = [
  "Damage caused by improper use.",
  "Damage caused by installation, disassembly or maintenance carried out by a non-VATTI service outlet.",
  "No warranty card or valid purchase certificate can be provided, or either has been altered.",
  "The product model and serial number on the warranty card or purchase certificate do not match the product being repaired.",
  "Electrical short circuit, voltage fluctuation, poor wiring, wrong use, missing parts, accidental damage and force majeure.",
  "Products that are outside the warranty period.",
];

/** The four fields the retired registration form collected per product. */
const REGISTER_WITH = [
  "Warranty card no. / serial no.",
  "Date of purchase",
  "Invoice no.",
  "Authorised dealer name",
];

export default function EWarrantyPage() {
  return (
    <>
      <SiteHeader />

      <main id="main">
        <section className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20">
          <div className="max-w-2xl">
            <h1 className="text-balance text-[clamp(2.25rem,1.2rem+4vw,4.5rem)] font-semibold leading-[1.02] tracking-[-0.04em]">
              VATTI eWarranty
            </h1>
            <p className="mt-6 text-lg leading-relaxed text-ink-muted">
              Guarantee the security of your products with VATTI eWarranty. Registration must be
              submitted within 14 days of purchase, and the warranty policy is valid only for
              products bought from authorised dealers and retailers throughout Malaysia.
            </p>
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

        {/* Registration. The 4-step, 23-field WPForms wizard is retired: the
            owner has decided there are no forms on this site, and the service
            team answers WhatsApp. Listing the fields it collected keeps the
            first message useful. */}
        <section
          aria-labelledby="register-heading"
          className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20"
        >
          <div className="grid gap-10 lg:grid-cols-[minmax(0,1fr)_minmax(0,1.4fr)] lg:gap-16">
            <div>
              <h2
                id="register-heading"
                className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl"
              >
                Register your product
              </h2>
              <p className="mt-5 max-w-[52ch] leading-relaxed text-ink-muted">
                Send us a WhatsApp message within 14 days of purchase with the details opposite —
                one set per product — and we will register the warranty and confirm it back to you.
              </p>
              <div className="mt-8 flex flex-wrap gap-3">
                <a
                  href={WHATSAPP}
                  className="rounded-sm bg-teal px-6 py-3 font-semibold text-void transition-opacity hover:opacity-90"
                >
                  Register on WhatsApp
                </a>
                <Link
                  href="/contact-us/"
                  className="rounded-sm border border-line-strong px-6 py-3 font-medium text-ink transition-colors hover:border-teal hover:text-teal"
                >
                  Other ways to reach us
                </Link>
              </div>
            </div>
            <ol className="self-start">
              {REGISTER_WITH.map((f, i) => (
                <li key={f} className="flex gap-4 border-b border-line py-4 first:border-t">
                  <span className="readout text-sm text-teal">{i + 1}</span>
                  {f}
                </li>
              ))}
            </ol>
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

            <h3 className="mt-12 text-lg font-semibold">
              Not covered by free maintenance
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

            <p className="mt-8 max-w-[68ch] leading-relaxed text-ink-muted">
              If a product fails outside the warranty period, VATTI after-sales outlets will still
              provide a paid service as per policy.
            </p>
          </div>
        </section>
      </main>
    </>
  );
}
