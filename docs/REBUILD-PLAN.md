# Vatti Malaysia — Rebuild Plan

Next.js + SQLite replacement for the WordPress/Elementor site at `vattimalaysia.com`,
preserving every existing URL.

Audit date: **2 Aug 2026**. Raw scrape data in `research/`.

---

## 1. Context

### The business

VATTI Malaysia is the **national distributor** for VATTI, a Chinese listed kitchen-appliance brand
(est. 1992, Red Dot and iF Design winner). It sells built-in kitchen appliances — cooker hoods, gas
and ceramic hobs, combi/steam ovens, one built-in microwave, one dishwasher, one under-sink RO water
purifier. About **30 SKUs**, marketed to Malaysian homeowners doing high-heat wok cooking, and sold
through a **75-dealer retail network** plus one flagship showroom at Atria Mall, Petaling Jaya.

**This is a lead-generation site, not a shop.** There is no cart, no checkout, and no price anywhere
on any page. WooCommerce is not installed. Every conversion path is: WhatsApp the sales line, submit
an enquiry form, or go find a dealer. The only money that moves is VATTI Pay — a single button that
hands existing dealers off to an external SAML portal (`vattipay.3ex.com.my`) to settle invoices.

**The data model therefore needs no orders table.** It needs products, dealers, articles, and two
form pipelines.

### Why rebuild

Measured on the live site, 2 Aug 2026:

| Page | HTML alone | Notes |
|---|---|---|
| `/` | **465 KB** | hero image is lazy-loaded behind a base64 SVG placeholder — guaranteed poor LCP |
| `/kitchen-hood-in-malaysia/` | **634 KB** | 2.2 s TTFB uncached |
| `/store-locations/` | **891 KB** | 77 `<img>` tags |
| `/tips-tricks/what-is-auto-clean/` | 425 KB | 3.9 s TTFB uncached |

That is before CSS, JS or images. The stack is WordPress + Astra + Elementor + Happy Addons +
Essential Addons + Stratum + Jetpack + LiteSpeed — five plugins shipping assets on the homepage
alone. A static Next.js build should land the same content in 15–40 KB of HTML.

### What is actually at stake (Search Console, last 90 days)

**10,792 clicks / 393,006 impressions. 64% mobile.**

| Page | Clicks | Impressions | CTR | Pos |
|---|---|---|---|---|
| `/kitchen-hood-in-malaysia/` | 1,922 | 21,895 | 8.8% | 5.9 |
| `/` | 1,869 | 18,606 | 10.1% | 5.6 |
| `/buying-guide/is-an-infrared-gas-stove-worth-it/` | 872 | 51,684 | **1.7%** | 4.0 |
| `/cooker-hob-in-malaysia/` | 361 | 7,813 | 4.6% | 6.8 |
| `/vatti-aetheris-series-cooker-hood-v929/` | 332 | 2,352 | 14.1% | 4.9 |
| `/tips-tricks/what-is-not-dishwasher-safe/` | 65 | 45,750 | **0.14%** | **2.7** |
| `/wp-content/uploads/2025/04/Vatti-Catalogue-2025-Website.pdf` | 151 | 4,238 | 3.6% | 8.4 |

Three things follow, and they shape the whole plan:

1. **`/kitchen-hood-in-malaysia/` outranks the homepage.** The category pages are the commercial
   engine, not a nav convenience. They get the design budget.
2. **There is a large CTR deficit.** `what-is-not-dishwasher-safe` sits at position 2.7 across 45,750
   impressions and converts 0.14% of them. Position 2.7 should return 10–15%. Several articles show
   the same shape. Titles, meta descriptions and rich results are an untapped win worth more than
   any ranking gain.
3. **PDFs rank and earn clicks directly.** The catalogue and four instruction manuals pull 366
   clicks between them. `/wp-content/uploads/...` paths are part of the URL contract.

---

## 2. Current site — what the audit found

### Products are stored twice, and one copy is empty

