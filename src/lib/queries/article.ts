import { all, get } from "@/lib/db";

export type Article = {
  id: number;
  slug: string;
  path: string;
  section: string;
  title: string;
  h1: string | null;
  meta_description: string | null;
  body_md: string;
  word_count: number;
  reading_minutes: number | null;
  published_at: string;
  modified_at: string | null;
  hero_url: string | null;
  hero_alt: string | null;
  hero_width: number | null;
  hero_height: number | null;
};

export type ArticleCard = {
  path: string;
  title: string;
  meta_description: string | null;
  published_at: string;
  reading_minutes: number | null;
  url: string | null;
  alt: string | null;
};

export type Archive = {
  slug: string;
  name: string;
  total: number;
  pages: number;
  /** Newest member article's modified/published date — the archive's own lastmod. */
  last_modified: string | null;
};

/**
 * Eight, and it is not a preference — it is the number that reproduces the live
 * page counts. Probed on the WordPress site: /category/tips-tricks/ has 7 pages,
 * buying-guide 5, recipe 4, uncategorized 1. Against the membership rule below
 * (54 / 36 / 27 / 1 articles) only 8 per page yields 7/5/4/1; 9 collapses
 * tips-tricks to 6 pages and 7 stretches it to 8. Those /page/N/ URLs are
 * indexed, so this constant is part of the URL contract.
 */
export const PER_PAGE = 8;

/**
 * What /category/<slug>/ lists. An article belongs to the archive if WordPress
 * files it there (`article_category`) OR if it sits under that URL section.
 *
 * Both halves are load-bearing. The category half picks up the 10 posts living
 * under /tips-tricks/ that WordPress files as Buying Guide — dropping them puts
 * buying-guide at 26 articles and 4 pages, one short of the live count. The
 * section half is the only thing that finds the single /uncategorized/ post,
 * which has no `blog_category` row of its own (it is filed under Buying Guide)
 * yet still has a live /category/uncategorized/ archive.
 *
 * For the three real categories the section half is a subset of the category
 * half, so the OR changes nothing there.
 */
const MEMBERSHIP = `a.is_published = 1
   AND (a.section = ?
        OR a.id IN (SELECT ac.article_id
                      FROM article_category ac
                      JOIN blog_category bc ON bc.id = ac.category_id
                     WHERE bc.slug = ?))`;

/** Same rule, correlated to the `arc` CTE below instead of bound parameters. */
const ARC_MEMBERSHIP = `a.is_published = 1
   AND (a.section = arc.slug
        OR a.id IN (SELECT ac.article_id
                      FROM article_category ac
                      JOIN blog_category bc ON bc.id = ac.category_id
                     WHERE bc.slug = arc.slug))`;

/** The 106 article routes, split off `article.path` — the stored canonical. */
export function articlePaths(): { section: string; slug: string }[] {
  return all<{ path: string }>(
    `SELECT path FROM article WHERE is_published = 1 ORDER BY path`
  ).map((r) => {
    const cut = r.path.indexOf("/");
    return { section: r.path.slice(0, cut), slug: r.path.slice(cut + 1) };
  });
}

/** The same 106 paths with their real dates, for the sitemap's lastmod. */
export function articleDates(): { path: string; last_modified: string }[] {
  return all<{ path: string; last_modified: string }>(
    `SELECT path, coalesce(modified_at, published_at) AS last_modified
       FROM article WHERE is_published = 1 ORDER BY path`
  );
}

/** Keyed on the full stored path, never rebuilt from section + slug. */
export function getArticle(path: string): Article | undefined {
  return get<Article>(
    `SELECT a.id, a.slug, a.path, a.section, a.title, a.h1, a.meta_description,
            a.body_md, a.word_count, a.reading_minutes, a.published_at, a.modified_at,
            i.url AS hero_url, i.alt AS hero_alt,
            i.width AS hero_width, i.height AS hero_height
       FROM article a
       LEFT JOIN image i ON i.id = a.featured_image_id
      WHERE a.path = ? AND a.is_published = 1`,
    path
  );
}

/**
 * Dimensions for the images placed in the body, so the renderer can reserve the
 * real box instead of a nominal one. The importer reads them out of the
 * old-media file headers; without them all 221 placements shift on load.
 */
export function getArticleImageSizes(
  articleId: number
): { url: string; width: number | null; height: number | null }[] {
  return all<{ url: string; width: number | null; height: number | null }>(
    `SELECT i.url, i.width, i.height
       FROM article_image ai
       JOIN image i ON i.id = ai.image_id
      WHERE ai.article_id = ?`,
    articleId
  );
}

/** The editorial category to name in a breadcrumb — the URL's, not WordPress's. */
export function getSectionName(section: string): string {
  return (
    get<{ name: string }>(`SELECT name FROM blog_category WHERE slug = ?`, section)?.name ??
    "Blog"
  );
}

/**
 * Four archives, not three. `blog_category` holds the three the footer links to;
 * /category/uncategorized/ is a fourth live WordPress archive with one post in
 * it and no category row, so it is unioned in rather than invented as a special
 * case at the route.
 */
export function archives(): Archive[] {
  const rows = all<{ slug: string; name: string; total: number; last_modified: string | null }>(
    `WITH arc(slug, name, sort_order) AS (
       SELECT slug, name, sort_order FROM blog_category
       UNION ALL
       SELECT 'uncategorized', 'Uncategorized', 99
        WHERE EXISTS (SELECT 1 FROM article WHERE section = 'uncategorized' AND is_published = 1)
     )
     SELECT arc.slug, arc.name,
            (SELECT count(*) FROM article a WHERE ${ARC_MEMBERSHIP}) AS total,
            -- Every date is stored with the same +08:00 offset, so max() over the
            -- raw strings is chronological.
            (SELECT max(coalesce(a.modified_at, a.published_at))
               FROM article a WHERE ${ARC_MEMBERSHIP}) AS last_modified
       FROM arc
      ORDER BY arc.sort_order`
  );
  return rows.map((r) => ({ ...r, pages: Math.max(1, Math.ceil(r.total / PER_PAGE)) }));
}

export function getArchive(slug: string): Archive | undefined {
  return archives().find((a) => a.slug === slug);
}

/** `page` is 1-based: page 1 is /category/<slug>/, the rest /category/<slug>/page/N/. */
export function getArchiveArticles(slug: string, page: number): ArticleCard[] {
  return all<ArticleCard>(
    `SELECT a.path, a.title, a.meta_description, a.published_at, a.reading_minutes,
            i.url, i.alt
       FROM article a
       LEFT JOIN image i ON i.id = a.featured_image_id
      WHERE ${MEMBERSHIP}
      ORDER BY a.published_at DESC, a.id DESC
      LIMIT ? OFFSET ?`,
    slug,
    slug,
    PER_PAGE,
    (page - 1) * PER_PAGE
  );
}

/** Sidebar/footer reading list on an article page. Same archive, minus itself. */
export function getMoreFromSection(section: string, excludePath: string): ArticleCard[] {
  return all<ArticleCard>(
    `SELECT a.path, a.title, a.meta_description, a.published_at, a.reading_minutes,
            i.url, i.alt
       FROM article a
       LEFT JOIN image i ON i.id = a.featured_image_id
      WHERE a.is_published = 1 AND a.section = ? AND a.path <> ?
      ORDER BY a.published_at DESC
      LIMIT 3`,
    section,
    excludePath
  );
}
