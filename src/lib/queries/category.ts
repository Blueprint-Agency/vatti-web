import { TAG, prefix, t, type Locale } from "@/i18n";
import { all, get } from "@/lib/db";
import type { Facet } from "@/lib/queries/product";

/**
 * Every function here that produces words takes the edition. English reads the
 * base tables exactly as before; Malay and Chinese overlay product_category_i18n
 * and product_i18n, read guides, reasons and FAQs by `lang`, and translate the
 * generated labels (facets, chips, superlatives) through src/i18n. Figures,
 * model codes and series names are the same in every edition.
 */

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
  /** Where the card links: the product page in this edition, or English until it exists. */
  href: string;
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
  href: string;
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
/** slug -> display name, for the page buttons `Markdown` renders. */
export function categoryNames(): Record<string, string> {
  return Object.fromEntries(
    all<{ slug: string; name: string }>(`SELECT slug, name FROM product_category`).map((r) => [
      r.slug,
      r.name,
    ])
  );
}

export function categorySlugs(): string[] {
  return all<{ slug: string }>(
    `SELECT slug FROM product_category ORDER BY sort_order`
  ).map((r) => r.slug);
}

/** One edition's category URL segments: the English slugs, or the translated rows. */
export function categoryParams(locale: Locale): string[] {
  if (locale === "en") return categorySlugs();
  return all<{ slug: string }>(
    `SELECT i.slug FROM product_category_i18n i
       JOIN product_category c ON c.id = i.category_id
      WHERE i.lang = ? ORDER BY c.sort_order`,
    TAG[locale]
  ).map((r) => r.slug);
}

/** A category's URL in every edition it exists in, keyed by locale. */
export function categoryEditions(categoryId: number): Partial<Record<Locale, string>> {
  const en = get<{ slug: string }>(`SELECT slug FROM product_category WHERE id = ?`, categoryId);
  const out: Partial<Record<Locale, string>> = en ? { en: `/${en.slug}/` } : {};
  for (const row of all<{ lang: string; slug: string }>(
    `SELECT lang, slug FROM product_category_i18n WHERE category_id = ?`,
    categoryId
  )) {
    const locale = row.lang === "ms-MY" ? "ms" : "zh";
    out[locale] = `${prefix(locale)}/${row.slug}/`;
  }
  return out;
}

/** Category URL by its English slug, in an edition; English when not translated yet. */
export function localCategoryPath(locale: Locale, enSlug: string): string {
  if (locale === "en") return `/${enSlug}/`;
  const row = get<{ slug: string }>(
    `SELECT i.slug FROM product_category_i18n i JOIN product_category c ON c.id = i.category_id
      WHERE c.slug = ? AND i.lang = ?`,
    enSlug,
    TAG[locale]
  );
  return row ? `${prefix(locale)}/${row.slug}/` : `/${enSlug}/`;
}

