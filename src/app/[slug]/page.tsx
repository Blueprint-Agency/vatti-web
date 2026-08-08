import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";
import { notFound } from "next/navigation";

import { ProductGallery } from "@/components/ProductGallery";
import { ReadoutStrip } from "@/components/ReadoutStrip";
import { SiteHeader } from "@/components/SiteHeader";
import { SpecTable } from "@/components/SpecTable";
import {
  categorySlugs,
  getCategory,
  getCategoryProducts,
  type Category,
} from "@/lib/queries/category";
import {
  getColourways,
  getDownloads,
  getFacets,
  getImages,
  getProduct,
  getRelated,
  getSpecs,
  getVideos,
  productSlugs,
  type Product,
} from "@/lib/queries/product";
import { WHATSAPP } from "@/lib/site";

import { CategoryView } from "./CategoryView";

/**
 * Almost every URL on this site is flat at the root — 39 products AND the 5
 * category pages. Next.js allows only one dynamic segment per level, so both
 * families resolve here: product first (39 slugs), then category (5), then 404.
 * Articles join the same two lines once the `article` table lands.
 *
 * Static segments (/about-us/, /store-locations/, /category/…) win over this
 * route on their own, so they need no special case.
 */
export function generateStaticParams() {
  return [...productSlugs(), ...categorySlugs()].map((slug) => ({ slug }));
}

export async function generateMetadata({
  params,
}: {
  params: Promise<{ slug: string }>;
}): Promise<Metadata> {
  const { slug } = await params;
  const product = getProduct(slug);
  if (product) return productMetadata(product);

  const category = getCategory(slug);
  if (category) return categoryMetadata(category);

  return {};
}

