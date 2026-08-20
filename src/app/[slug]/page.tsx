import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";
import { notFound } from "next/navigation";

import { CompareTable } from "@/components/CompareTable";
import { FitCheck } from "@/components/FitCheck";
import { ProductFeatures } from "@/components/ProductFeatures";
import { ProductGallery } from "@/components/ProductGallery";
import { ProductNav, type NavSection } from "@/components/ProductNav";
import { ReadoutStrip } from "@/components/ReadoutStrip";
import { ReviewWall } from "@/components/ReviewWall";
import { SiteHeader } from "@/components/SiteHeader";
import { SpecTable } from "@/components/SpecTable";
import {
  buildFilters,
  categorySlugs,
  getCategory,
  getCategoryProducts,
  getCollections,
  getCompareColumns,
  getFaqs,
  getGuides,
  getRangeSummary,
  getReasons,
  getReviews,
  getSignature,
  type Category,
} from "@/lib/queries/category";
import { getArticlesByPath, getRegions } from "@/lib/queries/home";
import {
  getColourways,
  getDimensions,
  getDownloads,
  getFacets,
  getFeatures,
  getFitMetrics,
  getImages,
  getProductFaqs,
  getProduct,
  getRelated,
  getSpecs,
  getVideos,
  productSlugs,
  type Dimension,
  type Facet,
  type Product,
  type ProductFaq,
  type ProductImage,
  type Video,
} from "@/lib/queries/product";
import { Inline, Markdown } from "@/lib/markdown";
import { formatDate, whatsappLink } from "@/lib/site";
import { warrantyFor } from "@/lib/warranty-terms";

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
  if (category) return <CategoryPage category={category} />;

  notFound();
}

/**
 * The long-form buying guide each category sends readers to. Editorial: one
 * per category, and the same article the live page promotes at the foot of
 * each, so a visitor arriving from either site meets the same guide.
 *
 * The first three are also the ones the homepage promotes, which is why a
 * visitor who came via the front page is never sent to a second article about
 * the same decision. The dishwasher and purifier entries have no homepage slot
 * to agree with and simply match their own live pages.
 */
const CATEGORY_GUIDE: Record<string, string> = {
  "kitchen-hood-in-malaysia": "buying-guide/types-of-range-hoods",
  "cooker-hob-in-malaysia": "buying-guide/glass-vs-stainless-gas-hob-which-gas-hob-are-best",
  "combi-and-steam-oven-in-malaysia": "buying-guide/what-is-a-combi-oven",
  "dishwasher-in-malaysia": "buying-guide/is-a-dishwasher-necessary",
  "one-tap-purifier-in-malaysia": "buying-guide/how-water-filters-work",
};

function CategoryPage({ category }: { category: Category }) {
  const products = getCategoryProducts(category.id);
  // Before buildFilters: it writes band membership back into each product's
  // `filters`, so the summary and the columns are read off the same array
  // either way, but the grid needs the mutated one.
  const summary = getRangeSummary(products);
  const columns = getCompareColumns(products);
  const filters = buildFilters(products, getCollections(category.id));
  const guidePath = CATEGORY_GUIDE[category.slug];

  return (
    <CategoryView
      category={category}
      products={products}
      filters={filters}
      summary={summary}
      columns={columns}
      signature={
        category.signature_product_id ? getSignature(category.signature_product_id) : undefined
      }
      guides={getGuides(category.id)}
      reasons={getReasons(category.id)}
      faqs={getFaqs(category.id)}
      // All ten the widget rotates. The rail is scrollable, so there is no
      // reason to hold seven of them back.
      reviews={getReviews(10)}
      regions={getRegions()}
      guideArticle={guidePath ? getArticlesByPath([guidePath])[0] : undefined}
    />
  );
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
      `Compare every VATTI ${category.name.toLowerCase()} sold in Malaysia: measured specifications, model by model, and the authorised dealers who stock them.`,
    alternates: { canonical: `/${category.slug}/` },
    openGraph: {
      title: category.seo_title ?? `${category.name} in Malaysia`,
      description: category.meta_description ?? undefined,
      url: `/${category.slug}/`,
    },
  };
}

