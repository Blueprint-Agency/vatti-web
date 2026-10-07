-- N3 product shots: the article_image rows for the linked product pictures
-- under each pick in the best kitchen hood guide (EN 112, MS 113, ZH 114).
-- See PRODUCT_SHOT in src/lib/markdown.tsx; these rows give it real sizes.
--
-- A file of its own because the hero image rows are created by
-- product-images-2026-08.sql, which sorts after piece-n3-*. This name sorts
-- after it and after translation-n3-best-kitchen-hood-{ms,zh}, which create
-- 113 and 114.

INSERT INTO article_image (article_id, image_id, position) VALUES
  (112, 9030, 0),
  (112, 9028, 1),
  (112, 9018, 2),
  (112, 9074, 3),
  (112, 41, 4),
  (112, 9001, 5),
  (112, 9004, 6),
  (112, 9011, 7),
  (112, 9014, 8);

INSERT INTO article_image (article_id, image_id, position) VALUES
  (113, 9030, 0),
  (113, 9028, 1),
  (113, 9018, 2),
  (113, 9074, 3),
  (113, 41, 4),
  (113, 9001, 5),
  (113, 9004, 6),
  (113, 9011, 7),
  (113, 9014, 8);

INSERT INTO article_image (article_id, image_id, position) VALUES
  (114, 9030, 0),
  (114, 9028, 1),
  (114, 9018, 2),
  (114, 9074, 3),
  (114, 41, 4),
  (114, 9001, 5),
  (114, 9004, 6),
  (114, 9011, 7),
  (114, 9014, 8);
