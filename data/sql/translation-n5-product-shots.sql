-- N4 and N5 product shots: the article_image rows for the linked product
-- pictures in the exhaust fan guide (EN 115, MS 116, ZH 117) and the best gas
-- hob guide (EN 118, MS 119, ZH 120). Same reason for a file of its own as
-- translation-n3-product-shots.sql: the hero image rows are created by
-- product-images-2026-08.sql, and this name sorts after it and after the
-- translation-n4-* and translation-n5-best-gas-hob-* files that create the articles.

-- N4: V959, V929, V995.
INSERT INTO article_image (article_id, image_id, position) VALUES
  (115, 9074, 0), (115, 9018, 1), (115, 9011, 2),
  (116, 9074, 0), (116, 9018, 1), (116, 9011, 2),
  (117, 9074, 0), (117, 9018, 1), (117, 9011, 2);

-- N5: C822G, C720S, C836G, C835G, C830G, M822G, C861G, C823G.
INSERT INTO article_image (article_id, image_id, position) VALUES
  (118, 9042, 0), (118, 9037, 1), (118, 9050, 2), (118, 9048, 3),
  (118, 9046, 4), (118, 9056, 5), (118, 9053, 6), (118, 9044, 7),
  (119, 9042, 0), (119, 9037, 1), (119, 9050, 2), (119, 9048, 3),
  (119, 9046, 4), (119, 9056, 5), (119, 9053, 6), (119, 9044, 7),
  (120, 9042, 0), (120, 9037, 1), (120, 9050, 2), (120, 9048, 3),
  (120, 9046, 4), (120, 9056, 5), (120, 9053, 6), (120, 9044, 7);
