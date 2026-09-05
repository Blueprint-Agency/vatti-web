-- Dimensions transcribed from the VATTI Kitchen Solutions Catalog 2026,
-- pages 20 to 22 (the "Cooker Hood Dimension", "Ceramic Hob Dimension",
-- "Cooker Hob Dimension" and "Built-in Combi Oven Dimension" drawings).
--
-- The filename is load-bearing. db-build.mjs runs schema/products/articles/
-- stores first and everything else in plain alphabetical order, and this file
-- references three products that other files create: VH IC09AL (id 43) in
-- new-products-2026-08.sql and both DWID3 colourways (ids 40, 41) in
-- product-images-2026-08.sql. "product-o" sorts after "product-i" and after
-- "new-", which is why it is not called product-dimensions-*: that name loads
-- before product-images and fails on a foreign key.
--
-- products.sql is generated and
-- the existing rows came from installation manuals, which are a richer source
-- than these drawings: the manuals give clearances, duct heights, hose
-- diameters and power. The catalogue gives the outline only. So this file ADDS
-- the outline where there was none and does not overwrite a manual figure that
-- measures something else, e.g. V960 "Depth 225 mm (the body, closed)" against
-- the catalogue's "D: 320 (Including Mat)" — both true, of different things.
--
-- Nothing here is inferred from a drawing's proportions. Every value is a
-- number printed on the drawing. Where the catalogue gives no figure, no row is
-- written, per the V936 precedent in CLAUDE.md.
--
-- The fit checker needs width + opening + clearance + duct_above_counter and
-- renders for none of these products, because the catalogue prints no cabinet
-- opening for the hoods and no clearance for the hobs. Adding `width` alone is
-- safe: getFitMetrics() returns undefined unless all four are present.
--
-- Rows render in `position` order with `section` as a heading, so every product
-- row has to sort before every installation row. The +1000 offset below is to
-- dodge the UNIQUE (product_id, position) constraint while renumbering.

-- ═══ COOKER HOODS ═══════════════════════════════════════════════════════════

-- V917 (ids 15 and 16, Carbon Black and Batik White — one drawing, two
-- colourways). Had installation rows only. Catalogue p.20 and p.21.
UPDATE product_dimension SET position = position + 1000 WHERE product_id IN (15, 16);
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm) VALUES
  (15, 1, 'product', 'Width', '896 mm', NULL, 'width', 896, 896),
  (15, 2, 'product', 'Height', '870 mm', 'body and chimney', NULL, NULL, NULL),
  (15, 3, 'product', 'Depth', '367 mm', 'including the mats', NULL, NULL, NULL),
  (15, 4, 'product', 'Chimney', '420 mm wide', '305 mm deep', NULL, NULL, NULL),
  (15, 5, 'product', 'Body height', '421 mm', NULL, NULL, NULL, NULL),
  (16, 1, 'product', 'Width', '896 mm', NULL, 'width', 896, 896),
  (16, 2, 'product', 'Height', '870 mm', 'body and chimney', NULL, NULL, NULL),
  (16, 3, 'product', 'Depth', '367 mm', 'including the mats', NULL, NULL, NULL),
  (16, 4, 'product', 'Chimney', '420 mm wide', '305 mm deep', NULL, NULL, NULL),
  (16, 5, 'product', 'Body height', '421 mm', NULL, NULL, NULL, NULL);
UPDATE product_dimension SET position = position - 1000 + 5
  WHERE product_id IN (15, 16) AND position >= 1000;

-- V938 (id 13). Had no outline at all: the slim depth is the cabinet insert,
-- not the body. Catalogue p.20 gives W 896, D 321 including mat, a 407 mm
-- chimney telescoping 470 to 770, and the canopy's swing when it opens.
UPDATE product_dimension SET position = position + 1000 WHERE product_id = 13;
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm) VALUES
  (13, 1, 'product', 'Width', '896 mm', NULL, 'width', 896, 896),
  (13, 2, 'product', 'Depth', '321 mm', 'including the mats', NULL, NULL, NULL),
  (13, 3, 'product', 'Chimney', '407 mm wide', NULL, NULL, NULL, NULL),
  (13, 4, 'product', 'Chimney height', '470 to 770 mm', 'telescopic', NULL, NULL, NULL),
  (13, 5, 'product', 'Canopy when open', '362 mm forward', '182 mm below the body', NULL, NULL, NULL);
UPDATE product_dimension SET position = position - 1000 + 5
  WHERE product_id = 13 AND position >= 1000;

