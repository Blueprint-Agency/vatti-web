import type { Metadata } from "next";
import Link from "next/link";

import { SiteHeader } from "@/components/SiteHeader";
import { CtaBar } from "@/components/CtaBar";
import { WHATSAPP } from "@/lib/site";

export const metadata: Metadata = {
  title: { absolute: "VATTI Pay - An Efficient and Easy Used Payment System" },
  description:
    "Join as a Vatti dealer, use reliable Vatti Pay for efficient payments. Experience convenience and trustworthiness.",
  alternates: { canonical: "/vatti-pay/" },
};

/**
 * The live "Make Payment" button carries a one-shot SAML AuthState query string
 * captured in 2023 — it expires. Link the SP entry point instead; the IdP
 * builds a fresh AuthState on arrival.
 */
const VATTI_PAY = "https://vattipay.3ex.com.my/dealer";

// Bank logos on the source page, as PNGs with no alt text. Named, not shown.
const BANKS = [
  "Maybank",
  "Public Bank",
  "CIMB",
  "OCBC",
  "HSBC",
  "Standard Chartered",
  "AmBank",
];

export default function VattiPayPage() {
  return (
    <>
      <SiteHeader />

      <main id="main">
        <section className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20">
          <div className="max-w-2xl">
            <h1 className="text-balance text-[clamp(2.25rem,1.2rem+4vw,4.5rem)] font-semibold leading-[1.02] tracking-[-0.04em]">
              VATTI Pay
            </h1>
            <p className="mt-6 text-lg leading-relaxed text-ink-muted">
              VATTI Pay lets existing dealers settle their invoices online. Accounts are issued by
              VATTI Malaysia, and you cannot register through this website.
            </p>
            <div className="mt-9 flex flex-wrap gap-3">
              <a
                href={VATTI_PAY}
                rel="noopener"
                className="rounded-sm bg-teal px-6 py-3 font-semibold text-void transition-opacity hover:opacity-90"
              >
                Make payment
              </a>
              <a
                href={WHATSAPP}
                className="rounded-sm border border-line-strong px-6 py-3 font-medium text-ink transition-colors hover:border-teal hover:text-teal"
              >
                Ask about a dealer account
              </a>
            </div>
          </div>
        </section>

        <section aria-labelledby="banks-heading" className="border-y border-line bg-surface">
          <div className="mx-auto grid max-w-6xl gap-10 px-5 py-14 sm:px-8 sm:py-20 lg:grid-cols-[minmax(0,1fr)_minmax(0,1.4fr)] lg:gap-16">
            <div>
              <h2
                id="banks-heading"
                className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl"
              >
                Supported banks
              </h2>
              <p className="mt-5 max-w-[52ch] leading-relaxed text-ink-muted">
                Payment is handled entirely by the VATTI Pay portal. Nothing is collected on this
                site.
              </p>
            </div>
            <ul className="flex flex-wrap gap-x-8 gap-y-3 self-start">
              {BANKS.map((b) => (
                <li key={b} className="text-ink-muted">
                  {b}
                </li>
              ))}
            </ul>
          </div>
        </section>

        <section className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20">
          <p className="text-ink-muted">
            Not a dealer?{" "}
            <Link href="/store-locations/" className="text-teal transition-opacity hover:opacity-80">
              Find your nearest showroom →
            </Link>
          </p>
        </section>
      </main>

      <CtaBar />
    </>
  );
}
