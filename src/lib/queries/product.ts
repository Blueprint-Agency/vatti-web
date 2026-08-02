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

export function getVideos(productId: number): string[] {
  return all<{ video_id: string }>(
    `SELECT video_id FROM product_video WHERE product_id = ? ORDER BY position`,
    productId
  ).map((r) => r.video_id);
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
