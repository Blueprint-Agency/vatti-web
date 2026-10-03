import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";
import { notFound } from "next/navigation";

import { CtaBar } from "@/components/CtaBar";
import { SiteHeader, type Editions } from "@/components/SiteHeader";
import { OG_LOCALE, localeFromTag, t as dict, type Dict, type Locale } from "@/i18n";
import { hreflang } from "@/lib/alternates";
import { SITE_ORIGIN } from "@/lib/deployment";
import { Markdown } from "@/lib/markdown";
import {
  articleCallouts,
  articleEditions,
  articleHref,
  articlePaths,
  getArticle,
  getArticleImageSizes,
  getMoreFromSection,
  getSectionName,
  type Article,
  type ArticleCard,
} from "@/lib/queries/article";
import { categoryNames } from "@/lib/queries/category";
import { productNames } from "@/lib/queries/product";
import { getRecipes, type Recipe } from "@/lib/queries/recipe";
import { archiveHref, homeHref } from "@/lib/routes";
import { formatDate } from "@/lib/site";

/**
 * An article page, in any edition. The route files are thin: English at
 * src/app/(en)/[slug]/[article]/page.tsx serves the 106 legacy editorial URLs
 * (/buying-guide/…/, /tips-tricks/…/, /recipe/…/ and the single
 * /uncategorized/induction-vs-ceramic-guide/); Malay and Chinese mirror it
 * under (ms)/ms and (zh)/zh.
 *
 * The outer segment is named `[slug]` because it has to be — it is the same
 * level as app/(en)/[slug]/page.tsx (products + categories) and Next.js allows
 * only one dynamic name per level. Here it holds the section's URL segment,
 * which is localised in Malay ('panduan-membeli'). Paths come straight off
 * `article.path`, the stored canonical, split on its one slash; nothing is
 * rebuilt from section + slug.
 */
export function articleParams(locale: Locale) {
  return articlePaths(locale).map((a) => ({ slug: a.section, article: a.slug }));
}

/** This piece's URL in every edition it is published in, its own included. */
function editionsOf(article: Article): Editions {
  const editions: Editions = Object.fromEntries(
    articleEditions(article.translation_key).map((e) => [localeFromTag(e.lang), e.href])
  );
  editions[localeFromTag(article.lang)] = articleHref(article.lang, article.path);
  return editions;
}

export function articleMetadata(locale: Locale, segment: string, leaf: string): Metadata {
  const article = getArticle(locale, `${segment}/${leaf}`);
  if (!article) return {};
  const href = articleHref(article.lang, article.path);

  return {
    // absolute: `title` is the legacy <title> these pages already rank on, and
    // the layout template would append "| VATTI Malaysia" to every one of them.
    title: { absolute: article.title },
    description: article.meta_description ?? undefined,
    alternates: { canonical: href, languages: hreflang(editionsOf(article)) },
    openGraph: {
      type: "article",
      title: article.title,
      description: article.meta_description ?? undefined,
      url: href,
      publishedTime: article.published_at,
      modifiedTime: article.modified_at ?? undefined,
      images: article.hero_url ? [{ url: article.hero_url }] : undefined,
      locale: OG_LOCALE[locale],
    },
  };
}

