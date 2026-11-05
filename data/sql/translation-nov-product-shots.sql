-- November product shots: the article_image rows for the linked product
-- pictures added 2026-11-05 to N6, N8, N9, N10 and N13 in all three editions,
-- one row of cards under each passage that names a VATTI model. Same pattern as
-- translation-n5-product-shots.sql. The name sorts after product-images-2026-08.sql,
-- which creates the hero image rows, and after every translation-n<digit> file
-- that creates the articles. Positions start at 2: position 1 is the body
-- figure on N9, N10 and N13.

-- N6, wet and dry kitchen: V960, V919, V959, V929, V938, C830G, C720S, C836G, ER3601T, VH-IC9-LA, C835G, VA05, VA06, O7559, M626, DWBB7, DWID3, WDHG01.
INSERT INTO article_image (article_id, image_id, position) VALUES
  (121, 9030, 2), (121, 9016, 3), (121, 9074, 4), (121, 9018, 5), (121, 9028, 6), (121, 9046, 7), (121, 9037, 8), (121, 9050, 9), (121, 273, 10), (121, 9079, 11), (121, 9048, 12), (121, 9059, 13), (121, 9062, 14), (121, 292, 15), (121, 9058, 16), (121, 364, 17), (121, 9069, 18), (121, 9065, 19),
  (122, 9030, 2), (122, 9016, 3), (122, 9074, 4), (122, 9018, 5), (122, 9028, 6), (122, 9046, 7), (122, 9037, 8), (122, 9050, 9), (122, 273, 10), (122, 9079, 11), (122, 9048, 12), (122, 9059, 13), (122, 9062, 14), (122, 292, 15), (122, 9058, 16), (122, 364, 17), (122, 9069, 18), (122, 9065, 19),
  (123, 9030, 2), (123, 9016, 3), (123, 9074, 4), (123, 9018, 5), (123, 9028, 6), (123, 9046, 7), (123, 9037, 8), (123, 9050, 9), (123, 273, 10), (123, 9079, 11), (123, 9048, 12), (123, 9059, 13), (123, 9062, 14), (123, 292, 15), (123, 9058, 16), (123, 364, 17), (123, 9069, 18), (123, 9065, 19);

-- N9, what is a steam oven: M626, VA05, VA06.
INSERT INTO article_image (article_id, image_id, position) VALUES
  (124, 9058, 2), (124, 9059, 3), (124, 9062, 4),
  (125, 9058, 2), (125, 9059, 3), (125, 9062, 4),
  (126, 9058, 2), (126, 9059, 3), (126, 9062, 4);

-- N13, hot water dispenser: WDHG01.
INSERT INTO article_image (article_id, image_id, position) VALUES
  (127, 9065, 2),
  (128, 9065, 2),
  (129, 9065, 2);

-- N10, steamed fish: VA05, VA06.
INSERT INTO article_image (article_id, image_id, position) VALUES
  (130, 9059, 2), (130, 9062, 3),
  (131, 9059, 2), (131, 9062, 3),
  (132, 9059, 2), (132, 9062, 3);

-- N8, moist chocolate steamed cake: VA05, VA06.
INSERT INTO article_image (article_id, image_id, position) VALUES
  (133, 9059, 2), (133, 9062, 3),
  (134, 9059, 2), (134, 9062, 3),
  (135, 9059, 2), (135, 9062, 3);
