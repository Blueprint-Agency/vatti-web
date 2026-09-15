-- Second pass against the VATTI Kitchen Solutions Catalog 2026, the
-- "Update with V959" edition, 2026-09-15. Read page by page against
-- product_spec, product_facet and product_dimension. Every figure already on
-- the site agreed with the catalogue; this file adds what the catalogue lists
-- and the site did not, and fixes four typos. Nothing is inferred: each bullet
-- below is printed on the page cited.
--
-- Not changed here, because the catalogue and the site disagree and only the
-- client can say which is current: the V917 colour names (catalogue Carbon
-- Grey and Malaysian Batik, site Carbon Black and Batik White since 2026-08),
-- the C720S burner category (site 995G, catalogue 955G), the VA05/VA06
-- cut-out width (manual 560 mm, catalogue 570 to 600 mm), and the four live
-- models the catalogue does not carry at all (V991, V996, V998, C821G).
--
-- products.sql is generated, so like spec-corrections-2026-09.sql this runs
-- after it. The name is chosen to sort after every product-*.sql file, after
-- spec-corrections-2026-09.sql and after refresh-articles-2026-09.sql: the
-- 07559 rows it edits come from product-outline-dimensions-2026-09.sql, the
-- V997 facets it renumbers around come from spec-corrections, and the article
-- paragraphs it replaces come from refresh-articles. db-build.mjs loads the
-- unordered files sorted, and "spec-corrections-c" sorts after
-- "spec-corrections-2".

-- A bullet appended at the end of a product's list. Each statement reads the
-- current max position, so consecutive calls for one product number themselves.
-- (Written out per row rather than as a multi-row VALUES, which would evaluate
-- the subquery once and collide on position.)

-- ── V959, page 7 and page 20 ───────────────────────────────────────────────
-- The page was images only: no specs, no facets, no dimensions.
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 0, 'Airflow rate', '2825m³/h', 'Airflow rate: 2825m³/h' FROM product WHERE slug = 'vatti-cooker-hood-v959';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 1, 'Air pressure rate', '1100Pa', 'Air pressure rate: 1100Pa' FROM product WHERE slug = 'vatti-cooker-hood-v959';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 2, NULL, NULL, 'BLDC and water proof motor' FROM product WHERE slug = 'vatti-cooker-hood-v959';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 3, NULL, NULL, 'Smart Auto Link (Selected Cooker Hob Models)' FROM product WHERE slug = 'vatti-cooker-hood-v959';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 4, NULL, NULL, 'Smart WIFI Link' FROM product WHERE slug = 'vatti-cooker-hood-v959';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 5, NULL, NULL, 'Full touch panel' FROM product WHERE slug = 'vatti-cooker-hood-v959';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 6, NULL, NULL, 'Hand sensor' FROM product WHERE slug = 'vatti-cooker-hood-v959';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 7, NULL, NULL, 'Low noise level 51db' FROM product WHERE slug = 'vatti-cooker-hood-v959';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 8, NULL, NULL, 'Oil filtration rate up to 95%' FROM product WHERE slug = 'vatti-cooker-hood-v959';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 9, NULL, NULL, 'Odor reduction rate up to 92%' FROM product WHERE slug = 'vatti-cooker-hood-v959';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 10, NULL, NULL, 'Turbo wash + nano coating' FROM product WHERE slug = 'vatti-cooker-hood-v959';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 11, NULL, NULL, 'Anti rust nano coating' FROM product WHERE slug = 'vatti-cooker-hood-v959';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 12, NULL, NULL, 'Ducted or recycled' FROM product WHERE slug = 'vatti-cooker-hood-v959';

INSERT INTO product_facet (product_id, facet, value, unit, label, position, source_position)
SELECT id, 'airflow', 2825, 'm³/h', 'Airflow', 0, 0 FROM product WHERE slug = 'vatti-cooker-hood-v959';
INSERT INTO product_facet (product_id, facet, value, unit, label, position, source_position)
SELECT id, 'pressure', 1100, 'Pa', 'Pressure', 1, 1 FROM product WHERE slug = 'vatti-cooker-hood-v959';
INSERT INTO product_facet (product_id, facet, value, unit, label, position, source_position)
SELECT id, 'noise', 51, 'dB', 'Noise', 2, 7 FROM product WHERE slug = 'vatti-cooker-hood-v959';
INSERT INTO product_facet (product_id, facet, value, unit, label, position, source_position)
SELECT id, 'filtration', 95, '%', 'Oil capture', 3, 8 FROM product WHERE slug = 'vatti-cooker-hood-v959';