export function ArticlePage({
  locale,
  segment,
  leaf,
}: {
  locale: Locale;
  segment: string;
  leaf: string;
}) {
  const article = getArticle(locale, `${segment}/${leaf}`);
  if (!article) notFound();

  // The recipe card's '### Note' is stored on every recipe that had one, but on
  // 3 of the 15 the same sentence is also a "Note:" line in the article's own
  // prose (spicy-enoki, avocado-tacos, sweet-potato-hash) — that copy is the
  // author's, not the stripped card's, so it stays and the block below stands
  // down. Printing the recipe twice is the bug the card strip exists to prevent.
  const recipes = getRecipes(article.id).map((r) =>
    r.notes && flatten(article.body_md).includes(flatten(r.notes)) ? { ...r, notes: null } : r
  );
  const more = getMoreFromSection(article.section, article.id, article.lang);
  const d = dict(locale);
  const t = labels(d, getSectionName(article.section, locale));
  const sectionHref = archiveHref(locale, article.section);
  const href = articleHref(article.lang, article.path);
  const editions = editionsOf(article);
  const { body, cover } = oneCover(article.body_md, article.hero_url);
  const sizes = Object.fromEntries(
    getArticleImageSizes(article.id)
      .filter((s) => s.width && s.height)
      .map((s) => [s.url, { width: s.width!, height: s.height! }])
  );
  // What a standalone body link may point at: a sibling guide (card) or a
  // product or category page (button). See Markdown's Callout.
  const callouts = {
    articles: articleCallouts(),
    pages: { ...categoryNames(), ...productNames() },
    labels: {
      related: d.article.related,
      minRead: d.article.minRead,
      readTheGuide: d.article.readTheGuide,
      explore: d.article.explore,
    },
  };

  return (
    <>
      <SiteHeader locale={locale} editions={editions} />

      {/* The reading surface. Product and category run on the dark chassis; 900
          words of grease-filter maintenance do not. See DESIGN.md § Direction. */}
      <main id="main" className="bg-paper text-paper-ink">
        <article lang={article.lang} className="mx-auto max-w-3xl px-5 py-10 sm:px-8 sm:py-16">
          <nav aria-label="Breadcrumb" className="text-sm">
            <ol className="flex flex-wrap items-center gap-2 text-paper-muted">
              <li>
                <Link href={homeHref(locale)} className="transition-colors hover:text-paper-ink">
                  {t.home}
                </Link>
              </li>
              <li aria-hidden="true">/</li>
              <li>
                <Link
                  href={sectionHref}
                  className="transition-colors hover:text-paper-ink"
                >
                  {t.section}
                </Link>
              </li>
            </ol>
          </nav>

          <h1 className="mt-6 text-balance text-[clamp(1.875rem,1.2rem+2.4vw,3rem)] font-semibold leading-[1.08] tracking-[-0.035em]">
            {article.h1 ?? article.title}
          </h1>

          <p className="mt-5 flex flex-wrap items-center gap-x-3 gap-y-1 text-sm text-paper-muted">
            <time className="readout" dateTime={article.published_at.slice(0, 10)}>
              {formatDate(article.published_at, article.lang)}
            </time>
            {article.reading_minutes && (
              <>
                <span aria-hidden="true">·</span>
                <span>
                  <span className="readout">{article.reading_minutes}</span> {t.minRead}
                </span>
              </>
            )}
            {recipes.length > 0 && (
              <>
                <span aria-hidden="true">·</span>
                <a href="#recipe" className="font-medium text-teal underline-offset-[3px] hover:underline">
                  {t.jumpToRecipe}
                </a>
              </>
            )}
          </p>

          {cover && article.hero_url && (
            <Image
              src={article.hero_url}
              alt={article.hero_alt ?? ""}
              width={article.hero_width ?? 1200}
              height={article.hero_height ?? 800}
              priority
              sizes="(max-width: 768px) 100vw, 720px"
              className="mt-8 h-auto w-full rounded-sm border border-paper-line"
            />
          )}

          {recipes.length > 0 && <RecipeSummary recipes={recipes} labels={d.article.recipe} />}

          <div className="mt-6 text-[1.0625rem]">
            <Markdown md={body} sizes={sizes} callouts={callouts} />
          </div>

          {recipes.map((recipe) => (
            <RecipeCard key={recipe.id} recipe={recipe} labels={d.article.recipe} />
          ))}
        </article>

        {more.length > 0 && (
          <section
            aria-labelledby="more-heading"
            className="border-t border-paper-line bg-paper-surface"
          >
            <div className="mx-auto max-w-5xl px-5 py-14 sm:px-8 sm:py-16">
              <div className="flex flex-wrap items-baseline justify-between gap-4">
                <h2
                  id="more-heading"
                  lang={article.lang}
                  className="text-2xl font-semibold tracking-[-0.03em]"
                >
                  {t.more(t.section)}
                </h2>
                <Link
                  href={sectionHref}
                  className="text-sm font-medium text-teal underline-offset-[3px] hover:underline"
                >
                  {t.seeAll}
                </Link>
              </div>
              <ul className="mt-8 grid gap-5 [grid-template-columns:repeat(auto-fit,minmax(240px,1fr))]">
                {more.map((m) => (
                  <li key={m.path}>
                    <MoreCard article={m} lang={article.lang} />
                  </li>
                ))}
              </ul>
            </div>
          </section>
        )}
      </main>

      <CtaBar label={t.cta} lang={locale === "en" ? undefined : article.lang} />

      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(articleSchema(article, href, t.section)) }}
      />
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{
          __html: JSON.stringify(articleBreadcrumbSchema(article, href, t, homeHref(locale), sectionHref)),
        }}
      />
      {recipes.map((r) => (
        <script
          key={r.id}
          type="application/ld+json"
          dangerouslySetInnerHTML={{ __html: JSON.stringify(recipeSchema(r, article, href)) }}
        />
      ))}
    </>
  );
}

