-- Front-facing card images for the five products resumed on 2026-09-15.
--
-- The category grid shows product.hero_image_id on a square card, and every
-- product from the 2026-08 studio shoot leads with a straight front view. The
-- five resumed models were retired before that shoot and the source folder has
-- no shots of them, so they keep the pictures the scrape gave them. Checked one
-- by one (all five are transparent cut-outs, so only the angle was in question):
--
--   ER3601T  hero is the top-front view with the zones lit      keep
--   ER5902T  hero is the straight top view                      keep
--   07559    hero is the straight front view                    keep
--   V937     hero was the three-quarter side view; the scrape   swap
--            also carried a straight front view (image 41)
--   DWBB7    only three-quarter views exist, closed and open;   keep, and
--            no front shot of this machine anywhere on the CDN  ask for one
--
-- The V937 front view is 374x374. It was the live site's thumbnail for two
-- years and reads cleanly at card size, but it is the smallest hero on the
-- site and will look soft on a high-density screen; a proper studio front
-- shot should replace it when one exists.
--
-- Sorts after product-images-2026-08.sql and retired-products-2026-08.sql,
-- neither of which touches these rows.

-- V937: the front view becomes the hero and goes first in the gallery; the
-- side view stays as the second gallery picture. (product_id, position) is the
-- primary key, so the swap goes through a spare position.
UPDATE product SET hero_image_id = 41
  WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';
UPDATE product_image SET position = 99
  WHERE product_id = (SELECT id FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937')
    AND image_id = 41;
UPDATE product_image SET position = 1, role = 'gallery'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937')
    AND image_id = 40;
UPDATE product_image SET position = 0, role = 'hero'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937')
    AND image_id = 41;
UPDATE image SET alt = 'Triple Intake Series T Type Cooker Hood V937, front view' WHERE id = 41;
UPDATE image SET alt = 'Triple Intake Series T Type Cooker Hood V937, angled view' WHERE id = 40;