-- Page 20 draws the V959 outline. The front view marks 896 across, 420 across
-- the chimney, 540 down the chimney, 362 down the body, and both 902 and 942
-- on the overall height without saying which is which; 942 is taken as the
-- maximum. The side view marks the chimney at 310 (324 including the mat) and
-- the body at 313 including the mat. No installation heights are printed, so
-- there are no installation rows and the fit checker stays off this page.
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 0, 'product', 'Width', '896 mm', NULL, 'width', 896, 896 FROM product WHERE slug = 'vatti-cooker-hood-v959';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 1, 'product', 'Height', '902 to 942 mm', 'body and chimney; the catalogue drawing marks both figures on the overall height', NULL, NULL, NULL FROM product WHERE slug = 'vatti-cooker-hood-v959';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 2, 'product', 'Depth', '313 mm', 'including the mat', NULL, NULL, NULL FROM product WHERE slug = 'vatti-cooker-hood-v959';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 3, 'product', 'Body height', '362 mm', NULL, NULL, NULL, NULL FROM product WHERE slug = 'vatti-cooker-hood-v959';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 4, 'product', 'Chimney', '420 mm wide', '310 mm deep, 324 mm including the mat; 540 mm tall', NULL, NULL, NULL FROM product WHERE slug = 'vatti-cooker-hood-v959';

-- ── VH-IC9-LA, page 13 ─────────────────────────────────────────────────────
-- Four dimension rows and nothing else. This is an induction plus ceramic
-- hob, which the page never said.
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 0, NULL, NULL, 'Induction + Ceramic' FROM product WHERE slug = 'vatti-cooker-hob-vh-ic9-la';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 1, 'L Induction', '2000 / 2300W (Booster)', 'L Induction: 2000 / 2300W (Booster)' FROM product WHERE slug = 'vatti-cooker-hob-vh-ic9-la';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 2, 'R Ceramic', '1000 / 2200W', 'R Ceramic: 1000 / 2200W' FROM product WHERE slug = 'vatti-cooker-hob-vh-ic9-la';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 3, NULL, NULL, 'Full touch panel' FROM product WHERE slug = 'vatti-cooker-hob-vh-ic9-la';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 4, NULL, NULL, 'Cooking timer' FROM product WHERE slug = 'vatti-cooker-hob-vh-ic9-la';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 5, NULL, NULL, 'Smart Auto Link (Selected Cooker Hood Models)' FROM product WHERE slug = 'vatti-cooker-hob-vh-ic9-la';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 6, NULL, NULL, 'App Control System' FROM product WHERE slug = 'vatti-cooker-hob-vh-ic9-la';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 7, NULL, NULL, 'Child lock' FROM product WHERE slug = 'vatti-cooker-hob-vh-ic9-la';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 8, NULL, NULL, 'Residual heat warning' FROM product WHERE slug = 'vatti-cooker-hob-vh-ic9-la';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 9, NULL, NULL, 'Overheat cut-off protection' FROM product WHERE slug = 'vatti-cooker-hob-vh-ic9-la';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 10, NULL, NULL, 'Booster function' FROM product WHERE slug = 'vatti-cooker-hob-vh-ic9-la';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT id, 11, NULL, NULL, 'Easy clean function' FROM product WHERE slug = 'vatti-cooker-hob-vh-ic9-la';
INSERT INTO product_facet (product_id, facet, value, unit, label, position, source_position)
SELECT id, 'burners', 2, '', 'Zones', 0, 0 FROM product WHERE slug = 'vatti-cooker-hob-vh-ic9-la';

-- ── hoods: bullets the catalogue prints that the scrape did not carry ──────
-- V929, page 4
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Smart Auto Link (Selected Cooker Hob Models)' FROM product p WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Ambient light' FROM product p WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Full touch panel' FROM product p WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Odor reduction rate up to 97%' FROM product p WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';

