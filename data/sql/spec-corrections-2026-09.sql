-- Spec corrections against the VATTI Kitchen Solutions Catalog 2026, audited
-- 2026-09-05. products.sql is generated from the WordPress scrape and must not
-- be hand-edited, so every correction lands here as an UPDATE. Runs after
-- products.sql (explicit ORDER in db-build.mjs) and after
-- retired-products-2026-08.sql (alphabetical, "s" > "r"), so the two unpublished
-- models below still get fixed data for whenever they come back.
--
-- Source of truth is the printed catalogue, page by page. Where the catalogue
-- simply omits a figure the site carries (V993/V999 oil filtration 85%, V919
-- filtration 92%), the site keeps it: silence is not a contradiction.
--
-- Facets are the readout strip and are derived from spec text at import, so a
-- number that changes has to change in BOTH tables or the strip and the bullet
-- list disagree on the same page. product_facet.source_position hides the
-- bullet it was extracted from (see queries/product.ts), which is why the two
-- typo fixes below also insert a facet and renumber the ones after it.

-- ---------------------------------------------------------------------------
-- V993 (id 1) — catalogue p.08 says 50db, not 53db.
-- ---------------------------------------------------------------------------
UPDATE product_spec SET raw_text = 'Low noise level 50db'
  WHERE product_id = 1 AND position = 5;
UPDATE product_facet SET value = 50 WHERE product_id = 1 AND facet = 'noise';

-- ---------------------------------------------------------------------------
-- V999 (id 2) — catalogue p.09 says 50db, not 52db, and 1000Pa. "1000DPa" was
-- a scrape typo that failed the import's pressure parser, which is why V999 is
-- the only Athena hood with no Pressure tile in its readout strip. Fixing the
-- text restores the tile, so the facet is inserted and the two after it shift.
-- ---------------------------------------------------------------------------
UPDATE product_spec SET spec_value = '1000Pa', raw_text = 'Air pressure rate: 1000Pa'
  WHERE product_id = 2 AND position = 1;
UPDATE product_spec SET raw_text = 'Low noise level 50db'
  WHERE product_id = 2 AND position = 4;

UPDATE product_facet SET value = 50 WHERE product_id = 2 AND facet = 'noise';
UPDATE product_facet SET position = position + 1
  WHERE product_id = 2 AND facet IN ('noise', 'filtration');
INSERT INTO product_facet (product_id, facet, value, unit, label, position, source_position)
  VALUES (2, 'pressure', 1000, 'Pa', 'Pressure', 1, 1);

-- ---------------------------------------------------------------------------
-- V931 (id 5) — catalogue p.09 confirms 1860m³/h. "1860m’/h" (curly apostrophe
-- for the superscript 3) failed the airflow parser the same way, costing V931
-- its Airflow tile. Same repair: fix the text, insert the facet, renumber.
-- ---------------------------------------------------------------------------
UPDATE product_spec SET spec_value = '1860m³/h', raw_text = 'Airflow rate: 1860m³/h'
  WHERE product_id = 5 AND position = 0;

UPDATE product_facet SET position = position + 1
  WHERE product_id = 5 AND facet IN ('pressure', 'noise', 'filtration');
INSERT INTO product_facet (product_id, facet, value, unit, label, position, source_position)
  VALUES (5, 'airflow', 1860, 'm³/h', 'Airflow', 0, 0);

-- ---------------------------------------------------------------------------
-- V937 (id 6) — catalogue p.09 says 50db. The site claimed 46db, which
-- overstated the model against its own printed spec.
-- ---------------------------------------------------------------------------
UPDATE product_spec SET raw_text = 'Low noise level 50db'
  WHERE product_id = 6 AND position = 5;
UPDATE product_facet SET value = 50 WHERE product_id = 6 AND facet = 'noise';

-- ---------------------------------------------------------------------------
-- V938 (id 13) — catalogue p.05 says 48db, not 47db.
-- ---------------------------------------------------------------------------
UPDATE product_spec SET raw_text = 'Low noise level 48db'
  WHERE product_id = 13 AND position = 7;
UPDATE product_facet SET value = 48 WHERE product_id = 13 AND facet = 'noise';