/** The words the page puts around an article, from the edition's dictionary. */
function labels(d: Dict, section: string) {
  return {
    home: d.nav.home,
    section,
    minRead: d.article.minRead,
    jumpToRecipe: d.article.jumpToRecipe,
    more: d.article.more,
    seeAll: d.article.seeAll,
    cta: d.cta.help,
  };
}

const SITE = SITE_ORIGIN;
const PUBLISHER = { "@type": "Organization", name: "VATTI Malaysia", url: `${SITE}/` };

/**
 * BlogPosting rather than Article: these are dated editorial posts under a blog
 * archive, which is the narrower and therefore more accurate type.
 *
 * `author` is the stored byline where WordPress carried one and the organisation
 * on the 30 posts where it did not. An unsigned company post is authored by the
 * company — inventing a person to fill the field would be worse than the
 * fallback, and omitting author loses the rich result.
 *
 * dateModified falls back to datePublished on the 3 posts with no modified_at.
 * Every published post has a hero image, so `image` is never empty; if that ever
 * stops being true the field drops rather than emitting null.
 */
function articleSchema(article: Article, href: string, sectionName: string) {
  return {
    "@context": "https://schema.org",
    "@type": "BlogPosting",
    headline: article.title,
    description: article.meta_description ?? undefined,
    url: `${SITE}${href}`,
    mainEntityOfPage: { "@type": "WebPage", "@id": `${SITE}${href}` },
    datePublished: article.published_at,
    dateModified: article.modified_at ?? article.published_at,
    author: article.author ? { "@type": "Organization", name: article.author } : PUBLISHER,
    publisher: PUBLISHER,
    image: article.hero_url ? [article.hero_url] : undefined,
    articleSection: sectionName,
    wordCount: article.word_count,
    inLanguage: article.lang,
  };
}

/** Mirrors the breadcrumb the reader can see at the top of the page. */
function articleBreadcrumbSchema(
  article: Article,
  href: string,
  t: ReturnType<typeof labels>,
  homePath: string,
  sectionPath: string
) {
  return {
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    itemListElement: [
      { "@type": "ListItem", position: 1, name: t.home, item: `${SITE}${homePath}` },
      {
        "@type": "ListItem",
        position: 2,
        name: t.section,
        item: `${SITE}${sectionPath}`,
      },
      {
        "@type": "ListItem",
        position: 3,
        name: article.title,
        item: `${SITE}${href}`,
      },
    ],
  };
}

/**
 * Only the 16 posts that carry a real single recipe get this — `getRecipes`
 * returns nothing for the 10 roundups that hold several recipes as prose, so
 * they emit no Recipe node rather than a wrong one describing only the first.
 *
 * Every field is a column that exists. There is no `nutrition` beyond calories
 * and no rating: recipe reviews are not collected, and `review` is about the
 * appliances' service, not the cooking.
 */
