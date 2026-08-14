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
  signature_product_id: number | null;
  /** Decorative backdrops for the hero and the questionnaire band. Usually null. */
  hero_image_url: string | null;
  finder_image_url: string | null;
  /**
   * The product shot beside the hero headline. Carries real alt text.
   * `_focus` is a CSS object-position; NULL centres it in the column.
   */
  hero_product_image_url: string | null;
  hero_product_image_alt: string | null;
  hero_product_image_focus: string | null;
  /**
   * The photograph the signature band is built on. NULL falls back to the
   * studio cut-out plate. `_focus` is a CSS object-position; NULL centres it.
   */
  signature_image_url: string | null;
  signature_image_alt: string | null;
  signature_image_focus: string | null;
};

export type CategoryProduct = {
  slug: string;
  name: string;
  model_code: string;
  secondary_model: string | null;
  series: string | null;
  /**
   * 'Carbon Grey'. The two V917s carry no series between them, so without this
   * they are two identical options in the comparison dropdown.
   */
  colour_variant: string | null;
  url: string | null;
  alt: string | null;
  /** Who this model is the right answer for. Editorial; may be absent. */
  best_for: string | null;
  /** 'Turbo wash + PM2.5'. Read off the spec bullets — see CLEAN_CYCLES. */
  auto_clean: string | null;
  facets: Facet[];
  /**
   * Filter ids this model satisfies — `series:small-kitchen-series`,
   * `airflow:1`, `tag:bldc`. See buildFilters.
   */
  filters: string[];
};

/** A term of the category's own series taxonomy. */
export type Collection = { slug: string; name: string };

export type Signature = {
  slug: string;
  name: string;
  model_code: string;
  series: string | null;
  intro_md: string | null;
  url: string | null;
  alt: string | null;
  facets: Facet[];
  /** The unkeyed spec bullets, minus the ones the readout already shows. */
  highlights: string[];
};

export type Guide = {
  heading: string;
  body_md: string;
  figure: string | null;
  figure_unit: string | null;
};

export type Reason = {
  title: string;
  body_md: string;
  figure: string | null;
  figure_unit: string | null;
  /** Subject, not glyph: 'airflow'. Mapped to an icon in the component. */
  icon: string | null;
};

export type Faq = { question: string; answer_md: string };

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

/**
 * The five category hero backdrops, for a page that needs a kitchen behind its
 * heading but does not belong to one category.
 *
 * These are already on R2 and already carry the hero treatment they were shot
 * for, so borrowing one costs no upload and no new column. They are decorative
 * by definition — the `image` table is not involved and there is no alt text,
 * because a backdrop that needs describing is doing a job the copy should be
 * doing. Ordered, so a caller that wants a stable pick can index it.
 */
export function categoryBackdrops(): string[] {
  return all<{ url: string }>(
    `SELECT hero_image_url AS url FROM product_category
      WHERE hero_image_url IS NOT NULL ORDER BY sort_order`
  ).map((r) => r.url);
}

export function getCategory(slug: string): Category | undefined {
  return get<Category>(
    `SELECT id, slug, name, h1, seo_title, meta_description, intro_md, signature_product_id,
            hero_image_url, finder_image_url,
            hero_product_image_url, hero_product_image_alt, hero_product_image_focus,
            signature_image_url, signature_image_alt, signature_image_focus
       FROM product_category WHERE slug = ?`,
    slug
  );
}

/**
 * Feature tags, read off the spec bullets.
 *
 * There is no feature column and there should not be one: the source data is
 * 373 free-text bullets whose wording drifts model to model ("Tru-clean (Hot
 * pressure steam wash)", "Cold wash auto clean", "Heater Heat auto clean" are
 * all the same capability). Matching a handful of patterns over that text is
 * honest about what the data actually is; a boolean column per feature would
 * be a hand-maintained lie that goes stale the first time a product is added.
 *
 * A tag that matches EVERY product in a category is dropped by buildFilters —
 * it separates nothing. That is why "auto-clean" is listed here and never
 * appears on the hood page: all 16 hoods have it.
 */
const FEATURE_TAGS: { tag: string; label: string; test: RegExp }[] = [
  { tag: "bldc", label: "BLDC motor", test: /bldc/i },
  { tag: "hand-sensor", label: "Hand sensor", test: /hand ?sensor|gesture/i },
  { tag: "auto-clean", label: "Auto-clean", test: /auto ?-? ?clean|steam wash|hot wash|turbo wash|tru-?clean/i },
  { tag: "pm25", label: "PM2.5 purification", test: /pm ?2\.5/i },
  { tag: "wifi", label: "WiFi and hob link", test: /wi-?fi|auto link/i },
  { tag: "ductless", label: "Ductless capable", test: /ducted or recycl/i },
  { tag: "waterproof", label: "Waterproof motor", test: /water ?-? ?proof motor/i },
  { tag: "nano", label: "Nano coating", test: /nano coating/i },
];

