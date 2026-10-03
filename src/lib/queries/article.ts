import { all, get } from "@/lib/db";
import { TAG, localeFromTag, prefix, type Locale } from "@/i18n/config";
import type { CalloutArticle } from "@/lib/markdown";

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
  /**
   * 'Vatti Malaysia' on 75 of the 105 published posts and NULL on the rest —
   * WordPress never carried a byline for them. The schema falls back to the
   * organisation, which is what an unsigned company post is.
   */
  author: string | null;
  /** BCP 47 tag of the edition: 'en-MY', 'ms-MY' or 'zh-MY'. */
  lang: string;
  translation_key: string | null;
  hero_url: string | null;
  hero_alt: string | null;
  hero_width: number | null;
  hero_height: number | null;
};

export type ArticleCard = {
  path: string;
  /** The URL, prefix and slashes included: '/ms/panduan-membeli/hood-dapur/'. */
  href: string;
  lang: string;
  title: string;
  meta_description: string | null;
  published_at: string;
  reading_minutes: number | null;
  url: string | null;
  alt: string | null;
};

export type Archive = {
  /** The section id, the archive's identity: 'buying-guide'. */
  section: string;
  /** Its URL segment in this edition: 'panduan-membeli' in Malay. */
  slug: string;
  name: string;
  total: number;
  pages: number;
  /** Newest member article's modified/published date — the archive's own lastmod. */
  last_modified: string | null;
};

/** '/ms/panduan-membeli/hood-dapur/' from a row's lang and language-free path. */
export function articleHref(lang: string, path: string): string {
  return `${prefix(localeFromTag(lang))}/${path}/`;
}

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
 *
 * Every archive is one edition's: the `lang` filter is what keeps the English
 * page counts on their legacy numbers once Malay and Chinese posts exist.
 */
const MEMBERSHIP = `a.is_published = 1 AND a.lang = ?
   AND (a.section = ?
        OR a.id IN (SELECT ac.article_id
                      FROM article_category ac
                      JOIN blog_category bc ON bc.id = ac.category_id
                     WHERE bc.slug = ?))`;

/** Same rule, correlated to the `arc` CTE below instead of bound parameters. */
const ARC_MEMBERSHIP = `a.is_published = 1 AND a.lang = arc.lang
   AND (a.section = arc.section
        OR a.id IN (SELECT ac.article_id
                      FROM article_category ac
                      JOIN blog_category bc ON bc.id = ac.category_id
                     WHERE bc.slug = arc.section))`;

/** One edition's article routes, split off `article.path` — the stored canonical. */
export function articlePaths(locale: Locale): { section: string; slug: string }[] {
  return all<{ path: string }>(
    `SELECT path FROM article WHERE is_published = 1 AND lang = ? ORDER BY path`,
    TAG[locale]
  ).map((r) => {
    const cut = r.path.indexOf("/");
    return { section: r.path.slice(0, cut), slug: r.path.slice(cut + 1) };
  });
}

/** Every edition's articles with their real dates, for the sitemap. */
export function articleDates(): {
  href: string;
  lang: string;
  translation_key: string | null;
  last_modified: string;
}[] {
  return all<{ path: string; lang: string; translation_key: string | null; last_modified: string }>(
    `SELECT path, lang, translation_key, coalesce(modified_at, published_at) AS last_modified
       FROM article WHERE is_published = 1 ORDER BY lang, path`
  ).map(({ path, ...r }) => ({ ...r, href: articleHref(r.lang, path) }));
}

/** Keyed on the edition and the full stored path, never rebuilt from section + slug. */
export function getArticle(locale: Locale, path: string): Article | undefined {
  return get<Article>(
    `SELECT a.id, a.slug, a.path, a.section, a.title, a.h1, a.meta_description,
            a.body_md, a.word_count, a.reading_minutes, a.published_at, a.modified_at,
            a.author, a.lang, a.translation_key,
            i.url AS hero_url, coalesce(a.featured_image_alt, i.alt) AS hero_alt,
            i.width AS hero_width, i.height AS hero_height
       FROM article a
       LEFT JOIN image i ON i.id = a.featured_image_id
      WHERE a.lang = ? AND a.path = ? AND a.is_published = 1`,
    TAG[locale],
    path
  );
}

