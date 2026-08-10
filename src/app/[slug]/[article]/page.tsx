import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";
import { notFound } from "next/navigation";

import { SiteHeader } from "@/components/SiteHeader";
import { Markdown } from "@/lib/markdown";
import {
  articlePaths,
  getArticle,
  getArticleImageSizes,
  getMoreFromSection,
  getSectionName,
  type Article,
  type ArticleCard,
} from "@/lib/queries/article";
import { getRecipes, type Recipe } from "@/lib/queries/recipe";
import { formatDate } from "@/lib/site";

/**
 * The 106 editorial URLs: /buying-guide/…/, /tips-tricks/…/, /recipe/…/ and the
 * single /uncategorized/induction-vs-ceramic-guide/.
 *
 * The outer segment is named `[slug]` because it has to be — it is the same
 * level as app/[slug]/page.tsx (39 products + 5 categories) and Next.js allows
 * only one dynamic name per level. Here it holds the section. Paths come
 * straight off `article.path`, the stored canonical, split on its one slash;
 * nothing is rebuilt from section + slug.
 *
 * Articles are NOT resolved in the root route: they live one level down, so the
 * root resolver keeps its two lookups and this route never sees a product slug.
 */
export function generateStaticParams() {
  return articlePaths().map((a) => ({ slug: a.section, article: a.slug }));
}

type Params = { params: Promise<{ slug: string; article: string }> };

export async function generateMetadata({ params }: Params): Promise<Metadata> {
  const { slug, article: leaf } = await params;
  const article = getArticle(`${slug}/${leaf}`);
  if (!article) return {};

  return {
    // absolute: `title` is the legacy <title> these pages already rank on, and
    // the layout template would append "| VATTI Malaysia" to every one of them.
    title: { absolute: article.title },
    description: article.meta_description ?? undefined,
    alternates: { canonical: `/${article.path}/` },
    openGraph: {
      type: "article",
      title: article.title,
      description: article.meta_description ?? undefined,
      url: `/${article.path}/`,
      publishedTime: article.published_at,
      modifiedTime: article.modified_at ?? undefined,
      images: article.hero_url ? [{ url: article.hero_url }] : undefined,
    },
  };
}