export default async function Page({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params;

  const product = getProduct(slug);
  if (product) return <ProductView product={product} />;

  const category = getCategory(slug);
  if (category) {
    return <CategoryView category={category} products={getCategoryProducts(category.id)} />;
  }

  notFound();
}

function productMetadata(product: Product): Metadata {
  const hero = getImages(product.id, "hero")[0] ?? getImages(product.id)[0];
  return {
    // absolute: the legacy <title> already reads "Cooker Hood | VATTI Athena
    // ... V993". Letting the layout template append "| VATTI Malaysia" would
    // change every ranking page's title. Titles are a CTR surface — see
    // PRODUCT.md § Design Principles 5.
    title: { absolute: product.seo_title ?? product.name },
    description: product.meta_description ?? undefined,
    alternates: { canonical: `/${product.slug}/` },
    openGraph: {
      title: product.seo_title ?? product.name,
      description: product.meta_description ?? undefined,
      url: `/${product.slug}/`,
      images: hero ? [{ url: hero.url }] : undefined,
    },
  };
}

/**
 * product_category.seo_title and .meta_description are NULL for all 5 rows in
 * data/sql/products.sql, so both fall back. The legacy strings that these pages
 * rank on are sitting in research/categories.json — importing them is a
 * data/sql change, which this file does not own.
 */
function categoryMetadata(category: Category): Metadata {
  const title = category.seo_title
    ? { absolute: category.seo_title }
    : `${category.name} in Malaysia`;
  return {
    title,
    description:
      category.meta_description ??
      `Compare every VATTI ${category.name.toLowerCase()} sold in Malaysia — measured specifications, model by model, and the authorised dealers who stock them.`,
    alternates: { canonical: `/${category.slug}/` },
    openGraph: {
      title: category.seo_title ?? `${category.name} in Malaysia`,
      description: category.meta_description ?? undefined,
      url: `/${category.slug}/`,
    },
  };
}

function ProductView({ product }: { product: Product }) {
  const facets = getFacets(product.id);
  const specs = getSpecs(product.id);
  const all = getImages(product.id);
  const gallery = all.filter((i) => i.role === "hero" || i.role === "gallery");
  const features = all.filter((i) => i.role === "feature" || i.role === "lifestyle");
  const dimensions = all.filter((i) => i.role === "dimension");
  const downloads = getDownloads(product.id);
  const videos = getVideos(product.id);
  const related = getRelated(product.id);
  const colourways = getColourways(product.id);

  return (
    <>
      <SiteHeader />

      {/* The footer carries the bottom padding that clears the mobile CTA bar. */}
      <main id="main">
        {/* Identity + gallery */}
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
                <Link
                  href={`/${product.category_slug}/`}
                  className="transition-colors hover:text-ink"
                >
                  {product.category_name}
                </Link>
              </li>
              <li aria-hidden="true">/</li>
              <li className="text-ink">{product.model_code}</li>
            </ol>
          </nav>

          <div className="grid gap-10 lg:grid-cols-[minmax(0,1fr)_minmax(0,1fr)] lg:gap-16">
            <ProductGallery images={gallery.length ? gallery : all} name={product.name} />

            <div className="flex flex-col">
              {/* No series eyebrow: the legacy H1 already opens with the series
                  name ("Athena Series Lifting Type Range Hood V993"), and we
                  keep that text verbatim for SEO. Repeating it above is noise. */}
              <h1 className="text-balance text-[clamp(1.875rem,1.2rem+2.6vw,3.25rem)] font-semibold leading-[1.05] tracking-[-0.035em]">
                {product.name}
              </h1>

              <p className="readout mt-3 text-lg text-ink-muted">
                {product.model_code}
                {product.secondary_model && ` + ${product.secondary_model}`}
              </p>

              {product.intro_md && (
                <p className="mt-6 max-w-[62ch] text-[1.0625rem] leading-relaxed text-ink-muted">
                  {product.intro_md}
                </p>
              )}

              {colourways.length > 1 && (
                <div className="mt-8">
                  <h2 className="text-sm font-semibold text-ink-muted">Finish</h2>
                  <ul className="mt-3 flex flex-wrap gap-2">
                    {colourways.map((c) => (
                      <li key={c.slug}>
                        <Link
                          href={`/${c.slug}/`}
                          aria-current={c.slug === product.slug ? "page" : undefined}
                          className={`block rounded-sm border px-3.5 py-2 text-sm transition-colors ${
                            c.slug === product.slug
                              ? "border-teal text-teal"
                              : "border-line text-ink-muted hover:border-line-strong hover:text-ink"
                          }`}
                        >
                          {c.colour_variant}
                        </Link>
                      </li>
                    ))}
                  </ul>
                </div>
              )}

              {downloads.length > 0 && (
                <div className="mt-8">
                  <h2 className="text-sm font-semibold text-ink-muted">Documents</h2>
                  <ul className="mt-3 flex flex-wrap gap-2">
                    {downloads.map((d) => (
                      <li key={d.url}>
                        <a
                          href={d.url}
                          className="flex items-center gap-2 rounded-sm border border-line px-3.5 py-2 text-sm text-ink transition-colors hover:border-teal hover:text-teal"
                        >
                          {d.label}
                          <span className="readout text-xs text-ink-muted">PDF</span>
                        </a>
                      </li>
                    ))}
                  </ul>
                </div>
              )}

              {/* Desktop CTA; mobile gets the sticky bar instead. Deliberately
                  NOT mt-auto — the right column is shorter than the gallery, so
                  pushing these to the bottom opened a dead gap. */}
              <div className="hidden gap-3 pt-10 lg:flex">
                <a
                  href="#enquire"
                  className="rounded-sm bg-teal px-6 py-3 font-semibold text-void transition-opacity hover:opacity-90"
                >
                  Enquire about {product.model_code}
                </a>
                <Link
                  href="/store-locations/"
                  className="rounded-sm border border-line-strong px-6 py-3 font-medium text-ink transition-colors hover:border-teal hover:text-teal"
                >
                  Find a dealer
                </Link>
              </div>
            </div>
          </div>
        </div>

        <ReadoutStrip facets={facets} />

        {/* Specifications */}
        <section
          aria-labelledby="specs-heading"
          className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20"
        >
          <h2 id="specs-heading" className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl">
            Specifications
          </h2>
          <div className="mt-8 max-w-3xl">
            <SpecTable specs={specs} />
          </div>
        </section>

        {dimensions.length > 0 && (
          <section
            aria-labelledby="dimensions-heading"
            className="mx-auto max-w-6xl px-5 pb-14 sm:px-8 sm:pb-20"
          >
            <h2
              id="dimensions-heading"
              className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl"
            >
              Dimensions
            </h2>
            <ul className="mt-8 grid gap-6 sm:grid-cols-2">
              {dimensions.map((img) => (
                <li key={img.url} className="rounded-sm border border-line bg-surface p-4">
                  <Image
                    src={img.url}
                    alt={img.alt || `${product.name} dimension diagram`}
                    width={img.width ?? 1080}
                    height={img.height ?? 1080}
                    sizes="(max-width: 640px) 100vw, 45vw"
                    className="h-auto w-full"
                  />
                </li>
              ))}
            </ul>
          </section>
        )}

        {videos.length > 0 && (
          <section
            aria-labelledby="video-heading"
            className="mx-auto max-w-6xl px-5 pb-14 sm:px-8 sm:pb-20"
          >
            <h2 id="video-heading" className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl">
              In action
            </h2>
            <div className="mt-8 grid gap-6 lg:grid-cols-2">
              {videos.map((id) => (
                <div
                  key={id}
                  className="aspect-video overflow-hidden rounded-sm border border-line bg-surface"
                >
                  <iframe
                    src={`https://www.youtube-nocookie.com/embed/${id}`}
                    title={`${product.name} product video`}
                    loading="lazy"
                    allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                    allowFullScreen
                    className="size-full"
                  />
                </div>
              ))}
            </div>
          </section>
        )}

        {features.length > 0 && (
          <section
            aria-labelledby="features-heading"
            className="mx-auto max-w-4xl px-5 pb-14 sm:px-8 sm:pb-20"
          >
            <h2
              id="features-heading"
              className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl"
            >
              Detail
            </h2>
            {/* Phase 6: caption_md carries the transcription of text baked into
                these JPEGs on the source site. Until that copy lands, the
                images ship with alt text only. */}
            <ul className="mt-8 flex flex-col gap-6">
              {features.map((img, i) => (
                <li key={img.url}>
                  <Image
                    src={img.url}
                    alt={img.alt || `${product.name} feature detail ${i + 1}`}
                    width={img.width ?? 1200}
                    height={img.height ?? 800}
                    loading={i < 1 ? "eager" : "lazy"}
                    sizes="(max-width: 896px) 100vw, 896px"
                    className="h-auto w-full rounded-sm border border-line"
                  />
                  {img.caption_md && (
                    <p className="mt-3 max-w-[68ch] text-[0.9375rem] leading-relaxed text-ink-muted">
                      {img.caption_md}
                    </p>
                  )}
                </li>
              ))}
            </ul>
          </section>
        )}

        {/* Enquiry */}
        <section
          id="enquire"
          aria-labelledby="enquire-heading"
          className="border-y border-line bg-surface"
        >
          <div className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20">
            <div className="max-w-2xl">
              <h2
                id="enquire-heading"
                className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl"
              >
                Ask about the {product.model_code}
              </h2>
              <p className="mt-3 max-w-[62ch] text-ink-muted">
                Tell us your kitchen layout and we will point you to the nearest authorised dealer
                who stocks it. Replies within 48 hours.
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
          </div>
        </section>

        {related.length > 0 && (
          <section
            aria-labelledby="related-heading"
            className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20"
          >
            <h2
              id="related-heading"
              className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl"
            >
              Also consider
            </h2>
            <ul className="mt-8 grid gap-5 [grid-template-columns:repeat(auto-fit,minmax(200px,1fr))]">
              {related.map((r) => (
                <li key={r.slug}>
                  <Link
                    href={`/${r.slug}/`}
                    className="group flex h-full flex-col gap-4 rounded-sm border border-line bg-surface p-4 transition-colors hover:border-line-strong"
                  >
                    {r.url && (
                      <div className="relative aspect-square overflow-hidden rounded-sm bg-void">
                        <Image
                          src={r.url}
                          alt=""
                          fill
                          loading="lazy"
                          sizes="(max-width: 640px) 50vw, 220px"
                          className="object-contain"
                        />
                      </div>
                    )}
                    <div className="mt-auto">
                      <p className="readout text-xs text-teal">{r.model_code}</p>
                      <p className="mt-1 text-sm font-medium leading-snug text-ink transition-colors group-hover:text-teal">
                        {r.name}
                      </p>
                    </div>
                  </Link>
                </li>
              ))}
            </ul>
          </section>
        )}
      </main>

      {/* Mobile sticky CTA — 64% of traffic */}
      <div className="fixed inset-x-0 bottom-0 z-[var(--z-sticky)] border-t border-line bg-void/95 px-4 py-3 backdrop-blur-sm lg:hidden">
        <div className="flex gap-3">
          <a
            href={WHATSAPP}
            className="flex-1 rounded-sm bg-teal px-4 py-3 text-center font-semibold text-void"
          >
            WhatsApp
          </a>
          <Link
            href="/store-locations/"
            className="flex-1 rounded-sm border border-line-strong px-4 py-3 text-center font-medium text-ink"
          >
            Find a dealer
          </Link>
        </div>
      </div>
    </>
  );
}
