-- Category page content: the signature model, the "how to choose" blocks, the
-- reasons-to-buy and the FAQ, plus the Google reviews carried over from the
-- Trustindex widget.
--
-- Source of truth, hand-authored and hand-editable — NOT generated from a
-- scrape. Runs after products.sql (db-build.mjs takes the ORDER list first,
-- then the rest sorted, and 'c' sorts before 'p'), so every product and
-- category row it joins to already exists.
--
-- Only kitchen hoods are written out below. The template renders each section
-- from its own table and skips the ones with no rows, so the other four
-- categories ship exactly as they do today until their copy is written. Adding
-- a category means adding rows here and nothing else.
--
-- Every figure is checked against product_facet. Do not write a number here
-- that the spec data does not support — the same page prints the measured
-- values twenty lines further down and a visitor can see both at once.

-- ── the hood page's H1 ─────────────────────────────────────────────────────
-- The live page carries TWO H1s: the hero headline and, six sections lower,
-- "Compare VATTI Kitchen Hood Models" over the comparison table. The scrape
-- captured the second one, so product_category.h1 has been the compare
-- heading standing in as the page headline ever since.
--
-- Now that the comparison section has been rebuilt and needs that string back,
-- the two collide. This restores the live site's own arrangement rather than
-- inventing one: the hero gets the hero H1, verbatim, and the table gets its
-- heading. The other four categories are untouched — their h1 is the same
-- mis-scrape, but nothing on those pages competes with it yet, and rewriting
-- a ranking headline nobody asked about is not a side effect to slip in here.
UPDATE product_category SET h1 = 'Powerful Kitchen Hood in Malaysia for Smoke-Free Malaysian Homes'
  WHERE slug = 'kitchen-hood-in-malaysia';

-- ── the model each category leads with ─────────────────────────────────────
-- Editorial. V929 is the hood the live site fronts; the other four match the
-- models the homepage promotes, so a visitor arriving from either page meets
-- the same product.
UPDATE product_category SET signature_product_id =
  (SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929')
  WHERE slug = 'kitchen-hood-in-malaysia';
UPDATE product_category SET signature_product_id =
  (SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g')
  WHERE slug = 'cooker-hob-in-malaysia';
UPDATE product_category SET signature_product_id =
  (SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06')
  WHERE slug = 'combi-and-steam-oven-in-malaysia';
UPDATE product_category SET signature_product_id =
  (SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwbb7')
  WHERE slug = 'dishwasher-in-malaysia';
UPDATE product_category SET signature_product_id =
  (SELECT id FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd')
  WHERE slug = 'one-tap-purifier-in-malaysia';

-- The signature block prints the model's own intro, and 38 of 39 products have
-- none — the scrape found intro copy on the V938 alone. Written here rather
-- than in products.sql because that file is generated; same arrangement as
-- product-captions.sql, which UPDATEs the rows it does not own. Guarded on
-- NULL so a future import that ships real copy wins over this.
UPDATE product SET intro_md =
  'Two things usually pull against each other in a hood: how hard it extracts and how loud it is doing it. The V929 is the model where VATTI stopped trading one for the other.'
  WHERE slug = 'vatti-aetheris-series-cooker-hood-v929' AND intro_md IS NULL;

-- ── kitchen hood: the series filter ────────────────────────────────────────
-- The five terms the live page filters on, in the live tab order, read out of
-- the `kitchen-hood-taxa-*` classes on vattimalaysia.com/kitchen-hood-in-malaysia/
-- (pages 1 and 2, 10 Aug 2026). Names and slugs are the live ones.
INSERT INTO product_collection (category_id, slug, name, sort_order) VALUES
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'),
   'compact-performance-series', 'Compact Performance Series', 1),
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'),
   'family-daily-cooking-series', 'Family Daily Cooking Series', 2),
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'),
   'heavy-duty-cooking-series', 'Heavy-Duty Cooking Series', 3),
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'),
   'high-efficiency-air-capture-series', 'High-Efficiency Air Capture Series', 4),
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'),
   'small-kitchen-series', 'Small Kitchen Series', 5);

