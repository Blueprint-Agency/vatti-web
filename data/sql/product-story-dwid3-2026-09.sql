-- DWID3 (ids 40 AG Grey and 41 White): the whole page, from the 2026-09 brand
-- pack — a 35-page English sales kit (34 of its panels as PNG), the product
-- info sheet, the installation manual, the user manual, eleven studio renders
-- and a presenter video. Before this the two pages were a name and a gallery.
--
-- Hand-authored, keyed on slug and variant_group, never on the integer ids.
-- Runs after product-images-2026-08.sql (which creates the two products) and
-- after product-outline-dimensions-2026-09.sql (which used to carry the
-- provisional outline and now points here): "product-s" > "product-o" >
-- "product-i". Image ids continue past product-swatches-2026-09.sql's 9100.
--
-- Everything shared between the colourways is inserted once against
-- variant_group = 'dwid3', the V917 pattern: same machine, same drawing, same
-- panels. The V917 pages got their blocks twice because the White pages had
-- White posters; VATTI shot no White panels for DWID3, so both pages carry the
-- same pictures and the White page's hero is the one place its colour shows.
--
-- Copy is faithful to the sales kit, with its English tidied. Where a figure
-- comes from a document, the comment above names it. Nothing here is guessed.
-- Two figures disagree across the pack and were decided, not averaged:
--   * capacity: the info sheet, the sales kit and the site all say 20+2; the
--     user manual's spec table says 18. The owner's sheet wins, flagged 2026-09-14.
--   * main programmes: the info sheet lists Independent Dry as the sixth; the
--     sales kit lists Sanitize. The info sheet wins for the same reason.

-- ── intro and best-for ───────────────────────────────────────────────────────
UPDATE product SET intro_md =
  'A fully integrated 60 cm dishwasher for 20 place settings plus a fruit basket, driven by a 55,000 Pa variable-pressure pump through two telescopic spray arms that cover the square of the tub rather than a circle inside it. It washes at 75°C, dries at 105°C, sterilises with UVC and keeps a finished load fresh for seven days. Detergent is dosed automatically from a two-week reservoir, and there are programmes for fruit, toys and baby bottles. 598 mm wide, into a 600 x 780 x 580 mm cabinet opening. AG Grey or White.'
  WHERE variant_group = 'dwid3';

UPDATE product SET best_for = 'Big loads, produce and toys'
  WHERE variant_group = 'dwid3';

-- ── gallery: two more renders from the 2026-09 pack ─────────────────────────
-- The other nine in the folder are the four already on the page, two 800px
-- duplicates of the front, the White front the White page already has, and
-- two straight-on shots of a black-glass front that is neither colourway sold
-- here and so are left out rather than filed under a colour they are not.
INSERT INTO image (id, url, legacy_url, alt, width, height) VALUES
  (9101, 'https://cdn.vattimalaysia.com/2026/09/vatti-dishwasher-dwid3-ag-grey-quarter-open-basket.webp', NULL, 'Vatti Dishwasher DWID3 (AG Grey), angled view, door open with the fruit basket on the lower rack', 1100, 1012),
  (9102, 'https://cdn.vattimalaysia.com/2026/09/vatti-dishwasher-dwid3-ag-grey-quarter-open-loaded.webp', NULL, 'Vatti Dishwasher DWID3 (AG Grey), angled view, loaded with pots and plates', 1100, 847);
