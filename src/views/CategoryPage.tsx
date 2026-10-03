import type { Metadata } from "next";
import { notFound } from "next/navigation";

import { OG_LOCALE, TAG, t, type Locale } from "@/i18n";
import { hreflang } from "@/lib/alternates";
import { get } from "@/lib/db";
import { articleHref } from "@/lib/queries/article";
import {
  buildFilters,
  categoryEditions,
  categoryParams,
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
} from "@/lib/queries/category";
import { getArticlesByPath, getRegions, type ArticleTeaser } from "@/lib/queries/home";

import { CategoryView } from "./CategoryView";

/**
 * A category page in any edition: data, metadata and the guide it sends readers
 * to. The route files are thin — (en)/[slug]/page.tsx resolves products first
 * and falls through to this; (ms)/ms/[slug] and (zh)/zh/[slug] serve only
 * categories until the product pages are translated (Phase 3).
 */

/**
 * The long-form buying guide each category sends readers to. Editorial: one
 * per category, and the same article the live page promotes at the foot of
 * each, so a visitor arriving from either site meets the same guide.
 *
 * The first three are also the ones the homepage promotes, which is why a
 * visitor who came via the front page is never sent to a second article about
 * the same decision. The dishwasher and purifier entries have no homepage slot
 * to agree with and simply match their own live pages.
 *
 * In Malay and Chinese the section shows only where the guide has an edition
 * in that language (same translation_key); sending a Malay reader to an
 * English article from the foot of a Malay page is a dead end, not a guide.
 */
export const CATEGORY_GUIDE: Record<string, string> = {
  "kitchen-hood-in-malaysia": "buying-guide/types-of-range-hoods",
  "cooker-hob-in-malaysia": "buying-guide/glass-vs-stainless-gas-hob-which-gas-hob-are-best",
  "combi-and-steam-oven-in-malaysia": "buying-guide/what-is-a-combi-oven",
  "dishwasher-in-malaysia": "buying-guide/is-a-dishwasher-necessary",
  "one-tap-purifier-in-malaysia": "buying-guide/how-water-filters-work",
};

function guideFor(locale: Locale, enSlug: string): { teaser: ArticleTeaser; href: string } | undefined {
  const path = CATEGORY_GUIDE[enSlug];
  if (!path) return undefined;
  if (locale === "en") {
    const teaser = getArticlesByPath([path])[0];
    return teaser && { teaser, href: `/${teaser.path}/` };
  }
  const key = get<{ translation_key: string | null }>(
    `SELECT translation_key FROM article WHERE lang = 'en-MY' AND path = ?`,
    path
  )?.translation_key;
  if (!key) return undefined;
  const teaser = get<ArticleTeaser & { lang: string }>(
    `SELECT a.path, a.lang, a.title, a.reading_minutes, i.url,
            coalesce(a.featured_image_alt, i.alt) AS alt
       FROM article a LEFT JOIN image i ON i.id = a.featured_image_id
      WHERE a.translation_key = ? AND a.lang = ? AND a.is_published = 1`,
    key,
    TAG[locale]
  );
  return teaser && { teaser, href: articleHref(teaser.lang, teaser.path) };
}

export function categoryRouteParams(locale: Locale): { slug: string }[] {
  return categoryParams(locale).map((slug) => ({ slug }));
}

/**
 * product_category.seo_title and .meta_description are NULL for some English
 * rows (data/sql/products.sql), so both fall back. Translated rows always carry
 * both, led by the keyword_map term.
 */
export function categoryMetadata(locale: Locale, slug: string): Metadata {
  const category = getCategory(locale, slug);
  if (!category) return {};
  const c = t(locale).category;
  const title = category.seo_title ? { absolute: category.seo_title } : c.h1Fallback(category.name);
  return {
    title,
    description: category.meta_description ?? c.metaDescriptionFallback(category.name),
    alternates: { canonical: category.path, languages: hreflang(categoryEditions(category.id)) },
    openGraph: {
      title: category.seo_title ?? c.h1Fallback(category.name),
      description: category.meta_description ?? undefined,
      url: category.path,
      locale: OG_LOCALE[locale],
    },
  };
}

export function CategoryPage({ locale, slug }: { locale: Locale; slug: string }) {
  const category = getCategory(locale, slug);
  if (!category) notFound();

  const products = getCategoryProducts(category.id, locale);
  // Before buildFilters: it writes band membership back into each product's
  // `filters`, so the summary and the columns are read off the same array
  // either way, but the grid needs the mutated one.
  const summary = getRangeSummary(products, locale);
  const columns = getCompareColumns(products);
  const filters = buildFilters(products, getCollections(category.id), locale);
  const guide = guideFor(locale, category.slug);

  return (
    <CategoryView
      locale={locale}
      category={category}
      editions={categoryEditions(category.id)}
      products={products}
      filters={filters}
      summary={summary}
      columns={columns}
      signature={
        category.signature_product_id
          ? getSignature(category.signature_product_id, locale)
          : undefined
      }
      guides={getGuides(category.id, locale)}
      reasons={getReasons(category.id, locale)}
      faqs={getFaqs(category.id, locale)}
      // All ten the widget rotates. The rail is scrollable, so there is no
      // reason to hold seven of them back.
      reviews={getReviews(10)}
      regions={getRegions()}
      guideArticle={guide?.teaser}
      guideHref={guide?.href}
    />
  );
}