-- Membership, term by term, exactly as the live loop files them.
--
-- The live loop carries 14 cards; we publish 16 hoods. The V936 and the V991
-- have product pages and sit in no term at all over there, which on a filtered
-- grid would mean two models that vanish whichever tab is pressed. Both are
-- Athena lifting-type hoods at 2,050 m³/h and 450-460 Pa, which is the V993 to
-- within a rounding error, so they are filed with it under Family Daily
-- Cooking. That pairing is ours, not the live site's; change it here if the
-- product team files them somewhere else.
INSERT INTO product_collection_member (collection_id, product_id)
SELECT c.id, p.id
  FROM product_collection c
  JOIN product p ON p.slug = m.slug
  JOIN (SELECT 'compact-performance-series' AS term, 'artemis-series-t-type-range-hood-v931' AS slug
  UNION ALL SELECT 'family-daily-cooking-series', 'athena-series-lifting-type-range-hood-v993'
  UNION ALL SELECT 'family-daily-cooking-series', 'athena-series-lifting-type-range-hood-v999'
  UNION ALL SELECT 'family-daily-cooking-series', 'athena-series-lifting-type-range-hood-v936'
  UNION ALL SELECT 'family-daily-cooking-series', 'athena-series-lifting-type-range-hood-v991'
  UNION ALL SELECT 'family-daily-cooking-series', 'vatti-smart-oxygen-range-hood-v998'
  UNION ALL SELECT 'family-daily-cooking-series', 'vatti-cooker-hood-v917-carbon-grey'
  UNION ALL SELECT 'family-daily-cooking-series', 'vatti-cooker-hood-v917-white'
  UNION ALL SELECT 'heavy-duty-cooking-series', 'vatti-aetheris-series-cooker-hood-v929'
  UNION ALL SELECT 'heavy-duty-cooking-series', 'vatti-magic-series-cooker-hood-v919'
  UNION ALL SELECT 'heavy-duty-cooking-series', 'vatti-range-hood-v997'
  UNION ALL SELECT 'high-efficiency-air-capture-series', 'triple-intake-series-t-type-cooker-hood-v937'
  UNION ALL SELECT 'high-efficiency-air-capture-series', 'vatti-hidden-series-range-hood-v938'
  UNION ALL SELECT 'high-efficiency-air-capture-series', 'vatti-stellar-series-cooker-hood-v960'
  UNION ALL SELECT 'small-kitchen-series', 'slim-series-type-range-hood-v995'
  UNION ALL SELECT 'small-kitchen-series', 'vatti-slim-series-type-range-hood-v996'
  ) m ON m.term = c.slug
 WHERE c.category_id = (SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia');

-- ── kitchen hood: how to choose ────────────────────────────────────────────
-- Two measured blocks, then four prose blocks. The measured pair is the whole
-- argument of the section: airflow is the number every brand quotes and it
-- does not separate these models, pressure is the number that does.
INSERT INTO category_guide (category_id, position, heading, body_md, figure, figure_unit) VALUES
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 1,
   'Start at ten air changes an hour',
   'A typical Malaysian kitchen needs somewhere around 650 to 800 m³/h to turn its air over ten times an hour. Every hood on this page is rated well above that at free flow, which is why airflow on its own will not tell you which one to buy.',
   '650-800', 'm³/h'),

  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 2,
   'Static pressure is what separates them',
   'Airflow is measured with nothing in the way. Static pressure is what survives once the air has to climb a riser or turn two corners. Short duct to an outside wall: the lower end is fine. High-rise or a long run through the ceiling: take the top of the range.',
   '420-1,700', 'Pa'),

  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 3,
   'Ducted, if the building allows it',
   'A ducted hood pushes smoke, steam and grease outside and never hands them back. It is the more effective arrangement for high-heat wok cooking, and the one to choose whenever ducting can reach an external wall.',
   NULL, NULL),

  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 4,
   'Ductless, when it does not',
   'A recirculating hood filters the air and returns it to the room. It is the practical pick where an external vent is not permitted. Budget for filter replacement, and expect the heat and humidity to stay in the kitchen with you.',
   NULL, NULL),

  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 5,
   'Slim and hidden bodies for condo kitchens',
   'A slim or hidden hood extracts as hard as a chimney model without dominating the room. Hidden bodies sit flush into the cabinetry above the hob, which is what keeps the sightline across an open-plan island clear.',
   NULL, NULL),

  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 6,
   'Size it to the hob, not to the wall',
   'The hood has to be at least as wide as the hob or smoke escapes at the edges however hard the motor pulls. Match the hob width, and when the two sizes fall between models, take the larger one.',
   NULL, NULL);