Products exist as **five separate WordPress custom post types** — `kitchen-hood-categor` (sic),
`cooker-hob-category`, `combine-oven-cate`, `dishwasher-cate`, `water-purifier-cate` — each with its
own private taxonomy (`conbine-oven-taxa`, also sic). Those 32 CPT records have **empty
`content`**; they exist only to render cards in the category-page loop grid.

The actual product detail lives in **39 separate Elementor pages** at flat root-level URLs. The two
sets do not fully agree: there are 39 pages against 32 CPT records, and one CPT record
(`vatti-stellar-series-cooker-hood-v960`) is titled "VATTI Hidden Series Cooker Hood V938" — a
copy-paste error that left V938 without a card and created two Stellar V960 entries.

The CPT permalinks (`/kitchen-hood-categor/stellar-series-v960/`) return **200 and are indexable**,
but are absent from the sitemap. That is duplicate content, and it gets 301'd on migration.

**The rebuild collapses both into one `product` table.**

### There is no spec table anywhere

Zero `<table>` elements across all 39 product pages. Specs are a flat `➥` bullet list in a text
widget. Only **41 of 332 bullets** parse as `Key: Value`; the other 291 are feature sentences
("BLDC motor", "Child Lock"). A column-per-spec model would be ~90% NULL.

Worse: the real product story — 5 to 20 full-width feature images per product — has **all its text
baked into the JPEGs**. Not selectable, not searchable, not translatable, invisible to Google, and
unusable by a screen reader. Transcribing it is the single biggest content win available, and it is
a copywriting task, not a code task.

### Category pages are already consolidated — verified

The six plain category URLs **already 301** on the live server:

```
/kitchen-hood/       → /kitchen-hood-in-malaysia/
/cooker-hob/         → /cooker-hob-in-malaysia/
/built-in-oven/      → /combi-and-steam-oven-in-malaysia/
/steamer-combi-oven/ → /combi-and-steam-oven-in-malaysia/
/dishwasher/         → /dishwasher-in-malaysia/
/one-tap-purifier/   → /one-tap-purifier-in-malaysia/
```

So there is no duplicate-content problem to solve and no consolidation decision to make — **there
are 5 category pages and 6 redirects, and we reproduce that exactly.** (The earlier concern that
these were competing doorway pages was wrong; they are legacy paths already pointing at the
canonical URL.)

Each category page is a rich ~30-section template: hero, signature-product video, taxonomy filter
chips, product loop grid, SEO buying-guide blocks, a comparison table, a 6-reason strip, a Google
reviews widget, blog teasers, a 3-CTA block, and two FAQ accordions (~12 Q&A). **That content is
unique per category and must be modelled, not hardcoded.**

### Editorial

107 articles: 54 `/tips-tricks/`, 26 `/recipe/`, 25 `/buying-guide/`, 1 `/uncategorized/`.
Only 3 WordPress categories exist and they **do not match the URL prefix** — 10 posts sitting under
`/tips-tricks/` are categorised Buying Guide. There are **no tags**; the tag-like strings are Rank
Math focus keywords (72 distinct, near 1:1 with posts) and must not become a taxonomy.

16 of 26 recipes carry real `Recipe` JSON-LD (ingredients, ISO-8601 times, steps, calories). The
other 10 are `5-*` roundup listicles holding several recipes each as prose — which is why `recipe`
hangs off `article` with a `position` rather than being 1:1.

**30 articles emit `"@type": "Off"`** instead of `BlogPosting` — Rank Math schema was switched off
in a bulk edit, so they publish no structured data at all. Re-enabling it is free CTR.

### Known defects to fix during migration

