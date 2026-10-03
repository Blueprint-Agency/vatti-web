import type { Metadata } from "next";
import Link from "next/link";
import { notFound } from "next/navigation";
import { ArrowLeft } from "@phosphor-icons/react/dist/ssr/ArrowLeft";
import { FilePdf } from "@phosphor-icons/react/dist/ssr/FilePdf";

import { SiteHeader } from "@/components/SiteHeader";
import { CtaBar } from "@/components/CtaBar";
import { MANUALS, manualBySlug } from "@/lib/manuals";
import { whatsappLink } from "@/lib/site";

type Params = { model: string };

export function generateStaticParams(): Params[] {
  return MANUALS.map((m) => ({ model: m.slug }));
}

export const dynamicParams = false;

/**
 * Behind a QR code on the appliance, not behind a search result: `noindex`
 * keeps it out of Google and sitemap.ts does not list it. The `follow` is
 * deliberate so the links to the product and eWarranty still count.
 */
export async function generateMetadata({
  params,
}: {
  params: Promise<Params>;
}): Promise<Metadata> {
  const manual = manualBySlug((await params).model);
  if (!manual) return {};
  return {
    title: `${manual.title} Instruction Manual`,
    description: manual.summary,
    alternates: { canonical: `/instruction-manual/${manual.slug}/` },
    robots: { index: false, follow: true },
  };
}

export default async function ManualPage({ params }: { params: Promise<Params> }) {
  const manual = manualBySlug((await params).model);
  if (!manual) notFound();

  const ask = whatsappLink(`Hi, I have a question about my VATTI ${manual.model}.`);

  return (
    <>
      <SiteHeader />

      <main id="main">
        <section className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20">
          <div className="max-w-2xl">
            {/* The way back for a visitor who arrived by QR code and has no
                history to return to. The footer link is too far down a phone. */}
            <Link
              href="/instruction-manual/"
              className="inline-flex items-center gap-1.5 text-sm text-ink-muted transition-colors hover:text-teal"
            >
              <ArrowLeft size={16} aria-hidden="true" />
              Back to all manuals
            </Link>
            <p className="readout mt-8 text-sm text-ink-muted">Instruction manual</p>
            <h1 className="mt-3 text-balance text-[clamp(2.25rem,1.2rem+4vw,4.5rem)] font-semibold leading-[1.02] tracking-[-0.04em]">
              {manual.title}
            </h1>
            <p className="mt-6 text-lg leading-relaxed text-ink-muted">{manual.summary}</p>
            <div className="mt-9 flex flex-wrap gap-3">
              <a
                href={manual.pdf}
                target="_blank"
                rel="noopener"
                className="inline-flex items-center gap-2 rounded-sm bg-teal px-6 py-3 font-semibold text-void transition-opacity hover:opacity-90"
              >
                <FilePdf size={20} aria-hidden="true" />
                Open the manual
              </a>
              <a
                href={ask}
                target="_blank"
                rel="noopener"
                className="rounded-sm border border-line-strong px-6 py-3 font-medium text-ink transition-colors hover:border-teal hover:text-teal"
              >
                Ask a question
              </a>
            </div>
            <p className="mt-4 text-sm text-ink-muted">PDF, opens in a new tab.</p>
          </div>
        </section>

        <section className="border-t border-line bg-surface">
          <div className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20">
            <ul className="flex flex-col gap-3 text-ink-muted sm:flex-row sm:flex-wrap sm:gap-x-10">
              <li>
                <Link
                  href="/vatti-ewarranty/"
                  className="text-teal transition-opacity hover:opacity-80"
                >
                  Register your warranty →
                </Link>
              </li>
              {manual.product && (
                <li>
                  <Link
                    href={`/${manual.product}/`}
                    className="text-teal transition-opacity hover:opacity-80"
                  >
                    See the {manual.model} →
                  </Link>
                </li>
              )}
            </ul>
          </div>
        </section>
      </main>

      <CtaBar href={ask} />
    </>
  );
}