function recipeSchema(recipe: Recipe, article: Article, href: string) {
  // yield_label already carries the whole phrase — '2 servings', not 'servings'
  // — and yield_qty is the bare number it starts with. Joining them yields
  // "2 2 servings". The label is the one to print; the number is what the card
  // shows on its own under "Serves".
  const yieldText = recipe.yield_label ?? recipe.yield_qty ?? undefined;

  return {
    "@context": "https://schema.org",
    "@type": "Recipe",
    name: recipe.name,
    description: recipe.description ?? undefined,
    url: `${SITE}${href}`,
    inLanguage: article.lang,
    image: article.hero_url ? [article.hero_url] : undefined,
    datePublished: article.published_at,
    author: article.author ? { "@type": "Organization", name: article.author } : PUBLISHER,
    publisher: PUBLISHER,
    prepTime: minutesToIso(recipe.prep_minutes),
    cookTime: minutesToIso(recipe.cook_minutes),
    totalTime: minutesToIso(recipe.total_minutes),
    recipeYield: yieldText,
    recipeCuisine: recipe.cuisine ?? undefined,
    recipeCategory: recipe.meal_category ?? undefined,
    nutrition: recipe.calories
      ? { "@type": "NutritionInformation", calories: recipe.calories }
      : undefined,
    recipeIngredient: recipe.ingredients.length ? recipe.ingredients : undefined,
    recipeInstructions: recipe.steps.length
      ? recipe.steps.map((text, i) => ({ "@type": "HowToStep", position: i + 1, text }))
      : undefined,
  };
}

/** 25 -> 'PT25M'. NULL stays undefined so the field drops out of the JSON. */
function minutesToIso(minutes: number | null): string | undefined {
  return minutes ? `PT${minutes}M` : undefined;
}

/** Comparison form: the scrape's curly apostrophes and the card's straight ones
 *  are the same character to a reader, and only the wording has to match. */
const flatten = (s: string) =>
  s.replace(/[‘’]/g, "'").replace(/\s+/g, " ").trim().toLowerCase();

/**
 * The featured image is also placed in the body on 101 of the 105 articles —
 * WordPress stores the two independently and its editor pasted the same file in
 * again, so rendering both prints the cover twice down the whole blog.
 *
 * Which copy loses depends on what the body's copy is doing. On 97 it is the
 * body's opening image, sitting in the intro or just under the first heading:
 * the cover slot above owns that picture, so the body line goes. On the other
 * four (is-a-dishwasher-worth-it, what-is-not-dishwasher-safe and two of the
 * numbered recipe round-ups) the featured image is instead the figure for a
 * section much further down, one of nine or ten with a picture each — pulling
 * it would leave that one section bare, so the body keeps it and the cover slot
 * stands down. Either way the image appears once.
 *
 * `hero_url` still feeds the OG tag and the archive card in both cases; this
 * only decides where the picture is drawn on the page.
 */
function oneCover(md: string, hero: string | null): { body: string; cover: boolean } {
  if (!hero) return { body: md, cover: false };

  const lines = md.split("\n");
  const first = lines.findIndex((l) => IMAGE_LINE.test(l.trim()));
  if (first < 0 || !lines[first].includes(hero)) {
    return { body: md, cover: !md.includes(hero) };
  }

  lines.splice(first, 1);
  return { body: lines.join("\n"), cover: true };
}

/** A standalone image placement, the only form the corpus uses — see markdown.tsx. */
const IMAGE_LINE = /^!\[[^\]]*\]\([^)\s]+\)$/;

/** Prep/cook/yield/calories, promoted out of the prose to sit under the title. */
type RecipeLabels = Dict["article"]["recipe"];

function RecipeSummary({ recipes, labels }: { recipes: Recipe[]; labels: RecipeLabels }) {
  const facts = recipes.flatMap((r) =>
    [
      r.prep_minutes && { label: labels.prep, value: String(r.prep_minutes), unit: labels.min },
      r.cook_minutes && { label: labels.cook, value: String(r.cook_minutes), unit: labels.min },
      r.total_minutes && { label: labels.total, value: String(r.total_minutes), unit: labels.min },
      r.yield_qty && { label: labels.serves, value: r.yield_qty, unit: "" },
      r.calories && { label: labels.energy, value: r.calories.replace(/\s*kcal$/i, ""), unit: "kcal" },
    ].filter((f): f is { label: string; value: string; unit: string } => Boolean(f))
  );
  if (facts.length === 0) return null;

  return (
    <dl className="mt-8 flex flex-wrap gap-x-10 gap-y-4 rounded-sm border border-paper-line bg-paper-surface px-6 py-5">
      {facts.map((f) => (
        <div key={f.label}>
          <dt className="text-[0.625rem] uppercase tracking-[0.14em] text-paper-muted">
            {f.label}
          </dt>
          <dd className="readout mt-1 text-lg font-medium">
            {f.value}
            {f.unit && <span className="text-sm text-paper-muted"> {f.unit}</span>}
          </dd>
        </div>
      ))}
    </dl>
  );
}