/** A product's URL in an edition. Product pages are English-only until Phase 3. */
export function localProductPath(_locale: Locale, slug: string): string {
  return `/${slug}/`;
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

export type MenuImage = { url: string; width: number; height: number };

/**
 * One product shot per category, for the mobile menu's product cards: the
 * cut-out of the model the category leads with (`signature_product_id`), so
 * changing the lead model changes the menu with it and there is no second
 * picture to keep. Keyed on the English slug, which is what the header's
 * category list and the nav dictionary are keyed on. Same in every edition.
 *
 * A category whose lead model has no hero image is simply absent; the card
 * renders without a picture rather than with a hole.
 */
export function categoryMenuImages(): Record<string, MenuImage> {
  const rows = all<MenuImage & { slug: string }>(
    `SELECT c.slug, i.url, i.width, i.height
       FROM product_category c
       JOIN product p ON p.id = c.signature_product_id AND p.is_published = 1
       JOIN image i ON i.id = p.hero_image_id
      WHERE i.width IS NOT NULL AND i.height IS NOT NULL`
  );
  return Object.fromEntries(rows.map(({ slug, ...img }) => [slug, img]));
}

/**
 * By the URL segment of the edition. A translated category keeps its English
 * `slug` field as identity (it is what the dictionaries and the guide map are
 * keyed on) and gains `path`, its URL in this edition.
 */
export function getCategory(locale: Locale, slug: string): (Category & { path: string }) | undefined {
  if (locale === "en") {
    const row = get<Category>(
      `SELECT id, slug, name, h1, seo_title, meta_description, intro_md, signature_product_id,
              hero_image_url, finder_image_url,
              hero_product_image_url, hero_product_image_alt, hero_product_image_focus,
              signature_image_url, signature_image_alt, signature_image_focus
         FROM product_category WHERE slug = ?`,
      slug
    );
    return row && { ...row, path: `/${row.slug}/` };
  }
  const row = get<Category & { local_slug: string }>(
    `SELECT c.id, c.slug, i.slug AS local_slug, i.name, i.h1, i.seo_title, i.meta_description,
            i.intro_md, c.signature_product_id, c.hero_image_url, c.finder_image_url,
            c.hero_product_image_url, c.hero_product_image_alt, c.hero_product_image_focus,
            c.signature_image_url, coalesce(i.signature_image_alt, c.signature_image_alt) AS signature_image_alt,
            c.signature_image_focus
       FROM product_category_i18n i JOIN product_category c ON c.id = i.category_id
      WHERE i.lang = ? AND i.slug = ?`,
    TAG[locale],
    slug
  );
  if (!row) return undefined;
  const { local_slug, ...category } = row;
  return { ...category, path: `${prefix(locale)}/${local_slug}/` };
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

// How the summary band names a facet's best value ("Quietest", "Peak airflow")
// lives in src/i18n under filters.superlative and filters.peak: the default suits
// any measurement; the exceptions are noise (best at the bottom) and the counts.

export function getCategoryProducts(categoryId: number, locale: Locale = "en"): CategoryProduct[] {
  const d = t(locale);
  const rows = all<Omit<CategoryProduct, "facets" | "filters" | "auto_clean" | "href"> & { id: number }>(
    `SELECT p.id, p.slug, coalesce(pi.name, p.name) AS name, p.model_code, p.secondary_model,
            p.series, p.colour_variant, coalesce(pi.best_for, p.best_for) AS best_for, i.url, i.alt
       FROM product p
       LEFT JOIN image i ON i.id = p.hero_image_id
       LEFT JOIN product_i18n pi ON pi.product_id = p.id AND pi.lang = ?
      WHERE p.category_id = ? AND p.is_published = 1
        -- One card per colourway group (V917, DWID3): the lowest sort_order
        -- member fronts the grid, the rest are reachable only through its
        -- "Finish" switcher (getColourways) — see product.ts. Both URLs stay
        -- live and indexable; only the catalogue listing dedupes.
        AND (p.variant_group IS NULL OR p.sort_order = (
          SELECT MIN(sort_order) FROM product
           WHERE variant_group = p.variant_group AND is_published = 1))
      ORDER BY p.sort_order`,
    TAG[locale],
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
    const mine = facets
      .filter((f) => f.product_id === id)
      .map((f) => ({ ...f, label: d.facets[f.label] ?? f.label }));
    const text = specs
      .filter((s) => s.product_id === id)
      .map((s) => s.raw_text)
      .join("\n");

    // The cycle, plus what it is paired with. PM2.5 is the differentiator on
    // the four models that have it, so it earns the suffix; on the rest the
    // oil-capture figure is the useful second half, and it comes from the
    // measured facet rather than from the sentence it was extracted out of.
    const found = CLEAN_CYCLES.find((c) => c.test.test(text))?.label;
    const cycle = found ? (d.filters.cycles[found] ?? found) : null;
    const capture = mine.find((f) => f.facet === "filtration");
    const suffix = /pm ?2\.5/i.test(text)
      ? " + PM2.5"
      : capture
        ? d.filters.oil(fmt(capture.value, locale))
        : "";

    return {
      ...r,
      href: localProductPath(locale, r.slug),
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
  collections: Collection[],
  locale: Locale = "en"
): FilterGroup[] {
  const f = t(locale).filters;
  const groups: FilterGroup[] = [];

  if (collections.length > 1) {
    const options = collections
      .map((c) => ({
        id: `series:${c.slug}`,
        label: f.collections[c.slug] ?? c.name,
        count: products.filter((p) => p.filters.includes(`series:${c.slug}`)).length,
      }))
      // A term with nothing in it is a tab that empties the grid.
      .filter((o) => o.count > 0);
    if (options.length > 1) {
      groups.push({ key: "series", label: f.series, all: true, options });
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
        { id: `${facet}:0`, label: f.upTo(fmt(low, locale)), in: (v: number) => v <= low },
        {
          id: `${facet}:1`,
          label: f.between(fmt(low, locale), fmt(high, locale)),
          in: (v: number) => v > low && v <= high,
        },
        { id: `${facet}:2`, label: f.over(fmt(high, locale)), in: (v: number) => v > high },
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
        groups.push({ key: facet, label: f.facetGroup(label, unit), options });
      }
    }
  }

  const features = FEATURE_TAGS.map((tag) => ({
    id: `tag:${tag.tag}`,
    label: f.tags[tag.tag] ?? tag.label,
    count: products.filter((p) => p.filters.includes(`tag:${tag.tag}`)).length,
  }))
    // Nothing and everything are both non-filters.
    .filter((o) => o.count > 0 && o.count < products.length);

  // One chip is not a filter, it is a fact about a single model. The hobs have
  // exactly one tagged feature between eleven products and get no group at all.
  if (features.length > 1) groups.push({ key: "feature", label: f.features, options: features });

  return groups;
}

export type Extreme = { facet: string; label: string; value: number; unit: string; model: string };

/**
 * The range in four numbers, for the top of the page: how many models, and the
 * best value the category reaches on each of its first three measurements.
 * "Best" is the high end everywhere except noise, where it is the low one.
 */
export function getRangeSummary(products: CategoryProduct[], locale: Locale = "en"): Extreme[] {
  const f = t(locale).filters;
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
        label: f.superlative[facet] ?? f.peak(best.f.label),
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
export function getSignature(productId: number, locale: Locale = "en"): Signature | undefined {
  const d = t(locale);
  const row = get<Omit<Signature, "facets" | "highlights" | "href">>(
    `SELECT p.slug, coalesce(pi.name, p.name) AS name, p.model_code, p.series,
            coalesce(pi.intro_md, p.intro_md) AS intro_md, i.url, i.alt
       FROM product p
       LEFT JOIN image i ON i.id = p.hero_image_id
       LEFT JOIN product_i18n pi ON pi.product_id = p.id AND pi.lang = ?
      WHERE p.id = ? AND p.is_published = 1`,
    TAG[locale],
    productId
  );
  if (!row) return undefined;

  const facets = all<Facet>(
    `SELECT facet, value, unit, label FROM product_facet WHERE product_id = ? ORDER BY position`,
    productId
  ).map((f) => ({ ...f, label: d.facets[f.label] ?? f.label }));
  // The bullets the readout has not already said, and only the unkeyed ones —
  // every keyed bullet on these products is a measurement the strip carries.
  const highlights = all<{ raw_text: string }>(
    `SELECT coalesce(si.raw_text, s.raw_text) AS raw_text FROM product_spec s
       LEFT JOIN product_spec_i18n si
         ON si.product_id = s.product_id AND si.position = s.position AND si.lang = ?
      WHERE s.product_id = ? AND s.spec_key IS NULL
        AND s.position NOT IN (SELECT source_position FROM product_facet WHERE product_id = ?)
      ORDER BY s.position`,
    TAG[locale],
    productId,
    productId
  ).map((r) => r.raw_text);

  return { ...row, href: localProductPath(locale, row.slug), facets, highlights };
}

export function getGuides(categoryId: number, locale: Locale = "en"): Guide[] {
  return all<Guide>(
    `SELECT heading, body_md, figure, figure_unit FROM category_guide
      WHERE category_id = ? AND lang = ? ORDER BY position`,
    categoryId,
    TAG[locale]
  );
}

export function getReasons(categoryId: number, locale: Locale = "en"): Reason[] {
  return all<Reason>(
    `SELECT title, body_md, figure, figure_unit, icon FROM category_reason
      WHERE category_id = ? AND lang = ? ORDER BY position`,
    categoryId,
    TAG[locale]
  );
}

export function getFaqs(categoryId: number, locale: Locale = "en"): Faq[] {
  return all<Faq>(
    `SELECT question, answer_md FROM category_faq
      WHERE category_id = ? AND lang = ? ORDER BY position`,
    categoryId,
    TAG[locale]
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

function fmt(n: number, locale: Locale = "en"): string {
  return Number.isInteger(n) ? n.toLocaleString(TAG[locale]) : String(n);
}