/**
 * The self-clean cycle each model runs, in the order a spec bullet is allowed
 * to claim it — first match wins, strongest first. The source wording drifts
 * model to model for what is the same handful of mechanisms ("Tru-clean (Hot
 * pressure steam wash)", "Steam & hot wash auto clean", "Heater Heat auto
 * clean"), which is why this is patterns over text rather than a column.
 */
const CLEAN_CYCLES: { label: string; test: RegExp }[] = [
  { label: "Turbo wash", test: /turbo wash/i },
  { label: "Steam wash", test: /steam (?:&|and)? ?(?:hot )?wash|hot pressure steam|steam wash/i },
  { label: "Heater wash", test: /heater heat/i },
  { label: "Cold wash", test: /cold wash/i },
];

/**
 * Which measured value a category is browsed by. Everything else about a hood
 * follows from airflow, everything about a hob from burner power. Pressure is
 * last: it is the number that separates hoods in practice, but it is a second
 * question, and a filter can only lead with one.
 */
const PRIMARY_FACET = ["airflow", "power", "capacity", "flow", "pressure"];

/** Which end of the range is the good end, for the summary readouts. */
const BETTER: Record<string, "high" | "low"> = {
  airflow: "high",
  pressure: "high",
  filtration: "high",
  capacity: "high",
  power: "high",
  flow: "high",
  efficiency: "high",
  noise: "low",
  burners: "high",
  functions: "high",
};

/**
 * How the summary band names a facet's best value, where "Peak <label>" is
 * wrong. Everything not listed here gets that default, which suits any
 * measurement; the exceptions are the facets that are not measurements. Noise
 * is best at the bottom, and a burner count is counted rather than measured.
 */
const SUPERLATIVE: Record<string, string> = {
  noise: "Quietest",
  burners: "Most burners",
  functions: "Most functions",
};

export function getCategoryProducts(categoryId: number): CategoryProduct[] {
  const rows = all<Omit<CategoryProduct, "facets" | "filters" | "auto_clean"> & { id: number }>(
    `SELECT p.id, p.slug, p.name, p.model_code, p.secondary_model, p.series,
            p.colour_variant, p.best_for, i.url, i.alt
       FROM product p
       LEFT JOIN image i ON i.id = p.hero_image_id
      WHERE p.category_id = ? AND p.is_published = 1
      ORDER BY p.sort_order`,
    categoryId
  );
  if (rows.length === 0) return [];

  const holes = rows.map(() => "?").join(",");
  const ids = rows.map((r) => r.id);

  // One query for every product's facets rather than one per card — the hood
  // page renders 16 of them.
  const facets = all<Facet & { product_id: number }>(
    `SELECT product_id, facet, value, unit, label
       FROM product_facet
      WHERE product_id IN (${holes})
      ORDER BY position`,
    ...ids
  );

  // Same again for the spec bullets the feature tags are read from. Only the
  // text is needed, so the keyed/unkeyed distinction is irrelevant here.
  const specs = all<{ product_id: number; raw_text: string }>(
    `SELECT product_id, raw_text FROM product_spec WHERE product_id IN (${holes})`,
    ...ids
  );

  const members = all<{ product_id: number; slug: string }>(
    `SELECT m.product_id, c.slug
       FROM product_collection_member m
       JOIN product_collection c ON c.id = m.collection_id
      WHERE m.product_id IN (${holes})`,
    ...ids
  );

  return rows.map(({ id, ...r }) => {
    const mine = facets.filter((f) => f.product_id === id);
    const text = specs
      .filter((s) => s.product_id === id)
      .map((s) => s.raw_text)
      .join("\n");

    // The cycle, plus what it is paired with. PM2.5 is the differentiator on
    // the four models that have it, so it earns the suffix; on the rest the
    // oil-capture figure is the useful second half, and it comes from the
    // measured facet rather than from the sentence it was extracted out of.
    const cycle = CLEAN_CYCLES.find((c) => c.test.test(text))?.label ?? null;
    const capture = mine.find((f) => f.facet === "filtration");
    const suffix = /pm ?2\.5/i.test(text)
      ? " + PM2.5"
      : capture
        ? ` (${fmt(capture.value)}% oil)`
        : "";

    return {
      ...r,
      auto_clean: cycle && `${cycle}${suffix}`,
      facets: mine,
      filters: [
        ...members.filter((m) => m.product_id === id).map((m) => `series:${m.slug}`),
        ...FEATURE_TAGS.filter((t) => t.test.test(text)).map((t) => `tag:${t.tag}`),
      ],
    };
  });
}

