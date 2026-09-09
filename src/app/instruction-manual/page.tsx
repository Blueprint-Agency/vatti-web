import type { Metadata } from "next";
import Link from "next/link";
import { FilePdf } from "@phosphor-icons/react/dist/ssr/FilePdf";

import { SiteHeader } from "@/components/SiteHeader";
import { CtaBar } from "@/components/CtaBar";
import { MANUALS } from "@/lib/manuals";
import { WHATSAPP } from "@/lib/site";

export const metadata: Metadata = {
  title: "Instruction Manuals",
  description:
    "Download the instruction manual for your VATTI appliance. Installation, operation, cleaning and troubleshooting, as a PDF.",
  alternates: { canonical: "/instruction-manual/" },
};

/**
 * Reached from the footer only, by the owner's decision. An owner looking for a
 * manual already has the appliance; the menu bar is for people who do not.
 */
export default function InstructionManualPage() {
  return (
    <>
      <SiteHeader />

      <main id="main">
        <section className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20">
          <div className="max-w-2xl">
            <h1 className="text-balance text-[clamp(2.25rem,1.2rem+4vw,4.5rem)] font-semibold leading-[1.02] tracking-[-0.04em]">
              Instruction Manuals
            </h1>
            <p className="mt-6 text-lg leading-relaxed text-ink-muted">
              The printed manual for your VATTI appliance, as a PDF. Open it on your phone or save
              it for later.
            </p>
          </div>

          <ul className="mt-12 grid gap-5 sm:grid-cols-2 lg:grid-cols-3">
            {MANUALS.map((m) => (
              <li
                key={m.slug}
                className="flex flex-col rounded-sm border border-line bg-surface p-6 transition-colors hover:border-line-strong"
              >
                <FilePdf size={28} className="text-teal" aria-hidden="true" />
                <p className="readout mt-5 text-sm text-ink-muted">{m.model}</p>
                <h2 className="mt-1 text-xl font-semibold tracking-[-0.02em]">{m.title}</h2>
                <p className="mt-3 flex-1 text-sm leading-relaxed text-ink-muted">{m.summary}</p>
                {/* The button opens the manual's own page, not the PDF: that page
                    is where the PDF, the warranty link and the WhatsApp line sit
                    together, and it is the same page the printed QR code lands on. */}
                <div className="mt-6">
                  <Link
                    href={`/instruction-manual/${m.slug}/`}
                    className="inline-block rounded-sm bg-teal px-5 py-2.5 font-semibold text-void transition-opacity hover:opacity-90"
                  >
                    Open manual
                  </Link>
                </div>
              </li>
            ))}
          </ul>
        </section>

        <section className="border-t border-line bg-surface">
          <div className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20">
            <p className="max-w-[60ch] leading-relaxed text-ink-muted">
              Cannot find your model? Message us with the model code on the rating label and we
              will send the manual to you.{" "}
              <a href={WHATSAPP} className="text-teal transition-opacity hover:opacity-80">
                WhatsApp 012-3366082 →
              </a>
            </p>
          </div>
        </section>
      </main>

      <CtaBar />
    </>
  );
}