| Issue | Action |
|---|---|
| `clean-baking-sheets-2` duplicates `clean-baking-sheets` (Jaccard 0.68) | 301 to the original |
| `induction-vs-ceramic-{features,safety,guide}` — 3 posts, same focus keyword, 331–437 words | merge into one, 301 the other two |
| `/uncategorized/induction-vs-ceramic-guide/` has no category at all | fold into the merge above |
| 3 posts link to `buying-guide/induction-cooker-vs-gas-stove-in-malaysia-what-is-the-difference` (404) | fix links + add redirect |
| `vatti-built-in-air-fryer-oven-07559` — slug uses digit `0`, not letter `O` | **keep the live URL**, add the correct spelling as a 301 source |
| V917 Carbon Grey / White — byte-identical specs | one product, two colourways; **both URLs stay live** |
| 5 products list themselves in "You May Be Interested In" | reject self-reference on import |
| 105 of 418 product images have no alt text | write alts |
| FAQ schema missing on cooker-hob, dishwasher, one-tap-purifier despite visible FAQs | emit from DB |
| `/oven/` and `/oven/recipe/` are empty orphan stubs, indexable | see § open questions |
| eWarranty dealer dropdown has 80 hardcoded options; store CPT has 75 | unify into one `dealer` table |
| Elementor's default "Sahara" palette was never rebranded | see § design |

---

## 3. Complete page inventory

**~238 URLs across 11 route templates.**

| # | Route | Template | Count | Data source |
|---|---|---|---|---|
| 1 | `/` | Home | 1 | `product`, `article`, static blocks |
| 2 | `/[slug]/` | Product detail | 39 | `product` + children |
| 3 | `/[slug]/` | Category | 5 | `product_category` + children |
| 4 | `/kitchen-hood-in-malaysia/[page]/` | Category pagination | 1 | `product` |
| 5 | `/[section]/[slug]/` | Article / Recipe | 106 | `article`, `recipe` |
| 6 | `/category/[slug]/` | Blog archive | 3 + pagination | `article` |
| 7 | `/store-locations/` | Dealer directory | 1 | `dealer` |
| 8 | `/store/[slug]/` | Dealer detail | 75 | `dealer` |
| 9 | `/about-us/`, `/contact-us/`, `/vatti-pay/`, `/vatti-ewarranty/` | Static | 4 | SQL content blocks |
| 10 | `/oven/`, `/oven/recipe/` | Stub | 2 | — |
| 11 | `/api/enquiry`, `/api/ewarranty` | Route handler | 2 | — (email only) |

Routes 2 and 3 share one dynamic segment. Next.js cannot have two dynamic segments at the same
level, so `app/[slug]/page.tsx` resolves the slug against the DB and branches:

```ts
// app/[slug]/page.tsx
export function generateStaticParams() {
  return [...productSlugs(), ...categorySlugs()].map(slug => ({ slug }))
}
export default async function Page({ params }) {
  const { slug } = await params
  const cat = getCategoryBySlug(slug)
  if (cat) return <CategoryPage category={cat} />
  const product = getProductBySlug(slug)
  if (!product) notFound()
  return <ProductPage product={product} />
}
```

Static routes (`/about-us/`, `/store-locations/`, `/category/…`) take precedence over `[slug]` in
Next.js, so they resolve correctly without special handling.

### Product URLs (39, flat at root — unchanged)

<details>
<summary>Range hoods (16)</summary>

`athena-series-lifting-type-range-hood-v993` · `-v999` · `-v936` · `-v991` ·
`artemis-series-t-type-range-hood-v931` · `triple-intake-series-t-type-cooker-hood-v937` ·
`slim-series-type-range-hood-v995` · `vatti-slim-series-type-range-hood-v996` ·
`vatti-magic-series-cooker-hood-v919` · `vatti-aetheris-series-cooker-hood-v929` ·
`vatti-range-hood-v997` · `vatti-smart-oxygen-range-hood-v998` ·
`vatti-hidden-series-range-hood-v938` · `vatti-stellar-series-cooker-hood-v960` ·
`vatti-cooker-hood-v917-carbon-grey` · `vatti-cooker-hood-v917-white`
</details>

<details>
<summary>Hobs (11), ovens & combi (9), other (3)</summary>