/**
 * Ingredients and method as real lists off `recipe_ingredient` / `recipe_step`,
 * which is the whole point of storing them separately. The WordPress recipe-card
 * copy of the same content is stripped out of the body — see lib/markdown.tsx.
 */
function RecipeCard({ recipe, labels }: { recipe: Recipe; labels: RecipeLabels }) {
  if (recipe.ingredients.length === 0 && recipe.steps.length === 0) return null;

  return (
    <section
      id="recipe"
      aria-labelledby={`recipe-${recipe.id}`}
      className="mt-14 scroll-mt-20 rounded-sm border border-paper-line bg-paper-surface p-6 sm:p-8"
    >
      <h2 id={`recipe-${recipe.id}`} className="text-2xl font-semibold tracking-[-0.03em]">
        {recipe.name}
      </h2>

      {(recipe.cuisine || recipe.meal_category || recipe.yield_label) && (
        <p className="mt-2 text-sm text-paper-muted">
          {[recipe.cuisine, recipe.meal_category, recipe.yield_label].filter(Boolean).join(" · ")}
        </p>
      )}

      {recipe.description && (
        <p className="mt-4 max-w-[62ch] leading-relaxed text-paper-muted">{recipe.description}</p>
      )}

      <div className="mt-8 grid gap-10 sm:grid-cols-[minmax(0,1fr)_minmax(0,1.4fr)]">
        {recipe.ingredients.length > 0 && (
          <div>
            <h3 className="text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-paper-muted">
              {labels.ingredients}
            </h3>
            <ul className="mt-4 flex flex-col gap-2.5">
              {recipe.ingredients.map((text, i) => (
                <li key={i} className="flex gap-3 leading-snug">
                  <span
                    aria-hidden="true"
                    className="mt-[0.55em] size-1.5 shrink-0 rounded-full bg-teal"
                  />
                  {text}
                </li>
              ))}
            </ul>
          </div>
        )}

        {recipe.steps.length > 0 && (
          <div>
            <h3 className="text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-paper-muted">
              {labels.method}
            </h3>
            <ol className="mt-4 flex flex-col gap-4">
              {recipe.steps.map((text, i) => (
                <li key={i} className="flex gap-4 leading-relaxed">
                  <span aria-hidden="true" className="readout shrink-0 text-sm text-teal">
                    {String(i + 1).padStart(2, "0")}
                  </span>
                  {text}
                </li>
              ))}
            </ol>
          </div>
        )}
      </div>

      {/* The card's '### Note'. Same micro-label as Ingredients/Method, ruled
          off because it qualifies the method rather than continuing it. */}
      {recipe.notes && (
        <div className="mt-8 border-t border-paper-line pt-6">
          <h3 className="text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-paper-muted">
            {labels.note}
          </h3>
          <p className="mt-3 max-w-[62ch] leading-relaxed">{recipe.notes}</p>
        </div>
      )}
    </section>
  );
}

function MoreCard({ article, lang }: { article: ArticleCard; lang: string }) {
  return (
    <Link
      href={article.href}
      lang={lang}
      className="group flex h-full flex-col gap-4 rounded-sm border border-paper-line bg-paper p-4 transition-colors hover:border-paper-muted"
    >
      {article.url && (
        <div className="relative aspect-[3/2] overflow-hidden rounded-sm bg-paper-surface">
          <Image
            src={article.url}
            alt={article.alt ?? ""}
            fill
            loading="lazy"
            sizes="(max-width: 640px) 100vw, 280px"
            className="object-cover"
          />
        </div>
      )}
      <p className="font-medium leading-snug transition-colors group-hover:text-teal">
        {article.title}
      </p>
      <p className="readout mt-auto text-xs text-paper-muted">
        {formatDate(article.published_at, lang)}
      </p>
    </Link>
  );
}
