-- Correction to v917-batik-2026-08.sql: Batik is not a third V917 colourway,
-- it is the pattern name for the existing "White" product — Batik White.
-- Two colours total: Carbon Black and Batik White.
--
-- Runs after v917-batik-2026-08.sql (alphabetical: "-fix" > "" at that byte),
-- so it can delete what that file inserted.

-- The standalone Batik product was live for under an hour and carries no
-- legacy history, but a redirect costs nothing and a bare DELETE would 404
-- anyone who already opened the link.
INSERT INTO redirect (from_path, to_path, code) VALUES
  ('/vatti-cooker-hood-v917-batik/', '/vatti-cooker-hood-v917-white/', 301);

-- Cascades product_image and product_collection_member for that product, but
-- NOT the `image` rows (image_id 9081/9082) — those get reattached below
-- rather than deleted, since they become White's photos.
DELETE FROM product WHERE slug = 'vatti-cooker-hood-v917-batik';

-- The Batik photos (still on R2 under the v917-batik-* keys, orphaned by the
-- delete above) become White's images. The slug stays
-- 'vatti-cooker-hood-v917-white' — legacy URL, unchanged.
DELETE FROM product_image
 WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v917-white')
   AND role IN ('hero', 'gallery');
INSERT INTO product_image (product_id, image_id, position, role) VALUES
  ((SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v917-white'),
   (SELECT id FROM image WHERE url = 'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/vatti-cooker-hood-v917-batik-front.webp'),
   900, 'hero'),
  ((SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v917-white'),
   (SELECT id FROM image WHERE url = 'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/vatti-cooker-hood-v917-batik-quarter-front.webp'),
   901, 'gallery');

UPDATE product SET
  colour_variant = 'Batik White',
  name = 'VATTI Cooker Hood V917 (Batik White)',
  seo_title = 'VATTI Cooker Hood V917 (Batik White)',
  hero_image_id = (SELECT id FROM image WHERE url = 'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/vatti-cooker-hood-v917-batik-front.webp')
  WHERE slug = 'vatti-cooker-hood-v917-white';

-- White's old hero/gallery, now unreferenced. 173 was already a stray in the
-- original scrape — misnamed "V997-Batik-Cabinet-Description" but filed
-- under White's gallery — orphaned the same way the other two are.
DELETE FROM image WHERE id IN (170, 171, 173);