-- ---------------------------------------------------------------------------
-- C835G (id 19) — catalogue p.12 lists this hob under "7 Safety Features" with
-- sixteen bullets; the scrape carried seven. Rewritten to the catalogue list.
-- "Anti-dry burning" is dropped as the catalogue's own wording for it, "Burn
-- dry auto cut-off", replaces it. "8-speed precise fire control" is kept: it is
-- a site claim the catalogue omits rather than contradicts.
--
-- Position 1 must stay the kW line — both C835G facets (power, burners) were
-- extracted from it and point at source_position 1.
-- ---------------------------------------------------------------------------
DELETE FROM product_spec WHERE product_id = 19;
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text) VALUES
  (19,  0, NULL, NULL, 'Powerful high flame'),
  (19,  1, NULL, NULL, '4.5kW (Left & Right)'),
  (19,  2, NULL, NULL, 'Burn dry auto cut-off'),
  (19,  3, NULL, NULL, 'Thermal dry auto cut-off'),
  (19,  4, NULL, NULL, 'Max 99 minutes cooking time'),
  (19,  5, NULL, NULL, '2 hour auto cut-off'),
  (19,  6, NULL, NULL, 'Safety device'),
  (19,  7, NULL, NULL, 'No cookware smart sensor'),
  (19,  8, NULL, NULL, 'Child lock control knob'),
  (19,  9, NULL, NULL, '8-speed precise fire control'),
  (19, 10, NULL, NULL, 'Rose gold lining'),
  (19, 11, NULL, NULL, 'Black tempered glass'),
  (19, 12, NULL, NULL, 'Cast iron stand'),
  (19, 13, NULL, NULL, 'Brass burner'),
  (19, 14, NULL, NULL, 'Zero sec ignition'),
  (19, 15, NULL, NULL, 'Electric ignition'),
  (19, 16, NULL, NULL, 'Easy clean design');

-- ---------------------------------------------------------------------------
-- ER5902T (id 27) — catalogue p.13 gives five zones for this five-burner hob:
-- two 1200W singles, one 1800W single, and two dual zones. The scrape read it
-- as "1200W X2" AND "1800W X2", which describes six zones on a five-burner hob
-- and loses every element diameter. Replaced with the catalogue's zone table.
--
-- Position 0 must stay the burner-count line — the burners facet points at it.
-- ---------------------------------------------------------------------------
DELETE FROM product_spec WHERE product_id = 27;
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text) VALUES
  (27,  0, NULL, NULL, '5 Burner Ceramic'),
  (27,  1, NULL, NULL, 'LT Single zone: 1200W (Ø160mm)'),
  (27,  2, NULL, NULL, 'LB Single zone: 1800W (Ø200mm)'),
  (27,  3, NULL, NULL, 'C Dual zone: 1000W / 2200W (Ø130mm / 230mm)'),
  (27,  4, NULL, NULL, 'RT Dual zone: 700W / 1700W (Ø120mm / 200mm)'),
  (27,  5, NULL, NULL, 'RB Single zone: 1200W (Ø160mm)'),
  (27,  6, NULL, NULL, 'Full Touch Panel'),
  (27,  7, NULL, NULL, 'Cooking Timer'),
  (27,  8, NULL, NULL, 'Child Lock'),
  (27,  9, NULL, NULL, 'Residual Heat Warning'),
  (27, 10, NULL, NULL, 'Overheat Cut off Protection'),
  (27, 11, NULL, NULL, 'Vatti verto high quality ceramic glass');

-- ---------------------------------------------------------------------------
-- M626 (id 37) — catalogue p.14 lists two functions the scrape missed. Appended
-- rather than reordered: the existing seven are unchanged and correct.
-- ---------------------------------------------------------------------------
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text) VALUES
  (37, 8, NULL, NULL, 'Auto clean function'),
  (37, 9, NULL, NULL, '8 Auto cooking menu');

-- ---------------------------------------------------------------------------
-- WDHG01 (id 39) — catalogue p.19 gives three selectable hot-water settings,
-- not a continuous range. "45°C to 100°C" reads as any temperature in between,
-- which the tap does not do. The Hot water facet (100°C, the top setting) is
-- still extracted from this line and stays as it is.
-- ---------------------------------------------------------------------------
UPDATE product_spec SET raw_text = 'Hot water temperature selection 45°C, 85°C or 100°C'
  WHERE product_id = 39 AND position = 5;
