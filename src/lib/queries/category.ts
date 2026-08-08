import { all, get } from "@/lib/db";
import type { Facet } from "@/lib/queries/product";

export type Category = {
  id: number;
  slug: string;
  name: string;
  h1: string | null;
  seo_title: string | null;
  meta_description: string | null;
  intro_md: string | null;
};

export type CategoryProduct = {
  slug: string;
  name: string;
  model_code: string;
  secondary_model: string | null;
  series: string | null;
  url: string | null;
  alt: string | null;
  facets: Facet[];
};

/**
 * The 5 live category pages. The six plain slugs (/kitchen-hood/, /cooker-hob/,
 * /built-in-oven/, /steamer-combi-oven/, /dishwasher/, /one-tap-purifier/) are
 * NOT pages — the live site 301s all six to their "-in-malaysia" twin (probed
 * in research/url-inventory.json, status 301 → final 200) and all six are
 * already rows in the `redirect` table. See REBUILD-PLAN § "Category pages are
 * already consolidated". Two of them collapse onto one page, which is why six
 * legacy paths map to five categories.
 */
export function categorySlugs(): string[] {
  return all<{ slug: string }>(
    `SELECT slug FROM product_category ORDER BY sort_order`
  ).map((r) => r.slug);
}

export function getCategory(slug: string): Category | undefined {
  return get<Category>(
    `SELECT id, slug, name, h1, seo_title, meta_description, intro_md
       FROM product_category WHERE slug = ?`,
    slug
  );
}

export function getCategoryProducts(categoryId: number): CategoryProduct[] {
  const rows = all<Omit<CategoryProduct, "facets"> & { id: number }>(
    `SELECT p.id, p.slug, p.name, p.model_code, p.secondary_model, p.series, i.url, i.alt
       FROM product p
       LEFT JOIN image i ON i.id = p.hero_image_id
      WHERE p.category_id = ? AND p.is_published = 1
      ORDER BY p.sort_order`,
    categoryId
  );
  if (rows.length === 0) return [];

  // One query for every product's facets rather than one per card — the hood
  // page renders 16 of them.
  const facets = all<Facet & { product_id: number }>(
    `SELECT product_id, facet, value, unit, label
       FROM product_facet
      WHERE product_id IN (${rows.map(() => "?").join(",")})
      ORDER BY position`,
    ...rows.map((r) => r.id)
  );

  return rows.map(({ id, ...r }) => ({
    ...r,
    facets: facets.filter((f) => f.product_id === id),
  }));
}