-- V938, page 5
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Full touch panel' FROM product p WHERE slug = 'vatti-hidden-series-range-hood-v938';

-- V997, page 8. The noise figure was never on the page, so the comparison
-- table printed a dash for it; the facet restores the tile. The scrape carried
-- the auto-clean bullet twice.
DELETE FROM product_spec WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-range-hood-v997') AND raw_text = 'Auto Clean (Turbo Wash)';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Low noise level 48db' FROM product p WHERE slug = 'vatti-range-hood-v997';
INSERT INTO product_facet (product_id, facet, value, unit, label, position, source_position)
SELECT p.id, 'noise', 48, 'dB', 'Noise', 2, (SELECT max(position) FROM product_spec WHERE product_id = p.id) FROM product p WHERE slug = 'vatti-range-hood-v997';
UPDATE product_facet SET position = 3 WHERE facet = 'filtration' AND product_id = (SELECT id FROM product WHERE slug = 'vatti-range-hood-v997');
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Smart auto link (Selected Hob Model)' FROM product p WHERE slug = 'vatti-range-hood-v997';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Ducted or recycled' FROM product p WHERE slug = 'vatti-range-hood-v997';

-- V919, page 8
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Full touch panel' FROM product p WHERE slug = 'vatti-magic-series-cooker-hood-v919';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Delay off function' FROM product p WHERE slug = 'vatti-magic-series-cooker-hood-v919';

-- V993, page 8
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Full touch panel' FROM product p WHERE slug = 'athena-series-lifting-type-range-hood-v993';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Hand sensor' FROM product p WHERE slug = 'athena-series-lifting-type-range-hood-v993';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Anti rust coating' FROM product p WHERE slug = 'athena-series-lifting-type-range-hood-v993';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Ducted or recycled' FROM product p WHERE slug = 'athena-series-lifting-type-range-hood-v993';

-- V999, page 9
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Full touch panel' FROM product p WHERE slug = 'athena-series-lifting-type-range-hood-v999';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Anti rust coating' FROM product p WHERE slug = 'athena-series-lifting-type-range-hood-v999';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Ducted or recycled' FROM product p WHERE slug = 'athena-series-lifting-type-range-hood-v999';

-- V937, page 9
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Three cavity hood' FROM product p WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Full touch panel' FROM product p WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Anti rust coating' FROM product p WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Ducted or recycled' FROM product p WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';

-- V995, page 9
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'LED lamp' FROM product p WHERE slug = 'slim-series-type-range-hood-v995';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Cooker hood chamber with nano coating' FROM product p WHERE slug = 'slim-series-type-range-hood-v995';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Anti rust coating' FROM product p WHERE slug = 'slim-series-type-range-hood-v995';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Ducted or recycled' FROM product p WHERE slug = 'slim-series-type-range-hood-v995';

-- ── hobs ───────────────────────────────────────────────────────────────────
-- C861G, page 10
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Full touch panel' FROM product p WHERE slug = 'vatti-magic-series-cooker-hob-c861g';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Tempered glass' FROM product p WHERE slug = 'vatti-magic-series-cooker-hob-c861g';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Electric ignition' FROM product p WHERE slug = 'vatti-magic-series-cooker-hob-c861g';

-- C836G, page 11
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Smart auto link (Selected Cooker Hood Models)' FROM product p WHERE slug = 'vatti-flexi-hob-c836g';

