import type { Metadata } from "next";
import Link from "next/link";

import { SiteHeader } from "@/components/SiteHeader";
import { WHATSAPP } from "@/lib/site";

export const metadata: Metadata = {
  title: { absolute: "Contact Us | Call Us Immediately | VATTI Malaysia" },
  description:
    "Contact us at +6012-3366082 or email enquiry@vattimalaysia.com. Reach out via our enquiry form. We're here to assist you!",
  alternates: { canonical: "/contact-us/" },
};

const ADDRESS = "Atria Shopping Gallery, Unit 17, 1, Damansara Jaya, 47400 Petaling Jaya, Selangor";

export default function ContactPage() {
  return (
    <>
      <SiteHeader />

      <main id="main">
        <section className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20">
          <div className="grid gap-12 lg:grid-cols-[minmax(0,1fr)_minmax(0,1fr)] lg:gap-16">
            <div>
              <h1 className="text-balance text-[clamp(2.25rem,1.2rem+4vw,4.5rem)] font-semibold leading-[1.02] tracking-[-0.04em]">
                Contact Us
              </h1>
              <p className="mt-6 max-w-[54ch] text-lg leading-relaxed text-ink-muted">
                Tell us your kitchen layout — hob width, ceiling height, whether you cook with a wok
                daily — and we will point you at the right model and the dealer who stocks it.
                Replies within 48 hours.
              </p>
              {/* The source page ran a Contact Form 7 widget here. The owner has
                  decided there are no forms on the new site: WhatsApp is the
                  line the service team actually answers. */}
              <div className="mt-9 flex flex-wrap gap-3">
                <a
                  href={WHATSAPP}
                  className="rounded-sm bg-teal px-6 py-3 font-semibold text-void transition-opacity hover:opacity-90"
                >
                  WhatsApp 012-3366082
                </a>
                <a
                  href="mailto:enquiry@vattimalaysia.com"
                  className="rounded-sm border border-line-strong px-6 py-3 font-medium text-ink transition-colors hover:border-teal hover:text-teal"
                >
                  Email us
                </a>
              </div>
            </div>

            <dl className="self-start">
              <div className="flex flex-wrap items-baseline justify-between gap-x-6 gap-y-1 border-b border-line py-4 first:border-t">
                <dt className="text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ink-muted">
                  Service care line / WhatsApp
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
                  Email
                </dt>
                <dd>
                  <a
                    href="mailto:enquiry@vattimalaysia.com"
                    className="text-teal transition-opacity hover:opacity-80"
                  >
                    enquiry@vattimalaysia.com
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
                  <address className="not-italic">{ADDRESS}</address>
                </dd>
              </div>
            </dl>
          </div>
        </section>

        <section aria-labelledby="visit-heading" className="border-t border-line bg-surface">
          <div className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20">
            <div className="max-w-2xl">
              <h2 id="visit-heading" className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl">
                Come and see one running
              </h2>
              <p className="mt-3 max-w-[62ch] text-ink-muted">
                The flagship showroom is at Atria Shopping Gallery in Petaling Jaya, and 76
                authorised dealers stock VATTI across Malaysia — including Sabah and Sarawak.
              </p>
              <div className="mt-8 flex flex-wrap gap-3">
                <Link
                  href="/store-locations/"
                  className="rounded-sm bg-teal px-6 py-3 font-semibold text-void transition-opacity hover:opacity-90"
                >
                  Find a dealer
                </Link>
                <a
                  href={`https://maps.google.com/maps?q=${encodeURIComponent(ADDRESS)}`}
                  rel="noopener"
                  className="rounded-sm border border-line-strong px-6 py-3 font-medium text-ink transition-colors hover:border-teal hover:text-teal"
                >
                  Directions to the showroom
                </a>
              </div>
            </div>
          </div>
        </section>
      </main>
    </>
  );
}