export default async function Page({ params }: Params) {
  const { slug, article: leaf } = await params;
  const article = getArticle(`${slug}/${leaf}`);
  if (!article) notFound();

  // The recipe card's '### Note' is stored on every recipe that had one, but on
  // 3 of the 15 the same sentence is also a "Note:" line in the article's own
  // prose (spicy-enoki, avocado-tacos, sweet-potato-hash) — that copy is the
  // author's, not the stripped card's, so it stays and the block below stands
  // down. Printing the recipe twice is the bug the card strip exists to prevent.
  const recipes = getRecipes(article.id).map((r) =>
    r.notes && flatten(article.body_md).includes(flatten(r.notes)) ? { ...r, notes: null } : r
  );
  const more = getMoreFromSection(article.section, article.path);
  const sizes = Object.fromEntries(
    getArticleImageSizes(article.id)
      .filter((s) => s.width && s.height)
      .map((s) => [s.url, { width: s.width!, height: s.height! }])
  );

  return (
    <>
      <SiteHeader />

      {/* The reading surface. Product and category run on the dark chassis; 900
          words of grease-filter maintenance do not. See DESIGN.md § Direction. */}
      <main id="main" className="bg-paper text-paper-ink">
        <article className="mx-auto max-w-3xl px-5 py-10 sm:px-8 sm:py-16">
          <nav aria-label="Breadcrumb" className="text-sm">
            <ol className="flex flex-wrap items-center gap-2 text-paper-muted">
              <li>
                <Link href="/" className="transition-colors hover:text-paper-ink">
                  Home
                </Link>
              </li>
              <li aria-hidden="true">/</li>
              <li>
                <Link
                  href={`/category/${article.section}/`}
                  className="transition-colors hover:text-paper-ink"
                >
                  {getSectionName(article.section)}
                </Link>
              </li>
            </ol>
          </nav>

          <h1 className="mt-6 text-balance text-[clamp(1.875rem,1.2rem+2.4vw,3rem)] font-semibold leading-[1.08] tracking-[-0.035em]">
            {article.h1 ?? article.title}
          </h1>

          <p className="mt-5 flex flex-wrap items-center gap-x-3 gap-y-1 text-sm text-paper-muted">
            <time className="readout" dateTime={article.published_at.slice(0, 10)}>
              {formatDate(article.published_at)}
            </time>
            {article.reading_minutes && (
              <>
                <span aria-hidden="true">·</span>
                <span>
                  <span className="readout">{article.reading_minutes}</span> min read
                </span>
              </>
            )}
            {recipes.length > 0 && (
              <>
                <span aria-hidden="true">·</span>
                <a href="#recipe" className="font-medium text-teal underline-offset-[3px] hover:underline">
                  Jump to recipe
                </a>
              </>
            )}
          </p>

          {article.hero_url && (
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

          {recipes.length > 0 && <RecipeSummary recipes={recipes} />}

          <div className="mt-6 text-[1.0625rem]">
            <Markdown md={article.body_md} sizes={sizes} />
          </div>

          {recipes.map((recipe) => (
            <RecipeCard key={recipe.id} recipe={recipe} />
          ))}
        </article>

        {more.length > 0 && (
          <section
            aria-labelledby="more-heading"
            className="border-t border-paper-line bg-paper-surface"
          >
            <div className="mx-auto max-w-5xl px-5 py-14 sm:px-8 sm:py-16">
              <div className="flex flex-wrap items-baseline justify-between gap-4">
                <h2 id="more-heading" className="text-2xl font-semibold tracking-[-0.03em]">
                  More {getSectionName(article.section)}
                </h2>
                <Link
                  href={`/category/${article.section}/`}
                  className="text-sm font-medium text-teal underline-offset-[3px] hover:underline"
                >
                  See all
                </Link>
              </div>
              <ul className="mt-8 grid gap-5 [grid-template-columns:repeat(auto-fit,minmax(240px,1fr))]">
                {more.map((m) => (
                  <li key={m.path}>
                    <MoreCard article={m} />
                  </li>
                ))}
              </ul>
            </div>
          </section>
        )}
      </main>
    </>
  );
}

/** Comparison form: the scrape's curly apostrophes and the card's straight ones
 *  are the same character to a reader, and only the wording has to match. */
const flatten = (s: string) =>
  s.replace(/[‘’]/g, "'").replace(/\s+/g, " ").trim().toLowerCase();

/** Prep/cook/yield/calories, promoted out of the prose to sit under the title. */
function RecipeSummary({ recipes }: { recipes: Recipe[] }) {
  const facts = recipes.flatMap((r) =>
    [
      r.prep_minutes && { label: "Prep", value: String(r.prep_minutes), unit: "min" },
      r.cook_minutes && { label: "Cook", value: String(r.cook_minutes), unit: "min" },
      r.total_minutes && { label: "Total", value: String(r.total_minutes), unit: "min" },
      r.yield_qty && { label: "Serves", value: r.yield_qty, unit: "" },
      r.calories && { label: "Energy", value: r.calories.replace(/\s*kcal$/i, ""), unit: "kcal" },
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
function RecipeCard({ recipe }: { recipe: Recipe }) {
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
              Ingredients
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
              Method
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
            Note
          </h3>
          <p className="mt-3 max-w-[62ch] leading-relaxed">{recipe.notes}</p>
        </div>
      )}
    </section>
  );
}

function MoreCard({ article }: { article: ArticleCard }) {
  return (
    <Link
      href={`/${article.path}/`}
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
        {formatDate(article.published_at)}
      </p>
    </Link>
  );
}