Hobs: `professional-series-c720s` · `professional-series-c821g` · `vatti-ai-hob-c835g` ·
`vatti-oylimpic-hob-m822g` (sic — "Olympic") · `vatti-flexi-hob-c822g` · `-c823g` · `-c836g` ·
`vatti-3-burner-gas-hob-c830g` · `vatti-magic-series-cooker-hob-c861g` ·
`ceramic-cooker-hob-er3601t` · `-er5902t`

Ovens/combi: `vatti-built-in-oven-o7549` · `-o755p` · `vatti-built-in-air-fryer-oven-07559` ·
`free-standing-combi-oven-va01` · `built-in-combi-oven-va03` · `-va04` · `-va05` ·
`vatti-magic-series-combi-oven-va06` · `built-in-steam-oven-z4501`

Other: `built-in-microwave-m626` · `vatti-dishwasher-dwbb7` ·
`vatti-one-tap-water-purifier-wdhg01-with-v818wd`
</details>

### Navigation (unchanged)

```
Home · Categories ▾ (5 -in-malaysia pages) · About Us · Contact Us ·
Store Locations · eWarranty · Blog ▾ (3 /category/ archives) · Catalog (PDF)
```

---

## 4. Data model

Source of truth is `data/sql/*.sql`, committed and reviewable. `pnpm db:build` compiles it to
`.data/vatti.db` (gitignored). See `research/schema.sql` for the products-only draft this merges.