/**
 * What the product page's WhatsApp buttons type for the visitor. The model code
 * gets a line of its own rather than being buried in the sentence: it is the one
 * thing the sales team needs, the legacy H1 often carries it in prose too, and a
 * secondary model (the hob a hood is sold beside) would otherwise be lost.
 */
function enquiryMessage(product: Product): string {
  return [
    `Hi VATTI Malaysia. I am enquiring about the ${product.name}.`,
    "",
    `Model: ${product.model_code}${product.secondary_model ? ` + ${product.secondary_model}` : ""}`,
    "",
    "Could you tell me the price and where I can see it?",
  ].join("\n");
}

/* ── structured data ───────────────────────────────────────────────────────
 *
 * The product template shipped with none, while the WordPress page it replaces
 * emits BreadcrumbList, WebPage and Article through Yoast. Cutting over without
 * this would have been a structured-data regression on the templates that carry
 * the model names.
 *
 * No `offers` node and no `aggregateRating`: there is no price on this site
 * (dealers quote their own installed price) and self-serving review markup is
 * against Google's guidelines, which is the same call ReviewWall documents.
 * Product without offers wins no merchant rich result, and that is fine — the
 * job here is naming the entity, its model code and its measured figures so an
 * answer engine has something to bind "V993" to.
 */
const SITE = "https://vattimalaysia.com";

function productSchema(
  product: Product,
  facets: Facet[],
  dimensions: Dimension[],
  images: ProductImage[]
) {
  return {
    "@context": "https://schema.org",
    "@type": "Product",
    name: product.name,
    sku: product.model_code,
    mpn: product.model_code,
    model: product.model_code,
    category: product.category_name,
    color: product.colour_variant ?? undefined,
    description: product.intro_md ?? product.meta_description ?? undefined,
    url: `${SITE}/${product.slug}/`,
    image: images.slice(0, 4).map((i) => i.url),
    brand: { "@type": "Brand", name: "VATTI" },
    manufacturer: { "@type": "Organization", name: "VATTI" },
    additionalProperty: [
      ...facets.map((f) => ({
        "@type": "PropertyValue",
        name: f.label,
        value: `${f.value} ${f.unit}`,
      })),
      ...dimensions.map((d) => ({
        "@type": "PropertyValue",
        name: d.label,
        value: d.note ? `${d.value} (${d.note})` : d.value,
      })),
    ],
  };
}

function breadcrumbSchema(product: Product) {
  return {
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    itemListElement: [
      { "@type": "ListItem", position: 1, name: "Home", item: `${SITE}/` },
      {
        "@type": "ListItem",
        position: 2,
        name: product.category_name,
        item: `${SITE}/${product.category_slug}/`,
      },
      {
        "@type": "ListItem",
        position: 3,
        name: product.model_code,
        item: `${SITE}/${product.slug}/`,
      },
    ],
  };
}

/** Only for a video we hold real metadata on — a bare id is not a VideoObject. */
function videoSchema(video: Video, product: Product) {
  return {
    "@context": "https://schema.org",
    "@type": "VideoObject",
    name: video.title ?? `${product.name} product video`,
    description: video.summary ?? undefined,
    uploadDate: video.published_on ?? undefined,
    duration: video.duration_seconds ? isoDuration(video.duration_seconds) : undefined,
    thumbnailUrl: [`https://i.ytimg.com/vi/${video.video_id}/hqdefault.jpg`],
    embedUrl: `https://www.youtube-nocookie.com/embed/${video.video_id}`,
    contentUrl: `https://www.youtube.com/watch?v=${video.video_id}`,
  };
}

function productFaqSchema(faqs: ProductFaq[]) {
  return {
    "@context": "https://schema.org",
    "@type": "FAQPage",
    mainEntity: faqs.map((f) => ({
      "@type": "Question",
      name: f.question,
      // Markdown links are stripped: the answer is rendered with them on the
      // page, but the schema field takes text, and `[V929](/…/)` in a rich
      // result reads as a typo.
      acceptedAnswer: { "@type": "Answer", text: f.answer_md.replace(/\[([^\]]*)\]\([^)]*\)/g, "$1") },
    })),
  };
}

/** 99 -> 'PT1M39S'. Every VATTI video is under an hour, so hours are not handled. */
function isoDuration(seconds: number): string {
  return `PT${Math.floor(seconds / 60)}M${seconds % 60}S`;
}

