import { all } from "@/lib/db";

/**
 * The homepage sells a kitchen, not a spec sheet. Nothing here returns a
 * measured value: a buyer picking a hood wants to see the hood, read one
 * sentence about it and know someone nearby fits it. The extraction figures
 * still exist and still matter, but they belong on the category and product
 * pages, where somebody has already decided what they are shopping for.
 */

/** A category as the homepage shows it: a picture, a sentence, and a count. */
export type CategoryCard = {
  slug: string;
  name: string;
  /** The category page's own intro. One sentence, written for buyers. */
  intro: string | null;
  model_count: number;
  url: string | null;
  alt: string | null;
};

export type Bestseller = {
  slug: string;
  name: string;
  model_code: string;
  series: string | null;
  /** Category name, e.g. "Kitchen Hood". None of these four products carries an
   *  intro_md, so this is the only real description the showcase can show. */
  category: string;
  url: string | null;
  alt: string | null;
};

export type ArticleTeaser = {
  path: string;
  title: string;
  reading_minutes: number | null;
  url: string | null;
  alt: string | null;
};

export type Region = { slug: string; region: string; count: number };

/**
 * The five categories, each fronted by its lowest-sorted published product.
 * That product's hero shot is the category's face on the homepage — the
 * `product_category` table carries no image of its own, and picking by
 * sort_order keeps the choice stable across rebuilds rather than letting
 * SQLite hand back an arbitrary group member.
 */
export function getCategoryCards(): CategoryCard[] {
  return all<CategoryCard>(
    `SELECT c.slug, c.name, c.intro_md AS intro,
            count(p.id) AS model_count,
            i.url, i.alt
       FROM product_category c
       LEFT JOIN product p ON p.category_id = c.id AND p.is_published = 1
       LEFT JOIN image i ON i.id = (
              SELECT f.hero_image_id
                FROM product f
               WHERE f.category_id = c.id AND f.is_published = 1
                 AND f.hero_image_id IS NOT NULL
               ORDER BY f.sort_order, f.id
               LIMIT 1)
      GROUP BY c.id
      ORDER BY c.sort_order`
  );
}

/**
 * The four models the source homepage promotes. Editorial, not derived — there
 * is no sales data in the DB and inventing a "popular" sort would be a lie.
 */
export function getBestsellers(slugs: string[]): Bestseller[] {
  const holes = slugs.map(() => "?").join(",");
  const rows = all<Bestseller>(
    `SELECT p.slug, p.name, p.model_code, p.series, c.name AS category, i.url, i.alt
       FROM product p
       JOIN product_category c ON c.id = p.category_id
       LEFT JOIN image i ON i.id = p.hero_image_id
      WHERE p.slug IN (${holes}) AND p.is_published = 1`,
    ...slugs
  );
  // Keep the caller's order — the source homepage's, not the DB's.
  return slugs.flatMap((slug) => rows.filter((r) => r.slug === slug));
}

/** One product by slug. The hero tile names the model it shows. */
export function getProductCard(slug: string): Bestseller | undefined {
  return getBestsellers([slug])[0];
}

/**
 * Named articles, in the order asked for. Recency alone picks badly for the
 * buying guides — the three newest are two halves of one induction-vs-ceramic
 * comparison plus a water filter piece, which reads as a thin catalogue rather
 * than the 25 guides that are actually there.
 */
export function getArticlesByPath(paths: string[]): ArticleTeaser[] {
  const holes = paths.map(() => "?").join(",");
  const rows = all<ArticleTeaser>(
    `SELECT a.path, a.title, a.reading_minutes, i.url, i.alt
       FROM article a
       LEFT JOIN image i ON i.id = a.featured_image_id
      WHERE a.path IN (${holes}) AND a.is_published = 1`,
    ...paths
  );
  return paths.flatMap((p) => rows.filter((r) => r.path === p));
}

/**
 * Newest articles in one section. The homepage links out to 105 posts that
 * currently have no route in from the front page at all.
 */
export function getArticleTeasers(section: string, limit: number): ArticleTeaser[] {
  return all<ArticleTeaser>(
    `SELECT a.path, a.title, a.reading_minutes, i.url, i.alt
       FROM article a
       LEFT JOIN image i ON i.id = a.featured_image_id
      WHERE a.section = ? AND a.is_published = 1
      ORDER BY a.published_at DESC
      LIMIT ?`,
    section,
    limit
  );
}

/**
 * Dealer count per region, largest first. The stored labels end in "Malaysia"
 * ("Klang Valley Malaysia") because WordPress used them as standalone archive
 * titles; on a Malaysian site's homepage that word is noise in every row.
 * Sabah & Sarawak carries no suffix, which `replace` leaves alone.
 */
export function getRegions(): Region[] {
  return all<Region>(
    `SELECT region_slug AS slug, replace(region, ' Malaysia', '') AS region, count(*) AS count
       FROM store
      GROUP BY region_slug
      ORDER BY count DESC`
  );
}
