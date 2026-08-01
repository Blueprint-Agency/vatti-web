-- VATTI Malaysia — product data model (SQLite)
-- Derived from 39 scraped product detail pages (research/products.json).
-- ponytail: no `categories`/`series` lookup tables — 7 categories and 12 series are
-- closed sets that never join to anything. TEXT + CHECK. Add tables when either
-- grows editable metadata (hero copy, icon, sort order).

PRAGMA foreign_keys = ON;

CREATE TABLE products (
  id                INTEGER PRIMARY KEY,
  slug              TEXT NOT NULL UNIQUE,          -- 'athena-series-lifting-type-range-hood-v993'
  model_code        TEXT NOT NULL,                 -- 'V993','C835G','ER5902T','VA06','DWBB7'
  secondary_model   TEXT,                          -- only WDHG01 bundles V818WD
  name              TEXT NOT NULL,                 -- cleaned H1
  category          TEXT NOT NULL CHECK (category IN (
                      'range-hood','hob','oven','combi-steam-oven',
                      'microwave','dishwasher','water-purifier')),
  series            TEXT CHECK (series IN (
                      'Athena','Artemis','Triple Intake','Slim','Magic','Aetheris',
                      'Hidden','Stellar','Professional','Flexi','Oylimpic','Smart Oxygen')),
  colour_variant    TEXT,                          -- 'Carbon Grey' / 'White' (V917 only)
  variant_group     TEXT,                          -- shared key for colourways: 'V917'
  intro             TEXT,                          -- marketing prose; present on only 2/39 today
  seo_title         TEXT,
  meta_description  TEXT,
  og_image_url      TEXT,
  hero_image_id     INTEGER REFERENCES product_images(id) ON DELETE SET NULL,
  -- ponytail: only the facets that actually exist on the source and are worth
  -- sorting/filtering by. Everything else stays in product_specs as text.
  airflow_m3h       INTEGER,                       -- range hoods: 16/16
  air_pressure_pa   INTEGER,                       -- range hoods: 16/16
  noise_db          INTEGER,                       -- range hoods: 15/16
  capacity_litres   INTEGER,                       -- ovens/combi/microwave/dishwasher
  price_cents       INTEGER,                       -- no prices on the live site; nullable
  currency          TEXT NOT NULL DEFAULT 'MYR',
  whatsapp_url      TEXT,                          -- only marketplace/CTA link found (wa.me)
  is_published      INTEGER NOT NULL DEFAULT 1,
  sort_order        INTEGER NOT NULL DEFAULT 0,
  created_at        TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at        TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX products_category_idx ON products(category, sort_order);
CREATE INDEX products_series_idx   ON products(series);
CREATE INDEX products_variant_idx  ON products(variant_group);

-- Specs are NOT a table on the source: they are a flat "➥" bullet list.
-- Only 41 of 332 bullets parse as "Key: Value"; the rest are feature sentences.
-- So: one ordered row per bullet, nullable key. Do not force a column-per-spec.
CREATE TABLE product_specs (
  id          INTEGER PRIMARY KEY,
  product_id  INTEGER NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  position    INTEGER NOT NULL,
  spec_key    TEXT,        -- 'Airflow Rate' when the bullet was "Key : Value", else NULL
  spec_value  TEXT,        -- '2500m3/h'
  raw_text    TEXT NOT NULL, -- always populated; the bullet exactly as rendered
  UNIQUE (product_id, position)
);
CREATE INDEX product_specs_key_idx ON product_specs(spec_key);

CREATE TABLE product_images (
  id            INTEGER PRIMARY KEY,
  product_id    INTEGER NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  position      INTEGER NOT NULL,
  url           TEXT NOT NULL,
  alt           TEXT,          -- missing on 105 of 418 source images
  width         INTEGER,
  height        INTEGER,
  role          TEXT NOT NULL DEFAULT 'feature'
                CHECK (role IN ('hero','gallery','feature','dimension','lifestyle')),
  wp_attachment_id INTEGER,    -- provenance for re-import
  UNIQUE (product_id, position)
);
CREATE INDEX product_images_role_idx ON product_images(product_id, role);

CREATE TABLE product_downloads (
  id          INTEGER PRIMARY KEY,
  product_id  INTEGER NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  position    INTEGER NOT NULL,
  label       TEXT NOT NULL,   -- 'Dimensions','Manual','WDHG01 Manual','V818WD Manual'
  url         TEXT NOT NULL,
  kind        TEXT NOT NULL DEFAULT 'other'
              CHECK (kind IN ('dimensions','manual','spec-sheet','other')),
  UNIQUE (product_id, position)
);

CREATE TABLE product_videos (
  id          INTEGER PRIMARY KEY,
  product_id  INTEGER NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  position    INTEGER NOT NULL,
  provider    TEXT NOT NULL DEFAULT 'youtube',
  video_id    TEXT NOT NULL,   -- 'Jcui1pueXCg'
  UNIQUE (product_id, position)
);

-- "You May Be Interested In These!" — hand-curated on the source, 4 per product.
CREATE TABLE product_related (
  product_id  INTEGER NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  related_id  INTEGER NOT NULL REFERENCES products(id) ON DELETE CASCADE,
  position    INTEGER NOT NULL,
  PRIMARY KEY (product_id, related_id),
  CHECK (product_id <> related_id)   -- source has 5 self-references; reject on import
);

-- Search. FTS5 external-content over the fields users actually type.
CREATE VIRTUAL TABLE products_fts USING fts5(
  name, model_code, series, specs_text,
  content='', tokenize='porter unicode61'
);

CREATE TRIGGER products_touch AFTER UPDATE ON products BEGIN
  UPDATE products SET updated_at = datetime('now') WHERE id = NEW.id;
END;
