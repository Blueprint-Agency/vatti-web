-- Hand-authored product content: the prose intro, the dimension drawing as
-- text, the per-product FAQ, and the metadata that turns a bare YouTube embed
-- into something readable. Source of truth, editable by hand, NOT generated.
--
-- Runs after products.sql, which creates the rows this file UPDATEs. Keyed on
-- slug, never on the scraped integer ids.
--
-- Where a figure comes from a PDF, the PDF is named in the comment above it.
-- Nothing here is invented: if a number is not in the drawing, the manual or
-- product_facet, it is not on the page.

-- athena-series-lifting-type-range-hood-v993 --------------------------------

-- Intro. The page had none, and 33 of the 39 products still have none. It
-- answers the two questions the H1 does not: what "lifting type" means, and
-- whether the thing fits.
UPDATE product SET intro_md =
  'A lifting type hood: the air inlet drops toward the hob when it runs, so it catches smoke about 350mm above the pot instead of 580mm away like a T-type. It moves 2,500 m³/h against 850 Pa of static pressure, which is the figure that decides whether a high-floor condo duct run actually clears, and holds 53 dB doing it. 896mm wide, for a standard hob run.'
  WHERE slug = 'athena-series-lifting-type-range-hood-v993';

-- Dimensions, transcribed from VATTI-Cooker-Hood-V993-Dimension.pdf (page 1,
-- "Product Dimension"). The asterisked 1,165 on the drawing is the maximum
-- with the chimney drawn out; 873 is the same hood with it closed.
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 1, 'product', 'Width', '896 mm', NULL, 'width', 896, 896 FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Depth', '420 mm', '432 mm including the rubber mats behind it' FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Height, closed', '873 mm', 'up to 1,165 mm with the chimney extended' FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Chimney adjustment', '0 to 320 mm', NULL FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'product', 'Chimney', '420 mm wide', '324 mm deep including the mats' FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 6, 'product', 'Body height', '325 mm', '475 mm with the inlet lowered' FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 7, 'product', 'Height, inlet lowered', '1,315 mm', 'measured to the top of the extended chimney' FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';