-- V919 (id 9). Renumbered whole rather than patched: the one outline row it had
-- was 'Depth 270 to 330 mm, depending on how it is fitted', and catalogue p.20
-- gives the two figures that range was hiding — 215 mm at the body and 330 mm
-- once the chimney cover is on. The three installation rows are re-inserted
-- byte for byte, metrics included.
DELETE FROM product_dimension WHERE product_id = 9;
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm) VALUES
  (9,  1, 'product', 'Width', '896 mm', NULL, 'width', 896, 896),
  (9,  2, 'product', 'Height', '976 mm', 'body and chimney', NULL, NULL, NULL),
  (9,  3, 'product', 'Depth', '215 mm', 'including the mats; 330 mm with the chimney cover fitted', NULL, NULL, NULL),
  (9,  4, 'product', 'Chimney', '400 mm wide', '315 mm deep', NULL, NULL, NULL),
  (9,  5, 'product', 'Body height', '421 mm', NULL, NULL, NULL, NULL),
  (9,  6, 'product', 'Chimney cover', '340 mm', 'optional, fitted over the chimney', NULL, NULL, NULL),
  (9,  7, 'product', 'Negative pressure bottom', '513 mm', 'the closed underside that holds the pocket', NULL, NULL, NULL),
  (9,  8, 'product', 'Static pressure', '450 Pa rated', '1,300 Pa maximum', NULL, NULL, NULL),
  (9,  9, 'installation', 'Clearance above the hob', '400 to 430 mm', NULL, 'clearance', 400, 430),
  (9, 10, 'installation', 'Bottom of hood from the floor', '1,250 to 1,280 mm', 'over an 850 mm cabinet', NULL, NULL, NULL),
  (9, 11, 'installation', 'Ducting hole from the floor', '2,390 to 2,420 mm', '7 inch, back to back or side way', 'duct_above_counter', 1540, 1570);

-- V960 (id 14). Width and chimney width already agreed with the catalogue. What
-- was missing is the chimney stack height and the depth over the mats.
UPDATE product_dimension SET position = position + 1000 WHERE product_id = 14 AND position >= 5;
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm) VALUES
  (14, 5, 'product', 'Chimney height', '689 to 850 mm', '519 mm fixed, plus a 170 to 330 mm telescopic upper section', NULL, NULL, NULL),
  (14, 6, 'product', 'Depth over the mats', '320 mm', 'against 225 mm at the body alone', NULL, NULL, NULL),
  (14, 7, 'product', 'Canopy when open', '350 mm forward', '200 mm below the body', NULL, NULL, NULL);
UPDATE product_dimension SET position = position - 1000 + 3
  WHERE product_id = 14 AND position >= 1000;

-- ═══ COOKER HOBS ════════════════════════════════════════════════════════════
-- Catalogue p.21. Eight hobs had no drawing on the site at all. The cut-out is
-- the figure a buyer actually needs, and for five of them it is a single number
-- rather than a range, so those carry metric 'opening' the way C720S already
-- does. C822G's and C836G's ranges follow the C823G precedent and carry none.

-- Each of these hobs already carries five or six spec-derived product rows
-- (burners, power, timer and so on) at positions 1..n and no outline. Width and
-- depth belong at the head of the product section and the cut-out at the tail,
-- so the existing rows shift down by two and the installation rows append.

-- C861G (id 25) — 5 existing product rows become 3..7
UPDATE product_dimension SET position = position + 1000 WHERE product_id = 25;
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm) VALUES
  (25, 1, 'product', 'Width', '820 mm', NULL, 'width', 820, 820),
  (25, 2, 'product', 'Depth', '470 mm', NULL, NULL, NULL, NULL);
UPDATE product_dimension SET position = position - 1000 + 2
  WHERE product_id = 25 AND position >= 1000;
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm) VALUES
  (25,  8, 'installation', 'Cut-out width', '700 mm', NULL, 'opening', 700, 700),
  (25,  9, 'installation', 'Cut-out depth', '400 mm', NULL, NULL, NULL, NULL),
  (25, 10, 'installation', 'Power', '13 amp plug', NULL, NULL, NULL, NULL);

-- C836G (id 23) — body size only; the cut-out range was already there.
UPDATE product_dimension SET position = position + 1000 WHERE product_id = 23;
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm) VALUES
  (23, 1, 'product', 'Width', '860 mm', NULL, 'width', 860, 860),
  (23, 2, 'product', 'Depth', '460 mm', NULL, NULL, NULL, NULL);