```sql
PRAGMA foreign_keys = ON;

-- ── media ──────────────────────────────────────────────────────────────────
-- One table for all 1,251 assets; doubles as the R2 migration manifest.
CREATE TABLE image (
  id          INTEGER PRIMARY KEY,
  r2_key      TEXT NOT NULL UNIQUE,   -- 'products/v993/hero.webp'
  url         TEXT NOT NULL,          -- CDN URL, what the app renders
  legacy_url  TEXT UNIQUE,            -- original wp-content or i0.wp.com URL
  alt         TEXT,
  width       INTEGER,
  height      INTEGER
);

-- ── products ───────────────────────────────────────────────────────────────
CREATE TABLE product_category (
  id            INTEGER PRIMARY KEY,
  slug          TEXT NOT NULL UNIQUE,   -- 'kitchen-hood-in-malaysia'
  name          TEXT NOT NULL,
  h1            TEXT NOT NULL,          -- 'Compare VATTI Kitchen Hood Models'
  seo_title     TEXT,
  meta_description TEXT,
  intro_md      TEXT,
  hero_image_id INTEGER REFERENCES image(id),
  video_url     TEXT,
  sort_order    INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE product (
  id              INTEGER PRIMARY KEY,
  slug            TEXT NOT NULL UNIQUE,
  category_id     INTEGER NOT NULL REFERENCES product_category(id),
  model_code      TEXT NOT NULL,        -- 'V993','C835G','ER5902T'
  secondary_model TEXT,                 -- only WDHG01 bundles V818WD
  name            TEXT NOT NULL,
  series          TEXT,                 -- Athena/Artemis/Magic/Slim/Stellar/…
  colour_variant  TEXT,                 -- 'Carbon Grey' | 'White'
  variant_group   TEXT,                 -- 'V917' — groups colourways
  intro_md        TEXT,                 -- present on only 2/39 today; write the rest
  seo_title       TEXT,
  meta_description TEXT,
  -- the four facets that genuinely exist and are worth filtering on
  airflow_m3h     INTEGER,              -- range hoods, 16/16
  air_pressure_pa INTEGER,              -- range hoods, 16/16
  noise_db        INTEGER,              -- range hoods, 15/16
  capacity_litres INTEGER,              -- ovens/combi/microwave/dishwasher
  hero_image_id   INTEGER REFERENCES image(id),
  whatsapp_url    TEXT,
  is_published    INTEGER NOT NULL DEFAULT 1,
  sort_order      INTEGER NOT NULL DEFAULT 0,
  wp_id           INTEGER               -- provenance only; never join on this
);
CREATE INDEX product_category_idx ON product(category_id, sort_order);
CREATE INDEX product_variant_idx  ON product(variant_group);

-- Ordered bullets with a NULLABLE key. Do not widen into columns — see §2.
CREATE TABLE product_spec (
  id         INTEGER PRIMARY KEY,
  product_id INTEGER NOT NULL REFERENCES product(id) ON DELETE CASCADE,
  position   INTEGER NOT NULL,
  spec_key   TEXT,                      -- 'Airflow Rate' when parseable, else NULL
  spec_value TEXT,
  raw_text   TEXT NOT NULL,             -- always populated
  UNIQUE (product_id, position)
);

CREATE TABLE product_image (
  product_id INTEGER NOT NULL REFERENCES product(id) ON DELETE CASCADE,
  image_id   INTEGER NOT NULL REFERENCES image(id),
  position   INTEGER NOT NULL,
  role       TEXT NOT NULL DEFAULT 'feature'
             CHECK (role IN ('hero','gallery','feature','dimension','lifestyle')),
  caption_md TEXT,                      -- ← transcription of text baked into the image
  PRIMARY KEY (product_id, position)
);

CREATE TABLE product_download (
  product_id INTEGER NOT NULL REFERENCES product(id) ON DELETE CASCADE,
  position   INTEGER NOT NULL,
  label      TEXT NOT NULL,
  url        TEXT NOT NULL,
  kind       TEXT NOT NULL DEFAULT 'other'
             CHECK (kind IN ('dimensions','manual','spec-sheet','other')),
  PRIMARY KEY (product_id, position)
);

CREATE TABLE product_video (
  product_id INTEGER NOT NULL REFERENCES product(id) ON DELETE CASCADE,
  position   INTEGER NOT NULL,
  video_id   TEXT NOT NULL,             -- YouTube id
  PRIMARY KEY (product_id, position)
);

CREATE TABLE product_related (
  product_id INTEGER NOT NULL REFERENCES product(id) ON DELETE CASCADE,
  related_id INTEGER NOT NULL REFERENCES product(id) ON DELETE CASCADE,
  position   INTEGER NOT NULL,
  PRIMARY KEY (product_id, related_id),
  CHECK (product_id <> related_id)      -- source has 5 self-references
);

-- ── editorial ──────────────────────────────────────────────────────────────
CREATE TABLE blog_category (
  id   INTEGER PRIMARY KEY,
  slug TEXT NOT NULL UNIQUE,            -- buying-guide | tips-tricks | recipe
  name TEXT NOT NULL,
  sort INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE article (
  id               INTEGER PRIMARY KEY,
  slug             TEXT NOT NULL UNIQUE,
  section          TEXT NOT NULL         -- the URL prefix; authoritative
                   CHECK (section IN ('recipe','buying-guide','tips-tricks')),
  kind             TEXT NOT NULL DEFAULT 'article'
                   CHECK (kind IN ('article','recipe','recipe-roundup')),
  title            TEXT NOT NULL,
  h1               TEXT NOT NULL,
  meta_description TEXT,
  body_md          TEXT NOT NULL,
  word_count       INTEGER NOT NULL DEFAULT 0,
  featured_image_id INTEGER REFERENCES image(id),
  published_at     TEXT NOT NULL,
  modified_at      TEXT,
  is_published     INTEGER NOT NULL DEFAULT 1
);
CREATE INDEX article_section_idx ON article(section, published_at DESC);

-- Many-to-many: the URL section and the editorial category disagree on 10 posts.
CREATE TABLE article_category (
  article_id  INTEGER NOT NULL REFERENCES article(id) ON DELETE CASCADE,
  category_id INTEGER NOT NULL REFERENCES blog_category(id),
  is_primary  INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (article_id, category_id)
);
CREATE UNIQUE INDEX article_primary_cat_idx
  ON article_category(article_id) WHERE is_primary = 1;

-- 0..n per article: the 10 roundup posts hold several recipes each.
CREATE TABLE recipe (
  id            INTEGER PRIMARY KEY,
  article_id    INTEGER NOT NULL REFERENCES article(id) ON DELETE CASCADE,
  position      INTEGER NOT NULL DEFAULT 1,
  name          TEXT NOT NULL,
  description   TEXT,
  prep_minutes  INTEGER,                -- parse PT30M once, at import
  cook_minutes  INTEGER,
  total_minutes INTEGER,
  yield_qty     TEXT,                   -- TEXT: '6-8' exists
  yield_label   TEXT,
  cuisine       TEXT,
  meal_category TEXT,
  calories      TEXT,                   -- only nutrition field the source has
  hero_image_id INTEGER REFERENCES image(id),
  UNIQUE (article_id, position)
);
CREATE TABLE recipe_ingredient (
  recipe_id INTEGER NOT NULL REFERENCES recipe(id) ON DELETE CASCADE,
  position  INTEGER NOT NULL,
  text      TEXT NOT NULL,              -- unparsed: 'All-purpose flour (210g)'
  PRIMARY KEY (recipe_id, position)
);
CREATE TABLE recipe_step (
  recipe_id INTEGER NOT NULL REFERENCES recipe(id) ON DELETE CASCADE,
  position  INTEGER NOT NULL,
  heading   TEXT,
  text      TEXT NOT NULL,
  PRIMARY KEY (recipe_id, position)
);

-- Polymorphic: category pages carry ~12 Q&A each, 5 articles have prose FAQs.
-- SHIPPED DIFFERENTLY: this landed as `category_faq(category_id, ...)` with a
-- real foreign key. A polymorphic owner_id cannot carry one, and
-- `PRAGMA foreign_key_check` in scripts/db-check.mjs is the thing that catches
-- content pointing at a row that no longer exists. Give the article FAQs their
-- own table when they are actually imported.
CREATE TABLE faq (
  id          INTEGER PRIMARY KEY,
  owner_type  TEXT NOT NULL CHECK (owner_type IN ('article','product_category','product')),
  owner_id    INTEGER NOT NULL,
  position    INTEGER NOT NULL,
  question    TEXT NOT NULL,
  answer_md   TEXT NOT NULL,
  UNIQUE (owner_type, owner_id, position)
);

CREATE TABLE article_product (
  article_id   INTEGER NOT NULL REFERENCES article(id) ON DELETE CASCADE,
  product_id   INTEGER NOT NULL REFERENCES product(id) ON DELETE CASCADE,
  PRIMARY KEY (article_id, product_id)
);

-- ── dealers ────────────────────────────────────────────────────────────────
-- Unifies the 75 store CPT records with the 80 hardcoded eWarranty dropdown options.
CREATE TABLE dealer (
  id             INTEGER PRIMARY KEY,
  slug           TEXT NOT NULL UNIQUE,
  name           TEXT NOT NULL,
  region         TEXT NOT NULL CHECK (region IN (
                   'klang-valley','southern','northern','east-coast','sabah-sarawak')),
  address        TEXT NOT NULL,
  phone          TEXT,
  directions_url TEXT,                  -- 74/75 have one
  image_id       INTEGER REFERENCES image(id),
  is_warranty_dealer INTEGER NOT NULL DEFAULT 1,  -- appears in the eWarranty select
  sort_order     INTEGER NOT NULL DEFAULT 0
);
CREATE INDEX dealer_region_idx ON dealer(region, name);

-- ── migration ──────────────────────────────────────────────────────────────
CREATE TABLE redirect (
  from_path TEXT PRIMARY KEY,
  to_path   TEXT NOT NULL,
  code      INTEGER NOT NULL DEFAULT 301
);

-- ── search ─────────────────────────────────────────────────────────────────
-- NO FTS5. Node's bundled SQLite ships without the extension, and a static site
-- has no runtime database to query anyway — site search must be a client-side
-- index generated at build. Revisit when search is actually built.
```