/** The category's series taxonomy, in the order the live site tabs them. */
export function getCollections(categoryId: number): Collection[] {
  return all<Collection>(
    `SELECT slug, name FROM product_collection
      WHERE category_id = ? ORDER BY sort_order, name`,
    categoryId
  );
}

export type FilterGroup = {
  /** 'series', 'airflow' or 'feature'. */
  key: string;
  label: string;
  /** Render an "All" chip that clears this group. The series tabs have one. */
  all?: boolean;
  options: { id: string; label: string; count: number }[];
};

/**
 * The chips above the model grid.
 *
 * The series taxonomy leads, because it is how the range is actually sold and
 * how the live site has always been browsed: "small kitchen" is a decision a
 * visitor arrives with, and no measurement expresses it — the two Slim hoods
 * sit either side of the airflow median. It carries an "All" chip and behaves
 * like the tab bar it replaces.
 *
 * The measured groups follow it and refine within it. Those come out of
 * product_facet: thresholds are the range's own thirds, rounded, so every
 * label is a value a visitor can read straight off a product page.
 *
 * MUTATES the products it is handed: band membership is written back into
 * `filters` so the client component only ever compares strings. Call it once,
 * server-side, on the array that is about to be serialised.
 */
export function buildFilters(
  products: CategoryProduct[],
  collections: Collection[]
): FilterGroup[] {
  const groups: FilterGroup[] = [];

  if (collections.length > 1) {
    const options = collections
      .map((c) => ({
        id: `series:${c.slug}`,
        label: c.name,
        count: products.filter((p) => p.filters.includes(`series:${c.slug}`)).length,
      }))
      // A term with nothing in it is a tab that empties the grid.
      .filter((o) => o.count > 0);
    if (options.length > 1) {
      groups.push({ key: "series", label: "Series", all: true, options });
    }
  }

  // The measured bands are the FALLBACK browse axis, not a second one. Where a
  // series taxonomy exists the two say nearly the same thing — Heavy-Duty
  // Cooking is the top airflow band and Small Kitchen the bottom — and
  // stacking both puts fifteen chips above the grid to sort sixteen models.
  // The hobs and ovens have no taxonomy, and there the bands are all there is.
  const facet = groups.length
    ? undefined
    : PRIMARY_FACET.find(
        (f) =>
          products.filter((p) => p.facets.some((x) => x.facet === f)).length >= products.length / 2
      );

  if (facet) {
    const measured = products
      .map((p) => p.facets.find((f) => f.facet === facet))
      .filter((f): f is Facet => f !== undefined);
    const values = measured.map((f) => f.value).sort((a, b) => a - b);
    const unit = measured[0].unit;
    const label = measured[0].label;

    // Round the band edges to the granularity the numbers are actually quoted
    // at, so an edge reads as a spec value and not as a computed artefact.
    // Airflow is written in fifties, burner power to one decimal place.
    const top = values[values.length - 1];
    const step = top > 1000 ? 50 : top > 100 ? 10 : top > 10 ? 1 : 0.1;
    // toFixed before Number: 4.8 / 0.1 * 0.1 is 4.800000000000001 in binary
    // floating point, and that is what would be printed on the chip.
    const nice = (n: number) => Number((Math.round(n / step) * step).toFixed(step < 1 ? 1 : 0));
    const low = nice(values[Math.floor(values.length / 3)]);
    const high = nice(values[Math.floor((values.length * 2) / 3)]);

    // Thirds that land on the same number mean the range is too flat to band —
    // two chips selecting the same models is worse than no chips.
    if (low < high) {
      const bands = [
        { id: `${facet}:0`, label: `Up to ${fmt(low)}`, in: (v: number) => v <= low },
        { id: `${facet}:1`, label: `${fmt(low)} to ${fmt(high)}`, in: (v: number) => v > low && v <= high },
        { id: `${facet}:2`, label: `Over ${fmt(high)}`, in: (v: number) => v > high },
      ];
      for (const p of products) {
        const value = p.facets.find((f) => f.facet === facet)?.value;
        if (value === undefined) continue;
        const band = bands.find((b) => b.in(value));
        if (band) p.filters.push(band.id);
      }
      const options = bands
        .map((b) => ({
          id: b.id,
          label: b.label,
          count: products.filter((p) => p.filters.includes(b.id)).length,
        }))
        // An empty band happens when the top third of the values are all equal
        // (three ovens at 75 L). A chip that selects nothing is a dead control.
        .filter((o) => o.count > 0);
      if (options.length > 1) {
        groups.push({ key: facet, label: `${label} (${unit})`, options });
      }
    }
  }

  const features = FEATURE_TAGS.map((t) => ({
    id: `tag:${t.tag}`,
    label: t.label,
    count: products.filter((p) => p.filters.includes(`tag:${t.tag}`)).length,
  }))
    // Nothing and everything are both non-filters.
    .filter((o) => o.count > 0 && o.count < products.length);

  // One chip is not a filter, it is a fact about a single model. The hobs have
  // exactly one tagged feature between eleven products and get no group at all.
  if (features.length > 1) groups.push({ key: "feature", label: "Features", options: features });

  return groups;
}