-- ── kitchen hood: why VATTI ────────────────────────────────────────────────
-- Three of the six carry a figure, and each of those three is the real
-- best-in-range value from product_facet: 1,700 Pa (V960), 92% oil capture
-- (nine models), 46 dB (V937). The other three claims have no measured value
-- behind them and correctly show none.
INSERT INTO category_reason (category_id, position, title, body_md, figure, figure_unit, icon) VALUES
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 1,
   'Airflow and pressure, not just airflow',
   'Airflow clears the smoke. Static pressure is what keeps clearing it through a duct that bends, rises and runs long. The range tops out at 1,700 Pa, which is where a high-rise installation stops being a compromise.',
   '1,700', 'Pa', 'airflow'),

  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 2,
   'Grease caught in layers',
   'Oil capture reaches 92% on the upper models. The PM2.5 models add air purification behind the grease stage, so what leaves the kitchen is cleaner than what the filters alone would give you.',
   '92', '%', 'filtration'),

  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 3,
   'Quiet for the air they move',
   'Measured noise across the range runs from 46 dB to 54 dB. That comes from aerodynamic duct design and motor insulation, not from a smaller fan: the quietest hood here is also one of the strongest.',
   '46', 'dB', 'noise'),

  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 4,
   'Brushless motors',
   'A BLDC motor holds suction at lower speed, draws less power for the same extraction, and stays quiet as it ages. Filter the grid above by motor to see which models carry one.',
   NULL, NULL, 'motor'),

  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 5,
   'Auto-clean that runs hot',
   'High-temperature steam and turbo wash cycles lift oil off the chamber wall before it hardens. Grease is why a hood loses suction in its third year. It is almost never the motor.',
   NULL, NULL, 'clean'),

  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 6,
   'Controls you can use with oily hands',
   'Wave a hand instead of touching a panel. Selected models add WiFi and a link to the hob, so the extraction follows the flame and shuts itself down after you finish.',
   NULL, NULL, 'controls');

-- ── kitchen hood: FAQ ──────────────────────────────────────────────────────
-- Carried over from the live page, which has been answering these for three
-- years and may already be feeding rich results. Wording is tightened, the
-- substance is not changed, except where the live answer contradicts the spec
-- data: the quietest-model answer named the V991 at 54 dB, which is the
-- loudest figure in the range, not the lowest.
INSERT INTO category_faq (category_id, position, question, answer_md) VALUES
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 1,
   'Which type of kitchen hood is better?',
   'Wall-mounted and island hoods are the usual choices for powerful ventilation. The question that changes more, in a Malaysian kitchen, is ducted or ductless: venting outside beats recirculating whenever the building permits it.'),

  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 2,
   'What should I look for when buying a kitchen hood?',
   'Suction power, static pressure, noise level, and a body at least as wide as your hob. Hand-wave sensors and auto-clean matter after those four. Our [kitchen hood buying guide](/buying-guide/types-of-range-hoods/) works through them in order.'),

  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 3,
   'Who should install a kitchen hood?',
   'A professional installer, and preferably the authorised dealer you bought it from. Ducting, mounting height and electrical work all affect how the hood performs, and doing them yourself can void the warranty.'),

  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 4,
   'Do kitchen hoods remove smells?',
   'Yes. Grease filters catch the oil and the airflow carries the odour out with it. The models with PM2.5 purification and odour reduction go further, up to 97% on the V938 and V960.'),

  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 5,
   'What is a good suction power for a kitchen hood?',
   'Aim to turn the kitchen air over at least ten times an hour, which is roughly 650 to 800 m³/h for a typical kitchen. Every hood here clears that comfortably, so use static pressure to choose between them.'),

  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 6,
   'What is a smart kitchen hood?',
   'One with hand-wave sensing, timed shutdown and, on the top models, WiFi and an automatic link to the hob. The hood raises its own speed as the flame goes up and runs on for a few minutes after you stop.'),

  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 7,
   'Are all kitchen hoods noisy?',
   'No. Noise varies by motor and duct design, and the useful comparison is the measured dB figure rather than the marketing. Anything in the 45 to 55 dB band is quiet enough to talk over while you cook.'),

  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 8,
   'Which VATTI kitchen hood is the quietest?',
   'The [Triple Intake V937](/triple-intake-series-t-type-cooker-hood-v937/) at 46 dB, with the [Aetheris V929](/vatti-aetheris-series-cooker-hood-v929/) just behind it at 46.5 dB. Both are also among the strongest extractors in the range.'),

  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 9,
   'What size kitchen hood do I need?',
   'At least the width of your hob. A hood narrower than the cooking surface lets smoke escape at the edges no matter how powerful it is, so when in doubt take the larger body.'),

  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 10,
   'How long should a kitchen hood last?',
   'Ten to fifteen years with proper maintenance. Clean the filters on schedule and run the auto-clean cycle: grease buildup, not wear, is what takes the suction away.');