**Why this shape.** No `series` or `region` lookup tables — closed sets that join to nothing, so
`TEXT` + `CHECK` is enough; promote them when they grow editable metadata. Slugs are the join key
in application code; `wp_id` is provenance only. Specs stay as ordered nullable-key rows because the
source has no spec table to import. `faq` is polymorphic because the same shape hangs off articles,
categories and products.

### Surfacing it in Next.js

```
data/sql/*.sql  →  pnpm db:build  →  .data/vatti.db  →  node:sqlite (read-only)
                                                     →  generateStaticParams
                                                     →  next build  →  static HTML
```

Queries live in `src/lib/queries/{product,article,dealer,category}.ts` as plain typed functions.
Components never open the database. Because every read happens at build time, there is no
connection pooling, no caching layer, no `revalidate` — the database does not exist at runtime.

`next.config.ts` generates its `redirects()` array from the `redirect` table at build time, so the
URL contract is data, not code.

---

## 5. URL contract

**Non-negotiable. Every legacy path resolves 200 or 301 — never 404.**

- Trailing slashes are preserved: `trailingSlash: true`.
- All 39 product URLs, all 5 category URLs, all 106 article URLs, all 75 store URLs, all 4 utility
  URLs keep their exact paths.
- The 6 existing category 301s are reproduced exactly.
- `/wp-content/uploads/**` — the catalogue and manuals rank on their own. Since media moves to R2,
  **every legacy asset path gets a 301 to its CDN URL.** This is the highest-risk item in the
  migration and gets its own verification step.
