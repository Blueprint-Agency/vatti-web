import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";
import { notFound } from "next/navigation";

import { SiteHeader } from "@/components/SiteHeader";
import { getStore, storeSlugs, storesNear, telHref, townOf, type Store } from "@/lib/queries/store";
import { CtaBar } from "@/components/CtaBar";
import { WHATSAPP } from "@/lib/site";

/**
 * The 75 dealer pages. These live under /store/ — they are NOT in the root
 * [slug] namespace; `store.path` is 'store/<slug>' and 75 of those URLs are live
 * 200s on WordPress today (the 76th is a dealer appointed since the scrape, so
 * it has no legacy page to preserve). The legacy pages are empty stubs with no
 * address in the markup and appear in no sitemap, so everything below is net new.
 */
// Exhaustive from the store table. See [slug]/page.tsx.
export const dynamicParams = false;

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

  const title = `${store.name} | Authorised VATTI Dealer`;
  const description = storeDescription(store);
  return {
    title,
    description,
    alternates: { canonical: `/store/${store.slug}/` },
    openGraph: {
      title,
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
  const place = placeOf(store);
  const town = townOf(store) ?? store.region;
  const near = storesNear(store);

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
                {place}
              </p>

              <h1 className="mt-3 text-balance text-[clamp(1.75rem,1.1rem+2.4vw,3rem)] font-semibold leading-[1.05] tracking-[-0.035em]">
                {store.name}
              </h1>

              <p className="mt-5 max-w-[52ch] leading-relaxed text-ink-muted">
                An authorised VATTI dealer in {place}. Ask here about VATTI{" "}
                <Link href="/kitchen-hood-in-malaysia/" className="text-teal underline-offset-[3px] hover:underline">
                  kitchen hoods
                </Link>
                ,{" "}
                <Link href="/cooker-hob-in-malaysia/" className="text-teal underline-offset-[3px] hover:underline">
                  cooker hobs
                </Link>
                ,{" "}
                <Link href="/combi-and-steam-oven-in-malaysia/" className="text-teal underline-offset-[3px] hover:underline">
                  ovens
                </Link>{" "}
                and{" "}
                <Link href="/dishwasher-in-malaysia/" className="text-teal underline-offset-[3px] hover:underline">
                  dishwashers
                </Link>
                . A unit bought here carries the VATTI Malaysia warranty; register it at{" "}
                <Link href="/vatti-ewarranty/" className="text-teal underline-offset-[3px] hover:underline">
                  VATTI eWarranty
                </Link>
                .
              </p>

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
                {/* One of the 75 has no directions_url. It gets no button at
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
                  target="_blank"
                  rel="noopener"
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
                Units bought outside this network, including VATTI models imported directly from
                China, are often different specifications entirely, are not ST or SIRIM certified,
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
        {near.length > 0 && (
          <section aria-labelledby="dealers-near" className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20">
            <h2 id="dealers-near" className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl">
              Other VATTI dealers near {town}
            </h2>
            <ul className="mt-8 grid gap-px overflow-hidden rounded-sm border border-line bg-line sm:grid-cols-2 lg:grid-cols-3">
              {near.map((s) => (
                <li key={s.slug} className="bg-void">
                  <Link
                    href={`/store/${s.slug}/`}
                    className="flex h-full flex-col gap-1 px-5 py-4 transition-colors hover:bg-surface"
                  >
                    <span className="font-medium leading-snug">{s.name}</span>
                    <span className="text-sm text-ink-muted">{placeOf(s)}</span>
                  </Link>
                </li>
              ))}
            </ul>
          </section>
        )}
      </main>

      <CtaBar />

      <script
        type="application/ld+json"
        // Static JSON built from DB columns, serialised with JSON.stringify —
        // no user input reaches it. REBUILD-PLAN § 5 asks for LocalBusiness and
        // the dealer pages are where it belongs.
        dangerouslySetInnerHTML={{ __html: JSON.stringify(localBusiness(store)) }}
      />
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumb(store)) }}
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
    description: storeDescription(store),
    address: {
      "@type": "PostalAddress",
      streetAddress: store.address,
      ...(store.locality && { addressLocality: townOf(store) }),
      ...(store.postcode && { postalCode: store.postcode }),
      addressRegion: store.state ?? store.region,
      addressCountry: "MY",
    },
    ...(store.locality && { areaServed: placeOf(store) }),
    ...(store.phone && { telephone: store.phone }),
    ...(store.directions_url && { hasMap: store.directions_url }),
    ...(store.url && { image: store.url }),
    brand: { "@type": "Brand", name: "VATTI" },
  };
}

const SITE = "https://vattimalaysia.com";

/** 'Johor Jaya, Johor Bahru, Johor', or the region for a row with no locality. */
function placeOf(store: Store): string {
  return store.locality && store.state ? `${store.locality}, ${store.state}` : store.region;
}

function storeDescription(store: Store): string {
  const where = store.locality ? `${store.locality}, ${store.state}` : store.region;
  const call = store.phone ? `Call ${store.phone}, get directions` : "Get directions";
  return `${store.name} is an authorised VATTI dealer in ${where}: ${store.address}. ${call}, or ask about VATTI hoods, hobs and ovens.`;
}

/** Mirrors the visible breadcrumb: Home / Store locations / the dealer. */
function breadcrumb(store: Store) {
  return {
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    itemListElement: [
      { "@type": "ListItem", position: 1, name: "Home", item: `${SITE}/` },
      { "@type": "ListItem", position: 2, name: "Store locations", item: `${SITE}/store-locations/` },
      { "@type": "ListItem", position: 3, name: store.name, item: `${SITE}/store/${store.slug}/` },
    ],
  };
}