-- Installation, from page 2 of the same PDF ("Open Hole Size & Installation
-- Guideline"). The floor heights assume the 850mm cabinet the drawing states.
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 8, 'installation', 'Clearance above the hob', '500 to 600 mm', NULL, 'clearance', 500, 600 FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 9, 'installation', 'Bottom of hood from the floor', '1,350 to 1,450 mm', 'over an 850 mm cabinet' FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 10, 'installation', 'Cabinet opening', '910 mm', 'the shelf above the hood lifts out', 'opening', 910, 910 FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';
-- 2,300-2,400 off the floor in the drawing, which states an 850mm counter.
-- Stored here as the same hole measured from the counter instead, so the
-- checker's arithmetic survives a kitchen built to a different height.
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 11, 'installation', 'Ducting hole from the floor', '2,300 to 2,400 mm', '7 inch, back to back or side way', 'duct_above_counter', 1450, 1550 FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 12, 'installation', 'Hood outlet', '200 mm diameter', NULL FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 13, 'installation', 'Ventilation hose', '180 mm inside, 185 mm outside', NULL FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 14, 'installation', 'Telescopic pipe to the ceiling', '120 mm minimum', NULL FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';

-- FAQ. Seven questions, and the first four are the ones Search Console shows
-- nobody currently asks this page because it could not answer them: size,
-- height, duct, and whether it is enough. Answers stay inside what the drawing
-- and product_facet actually say, and send the reader to the model that IS the
-- right answer when this one is not.
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What size is the VATTI V993?',
  'It is 896 mm wide and 420 mm deep, or 432 mm deep counting the rubber mats that sit behind it. Closed it stands 873 mm tall and the chimney draws out to 1,165 mm. Built into a cabinet it needs a 910 mm clear opening, and the shelf directly above it has to be removable.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'How high should the V993 be installed above the hob?',
  '500 to 600 mm from the hob surface to the bottom of the hood. Over a standard 850 mm cabinet that puts the bottom of the hood 1,350 to 1,450 mm off the floor. Higher than 600 mm and the lifting inlet loses the advantage it was built for.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'What ducting does the V993 need?',
  'A 7 inch run. The hood outlet is 200 mm across and the supplied hose is 180 mm inside, 185 mm outside. The wall or ceiling hole sits 2,300 to 2,400 mm off the floor, back to back or to the side, and the telescopic pipe wants at least 120 mm of clearance to the ceiling.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'Is 2,500 m³/h enough for wok cooking in a condominium?',
  'For most condo kitchens, yes: 2,500 m³/h with 850 Pa of static pressure, and turbo lifts it to 22 m³/min for a wok flare or a deep fry. Static pressure is the number that matters in a high-rise, because a long shared duct with several bends fights back. If your run is long or has more than two bends, the [V929](/vatti-aetheris-series-cooker-hood-v929/) pushes 1,300 Pa and is the safer choice.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'How is the V993 cleaned?',
  'Hot pressure steam wash, run from the panel. The motor is sealed against water, which is what makes running a wash cycle through the canopy safe, and the fluid-type filter net takes 85% of the oil out of the smoke before it reaches the motor. The stainless body is welded seamlessly, so there is no joint to trap grease.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'What warranty does the V993 carry?',
  'Two years on the hood and ten years on the motor, for the original buyer, bought from an authorised dealer. Register it at [VATTI eWarranty](/vatti-ewarranty/) when you buy: the registration has to be complete at the time of purchase for a claim to hold.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 7, 'How much is the V993 and where can I buy it?',
  'VATTI Malaysia does not sell online. The V993 goes through authorised dealers, who quote their own installed price depending on the ducting your kitchen needs. Find the nearest one in the [dealer directory](/store-locations/), or send us your kitchen layout and we will point you at the one that stocks it.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';

-- The video, read off its own YouTube page: title, upload date and length are
-- that page's, the summary is written from its title, description and what it
-- shows. Without these the section is an iframe and a heading.
UPDATE product_video SET
  title = 'VATTI Cooker Hood V993',
  summary = 'The V993 in a working kitchen: DC motor, 2,500 m³/h, turbo suction for heavy cooking, and the hot pressure steam wash auto-clean cycle.',
  published_on = '2022-09-13',
  duration_seconds = 99
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993')
    AND video_id = 'Jcui1pueXCg';

-- vatti-aetheris-series-cooker-hood-v929 ------------------------------------
-- Figures from two sources, both the manufacturer's own: the installation
-- drawing (V929-Dim26-Final.pdf) and the specification panel that shipped as
-- one of the product images (V929-PG-15). Where they disagree, the site's own
-- spec bullets win: the panel prints 3150 m³/h and product_facet holds 3125,
-- which is the number the readout strip and the comparison table already show,
-- so 3125 is the one used here. The discrepancy is the manufacturer's.

UPDATE product SET intro_md =
  'The loudest hood in the range on paper and the quietest in the kitchen: 3,125 m³/h against 1,300 Pa of static pressure, the highest pressure VATTI sells, at 46.5 dB. Glass instead of a filter mesh, so oil runs into a cup rather than setting into metal. A PM2.5 sensor decides when it has finished, and a wave of the hand starts it. 896mm wide, hung 300mm over the hob.'
  WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';

-- Product size from the specification panel; the rest from the drawing.
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 1, 'product', 'Width', '896 mm', NULL, 'width', 896, 896 FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Height', '1,077 mm', 'with the chimney fitted' FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Depth', '354 mm', NULL FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Chimney', '218 mm wide', '324 mm deep' FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'product', 'Power', '208 W', '220 to 240 V, 50 Hz' FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 6, 'installation', 'Clearance above the hob', '300 mm', 'this hood hangs low on purpose, close to the pan', 'clearance', 300, 300 FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 7, 'installation', 'Bottom of hood from the floor', '1,150 mm', 'over an 850 mm cabinet' FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 8, 'installation', 'Ducting hole from the floor', '2,330 mm', '7 inch, back to back or side way', 'duct_above_counter', 1480, 1480 FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 9, 'installation', 'Ventilation hose', '190 mm', NULL FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 10, 'installation', 'Telescopic pipe to the ceiling', '120 mm minimum', NULL FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 11, 'installation', 'Burner centre from the wall', '280 mm maximum', 'past that and the panel stops catching the pan' FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';

-- No 'opening' metric: this hood is drawn hung on the wall, and the drawing
-- states no cabinet cut-out. The fit checker is therefore not rendered, which
-- is the intended behaviour rather than a gap to paper over with a guess.

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What size is the VATTI V929?',
  '896 mm wide, 354 mm deep and 1,077 mm tall with the chimney on. The chimney itself is 218 mm wide and 324 mm deep, so it reads narrower than the body from the front.'
  FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'How high should the V929 be installed above the hob?',
  '300 mm from the hob surface to the bottom of the hood, which is roughly 1,150 mm off the floor over a standard 850 mm cabinet. That is much lower than a T-type hood hangs, and it is the point: the panel is slanted so it sits close to the pan without anyone knocking their head on it.'
  FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'What ducting does the V929 need?',
  'A 7 inch run with a 190 mm hose. The wall or ceiling hole sits about 2,330 mm off the floor, back to back or to the side, and the telescopic pipe needs at least 120 mm of clearance to the ceiling. Keep the centre of the nearest burner within 280 mm of the wall.'
  FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'Is the V929 strong enough for a high-floor condominium?',
  'It is the strongest VATTI sells for exactly that case: 3,125 m³/h at 1,300 Pa of static pressure. Airflow moves air in an open kitchen; static pressure is what pushes it down a long shared duct with bends in it, and 1,300 Pa is half as much again as most of the range.'
  FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'Does the V929 have a filter to clean?',
  'No mesh filter at all. Oil runs down the AG tempered glass, which carries a nano coating, into a built-in cup you empty. The Booster Clean cycle washes the impeller itself, and 92% of the oil is taken out of the smoke before it gets that far.'
  FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'Does the V929 work with any hob?',
  'It vents any hob. The auto-link, where lighting the hob starts the hood by itself, works only with the [C836G](/vatti-flexi-hob-c836g/). On every other hob you start it by hand, or by waving at the sensor under the panel.'
  FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 7, 'What warranty does the V929 carry?',
  'Two years on the hood and ten years on the motor, for the original buyer, bought from an authorised dealer. Register it at [VATTI eWarranty](/vatti-ewarranty/) at the time of purchase: a claim needs the registration to be complete.'
  FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 8, 'How much is the V929 and where can I buy it?',
  'VATTI Malaysia does not sell online. The V929 goes through authorised dealers, who quote their own installed price against the ducting your kitchen needs. Find the nearest one in the [dealer directory](/store-locations/), or send us your kitchen layout and we will point you at the one that stocks it.'
  FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';

-- athena-series-lifting-type-range-hood-v999 --------------------------------
-- Installation and product figures from VATTI-Cooker-Hood-v999-Dimension.pdf.
-- The static pressure figure (1,000 Pa) is off the product's own slide and its
-- YouTube description; there is no pressure row in product_facet for this model,
-- so it appears in the copy and not in the readout strip.

UPDATE product SET intro_md =
  'A side hood: the canopy is a dome that gathers smoke into a chamber instead of a flat T-shape plate that lets it roll off the edges, and nothing hangs at head height over the hob. 2,500 m³/h against up to 1,000 Pa, at 52 dB, with a steam and hot-water clean cycle that ends by spinning the motor dry. 895mm wide, hung 400 to 500mm over the hob.'
  WHERE slug = 'athena-series-lifting-type-range-hood-v999';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 1, 'product', 'Width', '895 mm', NULL, 'width', 895, 895 FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Depth', '400 mm', 'including the rubber mats behind it' FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Height', '734 mm', 'body and chimney, chimney closed' FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Body height', '305 mm', NULL FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'product', 'Chimney cover', '420 mm wide', '310 mm deep, adjustable 450 to 790 mm' FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 6, 'installation', 'Clearance above the hob', '400 to 500 mm', NULL, 'clearance', 400, 500 FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 7, 'installation', 'Bottom of hood from the floor', '1,250 to 1,350 mm', 'over an 850 mm cabinet' FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 8, 'installation', 'Cabinet opening', '910 mm', '580 mm high, with a removable shelf above the hood', 'opening', 910, 910 FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 9, 'installation', 'Ducting hole from the floor', '2,253 to 2,353 mm', '7 inch, back to back or side way', 'duct_above_counter', 1403, 1503 FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 10, 'installation', 'Hood outlet', '200 mm diameter', NULL FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 11, 'installation', 'Ventilation hose', '180 mm inside, 185 mm outside', NULL FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 12, 'installation', 'Telescopic pipe to the ceiling', '120 mm minimum', NULL FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What size is the VATTI V999?',
  '895 mm wide and 400 mm deep counting the rubber mats behind it. The body is 305 mm tall and the whole thing stands 734 mm with the chimney closed; the chimney cover is 420 mm wide and draws out between 450 and 790 mm. Built into a cabinet it needs a 910 mm opening, 580 mm high, with a removable shelf above.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'How high should the V999 be installed above the hob?',
  '400 to 500 mm from the hob surface to the bottom of the hood, which puts the bottom 1,250 to 1,350 mm off the floor over a standard 850 mm cabinet. Because it is a side hood there is no canopy sticking out at head height, so the low end of that range is comfortable to cook under.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'What ducting does the V999 need?',
  'A 7 inch run. The outlet is 200 mm across and the supplied hose is 180 mm inside, 185 mm outside. The wall or ceiling hole sits 2,253 to 2,353 mm off the floor, back to back or to the side, and the telescopic pipe wants at least 120 mm of clearance to the ceiling.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'What is a side hood, and is it better than a T-shape?',
  'The intake is on the underside of a domed canopy rather than on a flat plate hung out over the hob. The dome holds the smoke in a chamber instead of letting it roll off the edges, and nothing projects at head height. It is the better shape for a small kitchen where the cook stands close to the wall; a T-shape still suits an island where the hood is approached from both sides.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'Is 2,500 m³/h enough for wok cooking?',
  'For most kitchens, yes: 2,500 m³/h against up to 1,000 Pa of static pressure, at 52 dB. If the duct run is long or has several bends, which is the usual case on a high floor, the [V929](/vatti-aetheris-series-cooker-hood-v929/) pushes 1,300 Pa and is the safer choice.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'How is the V999 cleaned?',
  'A three-stage cycle you start from the panel: 110°C steam melts the grease, 80°C high-pressure water scours what is left, and the motor spins itself dry for 30 seconds. The body is laser welded along its length, so there is no seam across the front to trap what the cycle misses. Oil filtration is 85%.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 7, 'What warranty does the V999 carry?',
  'Two years on the hood and ten years on the motor, for the original buyer, bought from an authorised dealer. Register it at [VATTI eWarranty](/vatti-ewarranty/) at the time of purchase: a claim needs the registration to be complete.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 8, 'How much is the V999 and where can I buy it?',
  'VATTI Malaysia does not sell online. The V999 goes through authorised dealers, who quote their own installed price against the ducting your kitchen needs. Find the nearest one in the [dealer directory](/store-locations/), or send us your kitchen layout and we will point you at the one that stocks it.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';

UPDATE product_video SET
  title = 'VATTI Cooker Hood V999',
  summary = 'The V999 in a kitchen: the rose gold edge, 2,500 m³/h against 1,000 Pa, and the smoke going straight into the dome.',
  published_on = '2022-09-11',
  duration_seconds = 99
  WHERE product_id = (SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999')
    AND video_id = 'dxWTvQS-fhs';
-- vatti-smart-oxygen-range-hood-v998 ----------------------------------------
-- Installation figures from V998-Dimension.pdf; the product size, power and
-- outlet from the specification panel that shipped as V998-PG15.

UPDATE product SET intro_md =
  'A hidden hood: 136mm deep at the front, so it sits flush inside a wall cabinet instead of hanging out of it, and the kitchen reads as joinery. Behind that panel is the strongest pairing in the slim range, 2,850 m³/h against 1,250 Pa at 49 dB, taking smoke from above and from the side at once. A PM2.5 sensor decides when it has finished, and the wash cycle runs steam and hot water together. 898mm wide.'
  WHERE slug = 'vatti-smart-oxygen-range-hood-v998';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 1, 'product', 'Width', '898 mm', NULL, 'width', 898, 898 FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Depth', '320 mm', 'including the rubber mats; 313 mm at the body' FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Height', '911 mm', 'body and chimney' FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Panel depth', '136 mm', 'the 12.6 cm the slim series is named for, with the mat' FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'product', 'Chimney', '400 mm wide', NULL FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 6, 'product', 'Power', '200 W maximum', '4 W standing, 220 to 240 V, 50 Hz' FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 7, 'installation', 'Clearance above the hob', '420 to 460 mm', NULL, 'clearance', 420, 460 FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 8, 'installation', 'Bottom of hood from the floor', '1,270 to 1,310 mm', 'over an 850 mm cabinet' FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 9, 'installation', 'Cabinet opening', '898 mm', 'with a removable shelf above the hood', 'opening', 898, 898 FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 10, 'installation', 'Ducting hole from the floor', '2,430 to 2,470 mm', '7 inch, back to back or side way', 'duct_above_counter', 1580, 1620 FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 11, 'installation', 'Hood outlet', '235 mm diameter', NULL FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 12, 'installation', 'Ventilation hose', '180 mm inside, 185 mm outside', NULL FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 13, 'installation', 'Telescopic pipe to the ceiling', '120 mm minimum', NULL FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 14, 'installation', 'Burner centre from the wall', '280 mm maximum', NULL FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What size is the VATTI V998?',
  '898 mm wide, 320 mm deep including the mats behind it, and 911 mm tall with the chimney. The front panel is only 136 mm deep, which is the 12.6 cm the slim series is named for. Built into a cabinet it needs an 898 mm opening with a removable shelf above.'
  FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'How high should the V998 be installed above the hob?',
  '420 to 460 mm from the hob surface to the bottom of the hood, which puts the bottom 1,270 to 1,310 mm off the floor over a standard 850 mm cabinet.'
  FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'What ducting does the V998 need?',
  'A 7 inch run. The outlet is 235 mm across and the hose is 180 mm inside, 185 mm outside. The wall or ceiling hole sits 2,430 to 2,470 mm off the floor, back to back or to the side, with at least 120 mm of clearance from the telescopic pipe to the ceiling. Keep the centre of the nearest burner within 280 mm of the wall.'
  FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'Does a slim hood actually pull as hard as a full one?',
  'This one does: 2,850 m³/h against 1,250 Pa of static pressure, which is more pressure than most full-size hoods in the range. The suction is taken from the top and the side at once, so the thin front is a packaging decision rather than a compromise on the fan.'
  FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'How is the V998 cleaned?',
  'Steam and hot water together, driven by a heating pump, with a paddle brush scrubbing the blades and cavity: VATTI measures the cleaned area at up to 99.1% against under 50% for a plain water wash. There is no mesh filter to take down, the guide plate is enamelled so one wipe clears it, and 92% of the oil is separated before it reaches the motor.'
  FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'Does the V998 link to the hob?',
  'With selected VATTI hobs, yes: lighting the hob starts the extraction by itself. On any other hob it runs from the panel or the hand sensor.'
  FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 7, 'What warranty does the V998 carry?',
  'Two years on the hood and ten years on the motor, for the original buyer, bought from an authorised dealer. Register it at [VATTI eWarranty](/vatti-ewarranty/) at the time of purchase: a claim needs the registration to be complete.'
  FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 8, 'How much is the V998 and where can I buy it?',
  'VATTI Malaysia does not sell online. The V998 goes through authorised dealers, who quote their own installed price against the ducting your kitchen needs. Find the nearest one in the [dealer directory](/store-locations/), or send us your kitchen layout and we will point you at the one that stocks it.'
  FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';

-- triple-intake-series-t-type-cooker-hood-v937 ------------------------------
-- Installation figures from VATTI-Cooker-Hood-V937-Dimension.pdf; the product
-- size from the SPECIFICATION panel that shipped as V937-8.

UPDATE product SET intro_md =
  'A T-type hood with three intake cavities instead of one, a wide one between two narrow ones, so the low-pressure zone covers the whole hob rather than the middle of it. 2,500 m³/h against 1,050 Pa at 46 dB, and it reads the duct it is fitted to and sets its pressure to match. The main oil filter comes out in one piece for the sink. 896mm wide, hung 650 to 700mm over the hob.'
  WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 1, 'product', 'Width', '896 mm', NULL, 'width', 896, 896 FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Depth', '500 mm', '512 mm with the back feet' FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Height', '908 mm', 'chimney closed' FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Chimney', '400 mm wide', 'second chimney section, 396 mm' FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'product', 'Chimney adjustment', '0 to 320 mm', NULL FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 6, 'product', 'Canopy depth', '322 mm', '325 mm with the back feet' FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 7, 'installation', 'Clearance above the hob', '650 to 700 mm', 'a T-type hangs high; the canopy is what catches the smoke', 'clearance', 650, 700 FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 8, 'installation', 'Bottom of hood from the floor', '1,500 to 1,550 mm', 'over an 850 mm cabinet' FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 9, 'installation', 'Cabinet opening', '910 mm', NULL, 'opening', 910, 910 FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 10, 'installation', 'Ducting hole from the floor', '2,370 to 2,420 mm', '7 inch, back to back or side way', 'duct_above_counter', 1520, 1570 FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 11, 'installation', 'Hood outlet', '190 mm diameter', NULL FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 12, 'installation', 'Ventilation hose', '180 mm inside, 185 mm outside', NULL FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 13, 'installation', 'Telescopic pipe to the ceiling', '120 mm minimum', NULL FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What size is the VATTI V937?',
  '896 mm wide, 500 mm deep, or 512 mm counting the back feet, and 908 mm tall with the chimney closed. The chimney is 400 mm wide and adjusts through 320 mm. Built into a cabinet it needs a 910 mm opening.'
  FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'How high should the V937 be installed above the hob?',
  '650 to 700 mm from the hob surface to the bottom of the hood, which puts the bottom 1,500 to 1,550 mm off the floor over a standard 850 mm cabinet. A T-type hangs higher than a slant hood on purpose: the canopy is deep, and the cook has to be able to stand under it.'
  FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'What ducting does the V937 need?',
  'A 7 inch run. The outlet is 190 mm across and the hose is 180 mm inside, 185 mm outside. The wall or ceiling hole sits 2,370 to 2,420 mm off the floor, back to back or to the side, with at least 120 mm from the telescopic pipe to the ceiling.'
  FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'What does the triple intake actually do?',
  'It spreads the suction. One cavity pulls hardest directly under itself; three cavities in a 1:5:1 arrangement hold a low-pressure zone across the full width of the hob, so a pan on the front left burner is under the hood as much as a pot in the middle is.'
  FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'Is 2,500 m³/h enough for a condominium kitchen?',
  'With 1,050 Pa of static pressure behind it, yes for most. Pressure is what matters once the duct is long or has bends, which is the usual high-floor case. If yours is a long shared run, the [V929](/vatti-aetheris-series-cooker-hood-v929/) pushes 1,300 Pa and the [V938](/vatti-hidden-series-range-hood-v938/) 1,600 Pa.'
  FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'How is the V937 cleaned?',
  'A steamed auto-clean cycle you start from the panel, and a main oil filter that disassembles completely so it can be washed in the sink rather than wiped in place. Oil filtration is 85%, and the surface carries a pro nano coating.'
  FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 7, 'What warranty does the V937 carry?',
  'Two years on the hood and ten years on the motor, for the original buyer, bought from an authorised dealer. Register it at [VATTI eWarranty](/vatti-ewarranty/) at the time of purchase: a claim needs the registration to be complete.'
  FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 8, 'How much is the V937 and where can I buy it?',
  'VATTI Malaysia does not sell online. The V937 goes through authorised dealers, who quote their own installed price against the ducting your kitchen needs. Find the nearest one in the [dealer directory](/store-locations/), or send us your kitchen layout and we will point you at the one that stocks it.'
  FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';

UPDATE product_video SET
  title = 'VATTI Cooker Hood V937',
  summary = 'A minute with the V937 running: the three intake cavities, the panel, and the canopy over a working hob.',
  published_on = '2023-10-01',
  duration_seconds = 64
  WHERE product_id = (SELECT id FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937')
    AND video_id = 's6fHLhFwEu4';

UPDATE product_video SET
  title = 'VATTI Cooker Hood V937: the easy-clean design',
  summary = 'Two minutes on cleaning: the oil filter coming out in one piece, and the steamed auto-clean cycle from the panel.',
  published_on = '2024-03-30',
  duration_seconds = 124
  WHERE product_id = (SELECT id FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937')
    AND video_id = 'vx5EsrkiiJM';

-- vatti-hidden-series-range-hood-v938 ---------------------------------------
-- Installation figures from V938-Dimensions.pdf; the electrical figures, the
-- motor detail and the cleaning rates from the specification poster (V938-PG17)
-- and the cleaning poster (V938-PG13).

UPDATE product SET intro_md =
  'The hood for the kitchen that does not want one: the body sits inside the cabinet run at 325mm deep and only the front edge shows. Behind it is the hardest-pulling pair VATTI sells, 3,650 m³/h against 1,600 Pa, held at 47 dB by a 3.2 kg BLDC inverter motor. It reads the duct and sets its own extraction, it purifies on standby, and the wash cycle runs steam and hot water together.'
  WHERE slug = 'vatti-hidden-series-range-hood-v938';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 1, 'product', 'Slim depth', '325 mm', 'the part that sits inside the cabinet', NULL, NULL, NULL FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Opening clearance', '105 mm', 'how far the front drops when it runs' FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Motor', '490 W rated', 'BLDC inverter, 3.2 kg core, 2,000 rpm, rated past 30,000 hours' FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Supply', '220 to 240 V', '50 to 60 Hz, energy rating Grade 1' FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'product', 'Lighting', '2 x 2 W LED', NULL FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 6, 'installation', 'Clearance above the hob', '600 to 650 mm', NULL, 'clearance', 600, 650 FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 7, 'installation', 'Bottom of hood from the floor', '1,450 to 1,500 mm', 'over an 850 mm cabinet' FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 8, 'installation', 'Ducting hole from the floor', '2,380 mm', '7 inch, back to back or side way', 'duct_above_counter', 1530, 1530 FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'How is the V938 hidden, exactly?',
  'The body is 325 mm deep and sits inside the wall cabinet, so from the room you see the front panel and nothing else. When it runs the front drops 105 mm to open the intake. It can also be fitted semi-integrated or standalone if the cabinetry is not there.'
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'How high should the V938 be installed above the hob?',
  '600 to 650 mm from the hob surface to the bottom of the hood, which puts the bottom 1,450 to 1,500 mm off the floor over a standard 850 mm cabinet.'
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'What ducting does the V938 need?',
  'A 7 inch run, with the wall or ceiling hole about 2,380 mm off the floor, back to back or to the side. Given 1,600 Pa of static pressure, this is the model that copes best with a long or bent run.'
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'Is the V938 the strongest hood VATTI Malaysia sells?',
  'Yes, on both numbers that matter: 3,650 m³/h of airflow and 1,600 Pa of static pressure, at 47 dB. The next strongest is the [V929](/vatti-aetheris-series-cooker-hood-v929/) at 3,125 m³/h and 1,300 Pa.'
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'How is the V938 cleaned?',
  'A fifth-generation cycle that runs steam and hot water together, cleaning the inner chamber as well as the fan: VATTI measures 99.1% coverage, 99.2% deep clean and 99.99% sterilisation. Grease separation is 92% and odour reduction 97%.'
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'What can the V938 do by itself?',
  'It starts when the hob is lit and shuts down three minutes after cooking ends. It reads the resistance of the duct and sets extraction to match. On standby it samples the air and ventilates when it needs to. It also takes commands from the app, and from a wave of the hand.'
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 7, 'What warranty does the V938 carry?',
  'Two years on the hood and ten years on the motor, for the original buyer, bought from an authorised dealer. Register it at [VATTI eWarranty](/vatti-ewarranty/) at the time of purchase: a claim needs the registration to be complete.'
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 8, 'How much is the V938 and where can I buy it?',
  'VATTI Malaysia does not sell online. The V938 goes through authorised dealers, who quote their own installed price against the cabinetry and ducting your kitchen needs. Find the nearest one in the [dealer directory](/store-locations/), or send us your kitchen layout and we will point you at the one that stocks it.'
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';

-- vatti-magic-series-cooker-hood-v919 ---------------------------------------
-- Installation figures from V919-Dimension-1.pdf; the pressure pair and the
-- noise figure from the specification slide (Slide13).

UPDATE product SET intro_md =
  'A slim hood for a cabinet run: 270 to 330mm deep, with a closed negative-pressure underside 513mm across that holds the pocket under the whole canopy. 3,050 m³/h of turbo suction, 450 Pa rated and 1,300 Pa at peak, at 50 dB. It watches the resistance of the shared duct while you cook and adjusts to it, and the oil screen splits in two for the dishwasher.'
  WHERE slug = 'vatti-magic-series-cooker-hood-v919';

INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 1, 'product', 'Depth', '270 to 330 mm', 'depending on how it is fitted' FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Negative pressure bottom', '513 mm', 'the closed underside that holds the pocket' FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Static pressure', '450 Pa rated', '1,300 Pa maximum' FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 4, 'installation', 'Clearance above the hob', '400 to 430 mm', NULL, 'clearance', 400, 430 FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'installation', 'Bottom of hood from the floor', '1,250 to 1,280 mm', 'over an 850 mm cabinet' FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 6, 'installation', 'Ducting hole from the floor', '2,390 to 2,420 mm', '7 inch, back to back or side way', 'duct_above_counter', 1540, 1570 FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'How deep is the VATTI V919?',
  '270 to 330 mm, depending on whether it is hung open, set into a cabinet or fully built in. The closed underside that does the catching is 513 mm across.'
  FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'How high should the V919 be installed above the hob?',
  '400 to 430 mm from the hob surface to the bottom of the hood, which puts the bottom 1,250 to 1,280 mm off the floor over a standard 850 mm cabinet.'
  FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'What ducting does the V919 need?',
  'A 7 inch run, with the wall or ceiling hole 2,390 to 2,420 mm off the floor, back to back or to the side. It can also be run recycled rather than ducted where there is no riser to reach.'
  FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'What does 450 Pa rated and 1,300 Pa maximum mean?',
  'Rated pressure is what it holds continuously; maximum is what it can reach against a duct that fights back. On a short run the hood works at the low figure, quietly. On a long shared riser at dinner time it has 1,300 Pa in reserve, and it decides that for itself rather than waiting to be asked.'
  FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'How is the V919 cleaned?',
  'A one-key steam wash: high-pressure hot water flushes the cavity, then the motor spins itself dry. The oil screen is quick-release and splits into two sections small enough for the dishwasher, and the chamber carries a nano coating so less sticks in the first place. Oil filtration is 92%.'
  FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'What warranty does the V919 carry?',
  'Two years on the hood and ten years on the motor, for the original buyer, bought from an authorised dealer. Register it at [VATTI eWarranty](/vatti-ewarranty/) at the time of purchase: a claim needs the registration to be complete.'
  FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 7, 'How much is the V919 and where can I buy it?',
  'VATTI Malaysia does not sell online. The V919 goes through authorised dealers, who quote their own installed price against the cabinetry and ducting your kitchen needs. Find the nearest one in the [dealer directory](/store-locations/), or send us your kitchen layout and we will point you at the one that stocks it.'
  FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';

-- vatti-range-hood-v997 -----------------------------------------------------
-- Installation and product figures from V997-Full-Dimension.pdf; the electrical
-- figures and the noise level from the specification poster.

UPDATE product SET intro_md =
  'A four-chamber hood that pulls from the top and closes at the side, which VATTI puts at 99% smoke capture against 70% for the two-chamber design it descends from. 2,800 m³/h against 1,200 Pa at 48 dB, from a brushless motor on a Grade 1 energy rating. 896mm wide and 36cm slim, hung 300 to 380mm over the hob, in AG grey, pearl white or black.'
  WHERE slug = 'vatti-range-hood-v997';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 1, 'product', 'Width', '896 mm', NULL, 'width', 896, 896 FROM product WHERE slug = 'vatti-range-hood-v997';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Depth', '360 mm', 'including the mats; 353 mm at the body' FROM product WHERE slug = 'vatti-range-hood-v997';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Height', '908 mm', 'body and chimney' FROM product WHERE slug = 'vatti-range-hood-v997';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Chimney', '420 mm wide', '307 mm deep' FROM product WHERE slug = 'vatti-range-hood-v997';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'product', 'Power', '208 W', '220 to 240 V, 50 Hz, energy rating Level 1' FROM product WHERE slug = 'vatti-range-hood-v997';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 6, 'product', 'Lighting', '2 x 2 W LED', NULL FROM product WHERE slug = 'vatti-range-hood-v997';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 7, 'installation', 'Clearance above the hob', '300 to 380 mm', 'a side hood hangs low, close to the pan', 'clearance', 300, 380 FROM product WHERE slug = 'vatti-range-hood-v997';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 8, 'installation', 'Bottom of hood from the floor', '1,150 to 1,230 mm', 'over an 850 mm cabinet' FROM product WHERE slug = 'vatti-range-hood-v997';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 9, 'installation', 'Cabinet opening', '910 mm', 'with a removable shelf on top of the hood', 'opening', 910, 910 FROM product WHERE slug = 'vatti-range-hood-v997';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 10, 'installation', 'Ducting hole from the floor', '2,310 to 2,390 mm', '7 inch, back to back or side way', 'duct_above_counter', 1460, 1540 FROM product WHERE slug = 'vatti-range-hood-v997';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 11, 'installation', 'Hood outlet', '210 mm diameter', NULL FROM product WHERE slug = 'vatti-range-hood-v997';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 12, 'installation', 'Ventilation hose', '180 mm inside, 185 mm outside', NULL FROM product WHERE slug = 'vatti-range-hood-v997';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 13, 'installation', 'Telescopic pipe to the ceiling', '120 mm minimum', NULL FROM product WHERE slug = 'vatti-range-hood-v997';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 14, 'installation', 'Burner centre from the wall', '280 mm maximum', NULL FROM product WHERE slug = 'vatti-range-hood-v997';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What size is the VATTI V997?',
  '896 mm wide, 360 mm deep including the mats behind it, and 908 mm tall with the chimney. The chimney is 420 mm wide. Built into a cabinet it needs a 910 mm opening and a removable shelf directly above the hood.'
  FROM product WHERE slug = 'vatti-range-hood-v997';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'How high should the V997 be installed above the hob?',
  '300 to 380 mm from the hob surface to the bottom of the hood, which puts the bottom 1,150 to 1,230 mm off the floor over a standard 850 mm cabinet. That is deliberately low: the inlet is on the underside and it works by being close to the pan.'
  FROM product WHERE slug = 'vatti-range-hood-v997';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'What ducting does the V997 need?',
  'A 7 inch run. The outlet is 210 mm across and the hose is 180 mm inside, 185 mm outside. The wall or ceiling hole sits 2,310 to 2,390 mm off the floor, back to back or to the side, with at least 120 mm from the telescopic pipe to the ceiling. Keep the centre of the nearest burner within 280 mm of the wall.'
  FROM product WHERE slug = 'vatti-range-hood-v997';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'What does the four-chamber system actually change?',
  'It is where the smoke is held before the fan takes it. Two chambers captured about 70%, three about 80%, and four about 99% by VATTI''s own measure. In a kitchen that means less smoke rolling out at the sides of the canopy while a wok is going.'
  FROM product WHERE slug = 'vatti-range-hood-v997';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'What colours does the V997 come in?',
  'AG grey, pearl white and black. They are the same hood: the finish is the only difference, and all three carry the same figures.'
  FROM product WHERE slug = 'vatti-range-hood-v997';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'How is the V997 cleaned?',
  'Turbo Wash, the fifth generation of the VATTI cycle: the wash expands in a wave to cover a wider area of the impeller, which VATTI measures at 99.1% effective. The chamber carries a nano coating, and oil separation is 92%.'
  FROM product WHERE slug = 'vatti-range-hood-v997';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 7, 'What warranty does the V997 carry?',
  'Two years on the hood and ten years on the motor, for the original buyer, bought from an authorised dealer. Register it at [VATTI eWarranty](/vatti-ewarranty/) at the time of purchase: a claim needs the registration to be complete.'
  FROM product WHERE slug = 'vatti-range-hood-v997';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 8, 'How much is the V997 and where can I buy it?',
  'VATTI Malaysia does not sell online. The V997 goes through authorised dealers, who quote their own installed price against the ducting your kitchen needs. Find the nearest one in the [dealer directory](/store-locations/), or send us your kitchen layout and we will point you at the one that stocks it.'
  FROM product WHERE slug = 'vatti-range-hood-v997';

-- slim-series-type-range-hood-v995 ------------------------------------------
-- No feature images at all on this product, so there are no blocks to write.
-- Everything below is drawing and spec-bullet work, which is most of what a
-- buyer needed from the page anyway.

UPDATE product SET intro_md =
  'The slim hood for a kitchen that cannot give up the depth: 315mm deep, 136mm at the front, and 898mm wide. 2,050 m³/h against 450 Pa at 52 dB, with a cold-wash auto-clean cycle and a water-proof motor. Hung 300 to 380mm over the hob, close to the pan.'
  WHERE slug = 'slim-series-type-range-hood-v995';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 1, 'product', 'Width', '898 mm', NULL, 'width', 898, 898 FROM product WHERE slug = 'slim-series-type-range-hood-v995';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Depth', '315 mm', '136 mm at the front, including the mat' FROM product WHERE slug = 'slim-series-type-range-hood-v995';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Height', '911 mm', 'body and chimney' FROM product WHERE slug = 'slim-series-type-range-hood-v995';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Chimney', '400 mm wide', NULL FROM product WHERE slug = 'slim-series-type-range-hood-v995';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 5, 'installation', 'Clearance above the hob', '300 to 380 mm', NULL, 'clearance', 300, 380 FROM product WHERE slug = 'slim-series-type-range-hood-v995';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 6, 'installation', 'Bottom of hood from the floor', '1,150 to 1,230 mm', 'over an 850 mm cabinet' FROM product WHERE slug = 'slim-series-type-range-hood-v995';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 7, 'installation', 'Cabinet opening', '898 mm', 'with a removable shelf on top of the hood', 'opening', 898, 898 FROM product WHERE slug = 'slim-series-type-range-hood-v995';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 8, 'installation', 'Ducting hole from the floor', '2,310 to 2,390 mm', '7 inch, back to back or side way', 'duct_above_counter', 1460, 1540 FROM product WHERE slug = 'slim-series-type-range-hood-v995';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 9, 'installation', 'Hood outlet', '190 mm diameter', NULL FROM product WHERE slug = 'slim-series-type-range-hood-v995';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 10, 'installation', 'Ventilation hose', '180 mm inside, 185 mm outside', NULL FROM product WHERE slug = 'slim-series-type-range-hood-v995';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What size is the VATTI V995?',
  '898 mm wide, 315 mm deep and 911 mm tall with the chimney. The front is only 136 mm deep. Built into a cabinet it needs an 898 mm opening with a removable shelf above the hood.'
  FROM product WHERE slug = 'slim-series-type-range-hood-v995';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'How high should the V995 be installed above the hob?',
  '300 to 380 mm from the hob surface to the bottom of the hood, or 1,150 to 1,230 mm off the floor over a standard 850 mm cabinet.'
  FROM product WHERE slug = 'slim-series-type-range-hood-v995';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'What ducting does the V995 need?',
  'A 7 inch run. The outlet is 190 mm across and the hose is 180 mm inside, 185 mm outside; the hole sits 2,310 to 2,390 mm off the floor, back to back or to the side.'
  FROM product WHERE slug = 'slim-series-type-range-hood-v995';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'Is 450 Pa enough for a condominium?',
  'For a short, direct duct run, yes. 450 Pa is the lowest static pressure in the hood range, so on a high floor with a long shared riser and several bends it is the wrong end of the catalogue: the [V997](/vatti-range-hood-v997/) holds 1,200 Pa and the [V929](/vatti-aetheris-series-cooker-hood-v929/) 1,300 Pa in the same slim shape.'
  FROM product WHERE slug = 'slim-series-type-range-hood-v995';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'How is the V995 cleaned?',
  'A cold-wash auto-clean cycle, and a water-proof motor that makes running water through the canopy safe. Oil filtration is 92%.'
  FROM product WHERE slug = 'slim-series-type-range-hood-v995';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'What warranty does the V995 carry?',
  'Two years on the hood and ten years on the motor, for the original buyer, bought from an authorised dealer. Register it at [VATTI eWarranty](/vatti-ewarranty/) at the time of purchase.'
  FROM product WHERE slug = 'slim-series-type-range-hood-v995';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 7, 'How much is the V995 and where can I buy it?',
  'VATTI Malaysia does not sell online. Find your nearest authorised dealer in the [dealer directory](/store-locations/), or send us your kitchen layout and we will point you at the one that stocks it.'
  FROM product WHERE slug = 'slim-series-type-range-hood-v995';

-- artemis-series-t-type-range-hood-v931 -------------------------------------

UPDATE product SET intro_md =
  'The entry T-type: a 940mm canopy over a 896mm body, hung 650 to 700mm above the hob so there is room to stand under it. 1,860 m³/h against 420 Pa at 54 dB, with a hot-pressure steam wash, a nano-coated chamber and a water-proof motor. Ducted or recycled, whichever the kitchen allows.'
  WHERE slug = 'artemis-series-t-type-range-hood-v931';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 1, 'product', 'Width', '896 mm', NULL, 'width', 896, 896 FROM product WHERE slug = 'artemis-series-t-type-range-hood-v931';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Depth', '500 mm', '513 mm including the mats' FROM product WHERE slug = 'artemis-series-t-type-range-hood-v931';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Height', '940 mm', 'canopy extended; 620 mm canopy over an 85 mm body' FROM product WHERE slug = 'artemis-series-t-type-range-hood-v931';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Chimney', '400 mm wide', '324 mm deep including the mats, adjustable through 320 mm' FROM product WHERE slug = 'artemis-series-t-type-range-hood-v931';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 5, 'installation', 'Clearance above the hob', '650 to 700 mm', 'a T-type hangs high; the canopy is what catches the smoke', 'clearance', 650, 700 FROM product WHERE slug = 'artemis-series-t-type-range-hood-v931';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 6, 'installation', 'Bottom of hood from the floor', '1,500 to 1,550 mm', 'over an 850 mm cabinet' FROM product WHERE slug = 'artemis-series-t-type-range-hood-v931';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 7, 'installation', 'Cabinet opening', '910 mm', 'with a removable shelf on top of the hood', 'opening', 910, 910 FROM product WHERE slug = 'artemis-series-t-type-range-hood-v931';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 8, 'installation', 'Ducting hole from the floor', '2,370 to 2,420 mm', '7 inch, back to back or side way', 'duct_above_counter', 1520, 1570 FROM product WHERE slug = 'artemis-series-t-type-range-hood-v931';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 9, 'installation', 'Hood outlet', '200 mm diameter', NULL FROM product WHERE slug = 'artemis-series-t-type-range-hood-v931';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 10, 'installation', 'Ventilation hose', '180 mm inside, 185 mm outside', NULL FROM product WHERE slug = 'artemis-series-t-type-range-hood-v931';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 11, 'installation', 'Telescopic pipe to the ceiling', '120 mm minimum', NULL FROM product WHERE slug = 'artemis-series-t-type-range-hood-v931';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What size is the VATTI V931?',
  '896 mm wide and 500 mm deep, or 513 mm counting the mats behind it. The canopy stands 620 mm over an 85 mm body and extends to 940 mm. Built into a cabinet it needs a 910 mm opening with a removable shelf above.'
  FROM product WHERE slug = 'artemis-series-t-type-range-hood-v931';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'How high should the V931 be installed above the hob?',
  '650 to 700 mm from the hob surface, which puts the bottom of the hood 1,500 to 1,550 mm off the floor over a standard 850 mm cabinet. A T-type hangs higher than a slant hood because the canopy projects over the cook.'
  FROM product WHERE slug = 'artemis-series-t-type-range-hood-v931';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'What ducting does the V931 need?',
  'A 7 inch run, hole 2,370 to 2,420 mm off the floor, outlet 200 mm across, hose 180 mm inside. It can also be run recycled where there is no riser to reach.'
  FROM product WHERE slug = 'artemis-series-t-type-range-hood-v931';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'Is the V931 strong enough for wok cooking?',
  'It is the gentlest hood in the range: 1,860 m³/h against 420 Pa. That suits a landed kitchen with a short duct and moderate cooking. For daily high-heat wok work, or a high floor on a shared riser, start at the [V937](/triple-intake-series-t-type-cooker-hood-v937/) at 1,050 Pa.'
  FROM product WHERE slug = 'artemis-series-t-type-range-hood-v931';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'How is the V931 cleaned?',
  'Tru-clean, a hot-pressure steam wash run from the panel. The chamber carries a nano coating and the body an anti-rust coating, and oil filtration is 85%.'
  FROM product WHERE slug = 'artemis-series-t-type-range-hood-v931';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'What warranty does the V931 carry?',
  'Two years on the hood and ten years on the motor, for the original buyer, bought from an authorised dealer. Register it at [VATTI eWarranty](/vatti-ewarranty/) at the time of purchase.'
  FROM product WHERE slug = 'artemis-series-t-type-range-hood-v931';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 7, 'How much is the V931 and where can I buy it?',
  'VATTI Malaysia does not sell online. Find your nearest authorised dealer in the [dealer directory](/store-locations/), or send us your kitchen layout and we will point you at the one that stocks it.'
  FROM product WHERE slug = 'artemis-series-t-type-range-hood-v931';

-- athena-series-lifting-type-range-hood-v991 --------------------------------

UPDATE product SET intro_md =
  'A slant hood in piano black with a champagne line along its edge, hung 400 to 500mm over the hob. 2,050 m³/h against 460 Pa at 54 dB, through a patented V-shaped housing, with a baffle plate that closes behind the smoke so the centre tunnel does not leak it back. Five hand gestures run it without touching the glass. 895mm wide.'
  WHERE slug = 'athena-series-lifting-type-range-hood-v991';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 1, 'product', 'Width', '895 mm', NULL, 'width', 895, 895 FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Depth', '444 mm', NULL FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Height', '622 mm', 'body only, without the chimney cover' FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Chimney cover', '420 mm wide', '310 mm deep, adjustable 450 to 790 mm' FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 5, 'installation', 'Clearance above the hob', '400 to 500 mm', NULL, 'clearance', 400, 500 FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 6, 'installation', 'Bottom of hood from the floor', '1,250 to 1,350 mm', 'over an 850 mm cabinet' FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 7, 'installation', 'Cabinet opening', '910 mm', 'with a removable shelf on top of the hood', 'opening', 910, 910 FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 8, 'installation', 'Ducting hole from the floor', '2,220 to 2,320 mm', '7 inch, back to back or side way', 'duct_above_counter', 1370, 1470 FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 9, 'installation', 'Hood outlet', '190 mm diameter', NULL FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 10, 'installation', 'Ventilation hose', '180 mm inside, 185 mm outside', NULL FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 11, 'installation', 'Telescopic pipe to the ceiling', '120 mm minimum', NULL FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What size is the VATTI V991?',
  '895 mm wide, 444 mm deep and 622 mm tall at the body. The chimney cover is 420 mm wide and draws out between 450 and 790 mm. Built into a cabinet it needs a 910 mm opening with a removable shelf above.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'How high should the V991 be installed above the hob?',
  '400 to 500 mm from the hob surface to the bottom of the hood, or 1,250 to 1,350 mm off the floor over a standard 850 mm cabinet.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'What ducting does the V991 need?',
  'A 7 inch run, hole 2,220 to 2,320 mm off the floor, outlet 190 mm across, hose 180 mm inside and 185 mm outside, with at least 120 mm from the telescopic pipe to the ceiling.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'How do the hand gestures work?',
  'Swing a hand left to right to set the volume: one swing turns on the light and the suction, a second starts turbo, a third goes back to the second volume. Swing right to left to switch it off. It is there so the controls never need touching mid-cook.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'Is 2,050 m³/h enough for wok cooking?',
  'In a kitchen with a short duct run, yes, and the baffle plate helps by holding the smoke at the canopy. At 460 Pa it is not the model for a long shared riser on a high floor: the [V997](/vatti-range-hood-v997/) at 1,200 Pa and the [V929](/vatti-aetheris-series-cooker-hood-v929/) at 1,300 Pa are.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'How is the V991 cleaned?',
  'A cold-wash auto-clean cycle behind a water-proof motor, with a piano-black body that wipes down in one pass. Oil filtration is 85%.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 7, 'What warranty does the V991 carry, and where can I buy it?',
  'Two years on the hood and ten years on the motor, for the original buyer, bought from an authorised dealer; register it at [VATTI eWarranty](/vatti-ewarranty/) at the time of purchase. VATTI Malaysia does not sell online, so the price is the dealer''s: find the nearest one in the [dealer directory](/store-locations/).'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991';

-- vatti-slim-series-type-range-hood-v996 ------------------------------------
-- Figures from VATTI-Cooker-Hood-v996-Dimension.pdf.

UPDATE product SET intro_md =
  'A slim body with two inlets: one on the top that collects smoke as it rises, one on the side that takes it lower down. 1,950 m³/h against 500 Pa at 54 dB, 345mm deep so it fits a cabinet run, and cleaned by heat rather than water, seventeen minutes at a press. 896mm wide, hung 300 to 380mm over the hob.'
  WHERE slug = 'vatti-slim-series-type-range-hood-v996';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 1, 'product', 'Width', '896 mm', NULL, 'width', 896, 896 FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Depth', '345 mm', '360 mm including the mats' FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Height', '870 mm', 'body and chimney' FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Front panel', '77 mm', 'the visible edge under a cabinet' FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'product', 'Chimney', '400 mm wide', '297 mm deep' FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 6, 'installation', 'Clearance above the hob', '300 to 380 mm', NULL, 'clearance', 300, 380 FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 7, 'installation', 'Bottom of hood from the floor', '1,150 to 1,230 mm', 'over an 850 mm cabinet' FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 8, 'installation', 'Cabinet opening', '896 mm', 'with a removable shelf on top of the hood', 'opening', 896, 896 FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 9, 'installation', 'Ducting hole from the floor', '2,270 to 2,350 mm', '7 inch, back to back or side way', 'duct_above_counter', 1420, 1500 FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 10, 'installation', 'Hood outlet', '190 mm diameter', NULL FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 11, 'installation', 'Ventilation hose', '180 mm inside, 185 mm outside', NULL FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 12, 'installation', 'Burner centre from the wall', '290 mm maximum', NULL FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What size is the VATTI V996?',
  '896 mm wide, 345 mm deep, or 360 mm counting the mats, and 870 mm tall with the chimney. The visible front edge is 77 mm. Built into a cabinet it needs an 896 mm opening with a removable shelf above the hood.'
  FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'How high should the V996 be installed above the hob?',
  '300 to 380 mm from the hob surface to the bottom of the hood, or 1,150 to 1,230 mm off the floor over a standard 850 mm cabinet. Keep the centre of the nearest burner within 290 mm of the wall.'
  FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'What ducting does the V996 need?',
  'A 7 inch run. The outlet is 190 mm across and the hose is 180 mm inside, 185 mm outside; the hole sits 2,270 to 2,350 mm off the floor, back to back or to the side.'
  FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'What is a heat auto clean, and is it better than a water wash?',
  'It heats the cavity until the oil releases and lets the fan throw it off, in a seventeen-minute cycle of seven stages. It is different rather than better: there is no water cup to fill and nothing to pour away, but a steam wash like the [V997](/vatti-range-hood-v997/) reaches more of the impeller.'
  FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'Is 500 Pa enough for a condominium?',
  'For a short run, yes. On a high floor with a long shared riser, static pressure is the figure that decides it, and 500 Pa is at the gentle end of this range: the [V997](/vatti-range-hood-v997/) holds 1,200 Pa and the [V929](/vatti-aetheris-series-cooker-hood-v929/) 1,300 Pa in a similarly slim body.'
  FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'What warranty does the V996 carry?',
  'Two years on the hood and ten years on the motor, for the original buyer, bought from an authorised dealer. Register it at [VATTI eWarranty](/vatti-ewarranty/) at the time of purchase.'
  FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 7, 'How much is the V996 and where can I buy it?',
  'VATTI Malaysia does not sell online. Find your nearest authorised dealer in the [dealer directory](/store-locations/), or send us your kitchen layout and we will point you at the one that stocks it.'
  FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';

-- vatti-stellar-series-cooker-hood-v960 -------------------------------------
-- Installation figures from V960-Dimension.pdf; the product size from the
-- specification poster (V960-PG13).

UPDATE product SET intro_md =
  'The most air and the most pressure VATTI Malaysia sells, in a body 225mm deep: 3,690 m³/h against 1,700 Pa, at 48 dB, with a chamber and an exhaust for each burner. The panel opens downward so nothing swings into the room, the display wakes when you walk in, and microwave radar reads a hand well enough to tell gestures apart. 896mm wide.'
  WHERE slug = 'vatti-stellar-series-cooker-hood-v960';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 1, 'product', 'Width', '896 mm', NULL, 'width', 896, 896 FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Depth', '225 mm', 'the body, closed' FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Height', '542 mm', NULL FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Chimney', '400 mm wide', NULL FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'product', 'Front panel', '160 mm', NULL FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 6, 'installation', 'Clearance above the hob', '550 to 600 mm', NULL, 'clearance', 550, 600 FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 7, 'installation', 'Bottom of hood from the floor', '1,400 to 1,450 mm', 'over an 850 mm cabinet' FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 8, 'installation', 'Ducting hole from the floor', '2,400 mm', '7 inch, back to back or side way', 'duct_above_counter', 1550, 1550 FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What size is the VATTI V960?',
  '896 mm wide, 225 mm deep and 542 mm tall, with a 400 mm chimney and a 160 mm front panel. The depth is the point: it is one of the slimmest bodies in the range, and the panel opens downward rather than outward.'
  FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'How high should the V960 be installed above the hob?',
  '550 to 600 mm from the hob surface to the bottom of the hood, which puts the bottom 1,400 to 1,450 mm off the floor over a standard 850 mm cabinet.'
  FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'What ducting does the V960 need?',
  'A 7 inch run, with the wall or ceiling hole about 2,400 mm off the floor, back to back or to the side. At 1,700 Pa it is the model least troubled by a long or bent duct.'
  FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'Is the V960 or the V938 the stronger hood?',
  'The V960 moves more air, 3,690 m³/h against 3,650, and holds more pressure, 1,700 Pa against 1,600, at 48 dB against 47. They are within a hair of each other: choose the [V938](/vatti-hidden-series-range-hood-v938/) if it has to disappear into a cabinet run, and the V960 if you want the panel and the display on show.'
  FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'How is the V960 cleaned?',
  'Pulse-Wave Wash: one tap runs a high-pressure rinse to break the grease down, then a turbo dry so nothing is left damp inside. The panel is AG glass, low reflection and anti-fingerprint, and grease separation is 92%.'
  FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'What can the V960 do without being touched?',
  'It starts when the hob is lit and runs on for three minutes after cooking stops. It reads PM2.5 and sets its own fan step. Its display wakes when someone walks in. Microwave radar reads hand gestures for power and speed, and Wi-Fi control runs it from a phone.'
  FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 7, 'What warranty does the V960 carry?',
  'Two years on the hood and ten years on the motor, for the original buyer, bought from an authorised dealer. Register it at [VATTI eWarranty](/vatti-ewarranty/) at the time of purchase.'
  FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 8, 'How much is the V960 and where can I buy it?',
  'VATTI Malaysia does not sell online. Find your nearest authorised dealer in the [dealer directory](/store-locations/), or send us your kitchen layout and we will point you at the one that stocks it.'
  FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';

-- athena-series-lifting-type-range-hood-v936 --------------------------------
-- The only hood with no dimension drawing on file, so this product gets no
-- product_dimension rows: the fit checker and the dimension table both stay
-- away rather than being filled with figures nobody published. The manual is
-- still linked from the page.

UPDATE product SET intro_md =
  'A tower-type hood, tapered like the thing it is named after, with two cavities instead of one: the second holds a further negative-pressure zone so smoke that gets past the inlet is still caught. 2,050 m³/h against 450 Pa at 53 dB, through a patented V-shaped motor housing, and cleaned by 125 bursts of steam followed by high-pressure hot water.'
  WHERE slug = 'athena-series-lifting-type-range-hood-v936';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What are the V936''s dimensions?',
  'VATTI has not published an installation drawing for this model, so rather than guess we have left the figures off the page. The [instruction manual](https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2023/03/V936-instruction-manual.pdf) carries the mounting detail, and any authorised dealer can measure the run with you before quoting.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'What does the double cavity do?',
  'It gives the smoke two chances to be caught. The first cavity holds the pressure zone under the canopy; the second, 98mm deeper with the filter area 35mm behind it, catches what the first misses instead of letting it roll back out.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'Is 450 Pa enough for a condominium?',
  'For a short, direct duct run, yes. On a high floor with a long shared riser, static pressure is what decides it and 450 Pa is at the gentle end of this range: the [V937](/triple-intake-series-t-type-cooker-hood-v937/) holds 1,050 Pa in the same T-type shape, and the [V938](/vatti-hidden-series-range-hood-v938/) 1,600 Pa.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'How is the V936 cleaned?',
  'A steam and hot-water cycle: 125 bursts of steam melt the oil, 18 seconds of continuous high-pressure hot water scour it off, then 30 seconds of cleaning and 30 of spin-dry finish the job. Oil filtration is 85%.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'What warranty does the V936 carry?',
  'Two years on the hood and ten years on the motor, for the original buyer, bought from an authorised dealer. Register it at [VATTI eWarranty](/vatti-ewarranty/) at the time of purchase.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'How much is the V936 and where can I buy it?',
  'VATTI Malaysia does not sell online. Find your nearest authorised dealer in the [dealer directory](/store-locations/), or send us your kitchen layout and we will point you at the one that stocks it.'
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936';

-- vatti-cooker-hood-v917-carbon-grey / -white --------------------------------
-- Byte-identical specifications across the two colourways, and one shared
-- drawing (V917-Dimension.pdf), so intro, dimensions and FAQ are written once
-- and inserted against variant_group. Only the pictures differ, above.

UPDATE product SET intro_md =
  'A slant hood with two inlets, one above and one at the pan, in a body slim enough to sit under a cabinet run. 2,250 m³/h against 900 Pa at 48 dB, with 92% oil separation and a heat auto-clean that needs no water. It hangs low, 300 to 380mm over the hob, and it is run by waving a hand at it. Carbon Grey or Batik White.'
  WHERE variant_group = 'V917';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 1, 'installation', 'Clearance above the hob', '300 to 380 mm', 'a slant hood hangs low, close to the pan', 'clearance', 300, 380 FROM product WHERE variant_group = 'V917';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'installation', 'Bottom of hood from the floor', '1,150 to 1,230 mm', 'over an 850 mm cabinet' FROM product WHERE variant_group = 'V917';
INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 3, 'installation', 'Ducting hole from the floor', '2,120 to 2,200 mm', '7 inch, back to back or side way', 'duct_above_counter', 1270, 1350 FROM product WHERE variant_group = 'V917';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'How high should the V917 be installed above the hob?',
  '300 to 380 mm from the hob surface to the bottom of the hood, which puts the bottom 1,150 to 1,230 mm off the floor over a standard 850 mm cabinet. It is meant to hang low: the lower inlet works by being close to the pan.'
  FROM product WHERE variant_group = 'V917';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'What ducting does the V917 need?',
  'A 7 inch run, with the wall or ceiling hole 2,120 to 2,200 mm off the floor, back to back or to the side.'
  FROM product WHERE variant_group = 'V917';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'What is the difference between the Carbon Grey and the White V917?',
  'The colour, and nothing else. Both are 2,250 m³/h against 900 Pa at 48 dB with the same body, the same controls and the same cleaning cycle. The White is the one shown in the Batik Malaysia settings.'
  FROM product WHERE variant_group = 'V917';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'Is 900 Pa enough for a condominium?',
  'For most, yes: 900 Pa sits in the middle of the VATTI range and handles a normal shared riser. If yours is long or heavily bent, the [V997](/vatti-range-hood-v997/) holds 1,200 Pa and the [V929](/vatti-aetheris-series-cooker-hood-v929/) 1,300 Pa.'
  FROM product WHERE variant_group = 'V917';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'How is the V917 cleaned?',
  'Heat auto-clean: a seventeen-minute cycle in seven stages that heats the cavity until the oil dissolves and lets the fan throw it clear, with no water cup to fill or empty. The front panel is hinged so the smoke guide plate lifts out for washing, and oil separation is 92%.'
  FROM product WHERE variant_group = 'V917';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'What warranty does the V917 carry?',
  'Two years on the hood and ten years on the motor, for the original buyer, bought from an authorised dealer. Register it at [VATTI eWarranty](/vatti-ewarranty/) at the time of purchase.'
  FROM product WHERE variant_group = 'V917';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 7, 'How much is the V917 and where can I buy it?',
  'VATTI Malaysia does not sell online. Find your nearest authorised dealer in the [dealer directory](/store-locations/), or send us your kitchen layout and we will point you at the one that stocks it.'
  FROM product WHERE variant_group = 'V917';

-- vatti-dishwasher-dwbb7 ----------------------------------------------------
-- Figures from the parameter poster (description-9). The installation PDF on
-- this product is the full 32-page instruction manual rather than a drawing,
-- so the cabinet figures below are the manufacturer's own embedded size.

UPDATE product SET intro_md =
  'A 17-place machine that washes, dries, sterilises and then keeps the load fresh for up to a week: a BLDC inverter motor driving three counter-rotating spray levels, a 75°C wash with a UV steriliser, and 110°C drying from a PTC heater rather than a residual-heat cycle. 598mm wide, and it needs a 600 x 780 x 580mm cabinet opening.'
  WHERE slug = 'vatti-dishwasher-dwbb7';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 1, 'product', 'Width', '598 mm', NULL, 'width', 598, 598 FROM product WHERE slug = 'vatti-dishwasher-dwbb7';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Height', '775 mm', NULL FROM product WHERE slug = 'vatti-dishwasher-dwbb7';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Depth', '570 mm', NULL FROM product WHERE slug = 'vatti-dishwasher-dwbb7';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Capacity', '17 place settings', NULL FROM product WHERE slug = 'vatti-dishwasher-dwbb7';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'product', 'Power', '1,900 W', '220 to 240 V' FROM product WHERE slug = 'vatti-dishwasher-dwbb7';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 6, 'product', 'Water efficiency', 'Level 1', NULL FROM product WHERE slug = 'vatti-dishwasher-dwbb7';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 7, 'installation', 'Cabinet opening, width', '600 mm', 'the embedded size the manufacturer specifies', 'opening', 600, 600 FROM product WHERE slug = 'vatti-dishwasher-dwbb7';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 8, 'installation', 'Cabinet opening, height', '780 mm', NULL FROM product WHERE slug = 'vatti-dishwasher-dwbb7';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 9, 'installation', 'Cabinet opening, depth', '580 mm', NULL FROM product WHERE slug = 'vatti-dishwasher-dwbb7';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 10, 'installation', 'Water pressure', '0.04 to 1.0 MPa', 'mains pressure the inlet valve is rated for' FROM product WHERE slug = 'vatti-dishwasher-dwbb7';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What size cabinet opening does the DWBB7 need?',
  'The machine is 598 mm wide, 775 mm tall and 570 mm deep, and VATTI specifies an embedded opening of 600 x 780 x 580 mm. It is a standard 60cm built-in slot, so it drops into the space a full-size dishwasher already occupies.'
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'How many dishes does 17 place settings actually hold?',
  'A full family dinner and the pots it was cooked in, in one load. It is the largest capacity class sold in a 60cm cabinet, and it is what makes the half-load option useful: a smaller wash on the top or bottom rack alone, rather than waiting a day to fill it.'
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'Does the DWBB7 dry properly, or come out damp?',
  'It dries with heat rather than with what is left in the cavity: a 108 mm PTC infrared ceramic heater and a high-speed fan take the air to 110°C, and a hybrid condensation system pulls the steam out. Two drain pumps clear the water and the food waste so nothing is left standing under the baskets.'
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'Can dishes be left in it?',
  'Up to seven days. An automatic ventilation system refreshes the air inside and runs the UV steriliser while the door is shut, which VATTI measures at 99.99% bacteria removal. That is the "store" in wash, dry, sterilise, store.'
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'How is the DWBB7 itself cleaned?',
  'It runs a self-cleaning cycle on its own cavity, and the filter stack lifts out in three parts for a rinse: a PP plastic net, a 304 stainless flow net and a 304 stainless flat filter. The liner is all steel, quick-drying, and rated antibacterial above 91%.'
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'How much water and power does it use?',
  '1,900 W, on 220 to 240 V, at water efficiency Level 1, which is the top band. The inlet is rated for mains pressure between 0.04 and 1.0 MPa, so it will run on the pressure a Malaysian apartment riser gives.'
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 7, 'What warranty does the DWBB7 carry?',
  'The VATTI warranty agreement does not name dishwashers in its two-year appliance clause, so the term is the one your dealer states at purchase. Register the machine at [VATTI eWarranty](/vatti-ewarranty/) when you buy it, and keep the invoice: a claim needs both.'
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 8, 'How much is the DWBB7 and where can I buy it?',
  'VATTI Malaysia does not sell online. Find your nearest authorised dealer in the [dealer directory](/store-locations/), or send us your kitchen layout and we will point you at the one that stocks it.'
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';

-- vatti-one-tap-water-purifier-wdhg01-with-v818wd ---------------------------
-- Figures from WDHG01-GUILD.pdf, which carries the product drawing and the
-- under-sink plumbing diagram. Two units and a tap, so the dimension table
-- names all three.

UPDATE product SET intro_md =
  'Two boxes under the sink and one tap above it: the WDHG01 filters through four stages to a 0.0001 micron RO membrane, and the V818WD heats on demand, so hot water arrives in three seconds and a glass fills in six. Four temperatures on the tap, 100°C for tea down to room temperature. You change the filters yourself, RM189 a year and RM499 every second year.'
  WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 1, 'product', 'Purifier width', '439 mm', 'the WDHG01 body', 'width', 439, 439 FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Purifier height', '385 mm', NULL FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Purifier depth', '168 mm', NULL FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Heater', '175 x 295 x 120 mm', 'the V818WD, width by height by depth' FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'product', 'Tap', '374 mm tall', '188 mm reach, 42 mm across' FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';

INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 6, 'installation', 'Tap hole', '27 to 30 mm', 'the standard sink or counter hole' FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 7, 'installation', 'Cabinet space needed', '439 x 385 x 168 mm', 'plus the heater beside it and room to lift the lid off' FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 8, 'installation', 'Connections', 'Three', 'tap water in through a 3-way valve, waste water to the trap, drinking water up to the tap' FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 9, 'installation', 'Power', 'A socket in the cabinet', 'both units run from it' FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What is actually in the box: one unit or two?',
  'Two, plus the tap. The WDHG01 is the purifier and the V818WD is the instant heater; both sit under the sink and both feed the same tap on the counter. That is what "one tap" means here.'
  FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'Will it fit under my sink?',
  'The purifier is 439 mm wide, 385 mm tall and 168 mm deep, and the heater is 175 x 295 x 120 mm beside it. Leave room above the purifier to lift the lid off for a filter change. The tap needs a standard 27 to 30 mm hole in the sink or counter.'
  FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'What does it filter out?',
  'Four stages: PP cotton for sediment, pre activated carbon for chlorine and taste, a 0.0001 micron RO membrane for bacteria, viruses and microbes, then post activated carbon for the taste of what comes out. The RO stage is the one doing the work; the others are there to keep it working longer.'
  FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'How fast is it?',
  '600 gallons a day, which is 1.5 litres a minute at the tap: about six seconds for a glass. Hot water takes three seconds, because it is heated as it passes rather than kept hot in a tank.'
  FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'What temperatures does the tap give?',
  'Four: 100°C for brewing tea, 85°C for coffee, 45°C for making milk, and room temperature. They are picked with one touch on the display in the tap itself.'
  FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'What do the replacement filters cost, and can I change them myself?',
  'The four-layer carbon filter is RM189 and lasts about 12 months; the RO membrane is RM499 and lasts about 24 months. Both are designed to be changed without a technician: lift the top cover, turn the cap handle to unlock, pull the old filter up and drop the new one in.'
  FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 7, 'What warranty does it carry?',
  'The VATTI warranty agreement names hoods, hobs and ovens in its two-year clause and does not name water purifiers, so the term is the one your dealer states at purchase. Register the unit at [VATTI eWarranty](/vatti-ewarranty/) when you buy it and keep the invoice.'
  FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 8, 'How much is it and who installs it?',
  'VATTI Malaysia does not sell online, and this one is plumbed in rather than plugged in: the dealer quotes the unit and the installation together, against the 3-way valve, the waste connection and the tap hole your sink needs. Find the nearest one in the [dealer directory](/store-locations/).'
  FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';

-- vatti-magic-series-combi-oven-va06 ----------------------------------------
-- No dimension drawing exists for any oven or hob in the catalogue. The figures
-- below come from the specification slide that shipped with the product images
-- (Slide32), which states both the product size and the built-in cut-out.

UPDATE product SET intro_md =
  'Five appliances in one 70-litre cavity: steam, stew, bake, air-fry and steam-bake, run from a colour touch screen with 68 recipes already in it. Two hidden evaporators give it real steam at three humidity levels, which is what lets it roast without drying and bake bread with oven spring. 595mm across the front, into a 560mm cut-out.'
  WHERE slug = 'vatti-magic-series-combi-oven-va06';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 1, 'product', 'Width', '595 mm', NULL, 'width', 595, 595 FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Height', '595 mm', NULL FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Depth', '563 mm', NULL FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Capacity', '70 L', NULL FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'product', 'Power', '3,000 W', '220 V, 50 Hz' FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 6, 'installation', 'Cut-out width', '560 mm', NULL, 'opening', 560, 560 FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 7, 'installation', 'Cut-out height', '595 mm', NULL FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 8, 'installation', 'Cut-out depth', '550 mm minimum', 'the drawing states 550mm or deeper' FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What size cabinet does the VA06 need?',
  'The oven is 595 x 595 x 563 mm and the cut-out is 560 mm wide, 595 mm high and at least 550 mm deep. That is the standard 60cm built-in column, so it goes where a conventional oven goes.'
  FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'What does "5 in 1" actually mean?',
  'Five cooking modes in the one cavity: steam, stew, bake, air-fry and steam-bake. In practice it replaces a steamer, an oven and an air fryer, which is three appliances and two power points on a Malaysian worktop.'
  FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'Is it a real steam oven, or does it just spray water?',
  'Real steam: two hidden direct-injection evaporators feed it through a nozzle layout, at three humidity levels. That is what makes the difference between roasting something dry and roasting it tender, and it is what lets it bake bread with proper oven spring.'
  FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'Do I have to learn it before I can use it?',
  'Sixty-eight recipes are already programmed, and the screen is partitioned by function rather than buried in menus. Defrost, dough fermentation, a 60°C warm setting, yogurt and rice are all one touch as well.'
  FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'How is the VA06 cleaned?',
  'An auto-clean cycle takes the cavity hot enough to soften the oil on the walls, and it wipes off after. There is no separate pyrolytic burn and nothing to take out.'
  FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'How does it compare with the VA05?',
  'Both are 70 litres. The [VA05](/built-in-combi-oven-va05/) carries twelve functions and the VA06 eleven, but the VA06 is the one built around the five-mode idea with the colour screen and the 68 recipes. If you want the steam and the air-fry to be one appliance you actually use, this is the one.'
  FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 7, 'What warranty does the VA06 carry?',
  'Two years, as a combi oven under the VATTI agreement, for the original buyer from an authorised dealer. Register it at [VATTI eWarranty](/vatti-ewarranty/) at the time of purchase.'
  FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 8, 'How much is the VA06 and where can I buy it?',
  'VATTI Malaysia does not sell online. Find your nearest authorised dealer in the [dealer directory](/store-locations/), or send us your kitchen layout and we will point you at the one that stocks it.'
  FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';

-- vatti-flexi-hob-c836g -----------------------------------------------------
-- No hob in the catalogue has a dimension drawing. The cut-out ranges below are
-- off the product's own installation poster (description-4), which is the
-- figure that decides whether a replacement needs the countertop cut again.

UPDATE product SET intro_md =
  'A two-burner gas hob built around wok heat: 5.5 kW through a triple-ring burner that spreads the flame across the base instead of a circle, with five mechanical flame levels you can find by feel. The left burner reads oil temperature and cuts the flame before a dry pan becomes a fire, each side has its own 180 minute timer, and lighting it starts a compatible VATTI hood by itself.'
  WHERE slug = 'vatti-flexi-hob-c836g';

INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 1, 'product', 'Burners', 'Two', 'triple-ring on the left, with the smart sensor' FROM product WHERE slug = 'vatti-flexi-hob-c836g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Power', '5.5 kW', '5.0 kW on LPG' FROM product WHERE slug = 'vatti-flexi-hob-c836g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Thermal efficiency', '73%', NULL FROM product WHERE slug = 'vatti-flexi-hob-c836g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Timer', '0 to 180 minutes', 'one per zone' FROM product WHERE slug = 'vatti-flexi-hob-c836g';

INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'installation', 'Cut-out, front to back', '350 to 400 mm', 'anywhere in this range fits without re-cutting' FROM product WHERE slug = 'vatti-flexi-hob-c836g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 6, 'installation', 'Cut-out, side to side', '650 to 710 mm', NULL FROM product WHERE slug = 'vatti-flexi-hob-c836g';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'Will the C836G fit my existing cut-out?',
  'Very likely: the adjustable base takes a side-to-side cut-out between 650 and 710 mm and a front-to-back cut-out between 350 and 400 mm. Anywhere in that range it drops into the hole the old hob left, with no stone or laminate re-cutting.'
  FROM product WHERE slug = 'vatti-flexi-hob-c836g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'How hot does it get, and is it enough for a wok?',
  '5.5 kW on natural gas, 5.0 kW on LPG, at 73% thermal efficiency, through a triple-ring burner. That is high-heat stir-fry territory: the third ring is there so the heat covers the base of a wok rather than a ring in the middle of it.'
  FROM product WHERE slug = 'vatti-flexi-hob-c836g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'What does the smart burner actually do?',
  'It reads the pan. Hot-oil protection cuts the flame and alerts you if the oil hits temperature with nothing in it; empty-pan protection drops the flame on a long idle and then shuts off; dry-burn protection reacts to a sudden temperature climb. It is on the left burner.'
  FROM product WHERE slug = 'vatti-flexi-hob-c836g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'Which hoods does the hob-hood linkage work with?',
  'Compatible VATTI hoods, of which the [V929](/vatti-aetheris-series-cooker-hood-v929/) names this hob explicitly. Lighting the burner starts the extraction, and the hood matches low or high flame. On any other hood the C836G is simply a hob.'
  FROM product WHERE slug = 'vatti-flexi-hob-c836g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'How is it cleaned?',
  'The glass carries a water and oil repellent nano coating, so grease beads rather than bonds. The burner head lifts out, the flame cap is concave so spills run away from the ports, and the spill tray is raised to direct overflow outward instead of into the burner.'
  FROM product WHERE slug = 'vatti-flexi-hob-c836g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'What warranty does the C836G carry?',
  'Two years on the hob and a lifetime warranty on the glass top, for the original buyer from an authorised dealer. Register it at [VATTI eWarranty](/vatti-ewarranty/) at the time of purchase.'
  FROM product WHERE slug = 'vatti-flexi-hob-c836g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 7, 'How much is the C836G and where can I buy it?',
  'VATTI Malaysia does not sell online. Find your nearest authorised dealer in the [dealer directory](/store-locations/), or send us your kitchen layout and we will point you at the one that stocks it.'
  FROM product WHERE slug = 'vatti-flexi-hob-c836g';

-- vatti-flexi-hob-c822g -----------------------------------------------------
-- No dimension drawing exists for this hob. The posters state a "free die-cut
-- size" fit rather than a range of numbers, so there are no cut-out rows below
-- and the FAQ says what that phrase means instead of inventing millimetres.

UPDATE product SET intro_md =
  'A two-burner gas hob for wok cooking: 5.2 kW with the flame shaped to wrap the base of the pan, at 63% thermal efficiency, and a timer on each side so a braise turns its own fire off. The burners lift out to clean and the base takes a free die-cut fit, which is what makes it a straightforward replacement for an existing hob.'
  WHERE slug = 'vatti-flexi-hob-c822g';

INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 1, 'product', 'Burners', 'Two', NULL FROM product WHERE slug = 'vatti-flexi-hob-c822g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Power', '5.2 kW', NULL FROM product WHERE slug = 'vatti-flexi-hob-c822g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Thermal efficiency', '63%', 'first-class energy efficiency band' FROM product WHERE slug = 'vatti-flexi-hob-c822g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Ignition', 'Pulse electronic', 'battery box, removable from above' FROM product WHERE slug = 'vatti-flexi-hob-c822g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'product', 'Safety', 'Flame failure device', 'thermocouple, per burner' FROM product WHERE slug = 'vatti-flexi-hob-c822g';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What is a "free die-cut size" fit, and will it fit my counter?',
  'It means the base is not fixed to one cut-out size: the hob is designed to sit over a range of existing openings rather than one exact hole, so replacing an older hob usually does not mean re-cutting stone. VATTI publishes no millimetre range for this model, so have your dealer measure the opening before ordering. The [C836G](/vatti-flexi-hob-c836g/) states its range outright: 650 to 710 mm by 350 to 400 mm.'
  FROM product WHERE slug = 'vatti-flexi-hob-c822g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'Is 5.2 kW enough for wok cooking?',
  'Yes. 5.2 kW is high-heat stir-fry output, and the burner is shaped so the flame wraps the base of the wok rather than licking up its sides. At 63% thermal efficiency more of that gas ends up in the pan than in the room.'
  FROM product WHERE slug = 'vatti-flexi-hob-c822g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'What does the timer do?',
  'You set a time per zone and the hob turns that burner off when it expires: eight minutes for a steam, twenty for a stew, up to ninety-nine for a braise. It is the feature that lets you leave the kitchen.'
  FROM product WHERE slug = 'vatti-flexi-hob-c822g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'How is the C822G cleaned?',
  'The burners are detachable, so the top wipes flat with nothing to work around. The glass is anti-scratch tempered with an oil-resistant surface, and the knob pads are sealed so grease does not run into the base shell.'
  FROM product WHERE slug = 'vatti-flexi-hob-c822g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'Is it safe to leave running?',
  'Each burner has a flame failure device: if the flame goes out, the gas is cut. The ignition is pulse electronic from a battery box that lifts out from above rather than from inside the cabinet.'
  FROM product WHERE slug = 'vatti-flexi-hob-c822g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'What warranty does the C822G carry?',
  'Two years on the hob and a lifetime warranty on the glass top, for the original buyer from an authorised dealer. Register it at [VATTI eWarranty](/vatti-ewarranty/) at the time of purchase.'
  FROM product WHERE slug = 'vatti-flexi-hob-c822g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 7, 'How much is the C822G and where can I buy it?',
  'VATTI Malaysia does not sell online. Find your nearest authorised dealer in the [dealer directory](/store-locations/), or send us your kitchen layout and we will point you at the one that stocks it.'
  FROM product WHERE slug = 'vatti-flexi-hob-c822g';

-- built-in-combi-oven-va05 --------------------------------------------------
-- Figures from the specification poster (VA05-PI14). The cut-out is not stated
-- on it, so the installation row below gives the standard 60cm column figure
-- the VA06 drawing states for the same 595mm body, flagged as such.

UPDATE product SET intro_md =
  'Seventy litres of steam and bake in one 60cm cavity, with twelve functions: double steam outlets covering the food from every side, four heating elements and a 4D fan behind them, and top and bottom temperatures you can set apart. A food probe stops it when the meat is done, and it descales and dries itself afterwards.'
  WHERE slug = 'built-in-combi-oven-va05';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 1, 'product', 'Width', '595 mm', NULL, 'width', 595, 595 FROM product WHERE slug = 'built-in-combi-oven-va05';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Height', '595 mm', NULL FROM product WHERE slug = 'built-in-combi-oven-va05';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Depth', '563 mm', NULL FROM product WHERE slug = 'built-in-combi-oven-va05';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Capacity', '70 L', 'twelve functions' FROM product WHERE slug = 'built-in-combi-oven-va05';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'product', 'Power', '3,000 W', '220 to 240 V' FROM product WHERE slug = 'built-in-combi-oven-va05';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 6, 'installation', 'Cabinet column', '60 cm built-in', 'VATTI publishes no cut-out drawing for this model; the body is the same 595mm as the VA06, whose stated cut-out is 560 x 595 x 550mm' FROM product WHERE slug = 'built-in-combi-oven-va05';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What size cabinet does the VA05 need?',
  'The oven is 595 x 595 x 563 mm, which is the standard 60cm built-in column. VATTI publishes no cut-out drawing for this model; the [VA06](/vatti-magic-series-combi-oven-va06/) has the same 595mm body and states 560 x 595 x at least 550 mm, so that is the opening to work to, confirmed with your dealer.'
  FROM product WHERE slug = 'built-in-combi-oven-va05';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'What does the food probe do?',
  'It reads the temperature inside the meat rather than the air around it, and stops the oven when the number you set is reached. It is the single feature that makes roasting repeatable.'
  FROM product WHERE slug = 'built-in-combi-oven-va05';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'What is independent top and bottom control for?',
  'Setting the upper and lower elements to different temperatures. A pizza wants heat from below and a gratin from above; a roast chicken wants both, but not equally. The oven will hold a difference of up to about 30°C between them.'
  FROM product WHERE slug = 'built-in-combi-oven-va05';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'Does a steam oven need descaling?',
  'Any steam oven does, and this one does it itself: one key runs steam through the system to clear the scale, and a second mode dries the water out afterwards so nothing sits inside between uses.'
  FROM product WHERE slug = 'built-in-combi-oven-va05';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'How does the VA05 compare with the VA06?',
  'Both are 70 litres in the same 595mm body. The VA05 carries twelve functions, independent top and bottom control and a food probe; the [VA06](/vatti-magic-series-combi-oven-va06/) trades the probe for the five-mode idea, a colour touch screen and 68 built-in recipes. The VA05 is the cook''s oven, the VA06 the one that decides for you.'
  FROM product WHERE slug = 'built-in-combi-oven-va05';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'What warranty does the VA05 carry?',
  'Two years, as a combi oven under the VATTI agreement, for the original buyer from an authorised dealer. Register it at [VATTI eWarranty](/vatti-ewarranty/) at the time of purchase.'
  FROM product WHERE slug = 'built-in-combi-oven-va05';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 7, 'How much is the VA05 and where can I buy it?',
  'VATTI Malaysia does not sell online. Find your nearest authorised dealer in the [dealer directory](/store-locations/), or send us your kitchen layout and we will point you at the one that stocks it.'
  FROM product WHERE slug = 'built-in-combi-oven-va05';

-- vatti-3-burner-gas-hob-c830g ----------------------------------------------
-- No dimension drawing and no specification panel for this model, so it gets no
-- cut-out figures: the FAQ says so rather than borrowing another hob's numbers.

UPDATE product SET intro_md =
  'Three burners and 6 kW between them, which is the most output VATTI Malaysia sells in a hob: a wok on the big burner while a braise and a stew hold on the other two. A 99 minute timer turns a burner off by itself, the 1,059g pan support keeps the flame steady against a draught, and six separate safety features sit behind it.'
  WHERE slug = 'vatti-3-burner-gas-hob-c830g';

INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 1, 'product', 'Burners', 'Three', NULL FROM product WHERE slug = 'vatti-3-burner-gas-hob-c830g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Power', '6.0 kW', 'across the three burners' FROM product WHERE slug = 'vatti-3-burner-gas-hob-c830g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Timer', 'Up to 99 minutes', NULL FROM product WHERE slug = 'vatti-3-burner-gas-hob-c830g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Pan support', '1,059 g', 'energy-concentrated, windproof' FROM product WHERE slug = 'vatti-3-burner-gas-hob-c830g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'product', 'Panel', 'Three-layer tempered glass', 'explosion-proof, heat insulating' FROM product WHERE slug = 'vatti-3-burner-gas-hob-c830g';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What cut-out does the C830G need?',
  'VATTI publishes neither a drawing nor a specification panel for this model, so we have not put a figure on the page. It is a three-burner hob and therefore wider than the two-burner models; have your dealer measure the opening before ordering. The [C823G](/vatti-flexi-hob-c823g/) and [C836G](/vatti-flexi-hob-c836g/) both state their ranges outright.'
  FROM product WHERE slug = 'vatti-3-burner-gas-hob-c830g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'Is three burners better than two?',
  'For a household that cooks several dishes at once, yes: 6 kW across three means a wok, a braise and a stew at the same time instead of in sequence. For a small kitchen, the counter space a third burner takes is the cost of it.'
  FROM product WHERE slug = 'vatti-3-burner-gas-hob-c830g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'How safe is it to leave running?',
  'Thermocouple flameout protection cuts the gas if a flame goes out; the ignition is push-type rotary, which is child-resistant; the glass is three-layer tempered and explosion-proof; and the 99 minute timer turns the burner off if you forget it. VATTI tests the assembly through hot and cold shock, gravity shock and violent shock.'
  FROM product WHERE slug = 'vatti-3-burner-gas-hob-c830g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'What warranty does the C830G carry?',
  'Two years on the hob and a lifetime warranty on the glass top, for the original buyer from an authorised dealer. Register it at [VATTI eWarranty](/vatti-ewarranty/) at the time of purchase.'
  FROM product WHERE slug = 'vatti-3-burner-gas-hob-c830g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'How much is the C830G and where can I buy it?',
  'VATTI Malaysia does not sell online. Find your nearest authorised dealer in the [dealer directory](/store-locations/), or send us your kitchen layout and we will point you at the one that stocks it.'
  FROM product WHERE slug = 'vatti-3-burner-gas-hob-c830g';

-- vatti-flexi-hob-c823g -----------------------------------------------------
-- Figures from the specification panel (C823G-PG-7), which states both the
-- product size and the recommended die-cut range.

UPDATE product SET intro_md =
  'A two-burner gas hob at 4.8 kW and 63% thermal efficiency, with the burner lid angled at 38 degrees so the flame spreads across the base of the pan rather than up its sides. 750 x 450 mm on the counter, into a die-cut anywhere between 650 and 710 by 350 and 400 mm, which is what makes it a straight swap for an older hob.'
  WHERE slug = 'vatti-flexi-hob-c823g';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 1, 'product', 'Width', '750 mm', NULL, 'width', 750, 750 FROM product WHERE slug = 'vatti-flexi-hob-c823g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Depth', '450 mm', NULL FROM product WHERE slug = 'vatti-flexi-hob-c823g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Height', '146 mm', 'including the burners' FROM product WHERE slug = 'vatti-flexi-hob-c823g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Power', '4.8 kW', '63% thermal efficiency' FROM product WHERE slug = 'vatti-flexi-hob-c823g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'product', 'Weight', '13.6 kg', '16.0 kg boxed' FROM product WHERE slug = 'vatti-flexi-hob-c823g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 6, 'product', 'Safety', 'Thermocouple flame failure device', 'auto ignition' FROM product WHERE slug = 'vatti-flexi-hob-c823g';

INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 7, 'installation', 'Cut-out, side to side', '650 to 710 mm', 'the recommended standard die-cut range' FROM product WHERE slug = 'vatti-flexi-hob-c823g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 8, 'installation', 'Cut-out, front to back', '350 to 400 mm', NULL FROM product WHERE slug = 'vatti-flexi-hob-c823g';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What size is the C823G, and will it fit my cut-out?',
  'The hob is 750 x 450 mm and 146 mm deep including the burners, and the recommended die-cut is 650 to 710 mm across by 350 to 400 mm front to back. Anywhere inside that range it replaces an older hob without re-cutting the counter.'
  FROM product WHERE slug = 'vatti-flexi-hob-c823g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'Is 4.8 kW enough for wok cooking?',
  'For everyday stir-frying, yes, and the 38 degree burner lid angle spreads that heat across the base of the wok rather than concentrating it. If you cook at high heat daily, the [C836G](/vatti-flexi-hob-c836g/) gives 5.5 kW through a triple ring and the [C830G](/vatti-3-burner-gas-hob-c830g/) 6 kW across three burners.'
  FROM product WHERE slug = 'vatti-flexi-hob-c823g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'How safe is it?',
  'Each burner carries a thermocouple flame failure device, so the gas is cut if the flame goes out. Ignition is automatic and immediate rather than repeated clicking.'
  FROM product WHERE slug = 'vatti-flexi-hob-c823g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'What warranty does the C823G carry?',
  'Two years on the hob and a lifetime warranty on the glass top, for the original buyer from an authorised dealer. Register it at [VATTI eWarranty](/vatti-ewarranty/) at the time of purchase.'
  FROM product WHERE slug = 'vatti-flexi-hob-c823g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'How much is the C823G and where can I buy it?',
  'VATTI Malaysia does not sell online. Find your nearest authorised dealer in the [dealer directory](/store-locations/), or send us your kitchen layout and we will point you at the one that stocks it.'
  FROM product WHERE slug = 'vatti-flexi-hob-c823g';

-- vatti-magic-series-cooker-hob-c861g ---------------------------------------

UPDATE product SET intro_md =
  'The hob whose burners fold up. A patented 90 degree reversible burner head stands vertical when you are not cooking, so the top wipes flat and the drawer underneath stays a drawer. 4.8 kW at 65% thermal efficiency in seven tactile gears, with a sensor that reads the pot and three protections on the left burner.'
  WHERE slug = 'vatti-magic-series-cooker-hob-c861g';

INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 1, 'product', 'Burners', 'Two', 'reversible, 90 degree vertical' FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Power', '4.8 kW', '65% thermal efficiency' FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Flame steps', 'Seven', 'tactile card positions' FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Controls', 'Full touch', 'under the glass' FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'product', 'Patent', 'ZL201921462957.2', 'the reversible burner head' FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What does the flip-up burner actually do?',
  'The burner head turns 90 degrees and stands vertical when the hob is off. Two things follow: the glass top wipes flat with no burner ring to clean around, and the shallow body leaves the drawer under the counter usable. It is patented, ZL201921462957.2.'
  FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'What cut-out does the C861G need?',
  'VATTI publishes no drawing or specification panel for this model, so we have not put a figure on the page. Because of the folding mechanism the body is unusually shallow; have your dealer measure both the opening and the cabinet depth before ordering.'
  FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'Is 4.8 kW enough for wok cooking?',
  'For everyday stir-frying, yes, at 65% thermal efficiency, which is a first-class energy band. For daily high-heat wok work the [C836G](/vatti-flexi-hob-c836g/) gives 5.5 kW through a triple ring.'
  FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'What does the sensor do?',
  'It reads the contents of the pot. Cold food gets full flame; as the pot comes to temperature the flame steps down. Both zones hold their own set temperature, with overflow and burn-dry detection on top, and the left burner adds an oil-temperature probe.'
  FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'What warranty does the C861G carry?',
  'Two years on the hob and a lifetime warranty on the glass top, for the original buyer from an authorised dealer. Register it at [VATTI eWarranty](/vatti-ewarranty/) at the time of purchase.'
  FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'How much is the C861G and where can I buy it?',
  'VATTI Malaysia does not sell online. Find your nearest authorised dealer in the [dealer directory](/store-locations/), or send us your kitchen layout and we will point you at the one that stocks it.'
  FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g';

-- vatti-ai-hob-c835g --------------------------------------------------------

UPDATE product SET intro_md =
  'A hob that holds a temperature rather than a flame height: in intelligent mode it keeps a soup at 100°C without boiling it over, and it runs a different algorithm depending on the pot standing on it. 4.5 kW through a double fire cover, eight tactile speeds from 400 W to 4,500 W, anti-dry burning on the left burner and a 99 minute timer that cuts the gas at the end.'
  WHERE slug = 'vatti-ai-hob-c835g';

INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 1, 'product', 'Burners', 'Two', NULL FROM product WHERE slug = 'vatti-ai-hob-c835g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Power', '4.5 kW', NULL FROM product WHERE slug = 'vatti-ai-hob-c835g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Flame range', '400 W to 4,500 W', 'in eight steps' FROM product WHERE slug = 'vatti-ai-hob-c835g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Timer', 'Up to 99 minutes', 'with automatic gas cut-off' FROM product WHERE slug = 'vatti-ai-hob-c835g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'product', 'Panel', 'Black crystal tempered glass', 'gold trim, enamel cross pot holder' FROM product WHERE slug = 'vatti-ai-hob-c835g';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What makes the C835G an "AI" hob?',
  'It works to a temperature instead of a flame setting. In intelligent mode it holds a pot at its target, 100°C for a soup or porridge, adjusting the flame itself so it does not boil over, and it matches its response to the type of pot standing on the burner.'
  FROM product WHERE slug = 'vatti-ai-hob-c835g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'What cut-out does the C835G need?',
  'VATTI publishes no drawing or specification panel for this model, so there is no figure on this page to work from. Have your dealer measure the opening before ordering; the [C823G](/vatti-flexi-hob-c823g/) and [C836G](/vatti-flexi-hob-c836g/) both state their ranges outright if a stated fit matters to you.'
  FROM product WHERE slug = 'vatti-ai-hob-c835g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'How much can the flame be turned down?',
  'To 400 W, which is a genuine simmer rather than a low roar, and up to 4,500 W for stir-frying. There are eight positions between them, each a tactile click.'
  FROM product WHERE slug = 'vatti-ai-hob-c835g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'Is it safe to leave a pot on it?',
  'The left burner has a temperature probe with anti-dry-burning: past the critical value it shuts the flame off by itself. The 99 minute timer also cuts the gas at the end of its run, with a reminder on screen.'
  FROM product WHERE slug = 'vatti-ai-hob-c835g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'What warranty does the C835G carry?',
  'Two years on the hob and a lifetime warranty on the glass top, for the original buyer from an authorised dealer. Register it at [VATTI eWarranty](/vatti-ewarranty/) at the time of purchase.'
  FROM product WHERE slug = 'vatti-ai-hob-c835g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'How much is the C835G and where can I buy it?',
  'VATTI Malaysia does not sell online. Find your nearest authorised dealer in the [dealer directory](/store-locations/), or send us your kitchen layout and we will point you at the one that stocks it.'
  FROM product WHERE slug = 'vatti-ai-hob-c835g';

-- professional-series-c720s -------------------------------------------------

UPDATE product SET intro_md =
  'A three-burner stainless hob for a kitchen that cooks properly: the patented "Thor" wok burner at 5.2 kW with stepless control, a second at 5.2 kW and a 1.75 kW simmer between them. One integrated 0.8mm steel top with no seam to trap spills, a child lock in the valve and the original Spanish flame failure device. 780 x 450 mm, into a 708 x 388 mm cut-out.'
  WHERE slug = 'professional-series-c720s';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 1, 'product', 'Width', '780 mm', NULL, 'width', 780, 780 FROM product WHERE slug = 'professional-series-c720s';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Depth', '450 mm', NULL FROM product WHERE slug = 'professional-series-c720s';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Power', '5.2 kW, 1.75 kW, 5.2 kW', 'three burners' FROM product WHERE slug = 'professional-series-c720s';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Energy level', 'Level 2', 'at or above 52% thermal efficiency' FROM product WHERE slug = 'professional-series-c720s';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'product', 'Finish', '0.8 mm stainless steel', 'one integrated top sheet' FROM product WHERE slug = 'professional-series-c720s';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 6, 'product', 'Weight', '16.8 kg', '19.8 kg boxed' FROM product WHERE slug = 'professional-series-c720s';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 7, 'installation', 'Cut-out width', '708 mm', NULL, 'opening', 708, 708 FROM product WHERE slug = 'professional-series-c720s';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 8, 'installation', 'Cut-out depth', '388 mm', 'radiused corners; the drawing marks R20 mm and the table R5' FROM product WHERE slug = 'professional-series-c720s';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 9, 'installation', 'Gas', 'NG or LPG', 'NG 1,000 / 2,000 Pa, LPG 2,750 Pa' FROM product WHERE slug = 'professional-series-c720s';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What cut-out does the C720S need?',
  '708 mm wide by 388 mm deep, with radiused corners. The hob itself is 780 x 450 mm, so it covers a 708 mm opening with the overhang a three-burner hob needs.'
  FROM product WHERE slug = 'professional-series-c720s';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'What is the "Thor" burner?',
  'VATTI''s patented high-performance wok burner, with stepless control rather than fixed steps: the flame holds through multiple segments, so one burner takes a sear down to a simmer without being relit. It is the 5.2 kW burner on this hob.'
  FROM product WHERE slug = 'professional-series-c720s';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'Is it safe around children?',
  'The valve has an internal child lock and micro-switches: the knob must be pressed down and turned counter-clockwise before gas flows, which a small hand cannot do by accident. Each burner also carries an original Spanish flame failure device that stops the gas if the flame goes out.'
  FROM product WHERE slug = 'professional-series-c720s';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'What warranty does the C720S carry, and where can I buy it?',
  'Two years on the hob and a lifetime warranty on the glass top, for the original buyer from an authorised dealer; register it at [VATTI eWarranty](/vatti-ewarranty/) at purchase. VATTI Malaysia does not sell online, so find the nearest dealer in the [dealer directory](/store-locations/).'
  FROM product WHERE slug = 'professional-series-c720s';

-- professional-series-c821g -------------------------------------------------

UPDATE product SET intro_md =
  'Two 4.5 kW burners at Grade 1 energy efficiency, each with an inner double-layer flame for concentrated heat and an outer ring that turns it around the pan. Air is taken in on three levels so it burns clean, the safety valve closes on an accidental shutdown, and the same hob sits on the counter or drops into it. 750 x 420 mm, into a 650 x 320 mm opening.'
  WHERE slug = 'professional-series-c821g';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 1, 'product', 'Width', '750 mm', NULL, 'width', 750, 750 FROM product WHERE slug = 'professional-series-c821g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Depth', '420 mm', NULL FROM product WHERE slug = 'professional-series-c821g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Height', '149 mm', NULL FROM product WHERE slug = 'professional-series-c821g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Power', '4.5 kW', 'each burner, left and right' FROM product WHERE slug = 'professional-series-c821g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'product', 'Thermal efficiency', '65%', 'Grade 1' FROM product WHERE slug = 'professional-series-c821g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 6, 'product', 'Gas', 'LPG or natural gas', 'battery ignition' FROM product WHERE slug = 'professional-series-c821g';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 7, 'installation', 'Cut-out width', '650 mm', NULL, 'opening', 650, 650 FROM product WHERE slug = 'professional-series-c821g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 8, 'installation', 'Cut-out depth', '320 mm', 'R20 corners, 20 mm deep' FROM product WHERE slug = 'professional-series-c821g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 9, 'installation', 'Cabinet height below', '110 mm minimum', NULL FROM product WHERE slug = 'professional-series-c821g';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What cut-out does the C821G need?',
  'An opening 650 mm wide by 320 mm deep with R20 corners, and at least 110 mm of clear height in the cabinet below. The hob itself is 750 x 420 x 149 mm.'
  FROM product WHERE slug = 'professional-series-c821g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'Can it sit on the counter instead of being built in?',
  'Yes. The same unit works as a table-top hob or a built-in one, so it suits a kitchen where cutting the counter is not an option.'
  FROM product WHERE slug = 'professional-series-c821g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'Is 4.5 kW per burner enough?',
  'For everyday cooking, comfortably, and at 65% thermal efficiency it wastes less of that gas than most. For daily high-heat wok work the [C836G](/vatti-flexi-hob-c836g/) reaches 5.5 kW and the [C830G](/vatti-3-burner-gas-hob-c830g/) 6 kW across three burners.'
  FROM product WHERE slug = 'professional-series-c821g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'What warranty does the C821G carry, and where can I buy it?',
  'Two years on the hob and a lifetime warranty on the glass top, for the original buyer from an authorised dealer; register it at [VATTI eWarranty](/vatti-ewarranty/) at purchase. VATTI Malaysia does not sell online, so find the nearest dealer in the [dealer directory](/store-locations/).'
  FROM product WHERE slug = 'professional-series-c821g';

-- vatti-oylimpic-hob-m822g --------------------------------------------------

UPDATE product SET intro_md =
  'The hob built on the burner VATTI made for the Beijing Olympic torch: nearly ten thousand precision fire holes across an angled plate instead of a ring of jets, 3.5 kW reaching 1,000°C, with the heat spread evenly rather than ringed. The two sides are partitioned, one for a steady steam and one for a wok, and the safety valve closes the gas on an accidental shutdown.'
  WHERE slug = 'vatti-oylimpic-hob-m822g';

INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 1, 'product', 'Burners', 'Two', 'partitioned, left and right' FROM product WHERE slug = 'vatti-oylimpic-hob-m822g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Power', '3.8 kW', '3.5 kW through the micro-flame plate' FROM product WHERE slug = 'vatti-oylimpic-hob-m822g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Plate', '13.6 degree angle', 'nearly 10,000 precision fire holes' FROM product WHERE slug = 'vatti-oylimpic-hob-m822g';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Panel', 'Tempered glass', 'high temperature and impact rated' FROM product WHERE slug = 'vatti-oylimpic-hob-m822g';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What is micro-flame combustion?',
  'Instead of a ring of gas jets, the burner plate carries nearly ten thousand tiny holes at a 13.6 degree angle. The flame is spread across the whole plate rather than concentrated in a circle, which is why 3.5 kW reaches 1,000°C at the surface without a hot ring and a cold middle.'
  FROM product WHERE slug = 'vatti-oylimpic-hob-m822g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'What does the Olympic torch have to do with it?',
  'VATTI built the burner for the Beijing Olympic torch, which had to stay lit through 65 km/h winds and 55 mm of rain an hour. The same combustion design is what sits under this hob.'
  FROM product WHERE slug = 'vatti-oylimpic-hob-m822g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'What cut-out does the M822G need?',
  'VATTI publishes no drawing or specification panel for this model, so there is no figure on this page. Have your dealer measure the opening before ordering; the [C823G](/vatti-flexi-hob-c823g/) and [C821G](/professional-series-c821g/) both state theirs.'
  FROM product WHERE slug = 'vatti-oylimpic-hob-m822g';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'What warranty does the M822G carry, and where can I buy it?',
  'Two years on the hob and a lifetime warranty on the glass top, for the original buyer from an authorised dealer; register it at [VATTI eWarranty](/vatti-ewarranty/) at purchase. VATTI Malaysia does not sell online, so find the nearest dealer in the [dealer directory](/store-locations/).'
  FROM product WHERE slug = 'vatti-oylimpic-hob-m822g';

-- vatti-built-in-oven-o755p -------------------------------------------------

UPDATE product SET intro_md =
  'A 75 litre built-in oven with eleven baking modes and five shelf levels, in a ceramic cavity that wipes clean rather than an enamel one that needs soaking. Telescopic runners bring the shelf out to you, the door opens and closes on a cushion, and the panel locks against children. 595 x 595 x 563 mm, into a standard 60cm column.'
  WHERE slug = 'vatti-built-in-oven-o755p';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 1, 'product', 'Width', '595 mm', NULL, 'width', 595, 595 FROM product WHERE slug = 'vatti-built-in-oven-o755p';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Height', '595 mm', NULL FROM product WHERE slug = 'vatti-built-in-oven-o755p';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Depth', '563 mm', NULL FROM product WHERE slug = 'vatti-built-in-oven-o755p';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Capacity', '75 L', 'five shelf levels, eleven baking modes' FROM product WHERE slug = 'vatti-built-in-oven-o755p';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'installation', 'Cabinet column', '60 cm built-in', 'the same 595mm body as the VA05 and VA06; VATTI states a 560 x 595 x 550mm cut-out for those' FROM product WHERE slug = 'vatti-built-in-oven-o755p';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What size cabinet does the O755P need?',
  'The oven is 595 x 595 x 563 mm, a standard 60cm built-in column. VATTI publishes no separate cut-out drawing for it; the combi ovens with the same 595mm body state 560 x 595 x at least 550 mm, which is the opening to work to.'
  FROM product WHERE slug = 'vatti-built-in-oven-o755p';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'What is the ceramic cavity for?',
  'Cleaning. The surface is non-stick and scratch-resistant, so what splashes onto it wipes off with a damp cloth instead of needing a soak or a pyrolytic burn. The comparison in the pictures is against conventional enamel.'
  FROM product WHERE slug = 'vatti-built-in-oven-o755p';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'How does the O755P differ from the O7549?',
  'Modes and handling. The O755P has eleven baking modes, a ceramic easy-clean cavity, telescopic runners and a soft-close door; the [O7549](/vatti-built-in-oven-o7549/) has nine modes in the same 75 litre size. Both are 60cm columns.'
  FROM product WHERE slug = 'vatti-built-in-oven-o755p';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'What warranty does the O755P carry, and where can I buy it?',
  'Two years, as a built-in oven under the VATTI agreement, for the original buyer from an authorised dealer; register it at [VATTI eWarranty](/vatti-ewarranty/) at purchase. VATTI Malaysia does not sell online, so find the nearest dealer in the [dealer directory](/store-locations/).'
  FROM product WHERE slug = 'vatti-built-in-oven-o755p';

-- vatti-built-in-air-fryer-oven-07559 ---------------------------------------

UPDATE product SET intro_md =
  'A 75 litre built-in oven that air-fries a full tray rather than a basket: double M-shaped elements across the top and one at the back give it even heat with the cavity left clear. Nine baking modes, a three-layer low-E door that comes off without tools, 598 x 592 x 577 mm.'
  WHERE slug = 'vatti-built-in-air-fryer-oven-07559';

INSERT INTO product_dimension (product_id, position, section, label, value, note, metric, min_mm, max_mm)
SELECT id, 1, 'product', 'Width', '598 mm', NULL, 'width', 598, 598 FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Height', '592 mm', NULL FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Depth', '577 mm', NULL FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Capacity', '75 L', 'nine baking modes including air-fry' FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'installation', 'Cabinet column', '60 cm built-in', 'a little deeper than the 563mm ovens at 577mm; check the cabinet depth' FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What size cabinet does the 07559 need?',
  'The oven is 598 x 592 x 577 mm, a standard 60cm column, but note the 577mm depth: it is 14mm deeper than VATTI''s other built-in ovens, so check the cabinet before ordering.'
  FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'Does it really air-fry, or is it a fan oven with a label?',
  'It air-fries a tray. Two M-shaped elements are wall-mounted across the top with a third at the back, which gives the fast circulating heat an air fryer needs while keeping the top of the cavity clear. The gain over a basket fryer is quantity: a family portion in one go.'
  FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'Is the URL of this page misspelled?',
  'The slug reads 07559 with a zero where the model has the letter O. It is wrong and it is the address the page has always had, so it stays: changing it would break every link and search result pointing at it.'
  FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'What warranty does it carry, and where can I buy it?',
  'Two years, as a built-in oven under the VATTI agreement, for the original buyer from an authorised dealer; register it at [VATTI eWarranty](/vatti-ewarranty/) at purchase. VATTI Malaysia does not sell online, so find the nearest dealer in the [dealer directory](/store-locations/).'
  FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559';

-- vatti-built-in-oven-o7549 -------------------------------------------------

UPDATE product SET intro_md =
  'A 75 litre built-in convection oven with nine baking modes: the straightforward one in the range, without the steam, the air-fry or the touch screen. A three-layer low-E door that comes off without tools, a high-quality enamel liner, and a standard 60cm column to sit in.'
  WHERE slug = 'vatti-built-in-oven-o7549';

INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 1, 'product', 'Capacity', '75 L', 'nine baking modes' FROM product WHERE slug = 'vatti-built-in-oven-o7549';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Door', 'Three-layer low-E glass', 'removable without tools' FROM product WHERE slug = 'vatti-built-in-oven-o7549';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'installation', 'Cabinet column', '60 cm built-in', 'VATTI publishes no dimension panel for this model; its sibling the O755P is 595 x 595 x 563 mm' FROM product WHERE slug = 'vatti-built-in-oven-o7549';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What size cabinet does the O7549 need?',
  'A standard 60cm built-in column. VATTI publishes no dimension panel for this model; its sibling the [O755P](/vatti-built-in-oven-o755p/) is 595 x 595 x 563 mm, which is the size to plan for, confirmed with your dealer.'
  FROM product WHERE slug = 'vatti-built-in-oven-o7549';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'Which VATTI oven should I choose?',
  'The O7549 is the plain convection oven: 75 litres, nine modes. The [O755P](/vatti-built-in-oven-o755p/) adds eleven modes, a ceramic cavity, telescopic runners and a soft-close door. The [07559](/vatti-built-in-air-fryer-oven-07559/) adds air-frying, and the [VA05](/built-in-combi-oven-va05/) and [VA06](/vatti-magic-series-combi-oven-va06/) add steam.'
  FROM product WHERE slug = 'vatti-built-in-oven-o7549';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'What warranty does the O7549 carry, and where can I buy it?',
  'Two years, as a built-in oven under the VATTI agreement, for the original buyer from an authorised dealer; register it at [VATTI eWarranty](/vatti-ewarranty/) at purchase. VATTI Malaysia does not sell online, so find the nearest dealer in the [dealer directory](/store-locations/).'
  FROM product WHERE slug = 'vatti-built-in-oven-o7549';

-- built-in-combi-oven-va03 --------------------------------------------------

UPDATE product SET intro_md =
  'A 50 litre built-in combi oven with fourteen cooking functions: three steam settings, eight oven ones and combi modes that run both together at three humidity levels. Two steam nozzles and a heated ceiling keep condensation off the food, the 1.3 litre tank refills from outside, and top and bottom temperatures are set apart. 68 auto menus, and a steam cycle that cleans the cavity afterwards.'
  WHERE slug = 'built-in-combi-oven-va03';

INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 1, 'product', 'Capacity', '50 L', 'fourteen cooking functions' FROM product WHERE slug = 'built-in-combi-oven-va03';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Water tank', '1.3 L', 'external, refilled without opening the oven' FROM product WHERE slug = 'built-in-combi-oven-va03';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Steam settings', 'Low, standard, high', 'plus three combi humidity levels' FROM product WHERE slug = 'built-in-combi-oven-va03';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Cavity', 'Blue enamel', 'auto-clean and bacteriostatic drying' FROM product WHERE slug = 'built-in-combi-oven-va03';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'installation', 'Cabinet column', '60 cm built-in', 'VATTI publishes no cut-out drawing for this model; confirm the opening with your dealer' FROM product WHERE slug = 'built-in-combi-oven-va03';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What are the fourteen functions?',
  'Three steam settings (low, standard and high), eight oven functions and three combi modes that run steam and heat together at high, medium or low humidity. In practice you pick the dish and the humidity, not the element.'
  FROM product WHERE slug = 'built-in-combi-oven-va03';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'Does it drip on the food?',
  'That is the failure this oven is designed around. Two nozzles feed the steam, a heating tape keeps the ceiling above condensation point, and a bottom heating plate stops water collecting under the tray. VATTI contrasts it with the upper-pressure designs that lose steam and drip.'
  FROM product WHERE slug = 'built-in-combi-oven-va03';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'How do I steam an egg in it?',
  'By the auto menu, which sets both numbers for you. VATTI publishes the parameters: one egg soft is 70°C for 8 minutes, medium 110°C for 3, hard 110°C for 9; three eggs soft is 70°C for 13 minutes. Sixty-eight recipes are pre-set the same way.'
  FROM product WHERE slug = 'built-in-combi-oven-va03';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'How is it cleaned?',
  'A high-steam auto-clean softens the grease on the inner chamber and kills bacteria, followed by a high-temperature bacteriostatic drying cycle. The cavity is blue enamel, smooth enough that what is left wipes off.'
  FROM product WHERE slug = 'built-in-combi-oven-va03';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'How does the VA03 compare with the VA05 and VA06?',
  'Size, mostly. The VA03 is 50 litres; the [VA05](/built-in-combi-oven-va05/) and [VA06](/vatti-magic-series-combi-oven-va06/) are 70. The VA03 has the most cooking functions of the three at fourteen, and the external water tank, which is the one thing you touch every week.'
  FROM product WHERE slug = 'built-in-combi-oven-va03';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 6, 'What warranty does the VA03 carry, and where can I buy it?',
  'Two years, as a combi oven under the VATTI agreement, for the original buyer from an authorised dealer; register it at [VATTI eWarranty](/vatti-ewarranty/) at purchase. VATTI Malaysia does not sell online, so find the nearest dealer in the [dealer directory](/store-locations/).'
  FROM product WHERE slug = 'built-in-combi-oven-va03';

-- built-in-steam-oven-z4501 -------------------------------------------------

UPDATE product SET intro_md =
  'A 42 litre built-in steam oven: dual nozzles, accurate temperature, and heating tapes top and bottom so the ceiling never drips condensation onto what is cooking. Steam and grill run together between 100°C and 230°C, and 68 chef recipes adjust their own time and temperature to the portion you put in.'
  WHERE slug = 'built-in-steam-oven-z4501';

INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 1, 'product', 'Capacity', '42 L', 'eight cooking functions' FROM product WHERE slug = 'built-in-steam-oven-z4501';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Steam', 'Dual nozzle', 'with top and bottom heating tape' FROM product WHERE slug = 'built-in-steam-oven-z4501';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Grill range', '100°C to 230°C', 'with steam' FROM product WHERE slug = 'built-in-steam-oven-z4501';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Menus', '6 + 2 auto', '68 chef recipes' FROM product WHERE slug = 'built-in-steam-oven-z4501';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'installation', 'Cabinet column', '60 cm built-in', 'VATTI publishes no cut-out drawing for this model; confirm the opening with your dealer' FROM product WHERE slug = 'built-in-steam-oven-z4501';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'Is the Z4501 a steam oven or a combi?',
  'A steam oven with a grill. It steams, and it will grill under steam between 100°C and 230°C, but it is not a full baking oven: if you want to bake as well, the [VA03](/built-in-combi-oven-va03/) or [VA05](/built-in-combi-oven-va05/) are the combi ovens.'
  FROM product WHERE slug = 'built-in-steam-oven-z4501';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'Does it drip?',
  'Heating tapes run along the top and the bottom of the cavity, which keeps the ceiling above the temperature at which steam condenses. That is the difference between food that steams and food that sits under a drip.'
  FROM product WHERE slug = 'built-in-steam-oven-z4501';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'What do the 68 recipes do?',
  'They set the time and the temperature from the dish and the portion. Two fish or five, 150 grams or 400: the oven adjusts rather than making you convert a recipe written for one.'
  FROM product WHERE slug = 'built-in-steam-oven-z4501';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'What warranty does the Z4501 carry, and where can I buy it?',
  'Two years, as a built-in steam oven under the VATTI agreement, for the original buyer from an authorised dealer; register it at [VATTI eWarranty](/vatti-ewarranty/) at purchase. VATTI Malaysia does not sell online, so find the nearest dealer in the [dealer directory](/store-locations/).'
  FROM product WHERE slug = 'built-in-steam-oven-z4501';

-- free-standing-combi-oven-va01 ---------------------------------------------

UPDATE product SET intro_md =
  'The combi oven that needs no cabinet: 25 litres standing on the counter, steaming and grilling together between 100°C and 230°C, with a 1,200 W element that makes steam in about thirty seconds. Fermentation, yogurt, keep warm, dehydration, defrost and disinfection are all on the menu.'
  WHERE slug = 'free-standing-combi-oven-va01';

INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 1, 'product', 'Capacity', '25 L', 'free-standing, no cabinet needed' FROM product WHERE slug = 'free-standing-combi-oven-va01';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Steam power', '1,200 W', 'steam in about 30 seconds from cold, per VATTI''s own laboratory figure' FROM product WHERE slug = 'free-standing-combi-oven-va01';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Grill range', '100°C to 230°C', 'with steam' FROM product WHERE slug = 'free-standing-combi-oven-va01';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Liner', '304 stainless steel', 'fast heat transfer' FROM product WHERE slug = 'free-standing-combi-oven-va01';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'Does the VA01 need to be built in?',
  'No, and that is the point of it. It stands on the counter and plugs in, so it suits a rented kitchen, a small one, or a household that wants steam cooking without rebuilding a cabinet run.'
  FROM product WHERE slug = 'free-standing-combi-oven-va01';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'How long does it take to make steam?',
  'About thirty seconds from cold, from a 1,200 W element behind a 304 stainless liner. That figure is VATTI''s own laboratory measurement under specified conditions.'
  FROM product WHERE slug = 'free-standing-combi-oven-va01';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'Is 25 litres enough?',
  'For two to four people, yes: a fish, a tray of buns, a chicken portion. For a family roast or several trays at once, the built-in [VA03](/built-in-combi-oven-va03/) at 50 litres or the [VA05](/built-in-combi-oven-va05/) at 70 is the size to look at.'
  FROM product WHERE slug = 'free-standing-combi-oven-va01';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'What warranty does the VA01 carry, and where can I buy it?',
  'Two years, as a combi oven under the VATTI agreement, for the original buyer from an authorised dealer; register it at [VATTI eWarranty](/vatti-ewarranty/) at purchase. VATTI Malaysia does not sell online, so find the nearest dealer in the [dealer directory](/store-locations/).'
  FROM product WHERE slug = 'free-standing-combi-oven-va01';

-- The last four products in the catalogue, and the only ones with no marketing
-- images at all: two ceramic hobs, a combi oven and a microwave, each of which
-- shipped with a studio render and a spec list and nothing else. They get no
-- feature blocks, because there is nothing to cut apart. What they get is the
-- rest of the format: an intro, the figures as a table, and the questions.

-- ceramic-cooker-hob-er3601t ------------------------------------------------

UPDATE product SET intro_md =
  'A three-zone ceramic hob for a kitchen that cannot take gas: a flat glass top with a full touch panel, a 2,200 W dual zone that shrinks to 1,000 W for a small pan, and 1,200 W and 1,800 W single zones beside it. Child lock, cooking timer, residual heat warning and overheat cut-off are all standard.'
  WHERE slug = 'ceramic-cooker-hob-er3601t';

INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 1, 'product', 'Zones', 'Three', 'ceramic, flush glass' FROM product WHERE slug = 'ceramic-cooker-hob-er3601t';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Single zones', '1,200 W and 1,800 W', NULL FROM product WHERE slug = 'ceramic-cooker-hob-er3601t';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Dual zone', '1,000 W or 2,200 W', 'switches to suit the pan on it' FROM product WHERE slug = 'ceramic-cooker-hob-er3601t';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Controls', 'Full touch panel', 'with a cooking timer and a child lock' FROM product WHERE slug = 'ceramic-cooker-hob-er3601t';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'product', 'Safety', 'Residual heat warning', 'and overheat cut-off protection' FROM product WHERE slug = 'ceramic-cooker-hob-er3601t';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What size cut-out does the ER3601T need?',
  'VATTI publishes no dimension drawing or specification panel for this model, so there is no figure on this page to work from. Any [authorised dealer](/store-locations/) has the instruction manual and will measure the opening with you before ordering.'
  FROM product WHERE slug = 'ceramic-cooker-hob-er3601t';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'Is a ceramic hob the same as induction?',
  'No. A ceramic hob heats an element under the glass, which then heats the pan, so it works with any pan and stays hot after it is switched off, which is what the residual heat warning is for. An induction hob heats the pan itself and needs magnetic cookware. Ceramic is the simpler and cheaper of the two.'
  FROM product WHERE slug = 'ceramic-cooker-hob-er3601t';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'What is a dual zone for?',
  'It changes size. At 1,000 W it heats only the inner ring, for a small pot; at 2,200 W the whole zone is live, for a wide pan. Without it, a small pan on a big zone wastes most of the heat around its sides.'
  FROM product WHERE slug = 'ceramic-cooker-hob-er3601t';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'Can it be used for wok cooking?',
  'Not really. A ceramic hob heats a flat base through contact, so a round-bottomed wok touches it in one small circle. For wok cooking, gas is the right answer: the [C836G](/vatti-flexi-hob-c836g/) at 5.5 kW or the [C830G](/vatti-3-burner-gas-hob-c830g/) at 6 kW.'
  FROM product WHERE slug = 'ceramic-cooker-hob-er3601t';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 5, 'What warranty does it carry, and where can I buy it?',
  'Two years on the hob and a lifetime warranty on the glass top, for the original buyer from an authorised dealer; register it at [VATTI eWarranty](/vatti-ewarranty/) at purchase. VATTI Malaysia does not sell online, so find the nearest dealer in the [dealer directory](/store-locations/).'
  FROM product WHERE slug = 'ceramic-cooker-hob-er3601t';

-- ceramic-cooker-hob-er5902t ------------------------------------------------

UPDATE product SET intro_md =
  'Five ceramic zones across one glass top, which is a large-kitchen hob rather than a flat replacement for two burners: two 1,200 W zones, two at 1,800 W, and two dual zones that step between 700 and 1,700 W and 1,000 and 2,200 W. Full touch control, cooking timer, child lock, residual heat warning and overheat cut-off.'
  WHERE slug = 'ceramic-cooker-hob-er5902t';

INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 1, 'product', 'Zones', 'Five', 'ceramic, flush glass' FROM product WHERE slug = 'ceramic-cooker-hob-er5902t';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Single zones', '1,200 W x2, 1,800 W x2', NULL FROM product WHERE slug = 'ceramic-cooker-hob-er5902t';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Dual zones', '700 / 1,700 W and 1,000 / 2,200 W', 'each steps to suit the pan on it' FROM product WHERE slug = 'ceramic-cooker-hob-er5902t';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Controls', 'Full touch panel', 'with a cooking timer and a child lock' FROM product WHERE slug = 'ceramic-cooker-hob-er5902t';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'product', 'Safety', 'Residual heat warning', 'and overheat cut-off protection' FROM product WHERE slug = 'ceramic-cooker-hob-er5902t';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What size cut-out does the ER5902T need?',
  'VATTI publishes no dimension drawing for this model. It is a five-zone hob and therefore considerably wider than a two-burner one, so have your dealer measure the opening before ordering.'
  FROM product WHERE slug = 'ceramic-cooker-hob-er5902t';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'Five zones on a domestic hob: is that useful?',
  'It is a hob for a household that cooks several dishes at once, or one where the kitchen island is long enough to justify it. Two of the five change size, so a small pot is not sitting on a wide element.'
  FROM product WHERE slug = 'ceramic-cooker-hob-er5902t';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'How does it compare with the ER3601T?',
  'Two more zones and one more dual zone. The [ER3601T](/ceramic-cooker-hob-er3601t/) has three zones for a normal kitchen; this one has five for a large one. The controls, the safety features and the glass are the same.'
  FROM product WHERE slug = 'ceramic-cooker-hob-er5902t';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'What warranty does it carry, and where can I buy it?',
  'Two years on the hob and a lifetime warranty on the glass top, for the original buyer from an authorised dealer; register it at [VATTI eWarranty](/vatti-ewarranty/) at purchase. VATTI Malaysia does not sell online, so find the nearest dealer in the [dealer directory](/store-locations/).'
  FROM product WHERE slug = 'ceramic-cooker-hob-er5902t';

-- built-in-combi-oven-va04 --------------------------------------------------

UPDATE product SET intro_md =
  'A 70 litre built-in combi oven with eight baking functions and a steam function behind them: sprayed steam with a drying cycle after it, an auto-clean, an alarm sensor and a three-layer door that keeps the outside cool. Built so the water does not drip onto the food, which is the difference between a steam oven and a wet one.'
  WHERE slug = 'built-in-combi-oven-va04';

INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 1, 'product', 'Capacity', '70 L', 'eight baking functions plus steam' FROM product WHERE slug = 'built-in-combi-oven-va04';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Steam', 'Sprayed, with a drying cycle', 'built not to drip on the food' FROM product WHERE slug = 'built-in-combi-oven-va04';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Door', 'Three layers', 'to keep the outside cool' FROM product WHERE slug = 'built-in-combi-oven-va04';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Cleaning', 'Auto clean', 'with an alarm sensor function' FROM product WHERE slug = 'built-in-combi-oven-va04';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'installation', 'Cabinet column', '60 cm built-in', 'VATTI publishes no cut-out drawing for this model; the 70 litre VA05 and VA06 are 595 x 595 x 563 mm into a 560 x 595 x 550 mm opening' FROM product WHERE slug = 'built-in-combi-oven-va04';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What size cabinet does the VA04 need?',
  'A standard 60cm built-in column. VATTI publishes no drawing for this model; the other 70 litre combi ovens, the [VA05](/built-in-combi-oven-va05/) and [VA06](/vatti-magic-series-combi-oven-va06/), are 595 x 595 x 563 mm into a 560 x 595 x 550 mm opening, which is the size to plan for.'
  FROM product WHERE slug = 'built-in-combi-oven-va04';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'Which combi oven should I choose?',
  'The VA04 is the straightforward 70 litre one: eight functions and steam. The [VA05](/built-in-combi-oven-va05/) adds a food probe and independent top and bottom control; the [VA06](/vatti-magic-series-combi-oven-va06/) adds a colour screen, air-frying and 68 recipes; the [VA03](/built-in-combi-oven-va03/) is 50 litres with fourteen functions and an external water tank.'
  FROM product WHERE slug = 'built-in-combi-oven-va04';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'How is it cleaned?',
  'An auto-clean cycle, with a spraying steam and drying pair that leaves the cavity dry rather than damp. An alarm sensor tells you when it is finished.'
  FROM product WHERE slug = 'built-in-combi-oven-va04';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'What warranty does the VA04 carry, and where can I buy it?',
  'Two years, as a combi oven under the VATTI agreement, for the original buyer from an authorised dealer; register it at [VATTI eWarranty](/vatti-ewarranty/) at purchase. VATTI Malaysia does not sell online, so find the nearest dealer in the [dealer directory](/store-locations/).'
  FROM product WHERE slug = 'built-in-combi-oven-va04';

-- built-in-microwave-m626 ---------------------------------------------------

UPDATE product SET intro_md =
  'A 25 litre built-in microwave with a grill: 800 W of microwave, 1,100 W of grill, and a combi mode that runs both so things brown instead of steaming. A stainless cavity, a full digital touch screen, a 60 minute timer and no handle on the door, so it sits flush in a cabinet run.'
  WHERE slug = 'built-in-microwave-m626';

INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 1, 'product', 'Capacity', '25 L', NULL FROM product WHERE slug = 'built-in-microwave-m626';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 2, 'product', 'Microwave power', '800 W', NULL FROM product WHERE slug = 'built-in-microwave-m626';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 3, 'product', 'Grill power', '1,100 W', 'with a combi microwave and grill mode' FROM product WHERE slug = 'built-in-microwave-m626';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 4, 'product', 'Cavity', 'Stainless steel', NULL FROM product WHERE slug = 'built-in-microwave-m626';
INSERT INTO product_dimension (product_id, position, section, label, value, note)
SELECT id, 5, 'product', 'Controls', 'Full digital touch screen', '60 minute timer, handle-free door' FROM product WHERE slug = 'built-in-microwave-m626';

INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 1, 'What size cabinet does the M626 need?',
  'VATTI publishes no dimension drawing for this model. It is a built-in microwave for a standard 60cm cabinet run; have your dealer confirm the opening and the depth before the joinery is made.'
  FROM product WHERE slug = 'built-in-microwave-m626';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 2, 'What does the combi mode do?',
  'It runs the microwave and the 1,100 W grill together, so food heats through from the microwave while the grill browns the surface. A microwave alone reheats; combi is what stops leftovers coming out pale and soft.'
  FROM product WHERE slug = 'built-in-microwave-m626';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 3, 'Why is there no handle?',
  'So it sits flush with the cabinet fronts. The door opens on a push, which is what lets a microwave disappear into a run of joinery rather than interrupting it.'
  FROM product WHERE slug = 'built-in-microwave-m626';
INSERT INTO product_faq (product_id, position, question, answer_md)
SELECT id, 4, 'What warranty does the M626 carry, and where can I buy it?',
  'The VATTI warranty agreement does not name microwaves in its two-year clause, so the term is the one your dealer states at purchase. Register it at [VATTI eWarranty](/vatti-ewarranty/) and keep the invoice. VATTI Malaysia does not sell online: find the nearest dealer in the [dealer directory](/store-locations/).'
  FROM product WHERE slug = 'built-in-microwave-m626';