/** Every published edition of one piece, for hreflang and the language switcher. */
export function articleEditions(translationKey: string | null): { lang: string; href: string }[] {
  if (!translationKey) return [];
  return all<{ lang: string; path: string }>(
    `SELECT lang, path FROM article WHERE translation_key = ? AND is_published = 1`,
    translationKey
  ).map((r) => ({ lang: r.lang, href: articleHref(r.lang, r.path) }));
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

/**
 * A section's name and URL segment in one edition. English reads blog_category
 * (the scraped names); Malay and Chinese read section_i18n. 'uncategorized'
 * has no blog_category row, hence the literal.
 */
export function sectionInfo(section: string, locale: Locale): { slug: string; name: string } {
  if (locale === "en") {
    const name =
      get<{ name: string }>(`SELECT name FROM blog_category WHERE slug = ?`, section)?.name ??
      (section === "uncategorized" ? "Uncategorized" : "Blog");
    return { slug: section, name };
  }
  const row = get<{ slug: string; name: string }>(
    `SELECT slug, name FROM section_i18n WHERE section = ? AND lang = ?`,
    section,
    TAG[locale]
  );
  if (!row) throw new Error(`section_i18n has no ${TAG[locale]} row for ${section}`);
  return row;
}

/** The editorial category to name in a breadcrumb — the URL's, not WordPress's. */
export function getSectionName(section: string, locale: Locale = "en"): string {
  return sectionInfo(section, locale).name;
}

/**
 * One edition's archives. English has the three blog_category archives plus
 * /category/uncategorized/ while it holds a published post. Malay and Chinese
 * have an archive only for a section that holds at least one of their posts:
 * an empty archive would be a page of nothing.
 */
export function archives(locale: Locale): Archive[] {
  const rows = all<{ section: string; total: number; last_modified: string | null }>(
    `WITH arc(section, lang, sort_order) AS (
       SELECT slug, ?, sort_order FROM blog_category
       UNION ALL
       SELECT 'uncategorized', ?, 99
        WHERE EXISTS (SELECT 1 FROM article
                       WHERE section = 'uncategorized' AND is_published = 1 AND lang = ?)
     )
     SELECT arc.section,
            (SELECT count(*) FROM article a WHERE ${ARC_MEMBERSHIP}) AS total,
            -- Every date is stored with the same +08:00 offset, so max() over the
            -- raw strings is chronological.
            (SELECT max(coalesce(a.modified_at, a.published_at))
               FROM article a WHERE ${ARC_MEMBERSHIP}) AS last_modified
       FROM arc
      ORDER BY arc.sort_order`,
    TAG[locale],
    TAG[locale],
    TAG[locale]
  );
  return rows
    .filter((r) => locale === "en" || r.total > 0)
    .map((r) => ({
      ...r,
      ...sectionInfo(r.section, locale),
      pages: Math.max(1, Math.ceil(r.total / PER_PAGE)),
    }));
}

/** By the archive's URL segment in that edition. */
export function getArchive(locale: Locale, slug: string): Archive | undefined {
  return archives(locale).find((a) => a.slug === slug);
}

/** `page` is 1-based: page 1 is /category/<slug>/, the rest /category/<slug>/page/N/. */
export function getArchiveArticles(locale: Locale, section: string, page: number): ArticleCard[] {
  return cards(
    `SELECT a.path, a.lang, a.title, a.meta_description, a.published_at, a.reading_minutes,
            i.url, coalesce(a.featured_image_alt, i.alt) AS alt
       FROM article a
       LEFT JOIN image i ON i.id = a.featured_image_id
      WHERE ${MEMBERSHIP}
      ORDER BY a.published_at DESC, a.id DESC
      LIMIT ? OFFSET ?`,
    TAG[locale],
    section,
    section,
    PER_PAGE,
    (page - 1) * PER_PAGE
  );
}

function cards(sql: string, ...params: (string | number)[]): ArticleCard[] {
  return all<Omit<ArticleCard, "href">>(sql, ...params).map((r) => ({
    ...r,
    href: articleHref(r.lang, r.path),
  }));
}

/**
 * Every published article by its URL (no surrounding slashes:
 * 'tips-tricks/what-is-auto-clean', 'ms/panduan-membeli/hood-dapur'), for the
 * pointer cards `Markdown` renders when a body link to a sibling guide stands
 * alone on its line. One query per page build rather than one per link.
 * Each card names its section in the card's own language.
 */
export function articleCallouts(): Record<string, CalloutArticle> {
  const rows = all<{
    path: string;
    lang: string;
    title: string;
    section: string;
    reading_minutes: number | null;
    url: string | null;
    alt: string | null;
  }>(
    `SELECT a.path, a.lang, a.title, a.section, a.reading_minutes, i.url,
            coalesce(a.featured_image_alt, i.alt) AS alt
       FROM article a
       LEFT JOIN image i ON i.id = a.featured_image_id
      WHERE a.is_published = 1`
  );
  const names = new Map<string, string>();
  const nameOf = (section: string, lang: string) => {
    const k = `${lang}|${section}`;
    if (!names.has(k)) names.set(k, getSectionName(section, localeFromTag(lang)));
    return names.get(k)!;
  };
  return Object.fromEntries(
    rows.map(({ section, ...r }) => {
      const href = articleHref(r.lang, r.path);
      return [
        href.replace(/^\/|\/$/g, ""),
        { ...r, path: href.replace(/^\/|\/$/g, ""), section_name: nameOf(section, r.lang) },
      ];
    })
  );
}

/**
 * Reading list on an article page: the same section, the same edition, minus
 * itself. Same-edition because newest-first would otherwise put the Malay
 * guides at the top of every English buying guide's "More" row.
 */
export function getMoreFromSection(section: string, excludeId: number, lang: string): ArticleCard[] {
  return cards(
    `SELECT a.path, a.lang, a.title, a.meta_description, a.published_at, a.reading_minutes,
            i.url, coalesce(a.featured_image_alt, i.alt) AS alt
       FROM article a
       LEFT JOIN image i ON i.id = a.featured_image_id
      WHERE a.is_published = 1 AND a.section = ? AND a.id <> ? AND a.lang = ?
      ORDER BY a.published_at DESC
      LIMIT 3`,
    section,
    excludeId,
    lang
  );
}
