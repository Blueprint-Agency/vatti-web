-- SEO metadata corrections, 2026-09-11.
--
-- Two separate problems, both in the <title> / <meta name="description"> pair
-- that `productMetadata()` reads (src/app/[slug]/page.tsx):
--
--   1. V931 carried the V960's title and description verbatim.
--   2. Four products shipped with no description tag at all.
--
-- Why a correction file and not an edit in place: products.sql is generated
-- ("do not hand-edit"), so a fix typed into it dies at the next
-- `node scripts/import-products.mjs`. The V931 error came off the source site
-- in the scrape, which means the importer will faithfully reproduce it every
-- time — the correction has to outlive the regeneration, so it lives here.
-- Same pattern as retired-products-2026-08.sql and v917-batik-fix-2026-08.sql.
--
-- Load order (db-build.mjs: explicit ORDER first, then the rest sorted) puts
-- this after products.sql, new-products-2026-08.sql and
-- product-images-2026-08.sql, so every row below exists by the time it runs.
-- It is deliberately before v917-batik-fix-2026-08.sql, which owns the V917
-- rows; nothing here touches them.

-- ── 1. V931 was advertising a different model ──────────────────────────────
-- seo_title and meta_description were byte-identical to product id 14
-- (vatti-stellar-series-cooker-hood-v960), so every search result for the
-- Artemis V931 named the Stellar V960 and promised smart WiFi control — which
-- the V931 does not have.
--
-- The replacement is written from the V931's own product_spec rows: 1860m3/h
-- airflow, 420Pa, 54dB, 85% oil filtration, hand sensor, Tru-clean steam wash.
-- No claim here that is not in that table.
UPDATE product SET
  seo_title = 'VATTI Artemis Series Cooker Hood V931',
  meta_description = 'VATTI Artemis Series Cooker Hood V931: a T-type hood with 1860m3/h airflow, hand sensor control, Tru-clean steam wash and 85% oil filtration at 54dB.'
WHERE slug = 'artemis-series-t-type-range-hood-v931';

-- ── 2. Four products with no description at all ────────────────────────────
-- These four were added image-only and deliberately so — new-products-2026-08.sql
-- says "name + gallery, no specs/features/description". That is fine for the
-- page, which renders what it has, but it left `meta_description` NULL, and
-- productMetadata() maps NULL to `undefined`, so the pages shipped with no
-- description meta tag and no og:description for a crawler or a WhatsApp
-- preview to use.
--
-- They still have no product_spec, product_facet, product_feature or
-- product_faq rows, so there is nothing to quote. The copy below therefore
-- describes only what is demonstrably true — the model, the appliance type,
-- the finish, what the gallery actually shows, and the dealer route that every
-- other page ends in. No airflow figures, no capacities, no programme counts.
-- When VATTI supplies real specs, rewrite these from the spec table rather
-- than padding them.

-- Two finishes of one dishwasher. The descriptions stay close because the
-- appliances are identical apart from the front; the finish is the only honest
-- differentiator and it is the thing a shopper is choosing between.
UPDATE product SET
  seo_title = 'VATTI Dishwasher DWID3 (AG Grey)',
  meta_description = 'The VATTI DWID3 dishwasher in an AG Grey finish. See the gallery inside and out, then enquire through an authorised VATTI dealer in Malaysia.'
WHERE slug = 'vatti-dishwasher-dwid3-ag-grey';

UPDATE product SET
  seo_title = 'VATTI Dishwasher DWID3 (White)',
  meta_description = 'The VATTI DWID3 dishwasher in a white finish. See the gallery, then enquire through an authorised VATTI dealer in Malaysia for pricing and installation.'
WHERE slug = 'vatti-dishwasher-dwid3-white';

-- The V959 is the one model on the site with a published instruction manual
-- (src/lib/manuals.ts), and the QR landing page links here — so the manual is
-- both true and the most useful thing this page offers today.
UPDATE product SET
  seo_title = 'VATTI Cooker Hood V959',
  meta_description = 'The VATTI Cooker Hood V959. See the gallery with the canopy open and closed, download the instruction manual, and find an authorised dealer in Malaysia.'
WHERE slug = 'vatti-cooker-hood-v959';

-- No spec row states the heating type, and the model code is not evidence, so
-- this says "cooker hob" and nothing more. Do not write "induction" here until
-- a product_spec row says so.
UPDATE product SET
  seo_title = 'VATTI Cooker Hob VH IC09AL',
  meta_description = 'The VATTI Cooker Hob VH IC09AL, part of the VATTI built-in kitchen range. See the gallery and find an authorised VATTI dealer in Malaysia to enquire.'
WHERE slug = 'vatti-cooker-hob-vh-ic09al';

-- ── 3. The two V917 colourways shared one description ──────────────────────
-- Byte-identical meta_description on both rows, which Search Console reports
-- as a duplicate. The titles already differ, so only the description needs to;
-- the finish is the real difference between the two pages and the thing a
-- shopper is choosing, so it is what each one leads with. The shared spec
-- claims (suction, noise, hand sensor, oil filtration) are unchanged and still
-- come from the V917's own spec rows.
--
-- Note the colour names: v917-white is "Batik White" and v917-carbon-grey is
-- "Carbon Black", both renamed by v917-batik-fix-2026-08.sql. The slugs are
-- legacy URLs and stay wrong on purpose.
UPDATE product SET
  meta_description = 'VATTI Cooker Hood V917 in Carbon Black: powerful suction, low noise, hand sensor control and advanced oil filtration in a dark brushed finish.'
WHERE slug = 'vatti-cooker-hood-v917-carbon-grey';

UPDATE product SET
  meta_description = 'VATTI Cooker Hood V917 in Batik White: powerful suction, low noise, hand sensor control and advanced oil filtration in a patterned white finish.'
WHERE slug = 'vatti-cooker-hood-v917-white';
