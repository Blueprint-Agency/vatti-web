import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";
import { notFound } from "next/navigation";

import { SiteHeader } from "@/components/SiteHeader";
import { getStore, storeSlugs, telHref, type Store } from "@/lib/queries/store";
import { WHATSAPP } from "@/lib/site";

/**
 * The 76 dealer pages. These live under /store/ — they are NOT in the root
 * [slug] namespace; `store.path` is 'store/<slug>' and 75 of those URLs are live
 * 200s on WordPress today (the 76th is a dealer appointed since the scrape, so
 * it has no legacy page to preserve). The legacy pages are empty stubs with no
 * address in the markup and appear in no sitemap, so everything below is net new.
 */
export function generateStaticParams() {
  return storeSlugs().map((slug) => ({ slug }));
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ slug: string }>;
}): Promise<Metadata> {
  const { slug } = await params;
  const store = getStore(slug);
  if (!store) return {};

  const description = `${store.name} is an authorised VATTI dealer in ${store.region}. Address, phone number and directions.`;
  return {
    title: `${store.name} — Authorised VATTI Dealer`,
    description,
    alternates: { canonical: `/store/${store.slug}/` },
    openGraph: {
      title: `${store.name} — Authorised VATTI Dealer`,
      description,
      url: `/store/${store.slug}/`,
      images: store.url ? [{ url: store.url }] : undefined,
    },
  };
}

export default async function StorePage({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params;
  const store = getStore(slug);
  if (!store) notFound();

  return (
    <>
      <SiteHeader />

      <main id="main">
        <div className="mx-auto max-w-6xl px-5 py-8 sm:px-8 sm:py-12">
          <nav aria-label="Breadcrumb" className="mb-8 text-sm">
            <ol className="flex flex-wrap items-center gap-2 text-ink-muted">
              <li>
                <Link href="/" className="transition-colors hover:text-ink">
                  Home
                </Link>
              </li>
              <li aria-hidden="true">/</li>
              <li>
                <Link href="/store-locations/" className="transition-colors hover:text-ink">
                  Store locations
                </Link>
              </li>
              <li aria-hidden="true">/</li>
              <li className="text-ink">{store.name}</li>
            </ol>
          </nav>

          <div className="grid gap-10 lg:grid-cols-[minmax(0,1.1fr)_minmax(0,1fr)] lg:gap-16">
            <div className="flex flex-col">
              <p className="text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-teal">
                {store.region}
              </p>

              <h1 className="mt-3 text-balance text-[clamp(1.75rem,1.1rem+2.4vw,3rem)] font-semibold leading-[1.05] tracking-[-0.035em]">
                {store.name}
              </h1>

              <dl className="mt-8 border-t border-line">
                <div className="border-b border-line py-4">
                  <dt className="text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ink-muted">
                    Address
                  </dt>
                  <dd className="mt-2">
                    <address className="max-w-[46ch] not-italic leading-relaxed">
                      {store.address}
                    </address>
                  </dd>
                </div>

                {store.phone && (
                  <div className="border-b border-line py-4">
                    <dt className="text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ink-muted">
                      Phone
                    </dt>
                    <dd className="mt-2">
                      <a
                        href={`tel:${telHref(store.phone)}`}
                        className="readout text-teal transition-opacity hover:opacity-80"
                      >
                        {store.phone}
                      </a>
                    </dd>
                  </div>
                )}
              </dl>

              <div className="mt-8 flex flex-wrap gap-3">
                {/* One of the 76 has no directions_url. It gets no button at
                    all rather than a dead link or a "coming soon" placeholder. */}
                {store.directions_url && (
                  <a
                    href={store.directions_url}
                    target="_blank"
                    rel="noopener"
                    className="rounded-sm bg-teal px-6 py-3 font-semibold text-void transition-opacity hover:opacity-90"
                  >
                    Get directions
                  </a>
                )}
                <a
                  href={WHATSAPP}
                  className="rounded-sm border border-line-strong px-6 py-3 font-medium text-ink transition-colors hover:border-teal hover:text-teal"
                >
                  WhatsApp VATTI
                </a>
              </div>
            </div>

            {store.url && (
              <div className="relative aspect-[4/3] overflow-hidden rounded-sm border border-line bg-surface">
                <Image
                  src={store.url}
                  alt={store.alt || `${store.name} storefront`}
                  fill
                  priority
                  sizes="(max-width: 1024px) 100vw, 560px"
                  className="object-cover"
                />
              </div>
            )}
          </div>
        </div>

        <section aria-labelledby="dealer-note" className="border-y border-line bg-surface">
          <div className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20">
            <div className="max-w-2xl">
              <h2 id="dealer-note" className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl">
                Why buy from an authorised dealer
              </h2>
              <p className="mt-3 max-w-[62ch] leading-relaxed text-ink-muted">
                Units bought outside this network — including VATTI models imported directly from
                China — are often different specifications entirely, are not ST or SIRIM certified,
                and cannot be serviced, warranted or supplied with official spare parts by VATTI
                Malaysia.
              </p>
              <div className="mt-8">
                <Link
                  href="/store-locations/"
                  className="rounded-sm border border-line-strong px-6 py-3 font-medium text-ink transition-colors hover:border-teal hover:text-teal"
                >
                  All {store.region} dealers
                </Link>
              </div>
            </div>
          </div>
        </section>
      </main>

      <script
        type="application/ld+json"
        // Static JSON built from DB columns, serialised with JSON.stringify —
        // no user input reaches it. REBUILD-PLAN § 5 asks for LocalBusiness and
        // the dealer pages are where it belongs.
        dangerouslySetInnerHTML={{ __html: JSON.stringify(localBusiness(store)) }}
      />
    </>
  );
}

function localBusiness(store: Store) {
  return {
    "@context": "https://schema.org",
    "@type": "LocalBusiness",
    name: store.name,
    url: `https://vattimalaysia.com/store/${store.slug}/`,
    address: {
      "@type": "PostalAddress",
      streetAddress: store.address,
      addressRegion: store.region,
      addressCountry: "MY",
    },
    ...(store.phone && { telephone: store.phone }),
    ...(store.directions_url && { hasMap: store.directions_url }),
    ...(store.url && { image: store.url }),
    brand: { "@type": "Brand", name: "VATTI" },
  };
}
