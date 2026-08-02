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

CREATE TABLE redirect (
  from_path TEXT PRIMARY KEY,
  to_path   TEXT NOT NULL,
  code      INTEGER NOT NULL DEFAULT 301
);