UPDATE product_dimension SET position = position - 1000 + 2
  WHERE product_id = 23 AND position >= 1000;
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm) VALUES
  (23, 9, 'installation', 'Power', 'Size D battery or 13 amp plug', 'ignition is specified either way', NULL, NULL, NULL);

-- C822G (id 21) — 5 existing product rows become 3..7
UPDATE product_dimension SET position = position + 1000 WHERE product_id = 21;
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm) VALUES
  (21, 1, 'product', 'Width', '780 mm', NULL, 'width', 780, 780),
  (21, 2, 'product', 'Depth', '450 mm', NULL, NULL, NULL, NULL);
UPDATE product_dimension SET position = position - 1000 + 2
  WHERE product_id = 21 AND position >= 1000;
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm) VALUES
  (21, 8, 'installation', 'Cut-out, side to side', '650 to 710 mm', 'anywhere in this range fits without re-cutting', NULL, NULL, NULL),
  (21, 9, 'installation', 'Cut-out, front to back', '350 to 400 mm', NULL, NULL, NULL, NULL);

-- C830G (id 24) — 5 existing product rows become 3..7
UPDATE product_dimension SET position = position + 1000 WHERE product_id = 24;
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm) VALUES
  (24, 1, 'product', 'Width', '900 mm', NULL, 'width', 900, 900),
  (24, 2, 'product', 'Depth', '480 mm', NULL, NULL, NULL, NULL);
UPDATE product_dimension SET position = position - 1000 + 2
  WHERE product_id = 24 AND position >= 1000;
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm) VALUES
  (24, 8, 'installation', 'Cut-out width', '700 mm', NULL, 'opening', 700, 700),
  (24, 9, 'installation', 'Cut-out depth', '400 mm', NULL, NULL, NULL, NULL);

-- C835G (id 19) — 5 existing product rows become 3..7
UPDATE product_dimension SET position = position + 1000 WHERE product_id = 19;
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm) VALUES
  (19, 1, 'product', 'Width', '780 mm', NULL, 'width', 780, 780),
  (19, 2, 'product', 'Depth', '430 mm', NULL, NULL, NULL, NULL);
UPDATE product_dimension SET position = position - 1000 + 2
  WHERE product_id = 19 AND position >= 1000;
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm) VALUES
  (19,  8, 'installation', 'Cut-out width', '680 mm', NULL, 'opening', 680, 680),
  (19,  9, 'installation', 'Cut-out depth', '350 mm', NULL, NULL, NULL, NULL),
  (19, 10, 'installation', 'Power', '13 amp plug', NULL, NULL, NULL, NULL);

-- M822G (id 20) — 4 existing product rows become 3..6
UPDATE product_dimension SET position = position + 1000 WHERE product_id = 20;
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm) VALUES
  (20, 1, 'product', 'Width', '780 mm', NULL, 'width', 780, 780),
  (20, 2, 'product', 'Depth', '450 mm', NULL, NULL, NULL, NULL);
UPDATE product_dimension SET position = position - 1000 + 2
  WHERE product_id = 20 AND position >= 1000;
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm) VALUES
  (20, 7, 'installation', 'Cut-out width', '680 mm', NULL, 'opening', 680, 680),
  (20, 8, 'installation', 'Cut-out depth', '350 mm', NULL, NULL, NULL, NULL);

-- ═══ CERAMIC AND INDUCTION HOBS ═════════════════════════════════════════════
-- Catalogue p.21. VH IC09AL is printed as "VH-IC9-LA" there; the slug and the
-- model_code are the live URL and stay as they are. See the audit note.

-- VH IC09AL (id 43)
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm) VALUES
  (43, 1, 'product', 'Width', '750 mm', NULL, 'width', 750, 750),
  (43, 2, 'product', 'Depth', '420 mm', NULL, NULL, NULL, NULL),
  (43, 3, 'installation', 'Cut-out width', '720 mm', NULL, 'opening', 720, 720),
  (43, 4, 'installation', 'Cut-out depth', '390 mm', NULL, NULL, NULL, NULL);

-- ER3601T (id 26) — 5 existing product rows become 3..7
UPDATE product_dimension SET position = position + 1000 WHERE product_id = 26;
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm) VALUES
  (26, 1, 'product', 'Width', '580 mm', NULL, 'width', 580, 580),
  (26, 2, 'product', 'Depth', '510 mm', NULL, NULL, NULL, NULL);
UPDATE product_dimension SET position = position - 1000 + 2
  WHERE product_id = 26 AND position >= 1000;
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm) VALUES
  (26, 8, 'installation', 'Cut-out width', '560 mm', NULL, 'opening', 560, 560),
  (26, 9, 'installation', 'Cut-out depth', '490 mm', NULL, NULL, NULL, NULL);

