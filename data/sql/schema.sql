-- Vatti Malaysia — schema. Compiled to .data/vatti.db by scripts/db-build.mjs.
-- Read at BUILD TIME ONLY. There is no database at runtime.
--
-- ponytail: no FTS5. Node's bundled SQLite ships without the extension, and a
-- static site has no runtime DB to query anyway — site search must be a
-- client-side index generated at build. Add that when search is actually built.

PRAGMA foreign_keys = ON;

-- One row per asset. Doubles as the R2 migration manifest: legacy_url is the
-- WordPress path we must keep 301-ing, url is where it lives now.
CREATE TABLE image (
  id         INTEGER PRIMARY KEY,
  url        TEXT NOT NULL,
  legacy_url TEXT UNIQUE,
  alt        TEXT,
  width      INTEGER,
  height     INTEGER
);

-- The 5 live category pages. Note oven + combi-steam oven + microwave all sit
-- under combi-and-steam-oven-in-malaysia, so kind is NOT unique here — it lives
-- on product instead.
CREATE TABLE product_category (
  id               INTEGER PRIMARY KEY,
  slug             TEXT NOT NULL UNIQUE,   -- 'kitchen-hood-in-malaysia'
  name             TEXT NOT NULL,          -- 'Kitchen Hood'
  h1               TEXT,
  seo_title        TEXT,
  meta_description TEXT,
  intro_md         TEXT,
  sort_order       INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE product (
  id               INTEGER PRIMARY KEY,
  slug             TEXT NOT NULL UNIQUE,
  category_id      INTEGER NOT NULL REFERENCES product_category(id),
  kind             TEXT NOT NULL CHECK (kind IN (
                     'range hood','hob','oven','combi-steam oven',
                     'microwave','dishwasher','water purifier')),
  model_code       TEXT NOT NULL,
  secondary_model  TEXT,
  name             TEXT NOT NULL,
  series           TEXT,
  colour_variant   TEXT,
  variant_group    TEXT,
  intro_md         TEXT,
  seo_title        TEXT,
  meta_description TEXT,
  hero_image_id    INTEGER REFERENCES image(id),
  is_published     INTEGER NOT NULL DEFAULT 1,
  sort_order       INTEGER NOT NULL DEFAULT 0
);
CREATE INDEX product_category_idx ON product(category_id, sort_order);
CREATE INDEX product_variant_idx  ON product(variant_group);

-- The readout strip. One row per measured value, extracted from spec text at
-- import — 72% of the numbers live in UNKEYED bullets ("Low noise level 53db"),
-- so this cannot be read straight off a key/value column.
CREATE TABLE product_facet (
  product_id      INTEGER NOT NULL REFERENCES product(id) ON DELETE CASCADE,
  facet           TEXT NOT NULL,  -- airflow | pressure | noise | filtration | power | capacity | flow
  value           REAL NOT NULL,
  unit            TEXT NOT NULL,  -- m³/h | Pa | dB | % | kW | L | L/min
  label           TEXT NOT NULL,  -- 'Airflow'
  position        INTEGER NOT NULL,
  -- product_spec.position this was extracted from. The spec list hides these
  -- rows so the readout strip does not repeat itself two sections later.
  source_position INTEGER NOT NULL,
  PRIMARY KEY (product_id, facet)
);

-- Ordered bullets with a NULLABLE key. The source site has no spec table; only
-- 41 of 332 bullets parse as "Key: Value". Do not widen this into columns.
CREATE TABLE product_spec (
  id         INTEGER PRIMARY KEY,
  product_id INTEGER NOT NULL REFERENCES product(id) ON DELETE CASCADE,
  position   INTEGER NOT NULL,
  spec_key   TEXT,
  spec_value TEXT,
  raw_text   TEXT NOT NULL,
  UNIQUE (product_id, position)
);

CREATE TABLE product_image (
  product_id INTEGER NOT NULL REFERENCES product(id) ON DELETE CASCADE,
  image_id   INTEGER NOT NULL REFERENCES image(id),
  position   INTEGER NOT NULL,
  role       TEXT NOT NULL DEFAULT 'feature'
             CHECK (role IN ('hero','gallery','feature','dimension','lifestyle')),
  caption_md TEXT,   -- transcription of text baked into the source JPEG (Phase 6)
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
  video_id   TEXT NOT NULL,
  PRIMARY KEY (product_id, position)
);

CREATE TABLE product_related (
  product_id INTEGER NOT NULL REFERENCES product(id) ON DELETE CASCADE,
  related_id INTEGER NOT NULL REFERENCES product(id) ON DELETE CASCADE,
  position   INTEGER NOT NULL,
  PRIMARY KEY (product_id, related_id),
  CHECK (product_id <> related_id)   -- source has 5 self-references; rejected at import
);

-- ── editorial ──────────────────────────────────────────────────────────────
-- Only 3 categories exist and there are NO tags — the tag-like strings in the
-- scrape are Rank Math focus keywords (72 distinct, near 1:1 with posts). They
-- are not a taxonomy and are deliberately not imported.
CREATE TABLE blog_category (
  id         INTEGER PRIMARY KEY,
  slug       TEXT NOT NULL UNIQUE,   -- buying-guide | tips-tricks | recipe
  name       TEXT NOT NULL,          -- 'Tips & Tricks'
  sort_order INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE article (
  id                INTEGER PRIMARY KEY,
  slug              TEXT NOT NULL UNIQUE,
  -- The canonical path, stored rather than derived. Several articles are also
  -- indexed at a ROOT path (/how-to-clean-white-spots-on-glass-stove-tops/ earns
  -- 976 clicks, the sectioned twin 398), so "one URL per article" is false on
  -- this site. This column is the one that resolves 200; every other variant is
  -- a row in `redirect`. No leading slash, no trailing slash.
  path              TEXT NOT NULL UNIQUE,   -- 'tips-tricks/what-is-auto-clean'
  -- The URL prefix, and it is authoritative — see article_category for the 10
  -- posts WordPress files under a different category than their URL says.
  -- 'uncategorized' is one live legacy URL, not an editorial section.
  section           TEXT NOT NULL CHECK (section IN (
                      'buying-guide','tips-tricks','recipe','uncategorized')),
  title             TEXT NOT NULL,
  h1                TEXT,
  meta_description  TEXT,
  body_md           TEXT NOT NULL,
  word_count        INTEGER NOT NULL DEFAULT 0,
  reading_minutes   INTEGER,          -- source stores '5 minutes of reading'
  author            TEXT,             -- always 'Vatti Malaysia' or NULL; see below
  featured_image_id INTEGER REFERENCES image(id),
  published_at      TEXT NOT NULL,    -- ISO 8601 with +08:00 offset, as scraped
  modified_at       TEXT,             -- 3 of 106 have none
  -- 30 posts emit "@type":"Off" instead of BlogPosting — Rank Math schema was
  -- switched off in a bulk edit. Those same 30 are exactly the rows with a NULL
  -- author, because the author only ever existed inside that JSON-LD. Kept as a
  -- flag so Phase 5 can find them; the rebuild emits schema for all of them.
  schema_disabled   INTEGER NOT NULL DEFAULT 0,
  is_published      INTEGER NOT NULL DEFAULT 1
);
CREATE INDEX article_section_idx ON article(section, published_at DESC);

-- Many-to-many, because the URL section and the editorial category disagree on
-- 10 posts. is_primary always follows the URL — see CLAUDE.md, the URL wins.
CREATE TABLE article_category (
  article_id  INTEGER NOT NULL REFERENCES article(id) ON DELETE CASCADE,
  category_id INTEGER NOT NULL REFERENCES blog_category(id),
  is_primary  INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (article_id, category_id)
);
CREATE UNIQUE INDEX article_primary_cat_idx
  ON article_category(article_id) WHERE is_primary = 1;

CREATE TABLE article_image (
  article_id INTEGER NOT NULL REFERENCES article(id) ON DELETE CASCADE,
  image_id   INTEGER NOT NULL REFERENCES image(id),
  position   INTEGER NOT NULL,
  PRIMARY KEY (article_id, position)
);

-- A navigation index, not a rendering source — body_md already carries every
-- link inline. This exists so cross-link modules (related products, related
-- reading) and the link audit can be built from SQL instead of by re-parsing
-- markdown. One row per link; where the source repeats an href under several
-- anchors, the first anchor wins.
CREATE TABLE article_link (
  article_id INTEGER NOT NULL REFERENCES article(id) ON DELETE CASCADE,
  position   INTEGER NOT NULL,
  kind       TEXT NOT NULL CHECK (kind IN (
               'product','product-category','article','wp-category',
               'home','other-page','external')),
  href       TEXT NOT NULL,
  target_slug TEXT,             -- internal targets only; NULL on external
  anchor     TEXT,
  PRIMARY KEY (article_id, position)
);
CREATE INDEX article_link_target_idx ON article_link(kind, target_slug);

-- 0..n per article. Only 16 of 26 recipe posts carry real Recipe JSON-LD; the
-- other 10 are '5-*' roundups holding several recipes each as prose, which is
-- why this hangs off article with a position instead of being 1:1.
CREATE TABLE recipe (
  id            INTEGER PRIMARY KEY,
  article_id    INTEGER NOT NULL REFERENCES article(id) ON DELETE CASCADE,
  position      INTEGER NOT NULL DEFAULT 1,
  name          TEXT NOT NULL,
  description   TEXT,
  prep_minutes  INTEGER,        -- PT30M parsed once, at import
  cook_minutes  INTEGER,
  total_minutes INTEGER,
  yield_qty     TEXT,           -- TEXT because '6-8' exists
  yield_label   TEXT,           -- '6-8 servings'
  cuisine       TEXT,           -- source is an array; joined, 0-2 values
  meal_category TEXT,
  calories      TEXT,           -- only nutrition field present; '200 - 300 kcal' exists
  -- The recipe card's '### Note' line. Not in the JSON-LD — it only ever existed
  -- in the card markup that the importer strips, so without this column it is
  -- lost. 15 of 16 have one; 14 are yield boilerplate and one (spicy-enoki)
  -- carries real method detail that appears nowhere else on the page.
  notes         TEXT,
  hero_image_id INTEGER REFERENCES image(id),
  UNIQUE (article_id, position)
);

CREATE TABLE recipe_ingredient (
  recipe_id INTEGER NOT NULL REFERENCES recipe(id) ON DELETE CASCADE,
  position  INTEGER NOT NULL,
  text      TEXT NOT NULL,      -- unparsed: 'All-purpose flour (210g)'
  PRIMARY KEY (recipe_id, position)
);

-- No heading column: the source's step `name` is byte-identical to `text` in all
-- 135 steps. No image column either: no step has one.
CREATE TABLE recipe_step (
  recipe_id INTEGER NOT NULL REFERENCES recipe(id) ON DELETE CASCADE,
  position  INTEGER NOT NULL,
  text      TEXT NOT NULL,
  PRIMARY KEY (recipe_id, position)
);

-- ── stores ─────────────────────────────────────────────────────────────────
-- The 75-dealer retail network. Live URLs are /store/<slug>/ and the slug comes
-- from the WP REST `store` CPT, NOT from research/stores.json — that scrape
-- records stale root-level permalinks (/adamas/) which 301 to the homepage
-- today, and its slugs agree with the real ones on only 14 of 75 rows.
-- Probing the stale paths looks like success because a 301 to nowhere is not a
-- 404. Verified live 8 Aug 2026:
--   /adamas/                                        301 -> homepage
--   /store/adamas/                                  404
--   /store/southern-region-adamas-trading-m-sdn-bhd/ 200
-- These 75 URLs are in no sitemap; they exist only via the REST API.
--
-- Because they live under /store/, stores do NOT share the root [slug] segment
-- with products and categories — they need their own route.
--
-- ponytail: no is_warranty_dealer flag. The eWarranty dropdown's 80 hardcoded
-- options are not in this scrape, so the flag would be a guess on every row.
-- Add it when that list is actually extracted.
CREATE TABLE store (
  id             INTEGER PRIMARY KEY,
  slug           TEXT NOT NULL UNIQUE,   -- authoritative, from WP REST
  path           TEXT NOT NULL UNIQUE,   -- 'store/<slug>' — the URL that resolves 200
  wp_id          INTEGER,                -- provenance only; never join on this
  name           TEXT NOT NULL,
  region         TEXT NOT NULL,          -- 'Klang Valley Malaysia'
  region_slug    TEXT NOT NULL CHECK (region_slug IN (
                   'klang-valley-malaysia','southern-region-malaysia',
                   'northern-region-malaysia','east-coast-malaysia','sabah-sarawak')),
  address        TEXT NOT NULL,
  phone          TEXT,
  directions_url TEXT,                   -- 74/75 have one
  image_id       INTEGER REFERENCES image(id),
  sort_order     INTEGER NOT NULL DEFAULT 0
);
CREATE INDEX store_region_idx ON store(region_slug, name);

CREATE TABLE redirect (
  from_path TEXT PRIMARY KEY,
  to_path   TEXT NOT NULL,
  code      INTEGER NOT NULL DEFAULT 301
);