/** 99 -> '1m 39s', for the caption under the embed. */
function runtime(seconds: number): string {
  const m = Math.floor(seconds / 60);
  const rest = seconds % 60;
  return m ? `${m}m ${rest}s` : `${rest}s`;
}

/**
 * Scroll offset for anything the section rail links to: the sticky header plus
 * the rail itself. Without it an anchor jump parks the heading underneath both.
 */
const ANCHOR = "scroll-mt-[calc(var(--header-h)+3.25rem)]";

function ProductView({ product }: { product: Product }) {
  const facets = getFacets(product.id);
  const specs = getSpecs(product.id);
  const all = getImages(product.id);
  const gallery = all.filter((i) => i.role === "hero" || i.role === "gallery");
  const dimensionImages = all.filter((i) => i.role === "dimension");
  const dimensions = getDimensions(product.id);
  // Two ways to tell the same story. `story` is the written one, picture and
  // words apart; `featureImages` is the source site's composite JPEGs, which is
  // what a product still gets until its blocks are authored.
  const story = getFeatures(product.id);
  const featureImages = story.length
    ? []
    : all.filter((i) => i.role === "feature" || i.role === "lifestyle");
  const downloads = getDownloads(product.id);
  const videos = getVideos(product.id);
  const faqs = getProductFaqs(product.id);
  const related = getRelated(product.id);
  const colourways = getColourways(product.id);
  const warranty = warrantyFor(product.kind);
  const reviews = getReviews(8);
  const regions = getRegions();
  const dealers = regions.reduce((n, r) => n + r.count, 0);
  const guidePath = CATEGORY_GUIDE[product.category_slug];
  const guide = guidePath ? getArticlesByPath([guidePath])[0] : undefined;

  // The comparison is this model against the four it is filed beside, read out
  // of the category the same way the category page reads it. Anything wider is
  // the category page's job and it already does it better.
  const category = getCategory(product.category_slug);
  const relatedSlugs = new Set(related.map((r) => r.slug));
  const siblings = category
    ? getCategoryProducts(category.id).filter((p) => relatedSlugs.has(p.slug))
    : [];
  const lineup = category
    ? [
        ...getCategoryProducts(category.id).filter((p) => p.slug === product.slug),
        ...siblings,
      ]
    : [];
  const compareColumns = lineup.length > 1 ? getCompareColumns(lineup) : [];
  const fit = getFitMetrics(product.id);
  const enquireHref = whatsappLink(enquiryMessage(product));

  // Built from what this product actually renders, not from a fixed list: a
  // model with no video and no FAQ would otherwise get a rail pointing at two
  // sections that are not on the page.
  const navSections: NavSection[] = [
    specs.length > 0 && { id: "specifications", label: "Specifications" },
    (dimensions.length > 0 || dimensionImages.length > 0) && {
      id: "dimensions",
      label: "Dimensions",
    },
    (story.length > 0 || featureImages.length > 0) && { id: "detail", label: "Detail" },
    videos.length > 0 && { id: "video", label: "In action" },
    lineup.length > 1 && compareColumns.length > 0 && { id: "compare", label: "Compare" },
    faqs.length > 0 && { id: "questions", label: "Questions" },
    { id: "enquire", label: "Where to buy" },
  ].filter((x): x is NavSection => Boolean(x));

  return (
    <>
      <SiteHeader />
      <ProductNav sections={navSections} />

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

              {/* The warranty belongs beside the model, not on a page a visitor
                  has to go looking for. It is the answer to "will anyone service
                  this in five years", which PRODUCT.md names as the fear this
                  whole site is selling against. */}
              {warranty && (
                <p className="mt-6 flex flex-wrap items-baseline gap-x-3 gap-y-1 text-sm">
                  <span className="readout text-teal">{warranty.headline}</span>
                  {warranty.extra && <span className="text-ink-muted">{warranty.extra}</span>}
                  <Link
                    href="/vatti-ewarranty/"
                    className="text-ink-muted underline decoration-line underline-offset-4 transition-colors hover:text-teal"
                  >
                    Register it
                  </Link>
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
                  href={enquireHref}
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
          id="specifications"
          aria-labelledby="specs-heading"
          className={`mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20 ${ANCHOR}`}
        >
          <h2 id="specs-heading" className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl">
            Specifications
          </h2>
          <div className="mt-8 max-w-3xl">
            <SpecTable specs={specs} />
          </div>
        </section>

        {(dimensions.length > 0 || dimensionImages.length > 0) && (
          <section
            id="dimensions"
            aria-labelledby="dimensions-heading"
            className={`mx-auto max-w-6xl px-5 pb-14 sm:px-8 sm:pb-20 ${ANCHOR}`}
          >
            <h2
              id="dimensions-heading"
              className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl"
            >
              Dimensions and installation
            </h2>
            {/* Deliberately not "millimetres": a dishwasher's table carries place
                settings and a water pressure, and a purifier's carries three
                boxes. What every one of them has in common is that the figures
                came off the manufacturer's own drawing. */}
            <p className="mt-3 max-w-[62ch] text-ink-muted">
              The figures off the {product.model_code} drawing, in full. Whether it fits is the
              question that ends a shortlist, so it is answered here rather than four megabytes
              into a PDF.
            </p>

            {dimensions.length > 0 && (
              <div className="mt-8 grid gap-10 lg:grid-cols-2 lg:gap-16">
                {(["product", "installation"] as const).map((section) => {
                  const rows = dimensions.filter((d) => d.section === section);
                  if (!rows.length) return null;
                  return (
                    <div key={section}>
                      <h3 className="text-sm font-semibold text-ink-muted">
                        {section === "product" ? "The appliance" : "The space it goes in"}
                      </h3>
                      <dl className="mt-4 border-t border-line">
                        {rows.map((d) => (
                          <div
                            key={d.label}
                            // Wraps rather than shrinks: "180 mm inside, 185 mm
                            // outside" beside a long label is wider than a phone,
                            // and a row that refuses to break takes the whole
                            // page sideways with it.
                            className="flex flex-wrap items-baseline justify-between gap-x-6 gap-y-1 border-b border-line py-3"
                          >
                            <dt className="text-sm text-ink-muted">
                              {d.label}
                              {/* Side by side, the two columns are read as one
                                  table, so their rules have to line up. A note
                                  makes a row taller, and the two sections do not
                                  carry them on the same rows — so from lg, where
                                  the columns sit together, a row without a note
                                  keeps the empty line anyway. */}
                              {d.note ? (
                                <span className="mt-0.5 block text-xs text-ink-muted/80">
                                  {d.note}
                                </span>
                              ) : (
                                <span
                                  aria-hidden="true"
                                  className="mt-0.5 hidden text-xs lg:block"
                                >
                                  &nbsp;
                                </span>
                              )}
                            </dt>
                            <dd className="readout text-sm text-ink">{d.value}</dd>
                          </div>
                        ))}
                      </dl>
                    </div>
                  );
                })}
              </div>
            )}

            {dimensionImages.length > 0 && (
              <ul className="mt-10 grid gap-6 sm:grid-cols-2">
                {dimensionImages.map((img) => (
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
            )}

            {fit && (
              <div className="mt-10 max-w-3xl">
                <FitCheck model={product.model_code} metrics={fit} />
              </div>
            )}

            {downloads.some((d) => d.kind === "dimensions") && (
              <p className="mt-8 text-sm">
                <a
                  href={downloads.find((d) => d.kind === "dimensions")!.url}
                  className="text-teal underline decoration-line underline-offset-4"
                >
                  {/* The download's own label: on most products this file is a
                      dimension drawing, on the dishwasher it is the full
                      installation manual, and calling it the wrong thing is a
                      small lie the visitor discovers on click. */}
                  {downloads.find((d) => d.kind === "dimensions")!.label} (PDF)
                </a>
              </p>
            )}
          </section>
        )}

        {(story.length > 0 || featureImages.length > 0) && (
          <section
            id="detail"
            aria-labelledby="features-heading"
            className={`mx-auto px-5 pb-14 sm:px-8 sm:pb-20 ${ANCHOR} ${
              story.length ? "max-w-6xl" : "max-w-4xl"
            }`}
          >
            <h2
              id="features-heading"
              className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl"
            >
              Detail
            </h2>

            {story.length > 0 ? (
              <div className="mt-10">
                <ProductFeatures features={story} name={product.name} />
              </div>
            ) : (
              /* The source site's composites, text and all, with caption_md
                 repeating that text underneath so it is at least selectable.
                 A product graduates out of this branch by getting rows in
                 data/sql/product-features.sql. */
              <ul className="mt-8 flex flex-col gap-6">
                {featureImages.map((img, i) => (
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
                      <div className="mt-3 max-w-[68ch] text-[0.9375rem] text-ink-muted [&>:first-child]:mt-0 [&>:last-child]:mb-0">
                        <Markdown md={img.caption_md} />
                      </div>
                    )}
                  </li>
                ))}
              </ul>
            )}
          </section>
        )}

        {videos.length > 0 && (
          <section
            id="video"
            aria-labelledby="video-heading"
            className={`mx-auto max-w-6xl px-5 pb-14 sm:px-8 sm:pb-20 ${ANCHOR}`}
          >
            <h2 id="video-heading" className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl">
              In action
            </h2>
            {/* An iframe says nothing to a reader who will not press play, and
                nothing at all to a crawler. The summary and the date are the
                video's own, carried in product_video. */}
            {/* One video is the normal case, and it gets the summary beside the
                player rather than a dead half-row next to it. Two or more fall
                back to a plain two-up. */}
            <div className={`mt-8 grid gap-8 ${videos.length > 1 ? "lg:grid-cols-2" : ""}`}>
              {videos.map((v) => (
                <figure
                  key={v.video_id}
                  className={
                    videos.length === 1
                      ? "grid gap-6 lg:grid-cols-[minmax(0,1.25fr)_minmax(0,1fr)] lg:items-center lg:gap-12"
                      : "flex flex-col gap-4"
                  }
                >
                  <div className="aspect-video overflow-hidden rounded-sm border border-line bg-surface">
                    <iframe
                      src={`https://www.youtube-nocookie.com/embed/${v.video_id}`}
                      title={v.title ?? `${product.name} product video`}
                      loading="lazy"
                      allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                      allowFullScreen
                      className="size-full"
                    />
                  </div>
                  {(v.summary || v.published_on) && (
                    <figcaption className="max-w-[52ch] text-[0.9375rem] leading-relaxed text-ink-muted">
                      {v.summary}
                      {v.published_on && (
                        <span className="readout mt-2 block text-xs">
                          {formatDate(v.published_on)}
                          {v.duration_seconds ? ` · ${runtime(v.duration_seconds)}` : ""}
                        </span>
                      )}
                    </figcaption>
                  )}
                </figure>
              ))}
            </div>
          </section>
        )}

        {lineup.length > 1 && compareColumns.length > 0 && (
          <section
            id="compare"
            aria-labelledby="compare-heading"
            className={`mx-auto max-w-6xl px-5 pb-14 sm:px-8 sm:pb-20 ${ANCHOR}`}
          >
            <h2
              id="compare-heading"
              className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl"
            >
              How it compares
            </h2>
            <p className="mt-3 max-w-[62ch] text-ink-muted">
              The {product.model_code} against the models it is usually shortlisted with. Press a
              column to sort by it.
            </p>
            <div className="mt-8">
              <CompareTable products={lineup} columns={compareColumns} />
            </div>
          </section>
        )}

        {faqs.length > 0 && (
          <section
            id="questions"
            aria-labelledby="faq-heading"
            className={`mx-auto max-w-6xl px-5 pb-14 sm:px-8 sm:pb-20 ${ANCHOR}`}
          >
            <h2 id="faq-heading" className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl">
              Questions about the {product.model_code}
            </h2>
            {/* Open, not a disclosure stack. Seven answers is a page worth of
                text a buyer can skim and a search engine can lift; hiding them
                behind a chevron buys a shorter page and loses both. */}
            <dl className="mt-8 grid gap-x-14 gap-y-8 lg:grid-cols-2">
              {faqs.map((f) => (
                <div key={f.question}>
                  <dt className="text-[1.0625rem] font-semibold leading-snug tracking-[-0.02em]">
                    {f.question}
                  </dt>
                  <dd className="mt-2 max-w-[62ch] leading-relaxed text-ink-muted">
                    <Inline text={f.answer_md} />
                  </dd>
                </div>
              ))}
            </dl>
          </section>
        )}

        {/* Where to buy. The enquiry band with the dealer network named: the
            page ends in a shop, not a cart, and "which one of you actually
            stocks it" is the last question before the visit. */}
        <section
          id="enquire"
          aria-labelledby="enquire-heading"
          className={`border-y border-line bg-surface ${ANCHOR}`}
        >
          <div className="mx-auto grid max-w-6xl gap-10 px-5 py-14 sm:px-8 sm:py-20 lg:grid-cols-[minmax(0,1fr)_minmax(0,0.8fr)] lg:gap-16">
            <div className="max-w-2xl">
              <h2
                id="enquire-heading"
                className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl"
              >
                Where to buy the {product.model_code}
              </h2>
              <p className="mt-3 max-w-[62ch] text-ink-muted">
                VATTI Malaysia does not sell online. The {product.model_code} is sold and installed
                by authorised dealers, who quote their own installed price against the ducting your
                kitchen needs. Tell us your layout and we will point you to the nearest one that
                stocks it. Replies within 48 hours.
              </p>
              <div className="mt-8 flex flex-wrap gap-3">
                <a
                  href={enquireHref}
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

            {regions.length > 0 && (
              <div>
                <h3 className="text-sm font-semibold text-ink-muted">
                  <span className="readout text-ink">{dealers}</span> authorised dealers
                </h3>
                <ul className="mt-4 grid gap-2 sm:grid-cols-2">
                  {regions.map((r) => (
                    <li key={r.slug}>
                      <Link
                        href={`/store-locations/#${r.slug}`}
                        className="flex items-baseline justify-between gap-3 rounded-sm border border-line px-3.5 py-2.5 text-sm text-ink transition-colors hover:border-teal hover:text-teal"
                      >
                        {r.region}
                        <span className="readout text-xs text-ink-muted">{r.count}</span>
                      </Link>
                    </li>
                  ))}
                </ul>
              </div>
            )}
          </div>
        </section>

        {/* The service, in the words of people who have needed it. Same wall the
            category pages carry: these reviews are about the team behind every
            model, which is exactly what a buyer is weighing at this point. */}
        <ReviewWall reviews={reviews} heading="Backed by a service team Malaysians rate 5 stars" />

        {guide && (
          <section
            aria-labelledby="guide-heading"
            className="mx-auto max-w-6xl px-5 pt-14 sm:px-8 sm:pt-20"
          >
            <Link
              href={`/${guide.path}/`}
              className="group flex flex-col gap-2 rounded-sm border border-line bg-surface p-6 transition-colors hover:border-line-strong sm:p-8"
            >
              <span className="readout text-xs text-teal">Still deciding</span>
              <h2
                id="guide-heading"
                className="text-balance text-xl font-semibold tracking-[-0.025em] transition-colors group-hover:text-teal sm:text-2xl"
              >
                {guide.title}
              </h2>
              <span className="readout text-xs text-ink-muted">
                {guide.reading_minutes} minute read
              </span>
            </Link>
          </section>
        )}

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

      {/* Static JSON built from DB columns and serialised with JSON.stringify.
          No visitor input reaches any of it. */}
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{
          __html: JSON.stringify(productSchema(product, facets, dimensions, gallery)),
        }}
      />
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(breadcrumbSchema(product)) }}
      />
      {faqs.length > 0 && (
        <script
          type="application/ld+json"
          dangerouslySetInnerHTML={{ __html: JSON.stringify(productFaqSchema(faqs)) }}
        />
      )}
      {videos
        .filter((v) => v.title && v.published_on)
        .map((v) => (
          <script
            key={v.video_id}
            type="application/ld+json"
            dangerouslySetInnerHTML={{ __html: JSON.stringify(videoSchema(v, product)) }}
          />
        ))}

      {/* Mobile sticky CTA — 64% of traffic. Same prefilled message as the
          desktop hero button: this bar is that button on a phone. */}
      <div className="fixed inset-x-0 bottom-0 z-[var(--z-sticky)] border-t border-line bg-void/95 px-4 py-3 backdrop-blur-sm lg:hidden">
        <div className="flex gap-3">
          <a
            href={enquireHref}
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
