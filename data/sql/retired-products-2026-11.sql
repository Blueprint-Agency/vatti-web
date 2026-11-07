-- Owner-confirmed discontinued models, 2026-11-07: the V991 and the V996.
-- Same soft removal as retired-products-2026-08.sql, and for the same reason
-- the owner may bring them back: rows stay, is_published=0 drops them from the
-- category grid, the series filter, the sitemap and generateStaticParams, and a
-- 301 to the hood category keeps both URLs off 404.
--
-- To restore one, delete its slug from the UPDATE, its 301 and (for the V996)
-- the chain fix below. Everything else — features, FAQs, dimensions, images,
-- translations, series membership — was never touched and comes back with it.
--
-- Not changed, on purpose:
--   * warranty.sql keeps V991 and V996 on the eWarranty model list, for buyers
--     who already own one.
--   * Article links to either page now 301 to the category (db:check counts a
--     redirect source as a valid target). The prose that recommends them is an
--     editorial job, not a mechanical one; see the N3 best-hood piece in three
--     languages, the ms/zh hood buying guides and articles 98-100.
--
-- Must sort after redirects.sql, which opens with `DELETE FROM redirect;`.

UPDATE product SET is_published = 0 WHERE slug IN (
  'athena-series-lifting-type-range-hood-v991',
  'vatti-slim-series-type-range-hood-v996'
);

INSERT INTO redirect (from_path, to_path, code) VALUES
  ('/athena-series-lifting-type-range-hood-v991/', '/kitchen-hood-in-malaysia/', 301),
  ('/vatti-slim-series-type-range-hood-v996/', '/kitchen-hood-in-malaysia/', 301);

-- A legacy row in redirects.sql lands on the V996; without this it would be a
-- two-hop chain. from_path is the PRIMARY KEY, so REPLACE rewrites it in place.
INSERT OR REPLACE INTO redirect (from_path, to_path, code) VALUES
  ('/kitchen-hood-categor/slim-series-type-v996/', '/kitchen-hood-in-malaysia/', 301);
