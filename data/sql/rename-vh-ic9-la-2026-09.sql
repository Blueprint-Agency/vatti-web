-- The hob added in new-products-2026-08.sql went in as "VH IC09AL", read off
-- the 2026-08 shoot folder. The owner corrected the model to VH-IC9-LA on
-- 2026-09-14 (the catalogue, p.21, prints it that way too). The model code,
-- name, alt text and SEO fields are fixed at source in that file and in
-- seo-metadata-2026-09.sql; the slug moved with them, so the URL the page
-- has already been served under must 301, not 404.
--
-- The two image keys keep their -ic09al- spelling: a bucket key is not
-- visible to a visitor, and a renamed key would be a new object to upload
-- for no gain.
--
-- Runs after redirects.sql (alphabetical, both outside db-build.mjs's ORDER),
-- which opens with `DELETE FROM redirect;`.

INSERT INTO redirect (from_path, to_path, code) VALUES
  ('/vatti-cooker-hob-vh-ic09al/', '/vatti-cooker-hob-vh-ic9-la/', 301);