-- ER5902T (id 27) — 5 existing product rows become 3..7
UPDATE product_dimension SET position = position + 1000 WHERE product_id = 27;
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm) VALUES
  (27, 1, 'product', 'Width', '900 mm', NULL, 'width', 900, 900),
  (27, 2, 'product', 'Depth', '510 mm', NULL, NULL, NULL, NULL);
UPDATE product_dimension SET position = position - 1000 + 2
  WHERE product_id = 27 AND position >= 1000;
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm) VALUES
  (27, 8, 'installation', 'Cut-out width', '880 mm', NULL, 'opening', 880, 880),
  (27, 9, 'installation', 'Cut-out depth', '495 mm', NULL, NULL, NULL, NULL);

-- ═══ MICROWAVE ═════════════════════════════════════════════════════════════
-- M626 (id 37) — catalogue p.22. Had capacity and power but no box and no
-- niche, which is the pair that decides whether it goes in the cabinet.
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm) VALUES
  (37,  6, 'product', 'Width', '595 mm', '512 mm at the body, behind the trim', NULL, NULL, NULL),
  (37,  7, 'product', 'Height', '390 mm', NULL, NULL, NULL, NULL),
  (37,  8, 'product', 'Depth', '350 mm', 'plus a 20 mm front trim', NULL, NULL, NULL),
  (37,  9, 'installation', 'Cabinet opening, width', '570 to 600 mm', NULL, NULL, NULL, NULL),
  (37, 10, 'installation', 'Cabinet opening, height', '380 to 395 mm', NULL, NULL, NULL, NULL),
  (37, 11, 'installation', 'Cabinet opening, depth', '370 mm minimum', NULL, NULL, NULL, NULL);

-- ═══ DISHWASHER ════════════════════════════════════════════════════════════
-- DWID3 (ids 40 and 41, AG Grey and White). Catalogue p.22 draws DWBB7 and
-- DWID3 as one outline, and the three figures on it are the three DWBB7
-- already carries, so DWID3 gets the same box. The cabinet opening rows on
-- DWBB7 came from its manual and are NOT copied across: the catalogue prints
-- no niche for either model.
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm) VALUES
  (40, 1, 'product', 'Width', '598 mm', NULL, 'width', 598, 598),
  (40, 2, 'product', 'Height', '775 mm', '675 mm of door, over a 100 mm plinth', NULL, NULL, NULL),
  (40, 3, 'product', 'Depth', '570 mm', NULL, NULL, NULL, NULL),
  (40, 4, 'product', 'Capacity', '20+2 place settings', 'the +2 is the food basket', NULL, NULL, NULL),
  (41, 1, 'product', 'Width', '598 mm', NULL, 'width', 598, 598),
  (41, 2, 'product', 'Height', '775 mm', '675 mm of door, over a 100 mm plinth', NULL, NULL, NULL),
  (41, 3, 'product', 'Depth', '570 mm', NULL, NULL, NULL, NULL),
  (41, 4, 'product', 'Capacity', '20+2 place settings', 'the +2 is the food basket', NULL, NULL, NULL);

-- ═══ CERAMIC ZONE ROWS ══════════════════════════════════════════════════════
-- The zone breakdown appears twice on a product page: in product_spec (fixed
-- for ER5902T in spec-corrections-2026-09.sql) and again here as a dimension
-- row, which carried the same "1,800 W x2" error. Catalogue p.13 gives three
-- single zones on the ER5902T, not four: 1,200 W twice and 1,800 W once.
-- The element diameters are on the same page and were not recorded at all.
UPDATE product_dimension SET
  value = '1,200 W and 1,800 W', note = 'Ø165 mm and Ø200 mm'
  WHERE product_id = 26 AND position = 4;
UPDATE product_dimension SET
  value = '1,000 W or 2,200 W', note = 'Ø135 / 230 mm, switching to suit the pan on it'
  WHERE product_id = 26 AND position = 5;

UPDATE product_dimension SET
  value = '1,200 W x2 and 1,800 W', note = 'Ø160 mm each, and Ø200 mm'
  WHERE product_id = 27 AND position = 4;
UPDATE product_dimension SET
  value = '700 / 1,700 W and 1,000 / 2,200 W', note = 'Ø120 / 200 mm and Ø130 / 230 mm, each stepping to suit the pan on it'
  WHERE product_id = 27 AND position = 5;