- New 301s to add: 32 CPT permalinks (`/kitchen-hood-categor/*` etc.), `clean-baking-sheets-2`,
  the two merged `induction-vs-ceramic-*` posts, the misspelled air-fryer slug, and the broken
  `induction-cooker-vs-gas-stove-in-malaysia-…` target.

---

## 6. Design direction

The current site never got rebranded — it still renders Elementor's stock "Sahara" palette
(`#2A9D8F` teal, `#264653` slate, `#E9C46A`/`#F4A261`/`#E76F51` accents) while the Astra theme
palette (`#060097`, `#c10fff`) sits unused. Fonts are declared as Roboto but only Inter and Plus
Jakarta Sans actually load, so Roboto silently falls back to system sans.

**A real palette and type scale is a prerequisite, not a polish step.** Proposed before build starts;
see § open questions.

Template-level changes, in value order:

1. **Product pages** — drop the H2 that repeats the H1 verbatim; render specs as a proper two-column
   table with the four normalised facets pulled into a comparison strip; replace the mid-page wall of
   form fields with a sticky enquiry CTA; transcribe the feature-image text into real content.
2. **Category pages** — these earn the traffic. Real filtering off `airflow_m3h` / `capacity_litres`
   rather than Elementor taxonomy chips; a genuine comparison table built from `product_spec`;
   FAQ schema emitted on all five, not two.
3. **Store locator** — 891 KB of HTML for a list. Region-grouped, searchable, one map.
4. **Articles** — restore structured data on the 30 posts publishing none, and rewrite titles and
   meta descriptions for the high-impression/low-CTR set. This is where the CTR deficit lives.
5. **Mobile first throughout** — 64% of traffic.

---

## 7. Build plan

Each phase ends in something verifiable.

**Phase 0 — Foundations**
Next.js + TypeScript + Tailwind scaffold. `trailingSlash: true`. `db:build` and `db:check` scripts.
Palette and type scale locked. *Done when: `pnpm db:build && pnpm dev` serves an empty shell.*

**Phase 1 — Data import**
Transform `research/*.json` into `data/sql/*.sql`. Normalise the four spec facets, reject
self-references, unify the 75 stores with the 80 dealer options, resolve the 10 section/category
mismatches, deduplicate V917. *Done when: `pnpm db:check` passes — no orphans, no duplicate slugs,
no redirect loops, no self-references.*