-- C822G, page 11. The scrape carried "Flexible cut-out size" twice and the
-- cut-out range as a bullet, which product_dimension already states.
DELETE FROM product_spec WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c822g')
  AND raw_text = 'Flexible cut-out size'
  AND position > (SELECT min(position) FROM product_spec WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c822g') AND raw_text = 'Flexible cut-out size');
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Powerful high flame' FROM product p WHERE slug = 'vatti-flexi-hob-c822g';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Black tempered glass' FROM product p WHERE slug = 'vatti-flexi-hob-c822g';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Cast iron stand' FROM product p WHERE slug = 'vatti-flexi-hob-c822g';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Brass burner' FROM product p WHERE slug = 'vatti-flexi-hob-c822g';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Zero sec ignition' FROM product p WHERE slug = 'vatti-flexi-hob-c822g';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Child lock control knob' FROM product p WHERE slug = 'vatti-flexi-hob-c822g';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Battery ignition' FROM product p WHERE slug = 'vatti-flexi-hob-c822g';

-- C823G, page 12. Same duplicate bullet as the C822G.
DELETE FROM product_spec WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c823g')
  AND raw_text = 'Flexible cut-out size'
  AND position > (SELECT min(position) FROM product_spec WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c823g') AND raw_text = 'Flexible cut-out size');
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Zero sec ignition' FROM product p WHERE slug = 'vatti-flexi-hob-c823g';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Black tempered glass' FROM product p WHERE slug = 'vatti-flexi-hob-c823g';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Battery ignition' FROM product p WHERE slug = 'vatti-flexi-hob-c823g';

-- C720S, page 12
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Cast iron stand' FROM product p WHERE slug = 'professional-series-c720s';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Battery ignition' FROM product p WHERE slug = 'professional-series-c720s';

-- C830G, page 12. "Easy clear design" was a scrape typo.
UPDATE product_spec SET raw_text = 'Easy clean design'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-3-burner-gas-hob-c830g') AND raw_text = 'Easy clear design';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Powerful high flame' FROM product p WHERE slug = 'vatti-3-burner-gas-hob-c830g';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Black tempered glass' FROM product p WHERE slug = 'vatti-3-burner-gas-hob-c830g';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Cast iron stand' FROM product p WHERE slug = 'vatti-3-burner-gas-hob-c830g';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Brass burner' FROM product p WHERE slug = 'vatti-3-burner-gas-hob-c830g';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Zero sec ignition' FROM product p WHERE slug = 'vatti-3-burner-gas-hob-c830g';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Child lock control knob' FROM product p WHERE slug = 'vatti-3-burner-gas-hob-c830g';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Battery ignition' FROM product p WHERE slug = 'vatti-3-burner-gas-hob-c830g';

-- M822G, page 12. The catalogue spells the series Olympic; the scrape carried
-- "Oylmpic" into the display name, "Battery Ignitio" into the last bullet, and
-- "Tempered Glass" twice. The URL keeps its historic spelling.
UPDATE product SET name = 'VATTI Olympic Hob M822G' WHERE slug = 'vatti-oylimpic-hob-m822g';
UPDATE product_spec SET raw_text = 'Battery ignition'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-oylimpic-hob-m822g') AND raw_text = 'Battery Ignitio';
DELETE FROM product_spec
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-oylimpic-hob-m822g') AND raw_text = 'Tempered Glass';

-- ── ovens ──────────────────────────────────────────────────────────────────
-- 07559, page 14 and page 22. Two scrape typos, and the catalogue now prints
-- the cabinet opening the site could only guess at.
UPDATE product_spec SET raw_text = 'Capacity: 75L (Nett)', spec_key = 'Capacity', spec_value = '75L (Nett)'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559') AND raw_text LIKE 'Capacity : 75L%';
UPDATE product_spec SET raw_text = 'A+ Energy Consumption'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559') AND raw_text = 'A+ Energy Consumpt ion';
UPDATE product_spec SET raw_text = 'Voltage: 220 to 240V', spec_key = 'Voltage', spec_value = '220 to 240V'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559') AND raw_text LIKE 'Voltage :%';
UPDATE product_spec SET raw_text = 'Power: 2800W', spec_key = 'Power', spec_value = '2800W'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559') AND raw_text LIKE 'Power :%';
UPDATE product_dimension SET note = '598 mm wide and 592 mm high at the fascia, 577 mm deep including the 22 mm door'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559') AND label = 'Cabinet column';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT p.id, (SELECT max(position) + 1 FROM product_dimension WHERE product_id = p.id), 'installation', 'Cabinet opening, width', '570 to 600 mm', 'per the catalogue drawing', 'opening', 570, 600 FROM product p WHERE slug = 'vatti-built-in-air-fryer-oven-07559';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT p.id, (SELECT max(position) + 1 FROM product_dimension WHERE product_id = p.id), 'installation', 'Cabinet opening, height', '595 to 600 mm', NULL, NULL, NULL, NULL FROM product p WHERE slug = 'vatti-built-in-air-fryer-oven-07559';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT p.id, (SELECT max(position) + 1 FROM product_dimension WHERE product_id = p.id), 'installation', 'Cabinet opening, depth', '560 mm minimum', NULL, NULL, NULL, NULL FROM product p WHERE slug = 'vatti-built-in-air-fryer-oven-07559';

-- VA05, page 16
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, '3 steam modes: low, mid and high steam' FROM product p WHERE slug = 'built-in-combi-oven-va05';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, '2 auto clean functions: steam clean and heat dry' FROM product p WHERE slug = 'built-in-combi-oven-va05';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Triple-layer tempered glass door' FROM product p WHERE slug = 'built-in-combi-oven-va05';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Fermentation, keep warm, defrost, yogurt making, steam rice' FROM product p WHERE slug = 'built-in-combi-oven-va05';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT p.id, (SELECT max(position) + 1 FROM product_dimension WHERE product_id = p.id), 'product', 'Internal cavity', '480 x 370 x 430 mm', 'width by height by depth', NULL, NULL, NULL FROM product p WHERE slug = 'built-in-combi-oven-va05';

-- VA06, page 16. The catalogue also lists an "AI App System" variant of the
-- VA06 at a higher price; the site has one VA06 page, so the app control is
-- noted as an option rather than added as a second product.
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, '3 grades humidity level control' FROM product p WHERE slug = 'vatti-magic-series-combi-oven-va06';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, '2 auto clean functions: steam clean and heat dry' FROM product p WHERE slug = 'vatti-magic-series-combi-oven-va06';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'App control system on the AI App System variant' FROM product p WHERE slug = 'vatti-magic-series-combi-oven-va06';

-- ── dishwasher ─────────────────────────────────────────────────────────────
-- DWBB7, page 17
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, '8 auto menus: disinfect, glass care, oil intensive, fruit, feeding bottle, toy, big object, self clean' FROM product p WHERE slug = 'vatti-dishwasher-dwbb7';
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, (SELECT max(position) + 1 FROM product_spec WHERE product_id = p.id), NULL, NULL, 'Washing time display' FROM product p WHERE slug = 'vatti-dishwasher-dwbb7';

-- ── the induction article ──────────────────────────────────────────────────
-- refresh-articles-2026-09.sql rewrote the induction-versus-ceramic guide on
-- 2026-09-14 saying the VATTI range was gas only. The next day the VH-IC9-LA
-- got its specs (induction plus ceramic) and the two ceramic hobs came back on
-- sale, so the guide now has three VATTI electric hobs to send a reader to.
UPDATE article SET body_md = replace(body_md,
  'And if wok cooking is the heart of your kitchen, consider neither. A gas hob with a high-output burner still does that job best, and the [VATTI cooker hobs](/cooker-hob-in-malaysia/) are built around it, with glass tops that clean like a ceramic hob.',
  'VATTI sells both kinds. The [VH-IC9-LA](/vatti-cooker-hob-vh-ic9-la/) pairs a 2,300 W induction zone with a 2,200 W ceramic zone on one glass top, so you can try each side of this comparison in one hob. The [ER3601T](/ceramic-cooker-hob-er3601t/) and the five-zone [ER5902T](/ceramic-cooker-hob-er5902t/) are ceramic throughout. And if wok cooking is the heart of your kitchen, a gas hob with a high-output burner still does that job best; the [VATTI gas hobs](/cooker-hob-in-malaysia/) are built around it, with glass tops that clean like a ceramic hob.')
WHERE path = 'buying-guide/which-is-better-induction-or-ceramic-cooker';
UPDATE article SET body_md = replace(body_md,
  'If you cook with a wok every day, look at gas first: explore the [VATTI cooker hob range](/cooker-hob-in-malaysia/) and compare the burners model by model.',
  'The [VATTI cooker hob range](/cooker-hob-in-malaysia/) has induction, ceramic and gas side by side, so you can compare the zones and burners model by model.')
WHERE path = 'buying-guide/which-is-better-induction-or-ceramic-cooker';
