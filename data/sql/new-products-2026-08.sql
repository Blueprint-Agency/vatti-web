-- V959 (hood) and VH IC09AL (hob): folders from the 2026-08 shoot with no
-- existing product page. New products, image-only — name + gallery, no
-- specs/features/description, same as the DWID3 addition.
--
-- Runs after products.sql (see db-build.mjs ORDER); image ids continue past
-- the 9001-9073 range used there.

INSERT INTO image (id, url, legacy_url, alt, width, height) VALUES (9074, 'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/vatti-cooker-hood-v959-front.webp', NULL, 'Vatti Cooker Hood V959, front view', 1051, 1066);
INSERT INTO image (id, url, legacy_url, alt, width, height) VALUES (9075, 'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/vatti-cooker-hood-v959-front-open.webp', NULL, 'Vatti Cooker Hood V959, front view, canopy open', 1080, 1059);
INSERT INTO image (id, url, legacy_url, alt, width, height) VALUES (9076, 'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/vatti-cooker-hood-v959-quarter-front-open.webp', NULL, 'Vatti Cooker Hood V959, angled view, open', 993, 1068);
INSERT INTO image (id, url, legacy_url, alt, width, height) VALUES (9077, 'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/vatti-cooker-hood-v959-side.webp', NULL, 'Vatti Cooker Hood V959, side view', 382, 1058);
INSERT INTO image (id, url, legacy_url, alt, width, height) VALUES (9078, 'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/vatti-cooker-hood-v959-side-open.webp', NULL, 'Vatti Cooker Hood V959, side view, open', 381, 1055);
INSERT INTO image (id, url, legacy_url, alt, width, height) VALUES (9079, 'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/vatti-cooker-hob-vh-ic09al-front.webp', NULL, 'Vatti Cooker Hob VH IC09AL, front view', 1052, 588);
INSERT INTO image (id, url, legacy_url, alt, width, height) VALUES (9080, 'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/vatti-cooker-hob-vh-ic09al-layer-16.webp', NULL, 'Vatti Cooker Hob VH IC09AL, detail view', 1051, 278);

INSERT INTO product (id, slug, category_id, kind, model_code, secondary_model, name, series, colour_variant, variant_group, intro_md, seo_title, meta_description, hero_image_id, sort_order) VALUES (42, 'vatti-cooker-hood-v959', (SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'range hood', 'V959', NULL, 'Vatti Cooker Hood V959', NULL, NULL, NULL, NULL, NULL, NULL, 9074, (SELECT COALESCE(max(sort_order), -1) + 1 FROM product WHERE category_id = (SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia')));
INSERT INTO product (id, slug, category_id, kind, model_code, secondary_model, name, series, colour_variant, variant_group, intro_md, seo_title, meta_description, hero_image_id, sort_order) VALUES (43, 'vatti-cooker-hob-vh-ic09al', (SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 'hob', 'VH IC09AL', NULL, 'Vatti Cooker Hob VH IC09AL', NULL, NULL, NULL, NULL, NULL, NULL, 9079, (SELECT COALESCE(max(sort_order), -1) + 1 FROM product WHERE category_id = (SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia')));

INSERT INTO product_image (product_id, image_id, position, role) VALUES ((SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v959'), 9074, 900, 'hero');
INSERT INTO product_image (product_id, image_id, position, role) VALUES ((SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v959'), 9075, 901, 'gallery');
INSERT INTO product_image (product_id, image_id, position, role) VALUES ((SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v959'), 9076, 902, 'gallery');
INSERT INTO product_image (product_id, image_id, position, role) VALUES ((SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v959'), 9077, 903, 'gallery');
INSERT INTO product_image (product_id, image_id, position, role) VALUES ((SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v959'), 9078, 904, 'gallery');
INSERT INTO product_image (product_id, image_id, position, role) VALUES ((SELECT id FROM product WHERE slug = 'vatti-cooker-hob-vh-ic09al'), 9079, 900, 'hero');
INSERT INTO product_image (product_id, image_id, position, role) VALUES ((SELECT id FROM product WHERE slug = 'vatti-cooker-hob-vh-ic09al'), 9080, 901, 'gallery');

-- Hood and hob both carry a series taxonomy (category-content.sql), and
-- db:check fails any published product in a category that has one but sits
-- in no term — same problem category-content.sql already solved once for
-- V936/V991 (filed under Family Daily Cooking for lack of a clean fit).
-- With no specs yet to judge these two by, the general/everyday term in each
-- category is the pick least likely to claim a feature they may not have.
INSERT INTO product_collection_member (collection_id, product_id) VALUES ((SELECT id FROM product_collection WHERE slug = 'family-daily-cooking-series' AND category_id = (SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia')), (SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v959'));
INSERT INTO product_collection_member (collection_id, product_id) VALUES ((SELECT id FROM product_collection WHERE slug = 'family-everyday-cooking' AND category_id = (SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia')), (SELECT id FROM product WHERE slug = 'vatti-cooker-hob-vh-ic09al'));
