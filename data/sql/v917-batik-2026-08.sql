-- V917's third colourway: Batik. Carbon Grey/White already existed; this
-- shoot only supplied Batik and "Carbon Black" (see the rename in
-- v917-colors-2026-08.sql — the existing "Carbon Grey" product is the same
-- unit, renamed to match the real finish name). Image-only, same as the
-- other 2026-08 additions: name + gallery, specs/features pending from Vatti.
--
-- Runs after products.sql and category-content.sql (see db-build.mjs ORDER
-- plus alphabetical fallback — needs product_collection to already exist).

INSERT INTO image (id, url, legacy_url, alt, width, height) VALUES (9081, 'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/vatti-cooker-hood-v917-batik-front.webp', NULL, 'VATTI Cooker Hood V917 (Batik), front view', 1079, 1001);
INSERT INTO image (id, url, legacy_url, alt, width, height) VALUES (9082, 'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/vatti-cooker-hood-v917-batik-quarter-front.webp', NULL, 'VATTI Cooker Hood V917 (Batik), angled view', 1068, 1058);

INSERT INTO product (id, slug, category_id, kind, model_code, secondary_model, name, series, colour_variant, variant_group, intro_md, seo_title, meta_description, hero_image_id, sort_order) VALUES (44, 'vatti-cooker-hood-v917-batik', (SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'range hood', 'V917', NULL, 'VATTI Cooker Hood V917 (Batik)', NULL, 'Batik', 'V917', NULL, 'VATTI Cooker Hood V917 (Batik)', NULL, 9081, (SELECT COALESCE(max(sort_order), -1) + 1 FROM product WHERE category_id = (SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia')));

INSERT INTO product_image (product_id, image_id, position, role) VALUES ((SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v917-batik'), 9081, 900, 'hero');
INSERT INTO product_image (product_id, image_id, position, role) VALUES ((SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v917-batik'), 9082, 901, 'gallery');

-- Same series term as the other two V917 colourways (category-content.sql).
INSERT INTO product_collection_member (collection_id, product_id) VALUES ((SELECT id FROM product_collection WHERE slug = 'family-daily-cooking-series' AND category_id = (SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia')), (SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v917-batik'));
