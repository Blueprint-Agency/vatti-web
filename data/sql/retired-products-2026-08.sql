-- Owner-confirmed discontinued models, 2026-08. Soft removal, not a DELETE:
-- rows stay for provenance, is_published=0 drops them from the category grid,
-- sitemap and generateStaticParams (see product.ts / category.ts, all of which
-- filter on is_published). getProduct() then 404s the bare slug, which is why
-- every one of these needs its own 301 alongside the flag flip — CLAUDE.md's
-- one rule: every URL resolves 200 or 301, never 404.
--
-- Runs after redirects.sql (alphabetical, both outside db-build.mjs's ORDER) —
-- required, since redirects.sql opens with `DELETE FROM redirect;` and would
-- wipe anything inserted before it.

-- DWBB7 was the dishwasher category's featured model (category-content.sql);
-- its retirement needs a successor or the category page fronts a hidden
-- product. DWID3 AG Grey is the only other dishwasher on the site.
UPDATE product_category SET signature_product_id =
  (SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwid3-ag-grey')
  WHERE slug = 'dishwasher-in-malaysia';

UPDATE product SET is_published = 0 WHERE slug IN (
  'athena-series-lifting-type-range-hood-v936',
  'triple-intake-series-t-type-cooker-hood-v937',
  'ceramic-cooker-hob-er3601t',
  'ceramic-cooker-hob-er5902t',
  'vatti-built-in-oven-o7549',
  'vatti-built-in-oven-o755p',
  'vatti-built-in-air-fryer-oven-07559',
  'free-standing-combi-oven-va01',
  'built-in-combi-oven-va03',
  'built-in-combi-oven-va04',
  'built-in-steam-oven-z4501',
  'vatti-dishwasher-dwbb7'
);

INSERT INTO redirect (from_path, to_path, code) VALUES
  ('/athena-series-lifting-type-range-hood-v936/', '/kitchen-hood-in-malaysia/', 301),
  ('/triple-intake-series-t-type-cooker-hood-v937/', '/kitchen-hood-in-malaysia/', 301),
  ('/ceramic-cooker-hob-er3601t/', '/cooker-hob-in-malaysia/', 301),
  ('/ceramic-cooker-hob-er5902t/', '/cooker-hob-in-malaysia/', 301),
  ('/vatti-built-in-oven-o7549/', '/combi-and-steam-oven-in-malaysia/', 301),
  ('/vatti-built-in-oven-o755p/', '/combi-and-steam-oven-in-malaysia/', 301),
  ('/vatti-built-in-air-fryer-oven-07559/', '/combi-and-steam-oven-in-malaysia/', 301),
  ('/free-standing-combi-oven-va01/', '/combi-and-steam-oven-in-malaysia/', 301),
  ('/built-in-combi-oven-va03/', '/combi-and-steam-oven-in-malaysia/', 301),
  ('/built-in-combi-oven-va04/', '/combi-and-steam-oven-in-malaysia/', 301),
  ('/built-in-steam-oven-z4501/', '/combi-and-steam-oven-in-malaysia/', 301),
  ('/vatti-dishwasher-dwbb7/', '/dishwasher-in-malaysia/', 301);

-- Eight rows already in redirects.sql land on one of the URLs above — without
-- this they'd become two-hop chains (legacy path -> retired product -> category).
-- from_path is the table's PRIMARY KEY, so REPLACE overwrites to_path in place.
INSERT OR REPLACE INTO redirect (from_path, to_path, code) VALUES
  ('/kitchen-hood-categor/triple-intake-series-v937/', '/kitchen-hood-in-malaysia/', 301),
  ('/cooker-hob-category/ceramic-cooker-hob-er3601t/', '/cooker-hob-in-malaysia/', 301),
  ('/cooker-hob-category/ceramic-cooker-hob-er5902t/', '/cooker-hob-in-malaysia/', 301),
  ('/vatti-built-in-air-fryer-oven-o7559/', '/combi-and-steam-oven-in-malaysia/', 301),
  ('/combine-oven-cate/vatti-built-in-air-fryer-oven-o7559/', '/combi-and-steam-oven-in-malaysia/', 301),
  ('/combine-oven-cate/combi-oven-va03/', '/combi-and-steam-oven-in-malaysia/', 301),
  ('/home-2/', '/dishwasher-in-malaysia/', 301),
  ('/dishwasher-cate/vatti-dishwasher-dwbb7/', '/dishwasher-in-malaysia/', 301);
