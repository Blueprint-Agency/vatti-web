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
--
-- 2026-09-15: five of the original twelve came back. The 2026 catalogue's
-- dimension pages (p.22) still draw the V937, ER3601T, ER5902T, 07559 and
-- DWBB7, and the owner asked for their pages resumed. They are simply removed
-- from the lists below: the flag flips back, their five 301s and the seven
-- chain fixes that pointed legacy paths past them go, and redirects.sql's own
-- rows land on the product pages again. The seven that stay retired are the
-- V936, O7549, O755P, VA01, VA03, VA04 and Z4501.

-- DWBB7 was the dishwasher category's featured model (category-content.sql).
-- Its retirement needed a successor, and the DWID3 AG Grey took the spot. The
-- DWBB7 is back on sale as of 2026-09-15 but the DWID3 keeps the front of the
-- category: it is the newer machine and the one the brand pack was built for.
UPDATE product_category SET signature_product_id =
  (SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwid3-ag-grey')
  WHERE slug = 'dishwasher-in-malaysia';

UPDATE product SET is_published = 0 WHERE slug IN (
  'athena-series-lifting-type-range-hood-v936',
  'vatti-built-in-oven-o7549',
  'vatti-built-in-oven-o755p',
  'free-standing-combi-oven-va01',
  'built-in-combi-oven-va03',
  'built-in-combi-oven-va04',
  'built-in-steam-oven-z4501'
);

INSERT INTO redirect (from_path, to_path, code) VALUES
  ('/athena-series-lifting-type-range-hood-v936/', '/kitchen-hood-in-malaysia/', 301),
  ('/vatti-built-in-oven-o7549/', '/combi-and-steam-oven-in-malaysia/', 301),
  ('/vatti-built-in-oven-o755p/', '/combi-and-steam-oven-in-malaysia/', 301),
  ('/free-standing-combi-oven-va01/', '/combi-and-steam-oven-in-malaysia/', 301),
  ('/built-in-combi-oven-va03/', '/combi-and-steam-oven-in-malaysia/', 301),
  ('/built-in-combi-oven-va04/', '/combi-and-steam-oven-in-malaysia/', 301),
  ('/built-in-steam-oven-z4501/', '/combi-and-steam-oven-in-malaysia/', 301);

-- One row already in redirects.sql lands on a URL above — without this it
-- would be a two-hop chain (legacy path -> retired product -> category).
-- from_path is the table's PRIMARY KEY, so REPLACE overwrites to_path in place.
-- (Seven more such rows were rewritten here while the V937, the two ceramic
-- hobs, the 07559 and the DWBB7 were retired; they are gone with the
-- restoration and redirects.sql's originals land on the product pages again.)
INSERT OR REPLACE INTO redirect (from_path, to_path, code) VALUES
  ('/combine-oven-cate/combi-oven-va03/', '/combi-and-steam-oven-in-malaysia/', 301);
