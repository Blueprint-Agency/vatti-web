import { all } from "@/lib/db";
import type { Facet } from "@/lib/queries/product";

export type Tick = { slug: string; model_code: string; value: number };

export type CategoryRow = {
  slug: string;
  name: string;
  model_count: number;
  /** null for the dishwasher — its source spec sheet carries no measured value. */
  range: { label: string; unit: string; lo: number; hi: number; rated: number } | null;
};

export type Bestseller = {
  slug: string;
  name: string;
  model_code: string;
  url: string | null;
  alt: string | null;
  facets: Facet[];
};

/**
 * The one figure that decides the purchase in each category. Five fixed
 * categories, so a map beats a "pick the most common facet" heuristic — four
 * hood facets tie at 15 rows and the tie-break would be arbitrary.
 */
const HEADLINE_FACET: Record<string, string> = {
  "kitchen-hood-in-malaysia": "airflow",
  "cooker-hob-in-malaysia": "power",
  "combi-and-steam-oven-in-malaysia": "capacity",
  "one-tap-purifier-in-malaysia": "flow",
};

export function getCategoryRows(): CategoryRow[] {
  const counts = all<{ slug: string; name: string; model_count: number }>(
    `SELECT c.slug, c.name, count(p.id) AS model_count
       FROM product_category c
       LEFT JOIN product p ON p.category_id = c.id AND p.is_published = 1
      GROUP BY c.id
      ORDER BY c.sort_order`
  );

  const ranges = all<{
    category_slug: string;
    facet: string;
    label: string;
    unit: string;
    rated: number;
    lo: number;
    hi: number;
  }>(
    `SELECT c.slug AS category_slug, f.facet, f.label, f.unit,
            count(*) AS rated, min(f.value) AS lo, max(f.value) AS hi
       FROM product_facet f
       JOIN product p ON p.id = f.product_id AND p.is_published = 1
       JOIN product_category c ON c.id = p.category_id
      GROUP BY c.slug, f.facet`
  );

  return counts.map((c) => {
    const r = ranges.find(
      (x) => x.category_slug === c.slug && x.facet === HEADLINE_FACET[c.slug]
    );
    return {
      ...c,
      range: r ? { label: r.label, unit: r.unit, lo: r.lo, hi: r.hi, rated: r.rated } : null,
    };
  });
}

/** Every model carrying `facet`, ascending — the plot points for ScaleAxis. */
export function getScale(facet: string): Tick[] {
  return all<Tick>(
    `SELECT p.slug, p.model_code, f.value
       FROM product_facet f
       JOIN product p ON p.id = f.product_id AND p.is_published = 1
      WHERE f.facet = ?
      ORDER BY f.value`,
    facet
  );
}

/**
 * The four models the source homepage promotes. Editorial, not derived — there
 * is no sales data in the DB and inventing a "popular" sort would be a lie.
 */
export function getBestsellers(slugs: string[]): Bestseller[] {
  const holes = slugs.map(() => "?").join(",");
  const rows = all<Omit<Bestseller, "facets"> & { id: number }>(
    `SELECT p.id, p.slug, p.name, p.model_code, i.url, i.alt
       FROM product p
       LEFT JOIN image i ON i.id = p.hero_image_id
      WHERE p.slug IN (${holes}) AND p.is_published = 1`,
    ...slugs
  );
  if (rows.length === 0) return [];

  const facets = all<Facet & { product_id: number }>(
    `SELECT product_id, facet, value, unit, label
       FROM product_facet
      WHERE product_id IN (${rows.map(() => "?").join(",")})
      ORDER BY position`,
    ...rows.map((r) => r.id)
  );

  // Keep the caller's order — the source homepage's, not the DB's.
  return slugs.flatMap((slug) => {
    const r = rows.find((x) => x.slug === slug);
    return r ? [{ ...r, facets: facets.filter((f) => f.product_id === r.id) }] : [];
  });
}