export type Extreme = { facet: string; label: string; value: number; unit: string; model: string };

/**
 * The range in four numbers, for the top of the page: how many models, and the
 * best value the category reaches on each of its first three measurements.
 * "Best" is the high end everywhere except noise, where it is the low one.
 */
export function getRangeSummary(products: CategoryProduct[]): Extreme[] {
  const seen = new Set<string>();
  const order: string[] = [];
  for (const p of products) {
    for (const f of p.facets) {
      if (seen.has(f.facet)) continue;
      seen.add(f.facet);
      order.push(f.facet);
    }
  }

  return order
    .map((facet) => {
      const rows = products
        .map((p) => ({ f: p.facets.find((x) => x.facet === facet), model: p.model_code }))
        .filter((r): r is { f: Facet; model: string } => r.f !== undefined);
      if (rows.length < 2) return undefined;
      const best = rows.reduce((a, b) =>
        (BETTER[facet] ?? "high") === "low"
          ? b.f.value < a.f.value
            ? b
            : a
          : b.f.value > a.f.value
            ? b
            : a
      );
      return {
        facet,
        label: SUPERLATIVE[facet] ?? `Peak ${best.f.label.toLowerCase()}`,
        value: best.f.value,
        unit: best.f.unit,
        model: best.model,
      };
    })
    .filter((e): e is Extreme => e !== undefined)
    .slice(0, 3);
}

export type Column = { facet: string; label: string; unit: string; better: "high" | "low" };

/**
 * The columns of the comparison table: every measurement at least half the
 * category carries, in the order the products list them. A column two of
 * sixteen models fill is a column of dashes.
 */
export function getCompareColumns(products: CategoryProduct[]): Column[] {
  const seen = new Map<string, Column>();
  for (const p of products) {
    for (const f of p.facets) {
      if (seen.has(f.facet)) continue;
      seen.set(f.facet, {
        facet: f.facet,
        label: f.label,
        unit: f.unit,
        better: BETTER[f.facet] ?? "high",
      });
    }
  }
  return [...seen.values()].filter(
    (c) => products.filter((p) => p.facets.some((f) => f.facet === c.facet)).length >= products.length / 2
  );
}

/** The model the category leads with, with enough detail to sell it alone. */
export function getSignature(productId: number): Signature | undefined {
  const row = get<Omit<Signature, "facets" | "highlights">>(
    `SELECT p.slug, p.name, p.model_code, p.series, p.intro_md, i.url, i.alt
       FROM product p
       LEFT JOIN image i ON i.id = p.hero_image_id
      WHERE p.id = ? AND p.is_published = 1`,
    productId
  );
  if (!row) return undefined;

  const facets = all<Facet>(
    `SELECT facet, value, unit, label FROM product_facet WHERE product_id = ? ORDER BY position`,
    productId
  );
  // The bullets the readout has not already said, and only the unkeyed ones —
  // every keyed bullet on these products is a measurement the strip carries.
  const highlights = all<{ raw_text: string }>(
    `SELECT raw_text FROM product_spec
      WHERE product_id = ? AND spec_key IS NULL
        AND position NOT IN (SELECT source_position FROM product_facet WHERE product_id = ?)
      ORDER BY position`,
    productId,
    productId
  ).map((r) => r.raw_text);

  return { ...row, facets, highlights };
}

export function getGuides(categoryId: number): Guide[] {
  return all<Guide>(
    `SELECT heading, body_md, figure, figure_unit FROM category_guide
      WHERE category_id = ? ORDER BY position`,
    categoryId
  );
}

export function getReasons(categoryId: number): Reason[] {
  return all<Reason>(
    `SELECT title, body_md, figure, figure_unit, icon FROM category_reason
      WHERE category_id = ? ORDER BY position`,
    categoryId
  );
}

export function getFaqs(categoryId: number): Faq[] {
  return all<Faq>(
    `SELECT question, answer_md FROM category_faq
      WHERE category_id = ? ORDER BY position`,
    categoryId
  );
}

export type Review = {
  author: string;
  body: string;
  rating: number;
  posted_at: string;
  source: string;
};

/** Site-wide, not per category: they are all about the same service team. */
export function getReviews(limit: number): Review[] {
  return all<Review>(
    `SELECT author, body, rating, posted_at, source FROM review ORDER BY position LIMIT ?`,
    limit
  );
}

function fmt(n: number): string {
  return Number.isInteger(n) ? n.toLocaleString("en-MY") : String(n);
}