**Phase 2 — Media migration**
Download all 1,251 assets (including `i0.wp.com` Jetpack-CDN images), re-encode to WebP/AVIF, upload
to R2, populate `image` with `legacy_url` → `r2_key` mapping, generate the asset redirect set.
*Done when: every legacy asset URL 301s to a CDN URL that returns 200, and all ranked PDFs are
verified by hand.*

**Phase 3 — Core templates**
Product detail, category, article/recipe, blog archive, homepage, dealer directory and detail, four
static pages. *Done when: all ~238 URLs build and `pnpm links:check` finds no broken internal link.*

**Phase 4 — Forms**
`/api/enquiry` and `/api/ewarranty` route handlers → Resend. The eWarranty wizard reproduces all 23
fields, the multi-product repeater, the conditional model selects, and the file upload (attached to
the email; nothing persisted). *Done when: both forms deliver, including an attachment.*

**Phase 5 — SEO parity**
Sitemap, robots, canonicals, Open Graph. JSON-LD: `Product` (absent today), `Recipe` (16),
`FAQPage` (all 5 categories + 5 articles), `BlogPosting` (including the 30 currently switched off),
`LocalBusiness` for dealers. *Done when: every URL in the legacy sitemap resolves, verified by
script.*

**Phase 6 — Content upgrades** *(parallel with 3–5; client copy input)*
Transcribe feature-image text into `product_image.caption_md`. Write `intro_md` for the 37 products
with no prose. Alt text for 105 images. Merge the induction-vs-ceramic cluster. Rewrite titles and
meta descriptions for the low-CTR set.

**Phase 7 — Cutover**
Lighthouse and Core Web Vitals check, full-sitemap crawl against production, deploy, resubmit
sitemap, then watch Search Console coverage and rankings daily for two weeks.

---

## 8. Verification

```bash
pnpm db:check        # FK integrity, orphans, duplicate slugs, redirect loops, self-references
pnpm build           # must emit ~238 static routes
pnpm links:check     # crawls built output; fails on any 404 or broken internal link
```

Plus a migration-specific script that reads the **live** legacy sitemap and asserts every URL
resolves 200 or 301 against a preview deployment. That script is the launch gate.

Post-launch, Search Console is the real check: coverage errors should stay flat and the top-20 pages
should hold position. Both are directly observable through the connected GSC property.

---

## 9. Open questions

1. **Palette and typography** — the current colours are an un-rebranded Elementor default. Do you
   have brand guidelines, or should I propose a palette? This blocks Phase 0.
2. **Feature-image transcription** — ~200 images with baked-in text carry the entire product story.
   Client copy, or do we draft from the images and have them approve?
3. **`/oven/` and `/oven/recipe/`** — empty indexable orphan stubs, no inbound links, no traffic.
   Redirect them to `/combi-and-steam-oven-in-malaysia/` and `/category/recipe/`, or build them out?
4. **eWarranty registrations are emailed, not stored.** That follows from build-time SQLite on
   Vercel — there is no writable database at runtime. Given the form captures serial numbers,
   purchase dates and invoices, a searchable registry is a plausible business need. If so, that
   needs a real runtime DB (Turso or Postgres) and is out of the current scope.
5. ~~**Google reviews widget** on category pages — third-party embed. Keep it, or render cached
   reviews from the DB to avoid the render-blocking script?~~ **Resolved: rendered from the DB.**
   Four of the ten reviews the Trustindex widget rotates are in the `review` table, carried over
   verbatim, with the aggregate count as a dated constant in `src/lib/site.ts`. The embed costs a
   render-blocking third-party script on the highest-traffic template on the site and its markup is
   not ours to make accessible. No `Review`/`AggregateRating` JSON-LD is emitted: self-serving
   review markup on your own site is against Google's guidelines and the widget does not publish a
   per-review rating for us to carry anyway. Refreshing the reviews is a SQL edit.