-- ── kitchen hood: the "Best for" row ───────────────────────────────────────
-- One line per model for the comparison table. Written against the measured
-- figures, not around them: the V937 is named the quietest because at 46 dB it
-- is, and the two Slims are sent to condos because 1,950-2,050 m³/h with a
-- short duct is what they are for. Editorial, and the one row in that table a
-- buyer cannot work out from the numbers themselves.
UPDATE product SET best_for = CASE slug
  WHEN 'vatti-aetheris-series-cooker-hood-v929'      THEN 'Heavy wok cooking, open kitchens'
  WHEN 'vatti-stellar-series-cooker-hood-v960'       THEN 'Long ducts and high-rise units'
  WHEN 'vatti-hidden-series-range-hood-v938'         THEN 'Flush cabinetry, no chimney'
  WHEN 'vatti-magic-series-cooker-hood-v919'         THEN 'High-heat cooking, every day'
  WHEN 'vatti-smart-oxygen-range-hood-v998'          THEN 'Smart controls, modern kitchens'
  WHEN 'vatti-range-hood-v997'                       THEN 'Intensive cooking, auto suction'
  WHEN 'triple-intake-series-t-type-cooker-hood-v937' THEN 'The quietest strong extractor'
  WHEN 'athena-series-lifting-type-range-hood-v993'  THEN 'Everyday family cooking'
  WHEN 'athena-series-lifting-type-range-hood-v999'  THEN 'Everyday cooking, hand sensor'
  WHEN 'athena-series-lifting-type-range-hood-v936'  THEN 'Short ducts, moderate cooking'
  WHEN 'athena-series-lifting-type-range-hood-v991'  THEN 'Short ducts, lighter cooking'
  WHEN 'vatti-cooker-hood-v917-carbon-grey'          THEN 'Balanced power, slim body'
  WHEN 'vatti-cooker-hood-v917-white'                THEN 'Balanced power, in white'
  WHEN 'slim-series-type-range-hood-v995'            THEN 'Condos and small kitchens'
  WHEN 'vatti-slim-series-type-range-hood-v996'      THEN 'Tight spaces, lighter cooking'
  WHEN 'artemis-series-t-type-range-hood-v931'       THEN 'Compact kitchens, short runs'
  ELSE best_for END
 WHERE category_id = (SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia');

-- ── Google reviews ─────────────────────────────────────────────────────────
-- All ten the Trustindex widget rotates, verbatim, including the original
-- spelling and the Malay. Already published publicly under the same names on
-- both Google and vattimalaysia.com.
--
-- posted_at is the widget's own `data-time` unix timestamp, converted; the
-- rating is its five filled star images counted. Neither is estimated. Ten out
-- of ten are five stars, which is what the aggregate "Excellent" is built on.
-- The aggregate count itself lives in src/lib/site.ts.
INSERT INTO review (position, author, body, rating, posted_at, source) VALUES
  (1, 'Rez Mumy',
   'Both technician efficiently explain the suction issue.', 5, '2026-04-07', 'Google'),
  (2, 'Sky Ng',
   'Good Service, and Fast Settle', 5, '2026-04-07', 'Google'),
  (3, 'Michael Chong',
   'Good after sales service', 5, '2026-04-03', 'Google'),
  (4, 'roszaida othman',
   'hood problem…technician datang tukar board terus ok…technician berpengalaman service pantas dan friendly…puas hati…', 5, '2026-03-27', 'Google'),
  (5, 'Puvaneswary Thirunganam',
   'Had problem with cleaning the hood. Jack & Kishore had solved it. Very fast action', 5, '2026-03-27', 'Google'),
  (6, 'Emily Mong',
   'Good Service', 5, '2026-03-26', 'Google'),
  (7, 'Carol Quek',
   'Good after sales service. Both technicians Mr Jack and sales personal are responsible and fast response.', 5, '2026-03-19', 'Google'),
  (8, 'Farouq Mohamed',
   'Good response from technician regarding my device issue.good service', 5, '2026-03-18', 'Google'),
  (9, 'Dennis Liew',
   'Gas hob was purchased in July 2025 but only installed in Nov 25. We discovered the timer was faulty 2 weeks ago and ignition was faulty 2 days ago. We immediately requested a service visit and we are happy that Vatti replied and responded by sending someone over the very next day. Nesh the service person came, troubleshot the problem and we could timer assembly was faulty and was immediately replaced. Nesh also helped clean the stove and taught us how to clean the kitchen hood. We are very happy with the service done. Good job, Vatti. Thank you', 5, '2026-03-18', 'Google'),
  (10, 'HG Tan',
   'Good after sales service, very helpful and friendly technician, J&G 👍They fixed my cooker hood by checking throughly and explain how to take care the product. Thumbs up for the service and product, highly recommended! 16 Mar 2026 - Mr Jack & Mr Kishor appeared humble and friendly as usual had attended to me again. They fixed my hood''s auto cleaning issue promptly. Great job team!', 5, '2026-03-16', 'Google');