INSERT INTO product_image (product_id, image_id, position, role) VALUES
  ((SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwid3-ag-grey'), 9101, 904, 'gallery'),
  ((SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwid3-ag-grey'), 9102, 905, 'gallery');

-- ── specifications ──────────────────────────────────────────────────────────
-- From the product info sheet (DWID3.docx), in its order, with the figures the
-- sales kit adds. Positions 0 to 2 feed the readout strip below and are hidden
-- from the bullet list by it, which is why the programme names sit at 2 on
-- their own rather than inside the count.
INSERT INTO product_spec (product_id, position, spec_key, spec_value, raw_text)
SELECT p.id, s.pos, NULL, NULL, s.txt
  FROM product p
  JOIN (SELECT 0 AS pos, '20+2 place settings, the +2 a fruit and vegetable basket' AS txt
  UNION ALL SELECT 1, '6 wash programs'
  UNION ALL SELECT 2, '55,000 Pa variable-pressure pump'
  UNION ALL SELECT 3, 'Smart Wash, Fruit & Veg Wash, Independent Dry, Power Wash, Standard Wash, Eco Wash'
  UNION ALL SELECT 4, '4 app programs: Glass Care 60°C, Intensive 70°C, Toy Care 50°C, Self Clean 65°C'
  UNION ALL SELECT 5, '6 additional functions: UV, Smart Dosing, Extra Wash, Half Load Upper, Half Load Lower, 24-hour delay'
  UNION ALL SELECT 6, 'BLDC motor'
  UNION ALL SELECT 7, '150 L cavity, three-level rack with pull-out cutlery tray'
  UNION ALL SELECT 8, 'Dual telescopic spray arms, square full-coverage wash'
  UNION ALL SELECT 9, '75°C high temperature washing'
  UNION ALL SELECT 10, '105°C independent hot air drying'
  UNION ALL SELECT 11, 'UVC sterilisation, up to 99.9%'
  UNION ALL SELECT 12, '168 hours air ventilation, 7-day fresh storage'
  UNION ALL SELECT 13, 'Smart detergent dosing, 250 ml reservoir, about two weeks a fill'
  UNION ALL SELECT 14, 'Patented 3-way air circulation'
  UNION ALL SELECT 15, 'Patented dual pump, zero residual water'
  UNION ALL SELECT 16, 'Automatic drain seal'
  UNION ALL SELECT 17, 'Self-cleaning three-layer filter'
  UNION ALL SELECT 18, '23 inch full touch colour display, set at 20°'
  UNION ALL SELECT 19, 'Wi-Fi app control'
  UNION ALL SELECT 20, 'Rated power 1,750 W, 220 to 240 V'
  ) s
 WHERE p.variant_group = 'dwid3';

-- The readout strip: the same two figures the DWBB7 carries, so the category
-- comparison has like against like, and the pressure the whole sales kit is
-- built around. source_position hides the bullet each was read from.
INSERT INTO product_facet (product_id, facet, value, unit, label, position, source_position)
SELECT p.id, m.facet, m.value, m.unit, m.label, m.position, m.source
  FROM product p
  JOIN (SELECT 'capacity' AS facet, 20 AS value, '' AS unit, 'Place settings' AS label, 0 AS position, 0 AS source
  UNION ALL SELECT 'functions', 6, '', 'Wash programs', 1, 1
  UNION ALL SELECT 'pressure', 55000, 'Pa', 'Wash pressure', 2, 2
  ) m
 WHERE p.variant_group = 'dwid3';

-- ── dimensions ──────────────────────────────────────────────────────────────
-- Installation manual p.6 (the drawing and "hole size") and p.7 (holes,
-- socket and hose reach); power and water pressure from the user manual's
-- technique specification. Replaces the catalogue outline that stood in
-- before the manual arrived.
DELETE FROM product_dimension WHERE product_id IN (SELECT id FROM product WHERE variant_group = 'dwid3');
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT p.id, d.pos, d.section, d.label, d.value, d.note, d.metric, d.lo, d.hi
  FROM product p
  JOIN (SELECT 1 AS pos, 'product' AS section, 'Width' AS label, '598 mm' AS value, NULL AS note, 'width' AS metric, 598 AS lo, 598 AS hi
  UNION ALL SELECT 2, 'product', 'Height', '775 mm', '675 mm of door over a 100 mm plinth; the feet adjust 0 to 40 mm', NULL, NULL, NULL
  UNION ALL SELECT 3, 'product', 'Depth', '570 mm', 'the door reaches 620 mm from the back when open to 90°', NULL, NULL, NULL
  UNION ALL SELECT 4, 'product', 'Capacity', '20+2 place settings', 'the +2 is the fruit and vegetable basket', NULL, NULL, NULL
  UNION ALL SELECT 5, 'product', 'Cavity', '150 L', NULL, NULL, NULL, NULL
  UNION ALL SELECT 6, 'product', 'Power', '1,750 W', '220 to 240 V, 50 to 60 Hz', NULL, NULL, NULL
  UNION ALL SELECT 7, 'installation', 'Cabinet opening, width', '600 mm', 'the built-in size the manual specifies', 'opening', 600, 600
  UNION ALL SELECT 8, 'installation', 'Cabinet opening, height', '780 mm', NULL, NULL, NULL, NULL
  UNION ALL SELECT 9, 'installation', 'Cabinet opening, depth', '580 mm or more', NULL, NULL, NULL, NULL
  UNION ALL SELECT 10, 'installation', 'Hole in the cabinet base', '70 x 70 mm', 'beside the machine, for the hoses and the cord', NULL, NULL, NULL
  UNION ALL SELECT 11, 'installation', 'Socket', '10 A, earthed', 'in the cabinet next to the machine, never behind it', NULL, NULL, NULL
  UNION ALL SELECT 12, 'installation', 'Water inlet', 'G1/2 angle valve', 'thread at least 10 mm; mains pressure 0.04 to 1.0 MPa', NULL, NULL, NULL
  UNION ALL SELECT 13, 'installation', 'Drain', '40 mm standpipe', 'the hose needs 280 mm of it', NULL, NULL, NULL
  UNION ALL SELECT 14, 'installation', 'Hose reach, to the left', 'Inlet 1,400 mm, drain 2,000 mm', 'the cord reaches 1,100 mm either side', NULL, NULL, NULL
  UNION ALL SELECT 15, 'installation', 'Hose reach, to the right', 'Inlet 1,000 mm, drain 1,700 mm', 'measured from the side of the machine', NULL, NULL, NULL
  ) d
 WHERE p.variant_group = 'dwid3';

-- ── downloads ───────────────────────────────────────────────────────────────
-- Both PDFs shipped as vector outlines with no text layer, 47 MB and 14 MB.
-- They are re-rendered page by page at 150 dpi (3.3 MB and 1.7 MB): nothing
-- searchable was lost because nothing searchable was there, and a manual a
-- phone cannot open is not a manual.
INSERT INTO product_download (product_id, position, label, url, kind)
SELECT p.id, d.pos, d.label, d.url, d.kind
  FROM product p
  JOIN (SELECT 0 AS pos, 'Installation guide' AS label, 'https://cdn.vattimalaysia.com/2026/09/dwid3-installation-manual.pdf' AS url, 'dimensions' AS kind
  UNION ALL SELECT 1, 'Manual', 'https://cdn.vattimalaysia.com/2026/09/dwid3-user-manual.pdf', 'manual'
  ) d
 WHERE p.variant_group = 'dwid3';

-- ── video ───────────────────────────────────────────────────────────────────
-- The brand's own clip, an MP4 with no YouTube channel behind it, so it is a
-- hosted file (see product_video in schema.sql). 1080x1440 at 143 MB as it
-- arrived; 720x960 H.264 at 16 MB here. It is a presenter piece in Mandarin
-- with Chinese captions, which the summary says so nobody presses play
-- expecting English. published_on is the day it went up on this site.
INSERT INTO product_video (product_id, position, video_id, title, summary, published_on, duration_seconds, src_url, poster_url, width, height)
SELECT id, 0, NULL, 'VATTI DWID3 dishwasher',
  'A presenter walks through the DWID3 in a kitchen, in Mandarin with Chinese captions: the 55,000 Pa pump, the square spray path, the 20+2 capacity, the detergent reservoir, the three-duct hot-air drying, the 23 inch panel and starting a wash from the app.',
  '2026-09-14', 115,
  'https://cdn.vattimalaysia.com/2026/09/dwid3-video.mp4',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-video-poster.webp',
  720, 960
  FROM product WHERE variant_group = 'dwid3';

-- ── the feature story ───────────────────────────────────────────────────────
-- Twenty-three blocks from the sales kit, in its order: the wash, the racks,
-- the five sterilisation steps, dosing, produce, drainage, the panel. Every
-- picture is a crop recorded in data/crops/dwid3.json; the panel each came
-- from is named on the row. The 55000Pa cleaning tables (p.10), the five-step
-- certification table (p.14) and the dispensing comparison (p.23) are argument
-- rather than picture and are the sentences here, not pictures.

-- p.9: the motor, cut from the four bullets beside it.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'split', '55,000 Pa of water pressure',
  'A variable-pressure pump on a BLDC motor, which VATTI rates 30% stronger than a conventional motor and up to 20% more frugal with it. Variable frequency is what lets one pump run flat out on a wok and quietly through the night.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-pump-motor.webp',
  'Cutaway of the DWID3 variable-pressure pump motor', 1053, 941
  FROM product WHERE variant_group = 'dwid3';

-- p.2: the tub from above, the four corners marked.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', 'Dual-square, full-coverage wash',
  'Two telescopic spray arms that extend as they turn, so the spray path is a square that reaches the four corners of the tub rather than a circle that misses them. VATTI''s patented design, and nationally certified Grade A for cleaning coverage.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-dual-square-wash.webp',
  'The DWID3 tub from above, the spray arms extended into all four corners', 736, 706
  FROM product WHERE variant_group = 'dwid3';

-- p.4 left, the arm itself; the mechanism is p.5 and p.6, told here as words.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'The fourth generation of spray arm',
  'The satellite heads ride a curved linkage. Pointed at the short side of the tub the arm pulls in, pointed at a corner it reaches out, so it never touches the wall and never leaves a corner dry. VATTI''s first three generations swept a circle; this one covers the square.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-spray-arm.webp',
  'The DWID3 telescopic spray arm with its two satellite heads', 722, 338
  FROM product WHERE variant_group = 'dwid3';

-- p.7 and p.8: the test and its result. The clean rack is the picture.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'Tested against burnt-on milk',
  'The proof is a rack of deep glasses packed tight, each coated in milk protein baked hard. After the dual-square wash the bottom corners are clean; a round spray arm run on the same load leaves residue in them.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-test-glasses.webp',
  'A dense rack of glasses after a DWID3 wash, every one clear', 769, 376
  FROM product WHERE variant_group = 'dwid3';

-- p.11: the exploded rack render.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', '150 L cavity, racks made for Asian kitchens',
  'Three levels: a pull-out cutlery tray on top, a middle rack that lifts to take tall cookware and odd shapes, and a lower rack whose tines fold flat for up to four pots at once. Rated at 20 place settings, plus the basket.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-rack-system.webp',
  'The three racks of the DWID3 drawn apart, cutlery tray on top and pots below', 635, 687
  FROM product WHERE variant_group = 'dwid3';

-- p.12 gives the count; the picture is the 2026-09 render with the basket in.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', '130 pieces, and a basket for the fruit',
  'Eighteen rice bowls, nine deep plates, nine shallow, nine noodle bowls, nine tall glasses, nine mugs, 36 pairs of chopsticks and the serving spoons: VATTI''s count of a full load. The fruit and vegetable basket comes with the machine and has a programme of its own.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-fruit-basket.webp',
  'The DWID3 open, the fruit basket sitting on the pulled-out lower rack', 1100, 1012
  FROM product WHERE variant_group = 'dwid3';

-- p.13 right: the red handle.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'split', 'One pull, 40.87% more room below',
  'Pull the red handle and the lower rack drops, which opens the space above it by 40.87% and takes a pot up to 30 cm tall. A fixed rack cannot.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-one-pull-rack.webp',
  'The red height-adjustment handle on the DWID3 lower rack', 694, 536
  FROM product WHERE variant_group = 'dwid3';

-- p.16: step two of the five.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 8, 'split', '75°C wash',
  'Water hotter than hands can work in, which is what lifts cooking oil off a plate rather than moving it around, and the second of the five sterilisation stages.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-75c-wash.webp',
  'The DWID3 mid-wash, the 75°C figure lit in the spray', 725, 946
  FROM product WHERE variant_group = 'dwid3';

-- p.17: step three, the cutaway with its three ducts.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 9, 'split', '105°C hot-air drying',
  'Far-infrared heat through two heating ducts and out through an exhaust duct. Air comes in on the right side, is filtered, heated and circulated through the cavity, then pushed out humid, so the load comes out dry with no water marks and no smell. VATTI rates the stage at 99.99% sterilisation.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-hot-air-drying.webp',
  'Cutaway of the DWID3 with hot air drawn through the cavity', 669, 725
  FROM product WHERE variant_group = 'dwid3';

-- p.18: step four.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 10, 'split', 'UVC sterilisation, up to 99.9%',
  'A UVC lamp breaks down bacterial DNA and RNA after the wash, and in storage mode it comes on periodically for up to 168 hours. Physical sterilisation with no chemical residue, from a lamp rated for over 10,000 hours.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-uvc.webp',
  'The DWID3 cavity under the UVC lamp', 351, 555
  FROM product WHERE variant_group = 'dwid3';

-- p.19 and p.20: step five, and the comparison with a door that pops open.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 11, 'split', 'Seven days of fresh air',
  'After the cycle the machine changes its air every three hours, removes the moisture and runs the UVC lamp, so a load left inside stays hygienically fresh for up to seven days with the door shut. A door that opens itself to dry lets the kitchen in: dust, damp, and whatever crawls.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-fresh-air.webp',
  'Air circulating through the closed DWID3', 602, 706
  FROM product WHERE variant_group = 'dwid3';

-- p.21 and p.22: the dispenser.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 12, 'split', 'Smart detergent dosing, refilled every fortnight',
  'A 250 ml reservoir of liquid detergent and another of rinse aid. Each wash is dosed to its soil level, so one fill lasts about two weeks of normal use, and the same dispenser still takes a tablet or powder for a single wash. Standard dishwasher detergent, nothing proprietary.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-smart-dosing.webp',
  'The DWID3 dispenser with its detergent and rinse-aid reservoirs', 970, 489
  FROM product WHERE variant_group = 'dwid3';

-- p.25 and p.27: the produce wash and its figures.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 13, 'split', 'One-touch fruit and vegetable wash',
  'A 26-minute soft-water programme that VATTI measures at 95% of pesticide residue removed and 92.7% of insecticide, without touching taste or nutrition. Grapes, strawberries, blueberries and cherries get a gentle rolling wash rather than a blast.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-fruit-wash.webp',
  'A tomato, cherries and grapes dropping into water', 836, 894
  FROM product WHERE variant_group = 'dwid3';

-- p.26: the four tiles of the produce cycle, one card each.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 14, 'card', '35°C warm pre-rinse',
  'Softens surface dirt and residue before the deep clean.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-step-pre-rinse.webp',
  'Grapes and a tomato under warm water', 385, 339
  FROM product WHERE variant_group = 'dwid3';
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 15, 'card', '360° high-pressure spray',
  'Multi-angle jets reach every part of the produce.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-step-spray.webp',
  'A spray head over lettuce and cherry tomatoes', 385, 339
  FROM product WHERE variant_group = 'dwid3';
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 16, 'card', 'Circulating filtration',
  'The water is filtered as it circulates, so dirt is not sprayed back on.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-step-filtration.webp',
  'Water pouring through the filter', 385, 339
  FROM product WHERE variant_group = 'dwid3';
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 17, 'card', 'Clean rinse',
  'Multi-stage rinsing before the basket comes out.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-step-rinse.webp',
  'Broccoli, lettuce and peppers rinsed in a bowl', 385, 339
  FROM product WHERE variant_group = 'dwid3';

-- p.31: the pump pair. The numbered callouts name the five stages.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 18, 'split', 'Two pumps, nothing left behind',
  'Filtration, rinse, drainage, suction and an anti-odour trap: five stages that clear the residual water and the food debris a single pump leaves sitting in the sump. No standing water, no backflow, no smell, and nothing to scoop out by hand.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-dual-pump.webp',
  'The DWID3 sump and its two pumps, each stage numbered', 886, 649
  FROM product WHERE variant_group = 'dwid3';

-- p.33: the seal.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 19, 'split', 'Automatic drain seal',
  'When draining finishes the drain closes itself, so waste-water odour cannot come back up the pipe and cockroaches cannot come in through it. A conventional drain stays open.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-drain-seal.webp',
  'The DWID3 drain seal, closed after draining', 669, 602
  FROM product WHERE variant_group = 'dwid3';

-- p.34 for the words; the photograph is sales kit p.32, which carries none.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 20, 'split', 'A filter that rinses itself',
  'Coarse, fine and flat micro filter, in three layers. During draining the stack is flushed automatically, so food residue does not sit in it between washes.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-filter.webp',
  'The DWID3 filter seated in the floor of the tub', 1716, 1188
  FROM product WHERE variant_group = 'dwid3';

-- p.35: the panel.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 21, 'split', '23 inch touch screen, set at 20°',
  'A full-width colour touch panel in abrasion-resistant IMD, angled at 20° so it reads without bending down. Programmes, functions and the timer on one surface, and the same controls from the VATTI app over Wi-Fi.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-touch-screen.webp',
  'A hand on the DWID3 touch panel', 903, 602
  FROM product WHERE variant_group = 'dwid3';

-- p.28, p.29, p.30 and the basket: the four things it washes or dries that are
-- not dinner.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 22, 'card', 'Toy care, 50°C',
  'Pre-rinse, a 50°C wash, multi-rinse and dry, for plastic and silicone toys. Not the wooden or battery ones.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-toys.webp',
  'The DWID3 loaded with children''s toys', 293, 499
  FROM product WHERE variant_group = 'dwid3';
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 23, 'card', 'Independent drying',
  'Dry a hand-washed load or a batch of baby bottles without running a wash first.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-independent-dry.webp',
  'The DWID3 drying a load under warm light', 468, 433
  FROM product WHERE variant_group = 'dwid3';
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 24, 'card', 'Self-clean, 65°C',
  '118 minutes at 65°C through the tub, the arms, the filter and the pipes. The app reminds you every one to two months.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-self-clean.webp',
  'The DWID3 empty, washing its own cavity', 351, 546
  FROM product WHERE variant_group = 'dwid3';
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 25, 'card', 'Fruit and vegetable basket',
  'Supplied with the machine, with the produce programme to go with it.',
  'https://cdn.vattimalaysia.com/2026/09/dwid3-basket-gift.webp',
  'The basket on the DWID3 lower rack', 550, 455
  FROM product WHERE variant_group = 'dwid3';

-- ── questions ───────────────────────────────────────────────────────────────
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What size cabinet opening does the DWID3 need?',
  'The machine is 598 mm wide, 775 mm tall and 570 mm deep, and the manual specifies a built-in opening of 600 x 780 x 580 mm, the standard 60 cm slot. Leave a 70 x 70 mm hole in the base of the cabinet beside it for the hoses and the cord, and put the socket in that neighbouring cabinet, not behind the machine. The feet adjust 0 to 40 mm to meet the counter.'
  FROM product WHERE variant_group = 'dwid3';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'How much does 20+2 place settings actually hold?',
  'VATTI''s count of a full load is about 130 pieces: eighteen rice bowls, nine each of deep plates, shallow plates, noodle bowls, tall glasses and mugs, 36 pairs of chopsticks and the serving spoons. The +2 is the fruit and vegetable basket. The lower rack drops on one pull to take a pot 30 cm tall, and half load washes the top or bottom rack alone on the days it is not worth filling both.'
  FROM product WHERE variant_group = 'dwid3';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'What is the difference between the AG Grey and the White DWID3?',
  'The front panel, and nothing else. Both are the same 55,000 Pa machine with the same racks, programmes and drying. AG Grey is [here](/vatti-dishwasher-dwid3-ag-grey/) and White is [here](/vatti-dishwasher-dwid3-white/).'
  FROM product WHERE variant_group = 'dwid3';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'Does the DWID3 dry properly, or come out damp?',
  'It dries with heat, not with what is left in the cavity: far-infrared air at 105°C through two heating ducts, with an exhaust duct carrying the moisture out. Two pumps clear the sump so nothing is left standing under the baskets, and rinse aid is dosed automatically from its own reservoir. There is also an independent drying programme for a load washed by hand.'
  FROM product WHERE variant_group = 'dwid3';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'Can dishes be left in it?',
  'Up to seven days. In storage mode the machine changes its air every three hours, keeps the cavity dry and runs the UVC lamp periodically, all with the door shut. That is what the 168 hours on the spec sheet means.'
  FROM product WHERE variant_group = 'dwid3';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'Can it wash fruit and vegetables, or toys?',
  'Both. The fruit and vegetable programme runs 26 minutes in soft water in the supplied basket, and VATTI measures it at 95% of pesticide residue removed. Toy Care is a 50°C wash from the app for plastic and silicone toys; wooden, plush, paper and battery toys stay out. Baby bottles go in on a normal wash or the independent dry.'
  FROM product WHERE variant_group = 'dwid3';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 7, 'How does the detergent dosing work?',
  'Fill the 250 ml liquid detergent reservoir and the rinse-aid reservoir and the machine doses each wash by how dirty the load is, which comes to about two weeks of normal use per fill. It takes any standard dishwasher detergent. For a single wash you can still drop a tablet or powder in the dispenser instead; the two modes are not used together.'
  FROM product WHERE variant_group = 'dwid3';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 8, 'What does the app add?',
  'Four programmes that are not on the panel: Glass Care at 60°C, Intensive at 70°C, Toy Care at 50°C and Self Clean at 65°C. It also starts a wash remotely over Wi-Fi and sets the self-clean reminder at 30, 60 or 90 days.'
  FROM product WHERE variant_group = 'dwid3';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 9, 'How is the DWID3 itself cleaned?',
  'The filter rinses itself every time the machine drains, and lifts out in three layers for a tap rinse when it needs one; VATTI suggests every three days. Self Clean runs 118 minutes at 65°C through the tub, the spray arms, the filter and the water channels, every one to two months. The drain seals itself after draining, so nothing comes back up.'
  FROM product WHERE variant_group = 'dwid3';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 10, 'What warranty does the DWID3 carry?',
  'The VATTI warranty agreement does not name dishwashers in its two-year appliance clause, so the term is the one your dealer states at purchase. Register the machine at [VATTI eWarranty](/vatti-ewarranty/) when you buy it, and keep the invoice: a claim needs both.'
  FROM product WHERE variant_group = 'dwid3';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 11, 'How much is the DWID3 and where can I buy it?',
  'VATTI Malaysia does not sell online. Find your nearest authorised dealer in the [dealer directory](/store-locations/), or send us your kitchen layout and we will point you at the one that stocks it and installs it.'
  FROM product WHERE variant_group = 'dwid3';
