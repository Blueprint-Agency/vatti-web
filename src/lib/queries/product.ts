import type { FitMetrics } from "@/components/FitCheck";
import { all, get } from "@/lib/db";

export type Facet = { facet: string; value: number; unit: string; label: string };
export type Spec = { spec_key: string | null; spec_value: string | null; raw_text: string };
export type ProductImage = {
  url: string;
  alt: string | null;
  width: number | null;
  height: number | null;
  role: string;
  caption_md: string | null;
};
export type Feature = {
  layout: "banner" | "split" | "card";
  title: string | null;
  body_md: string | null;
  image_url: string | null;
  image_alt: string | null;
  image_w: number | null;
  image_h: number | null;
};
export type Dimension = {
  section: "product" | "installation";
  label: string;
  value: string;
  note: string | null;
};
export type ProductFaq = { question: string; answer_md: string };
export type Video = {
  video_id: string;
  title: string | null;
  summary: string | null;
  published_on: string | null;
  duration_seconds: number | null;
};
export type Download = { label: string; url: string; kind: string };
export type RelatedProduct = {
  slug: string;
  name: string;
  model_code: string;
  url: string | null;
  alt: string | null;
};

export type Product = {
  id: number;
  slug: string;
  kind: string;
  model_code: string;
  secondary_model: string | null;
  name: string;
  series: string | null;
  colour_variant: string | null;
  intro_md: string | null;
  seo_title: string | null;
  meta_description: string | null;
  category_slug: string;
  category_name: string;
};

export function productSlugs(): string[] {
  return all<{ slug: string }>(
    `SELECT slug FROM product WHERE is_published = 1 ORDER BY sort_order`
  ).map((r) => r.slug);
}

export function getProduct(slug: string): Product | undefined {
  return get<Product>(
    `SELECT p.id, p.slug, p.kind, p.model_code, p.secondary_model, p.name, p.series,
            p.colour_variant, p.intro_md, p.seo_title, p.meta_description,
            c.slug AS category_slug, c.name AS category_name
       FROM product p
       JOIN product_category c ON c.id = p.category_id
      WHERE p.slug = ? AND p.is_published = 1`,
    slug
  );
}

export function getFacets(productId: number): Facet[] {
  return all<Facet>(
    `SELECT facet, value, unit, label FROM product_facet
      WHERE product_id = ? ORDER BY position`,
    productId
  );
}

/**
 * Excludes bullets that were consumed into the readout strip — otherwise the
 * page states "2,500 m³/h" in 36px type and then repeats "Airflow Rate :
 * 2500m3/h" two sections later.
 */
export function getSpecs(productId: number): Spec[] {
  return all<Spec>(
    `SELECT spec_key, spec_value, raw_text FROM product_spec
      WHERE product_id = ?
        AND position NOT IN (SELECT source_position FROM product_facet WHERE product_id = ?)
      ORDER BY position`,
    productId,
    productId
  );
}

export function getImages(productId: number, role?: string): ProductImage[] {
  const sql = `SELECT i.url, i.alt, i.width, i.height, pi.role, pi.caption_md
                 FROM product_image pi JOIN image i ON i.id = pi.image_id
                WHERE pi.product_id = ?${role ? ` AND pi.role = ?` : ``}
                ORDER BY pi.position`;
  return role ? all<ProductImage>(sql, productId, role) : all<ProductImage>(sql, productId);
}

export function getDownloads(productId: number): Download[] {
  return all<Download>(
    `SELECT label, url, kind FROM product_download WHERE product_id = ? ORDER BY position`,
    productId
  );
}

/**
 * The drawing, split by what it answers: `product` is the box, `installation`
 * is everything about the hole it goes in. Two sections rather than two tables
 * — same call product_spec made, and the section is a heading, not a taxonomy.
 */
export function getDimensions(productId: number): Dimension[] {
  return all<Dimension>(
    `SELECT section, label, value, note FROM product_dimension
      WHERE product_id = ? ORDER BY position`,
    productId
  );
}

/**
 * The subset of the drawing the fit checker does arithmetic on. Returns
 * undefined unless every metric it needs is present, so a half-transcribed
 * product renders no checker rather than a checker that quietly guesses.
 */
export function getFitMetrics(productId: number): FitMetrics | undefined {
  const rows = all<{ metric: string; min_mm: number | null; max_mm: number | null }>(
    `SELECT metric, min_mm, max_mm FROM product_dimension
      WHERE product_id = ? AND metric IS NOT NULL`,
    productId
  );
  const by = new Map(rows.map((r) => [r.metric, r]));
  const width = by.get("width");
  const opening = by.get("opening");
  const clearance = by.get("clearance");
  const duct = by.get("duct_above_counter");
  if (!width?.min_mm || !opening?.min_mm) return undefined;
  if (!clearance?.min_mm || !clearance.max_mm || !duct?.min_mm || !duct.max_mm) return undefined;
  return {
    width: width.min_mm,
    opening: opening.min_mm,
    clearance: { min: clearance.min_mm, max: clearance.max_mm },
    duct: { min: duct.min_mm, max: duct.max_mm },
  };
}

export function getProductFaqs(productId: number): ProductFaq[] {
  return all<ProductFaq>(
    `SELECT question, answer_md FROM product_faq WHERE product_id = ? ORDER BY position`,
    productId
  );
}

export function getVideos(productId: number): Video[] {
  return all<Video>(
    `SELECT video_id, title, summary, published_on, duration_seconds
       FROM product_video WHERE product_id = ? ORDER BY position`,
    productId
  );
}

export function getRelated(productId: number): RelatedProduct[] {
  return all<RelatedProduct>(
    `SELECT p.slug, p.name, p.model_code, i.url, i.alt
       FROM product_related r
       JOIN product p ON p.id = r.related_id
       LEFT JOIN image i ON i.id = p.hero_image_id
      WHERE r.product_id = ? AND p.is_published = 1
      ORDER BY r.position`,
    productId
  );
}

/**
 * The written feature story, where one has been authored. Empty for a product
 * still running on the legacy image stack, which is what the page falls back
 * to — see data/sql/product-features.sql.
 */
export function getFeatures(productId: number): Feature[] {
  return all<Feature>(
    `SELECT layout, title, body_md, image_url, image_alt, image_w, image_h
       FROM product_feature WHERE product_id = ? ORDER BY position`,
    productId
  );
}

/** Colourways of the same model (V917 Carbon Grey / White). Both URLs stay live. */
export function getColourways(productId: number): { slug: string; colour_variant: string }[] {
  return all<{ slug: string; colour_variant: string }>(
    `SELECT slug, colour_variant FROM product
      WHERE variant_group = (SELECT variant_group FROM product WHERE id = ?)
        AND variant_group IS NOT NULL
      ORDER BY sort_order`,
    productId
  );
}
