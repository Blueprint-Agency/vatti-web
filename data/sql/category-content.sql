-- Category page content: the signature model, the "how to choose" blocks, the
-- reasons-to-buy and the FAQ, plus the Google reviews carried over from the
-- Trustindex widget.
--
-- Source of truth, hand-authored and hand-editable — NOT generated from a
-- scrape. Runs after products.sql (db-build.mjs takes the ORDER list first,
-- then the rest sorted, and 'c' sorts before 'p'), so every product and
-- category row it joins to already exists.
--
-- Kitchen hoods and cooker hobs are written out below. The template renders
-- each section from its own table and skips the ones with no rows, so the
-- remaining three categories ship exactly as they do today until their copy is
-- written. Adding a category means adding rows here and nothing else.
--
-- Every figure is checked against product_facet. Do not write a number here
-- that the spec data does not support — the same page prints the measured
-- values twenty lines further down and a visitor can see both at once.

-- ── the hood and hob page H1s ──────────────────────────────────────────────
-- The live page carries TWO H1s: the hero headline and, six sections lower,
-- "Compare VATTI Kitchen Hood Models" over the comparison table. The scrape
-- captured the second one, so product_category.h1 has been the compare
-- heading standing in as the page headline ever since.
--
-- Now that the comparison section has been rebuilt and needs that string back,
-- the two collide. This restores the live site's own arrangement rather than
-- inventing one: the hero gets the hero H1, verbatim, and the table gets its
-- heading. The remaining three categories are untouched — their h1 is the same
-- mis-scrape, but nothing on those pages competes with it yet, and rewriting
-- a ranking headline nobody asked about is not a side effect to slip in here.
--
-- The hob page is the same story. Its scrape returned NO h1 at all (the live
-- markup tags both headings h2), so product_category.h1 held the compare
-- heading by the same accident. Both strings below are the live hero copy,
-- verbatim.
UPDATE product_category SET h1 = 'Powerful Kitchen Hood in Malaysia for Smoke-Free Malaysian Homes'
  WHERE slug = 'kitchen-hood-in-malaysia';
UPDATE product_category SET h1 = 'Power & Precision Cooker Hob in Malaysia for Modern Asian Cooking'
  WHERE slug = 'cooker-hob-in-malaysia';

-- The remaining three, same story and same source: each is the hero heading
-- the live page opens with, verbatim.
--
-- The purifier is the exception worth knowing about. Its live hero heading is
-- 92 characters, which is half as long again as any other H1 here and would
-- wrap to four lines in the banner. Its page also carries a REAL <h1> further
-- down ("Single Tap Water Purifier & Instant Hot Water Dispenser"), which the
-- scrape did capture, so that is what goes in the hero: it is the string the
-- page already ranks under, and it fits.
UPDATE product_category SET h1 = 'Powerful, Healthy & Smart Cooking with Combi and Steam Ovens in Malaysia'
  WHERE slug = 'combi-and-steam-oven-in-malaysia';
UPDATE product_category SET h1 = 'Advanced Dishwashers for Hygienic & Effortless Cleaning in Malaysia'
  WHERE slug = 'dishwasher-in-malaysia';
UPDATE product_category SET h1 = 'Single Tap Water Purifier & Instant Hot Water Dispenser'
  WHERE slug = 'one-tap-purifier-in-malaysia';

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

-- ── the decorative backdrops ───────────────────────────────────────────────
-- The hero and the band that asks about the visitor's kitchen both stand on a
-- photograph of one, knocked back far enough to read as a ground rather than a
-- picture: opacity-50 under a wash of --void, at which strength what reads is
-- the room and not the appliance in it.
--
-- All five stand on a photograph of their own appliance now. The purifier was
-- the last one holding a hood behind a page that talks about a purifier, and
-- it is not doing that any more.
UPDATE product_category SET
  hero_image_url =
    'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/kitchen-hood-hero-backdrop.jpg',
  finder_image_url =
    'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/kitchen-hood-finder-backdrop.jpg'
  WHERE slug = 'kitchen-hood-in-malaysia';

-- The hob leads with its own C861G-in-a-kitchen shot. It carries the whole
-- hero on its own now that there is no cut-out set over it, which is why this
-- is a hob-led frame and not the hood's.
--
-- The questionnaire band is still the hood's photograph. That band asks about
-- the visitor's kitchen rather than about the appliance, the picture is a
-- whole room at half opacity under the same wash, and nothing in the copy
-- beside it names a product. Swap it the day a second hob-led room shot
-- exists; it does not need one to be honest.
UPDATE product_category SET
  hero_image_url =
    'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/cooker-hob-hero-backdrop.jpg',
  finder_image_url =
    'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/kitchen-hood-finder-backdrop.jpg'
  WHERE slug = 'cooker-hob-in-malaysia';

-- The oven now leads with its own appliance too: a built-in combi set in a
-- walnut cabinet run at eye level, which is the height the guide beside it
-- argues an oven belongs at. Same treatment as the hob, and the same reason
-- it is a full-screen banner rather than a shallow band: no cut-out is set
-- over it, so the photograph IS the hero.
--
-- The questionnaire band below it is still the hood's room shot, on the same
-- terms the hob keeps it: that band asks about the visitor's kitchen, not
-- about the appliance, and nothing in the copy beside it names a product.
UPDATE product_category SET
  hero_image_url =
    'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/combi-oven-hero-backdrop.jpg',
  finder_image_url =
    'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/kitchen-hood-finder-backdrop.jpg'
  WHERE slug = 'combi-and-steam-oven-in-malaysia';

-- The dishwasher leads with its own machine as well: a built-in fronted in
-- black glass, set into a dark cabinet run under a marble counter. Same terms
-- as the hob and the oven — no cut-out over it, so the photograph IS the hero
-- and the banner runs the full screen.
--
-- The questionnaire backdrop is the hood's room shot and is not rendered on
-- this page at all: that band needs more than two models to have anything to
-- narrow, and there is one. It is set so the row is ready the day a second
-- machine is published, on the same reasoning the hob and oven keep it — the
-- band asks about the visitor's kitchen, not about the appliance.
UPDATE product_category SET
  hero_image_url =
    'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/dishwasher-hero-backdrop.jpg',
  finder_image_url =
    'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/kitchen-hood-finder-backdrop.jpg'
  WHERE slug = 'dishwasher-in-malaysia';

-- The purifier now leads with its own units: the WDHG01 and the V818WD heater
-- beside it on a marble counter, the tap in the same frame, in a kitchen of
-- pale wood and daylight. It replaces the hood photograph this page stood on
-- while the real ones were produced, which was the wrong appliance behind an
-- argument about a purifier. Same terms as the hob, the oven and the
-- dishwasher: no cut-out over it, so the photograph IS the hero and the banner
-- runs the full screen.
--
-- The questionnaire backdrop is still the hood's room shot, and as on the
-- dishwasher page it is not rendered here at all: that band needs more than
-- two models to have anything to narrow, and there is one. It is set so the
-- row is ready the day a second purifier is published.
UPDATE product_category SET
  hero_image_url =
    'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/water-purifier-hero-backdrop.jpg',
  finder_image_url =
    'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/kitchen-hood-finder-backdrop.jpg'
  WHERE slug = 'one-tap-purifier-in-malaysia';

-- ── the photograph under the signature band ────────────────────────────────
-- The lead model installed and working, which is the argument the band makes.
-- The hood shot moved here off a public/ path in SIGNATURE_SCENE; it is the
-- same bytes under a new R2 key, so nothing on the page changes.
--
-- The focus points differ because the photographs do. The hood is the top
-- left two thirds of its frame and the copy sits right, so the crop is biased
-- up and left and the right edge is the side that can afford to go. The hob
-- sits centre and slightly low in a wide countertop shot, so it holds nearer
-- the middle and drops a little to keep the burners in frame when the band
-- crops to a phone. The oven is a tall unit standing just left of centre in
-- its frame, so it holds close to the middle horizontally, which also keeps
-- it clear of the copy weighted right, and lifts a little vertically so the
-- control panel survives the crop rather than the plinth below the door. The
-- dishwasher stands open in a wide kitchen with its door down, and the part of
-- it that reads at any size is the lit interior behind that door rather than
-- the black slab of the door itself. So it holds a little left of centre,
-- which is where the light is, and a portrait crop keeps the baskets instead
-- of a dark panel. It drops below the middle for the same reason the oven
-- lifts above it: crop the top of this frame and what is left is worktop.
-- Measured at 52% first, which centres the door and loses the light.
-- The purifier is two boxes and a tap on a counter, and the pair of boxes is
-- the whole subject: they sit left of centre in a wide frame with the tap out
-- at 75%, so the crop holds well left. That is also the side the desktop
-- gradient leaves lit, the copy being weighted right. It drops below the
-- middle for the dishwasher's reason: above the units there is only cabinet.
UPDATE product_category SET
  signature_image_url =
    'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/kitchen-hood-signature-scene.webp',
  signature_image_alt =
    'A VATTI V929 cooker hood drawing steam off a steak searing in a pan on a gas hob.',
  signature_image_focus = '38% 38%'
  WHERE slug = 'kitchen-hood-in-malaysia';
UPDATE product_category SET
  signature_image_url =
    'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/cooker-hob-signature-scene.jpg',
  signature_image_alt =
    'A VATTI C861G cooker hob set into a marble countertop, its brushed grey glass and lit touch strip between a toaster, a kettle and a chopping board.',
  signature_image_focus = '45% 62%'
  WHERE slug = 'cooker-hob-in-malaysia';
UPDATE product_category SET
  signature_image_url =
    'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/combi-oven-signature-scene.jpg',
  signature_image_alt =
    'A VATTI built-in combi oven fitted at eye level into a dark walnut cabinet run, its display lit beside a marble backsplash.',
  signature_image_focus = '48% 46%'
  WHERE slug = 'combi-and-steam-oven-in-malaysia';
UPDATE product_category SET
  signature_image_url =
    'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/dishwasher-signature-scene.jpg',
  signature_image_alt =
    'A VATTI DWBB7 dishwasher built into a grey cabinet run, its door down and its baskets lit, in a kitchen with a marble backsplash.',
  signature_image_focus = '42% 55%'
  WHERE slug = 'dishwasher-in-malaysia';
UPDATE product_category SET
  signature_image_url =
    'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/water-purifier-signature-scene.jpg',
  signature_image_alt =
    'A VATTI WDHG01 water purifier and its V818WD heater on a marble counter, with the stainless One Tap fitted at the sink beside them.',
  signature_image_focus = '40% 58%'
  WHERE slug = 'one-tap-purifier-in-malaysia';

-- ── the product beside the hero headline ───────────────────────────────────
-- Nothing sets it, and that is now the arrangement on both written pages.
--
-- Each of them already leads with a photograph of its own appliance installed
-- and working, so a cut-out of the same product laid over the top would be
-- putting it in the frame twice. Leaving the column NULL is what makes the
-- hero a full-screen banner with the copy centred over it, because the
-- template reads the absence as the layout instruction it is: no product
-- beside the words means the words have the whole banner. See CategoryView.
--
-- The hood carried v996-hero-cutout.webp here until the hob's hero settled
-- and the same treatment was taken across to it. The file is still on R2 and
-- the column and its layout branch are both still live, so restoring the
-- split hero is this UPDATE and nothing else:
--
--   UPDATE product_category SET
--     hero_product_image_url = '<CDN>/2026/08/v996-hero-cutout.webp',
--     hero_product_image_alt = 'A VATTI V996 cooker hood in black glass, ...',
--     hero_product_image_focus = '50% 0%'
--     WHERE slug = 'kitchen-hood-in-malaysia';
--
-- _focus was '50% 0%' on that row: the cut-out is tall and pinned to the top
-- so the canopy meets the header instead of drifting down beside the copy.

-- The signature block prints the model's own intro, and 38 of 39 products have
-- none — the scrape found intro copy on the V938 alone. Written here rather
-- than in products.sql because that file is generated; same arrangement as
-- product-captions.sql, which UPDATEs the rows it does not own. Guarded on
-- NULL so a future import that ships real copy wins over this.
UPDATE product SET intro_md =
  'Two things usually pull against each other in a hood: how hard it extracts and how loud it is doing it. The V929 is the model where VATTI stopped trading one for the other.'
  WHERE slug = 'vatti-aetheris-series-cooker-hood-v929' AND intro_md IS NULL;
UPDATE product SET intro_md =
  'A hob is usually a choice between a flame strong enough for a wok and a top that is quick to wipe down afterwards. The C861G lifts its burners clear of the glass, so the surface underneath cleans in one pass.'
  WHERE slug = 'vatti-magic-series-cooker-hob-c861g' AND intro_md IS NULL;
UPDATE product SET intro_md =
  'Most kitchens end up filtering the water in one place and heating it in another: a filter at the sink, a kettle on the counter and a jug in the fridge door. The WDHG01 does all three at one tap, from cold to 100°C, with 45°C in between for making up formula.'
  WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd' AND intro_md IS NULL;

-- The DWBB7 is the one product whose intro is OVERWRITTEN rather than filled
-- in. The V938 was the only model the scrape found real intro copy on; what it
-- found here is the first line of the user manual listing ("provides detailed
-- instructions on installation, operation, maintenance and troubleshooting"),
-- which describes a PDF rather than the machine. That string is the lead
-- paragraph of the signature band and of the product page, and on the
-- dishwasher page the band is now the whole product section, so it is replaced
-- outright. Not guarded on NULL for that reason.
UPDATE product SET intro_md =
  'The argument for a dishwasher in a Malaysian kitchen is not the washing up, it is the wok. The DWBB7 runs its wash at 75°C and dries at 110°C, which is water hotter than hands can work in and the reason cooking oil comes off a plate rather than moving around it.'
  WHERE slug = 'vatti-dishwasher-dwbb7';

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

-- ═══════════════════════════════════════════════════════════════════════════
-- COOKER HOB
-- ═══════════════════════════════════════════════════════════════════════════
-- Same seven blocks as the hood page above, in the same order, because it is
-- the same template: series taxonomy, how to choose, why VATTI, the FAQ, and
-- the "Best for" line per model. Content is the live cooker-hob page tightened
-- to house voice, with every number re-checked against product_facet and
-- product_spec first.
--
-- Two things the live page says are NOT repeated here, deliberately:
--
--   * "Induction". The meta description and the fuel-type cards both mention
--     it and VATTI Malaysia sells no induction hob — the eleven models are
--     nine gas and two electric ceramic. The guide block below says gas and
--     ceramic, which is what is actually on the page underneath it.
--   * "60cm / 70cm / 90cm". Generic industry sizing, and no hob here publishes
--     an overall width we hold. The measured block leads with the cut-out
--     range instead, which we do have from the two Flexi spec sheets.
--
-- The imagery is all set alongside the hood's, further up: the two decorative
-- backdrops are shared with it, and the hero cut-out and the signature
-- photograph are both the C861G, staged for this page. Neither is a catalogue
-- shot — those are the card images in the grid two screens below, and the
-- split hero exists precisely so the top of the page is not the first card
-- again (see CategoryView).

-- ── cooker hob: the series filter ──────────────────────────────────────────
-- The four terms the live page filters on, in the live tab order, read out of
-- the `cooker-hob-taxa-*` classes in research/wp-cpt-raw.json. Names and slugs
-- are the live ones. Unlike the hoods, the live loop carries all eleven
-- published models and every one of them sits in exactly one term, so no
-- membership below is invented.
INSERT INTO product_collection (category_id, slug, name, sort_order) VALUES
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'),
   'electric-ceramic-series', 'Electric Ceramic Series', 1),
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'),
   'family-everyday-cooking', 'Family & Everyday Cooking', 2),
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'),
   'high-power-cooking', 'High Power Cooking', 3),
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'),
   'smart-safety-series', 'Smart & Safety Series', 4);

-- Membership, term by term. The live loop slugs differ from ours on six of the
-- eleven (`cooker-hob-c821g` is our `professional-series-c821g`, `olympic-hob-
-- m822g` our `vatti-oylimpic-hob-m822g`, and so on); these are OUR slugs, and
-- db:check will fail loudly on any that stops resolving.
INSERT INTO product_collection_member (collection_id, product_id)
SELECT c.id, p.id
  FROM product_collection c
  JOIN product p ON p.slug = m.slug
  JOIN (SELECT 'electric-ceramic-series' AS term, 'ceramic-cooker-hob-er3601t' AS slug
  UNION ALL SELECT 'electric-ceramic-series', 'ceramic-cooker-hob-er5902t'
  UNION ALL SELECT 'family-everyday-cooking', 'vatti-3-burner-gas-hob-c830g'
  UNION ALL SELECT 'family-everyday-cooking', 'vatti-flexi-hob-c823g'
  UNION ALL SELECT 'family-everyday-cooking', 'professional-series-c821g'
  UNION ALL SELECT 'high-power-cooking', 'professional-series-c720s'
  UNION ALL SELECT 'high-power-cooking', 'vatti-oylimpic-hob-m822g'
  UNION ALL SELECT 'high-power-cooking', 'vatti-flexi-hob-c822g'
  UNION ALL SELECT 'high-power-cooking', 'vatti-flexi-hob-c836g'
  UNION ALL SELECT 'smart-safety-series', 'vatti-ai-hob-c835g'
  UNION ALL SELECT 'smart-safety-series', 'vatti-magic-series-cooker-hob-c861g'
  ) m ON m.term = c.slug
 WHERE c.category_id = (SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia');

-- ── cooker hob: the burner count, as a measured facet ──────────────────────
-- Without this the hob page has exactly ONE measured column (power), and
-- getCompareColumns drops the comparison section entirely at fewer than two —
-- which would take "Compare VATTI Cooker Hob Models" off a page that has been
-- carrying that heading for years. Efficiency cannot fill the gap: one model
-- of eleven publishes it, so it is a column of ten dashes.
--
-- Burner count is the right second number anyway. It is the first thing anyone
-- asks about a hob, it is published for all eleven, and after this the two
-- ceramic models stop being the only products on the site with no readout at
-- all.
--
-- source_position is the bullet the count is read from. Seven of them share
-- the row power already uses ("4.8KW (left & right)" states both), so nothing
-- new disappears from the spec table — see getSpecs, which hides any bullet a
-- facet was extracted from. The C720S deliberately points at its left/right
-- bullet rather than at "1.75KW (centre)": the centre bullet is what proves
-- the third burner, but it also carries that burner's rating, and hiding it
-- would lose a figure the readout does not replace.
INSERT INTO product_facet (product_id, facet, value, unit, label, position, source_position)
SELECT p.id, 'burners', m.value, '', 'Burners', m.position, m.source
  FROM product p
  JOIN (SELECT 'professional-series-c720s' AS slug,           3 AS value, 1 AS position, 1 AS source
  UNION ALL SELECT 'professional-series-c821g',               2, 1, 1
  UNION ALL SELECT 'vatti-ai-hob-c835g',                      2, 1, 1
  UNION ALL SELECT 'vatti-oylimpic-hob-m822g',                2, 1, 1
  UNION ALL SELECT 'vatti-flexi-hob-c822g',                   2, 1, 1
  UNION ALL SELECT 'vatti-flexi-hob-c823g',                   2, 1, 1
  UNION ALL SELECT 'vatti-flexi-hob-c836g',                   2, 2, 0
  UNION ALL SELECT 'vatti-3-burner-gas-hob-c830g',            3, 1, 0
  UNION ALL SELECT 'vatti-magic-series-cooker-hob-c861g',     2, 1, 1
  UNION ALL SELECT 'ceramic-cooker-hob-er3601t',              3, 0, 0
  UNION ALL SELECT 'ceramic-cooker-hob-er5902t',              5, 0, 0
  ) m ON m.slug = p.slug;

-- ── cooker hob: how to choose ──────────────────────────────────────────────
-- Two measured blocks, then four prose blocks, matching the hood page. The
-- measured pair is the argument: power decides whether the hob can cook the
-- way you cook, and the cut-out decides whether it can be installed at all.
-- Both figures come off spec bullets, not off the marketing copy.
INSERT INTO category_guide (category_id, position, heading, body_md, figure, figure_unit) VALUES
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 1,
   'Burner power is where to start',
   'Malaysian cooking is high-heat cooking, and the burner rating decides whether a wok gets there at all. The gas hobs on this page run from 3.8 kW to 6 kW on their main burners. From 4.8 kW upward there is enough heat to hold wok hei through a full stir-fry; below that suits a household that mostly boils and simmers.',
   '3.8-6', 'kW'),

  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 2,
   'Measure the cut-out, not the hob',
   'A hob is bought to fit a hole that already exists, so the countertop opening rules out more models than any specification does. The two Flexi hobs take an opening anywhere from 650 to 710 mm wide and 350 to 400 mm deep, which is what lets them drop into a counter that was cut for another brand.',
   '650-710', 'mm'),

  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 3,
   'Gas, for the wok',
   'Gas answers the moment the knob turns, goes from full flame to a simmer instantly, and keeps working through a power cut. It is still the right choice for anyone who stir-fries, and it is what nine of the eleven hobs here are.',
   NULL, NULL),

  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 4,
   'Electric ceramic, for a flat top',
   'A ceramic hob heats evenly, has no open flame, and wipes down in one pass because the whole surface is flat. Zones run up to 2,200 W, with touch control and a residual heat warning. Choose it for a kitchen that cooks more slowly, or where a gas point is not available.',
   NULL, NULL),

  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 5,
   'Safety that works without you',
   'Every gas hob here carries a safety device that cuts the gas when a flame goes out. Most add a child lock on the control knob, and the newer models add burn-dry and thermal cut-offs plus a sensor that shuts a burner down with nothing on it. The ceramic hobs carry child lock, overheat cut-off and a residual heat warning.',
   NULL, NULL),

  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 6,
   'Glass or stainless steel',
   'Tempered glass wipes clean and suits a modern kitchen, and the C836G adds a nano coating so grease lifts off it. Stainless steel takes heat and knocks better, which is why the Professional C720S is built from it. Most models sit on cast iron supports heavy enough to hold a loaded wok steady. Our [gas hob buying guide](/buying-guide/glass-vs-stainless-gas-hob-which-gas-hob-are-best/) works through the trade-off in full.',
   NULL, NULL);

-- ── cooker hob: why VATTI ──────────────────────────────────────────────────
-- Six claims, the same count the live page makes. Two carry a figure and both
-- are real: 6 kW is the C830G main burner in product_facet, 73% is the C836G
-- efficiency facet and is named to that model because it is the only hob in
-- the range that publishes the number.
INSERT INTO category_reason (category_id, position, title, body_md, figure, figure_unit, icon) VALUES
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 1,
   'Power measured in kilowatts',
   'The range tops out at 6 kW on the C830G main burners, and seven of the nine gas hobs sit at 4.8 kW or above. That is enough heat to bring a wok up fast and hold it there, which is the whole job of a gas hob in a Malaysian kitchen.',
   '6', 'kW', 'power'),

  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 2,
   'Multi-ring flames, less wasted gas',
   'An inner and an outer ring spread heat across the whole base of a wok instead of a spot in the middle. The C836G publishes 73% energy efficiency on the back of that design, and it is the only hob in the range that quotes the figure at all.',
   '73', '%', 'heat'),

  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 3,
   'Safety as standard, not as an upgrade',
   'A safety device on every gas burner cuts the supply the moment a flame goes out. Burn-dry cut-off, thermal cut-off, a no-cookware sensor and a child-locked knob appear across the range, and both ceramic hobs add overheat protection and a residual heat warning.',
   NULL, NULL, 'safety'),

  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 4,
   'Surfaces made to be wiped',
   'Tempered glass on most of the range, nano coating on the C836G, and high-grade stainless steel on the Professional C720S. The C861G goes further and flips its burners up out of the way, so there is nothing left to clean around.',
   NULL, NULL, 'clean'),

  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 5,
   'Timers that cook while you do something else',
   'Ninety-nine minutes of independent timer control on the C822G, C830G and C835G, eight-speed flame control on the AI hob, and four preset modes on the C861G for stir-fry, fry, grill and boil.',
   NULL, NULL, 'smart'),

  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 6,
   'Ignition that catches first time',
   'Zero-second ignition on the M822G and the C836G, electric or battery firing where the kitchen has no socket behind the counter, and a full touch panel on both ceramic hobs.',
   NULL, NULL, 'controls');

-- ── cooker hob: FAQ ────────────────────────────────────────────────────────
-- All ten from the live page. The live page has no FAQPage schema on it, so
-- these are not defending an existing rich result the way the hood answers
-- are; the wording is freer as a result, but the substance is unchanged.
-- Corrections against the spec data: the size answer leads with the cut-out
-- rather than the 60/70/90 cm sizes, because the cut-out is the figure the
-- product pages actually publish.
INSERT INTO category_faq (category_id, position, question, answer_md) VALUES
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 1,
   'Where should a cooker hob go?',
   'In a well-ventilated spot with clear space around it for pans and for the person cooking. Keep it out of a draught, and put a [kitchen hood](/kitchen-hood-in-malaysia/) directly above it so the smoke has somewhere to go.'),

  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 2,
   'What size cooker hob do I need?',
   'Sixty centimetres suits basic cooking, seventy balances size against counter space, and ninety fits a large kitchen. Measure the countertop cut-out before you shop: the Flexi models take an opening between 650 and 710 mm wide, which covers most of what is already cut.'),

  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 3,
   'What is the life expectancy of a cooker hob?',
   'Ten to fifteen years with proper maintenance. Burners and igniters are serviceable parts, so a hob rarely fails as a whole. Keep the burner caps clean and the ports clear and it will outlast the kitchen it went into.'),

  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 4,
   'Is a glass or a stainless steel cooker hob better?',
   'Glass looks sleeker and wipes clean faster. Stainless steel takes heat and scratches better and is the harder-wearing of the two. Our [gas hob buying guide](/buying-guide/glass-vs-stainless-gas-hob-which-gas-hob-are-best/) compares them properly.'),

  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 5,
   'What should I look for when buying a cooker hob?',
   'Burner power, the cut-out size, the number of burners, the control type and the safety features. Take them in that order: power and fit rule out most of the range before anything else matters.'),

  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 6,
   'How far does a cooker hob need to be from a window?',
   'At least 100 cm as a rule, so ventilation works properly and a draught cannot blow a flame out. Your installer will confirm it against the layout of your kitchen.'),

  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 7,
   'Which cooker hob is easier to clean?',
   'Glass, because the surface is flat and spills sit on top of it. The [C836G](/vatti-flexi-hob-c836g/) adds a nano coating that stops grease bonding, and the [C861G](/vatti-magic-series-cooker-hob-c861g/) flips its burners up so you can wipe straight across.'),

  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 8,
   'Why does food taste better cooked on a gas hob?',
   'Because the heat responds immediately. A flame goes from full to low the moment the knob turns, and searing and wok work both depend on that. Our [induction versus gas comparison](/buying-guide/induction-cooker-vs-gas-stove/) sets the two side by side.'),

  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 9,
   'How can I get more out of my cooker hob?',
   'Match the pan to the burner: a small pot on a 6 kW burner sends most of the heat up its sides. Clean the burner caps, keep the ports clear, and use the timer instead of watching the clock.'),

  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 10,
   'Can I install a cooker hob myself?',
   'Not a gas one. Gas hobs have to be fitted by a professional, and doing it yourself is unsafe and can void the warranty. The [authorised dealer](/store-locations/) you buy from will arrange it.');

-- ── cooker hob: the "Best for" row ─────────────────────────────────────────
-- One line per model for the comparison table, written against the measured
-- figures and the spec bullets. The M822G is NOT called the hottest in the
-- range: its "up to 1000°C" bullet is about the burner head, and its measured
-- facet is 3.8 kW, the lowest here. Naming it hottest beside its own figure
-- would be the page arguing with itself.
UPDATE product SET best_for = CASE slug
  WHEN 'vatti-3-burner-gas-hob-c830g'         THEN 'Three burners, family cooking'
  WHEN 'vatti-flexi-hob-c836g'                THEN 'The most efficient burners here'
  WHEN 'professional-series-c720s'            THEN 'Heavy wok work, stainless top'
  WHEN 'vatti-flexi-hob-c822g'                THEN 'Flexible cut-out, high output'
  WHEN 'vatti-flexi-hob-c823g'                THEN 'Flexible cut-out, everyday heat'
  WHEN 'professional-series-c821g'            THEN 'Everyday cooking, tempered glass'
  WHEN 'vatti-magic-series-cooker-hob-c861g'  THEN 'Four cooking modes, flip-up burners'
  WHEN 'vatti-ai-hob-c835g'                   THEN 'Timer cooking, eight-speed flame'
  WHEN 'vatti-oylimpic-hob-m822g'             THEN 'Brass burners, cast iron stand'
  WHEN 'ceramic-cooker-hob-er3601t'           THEN 'Three ceramic zones, no flame'
  WHEN 'ceramic-cooker-hob-er5902t'           THEN 'Five ceramic zones, big cook-ups'
  ELSE best_for END
 WHERE category_id = (SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia');

-- ═══════════════════════════════════════════════════════════════════════════
-- COMBI AND STEAM OVEN
-- ═══════════════════════════════════════════════════════════════════════════
-- Ten models, so this page renders every section the hood and hob pages do.
--
-- No series taxonomy, on purpose. The live page filters on three terms
-- (built-in-air-fry-oven, built-in-microwave, built-in-combi-ovens) that cover
-- five of our ten models between them, and the five left over are two plain
-- built-in ovens, a free-standing combi and a steam oven — none of which any
-- of the three terms describes. Filing them would mean inventing terms rather
-- than adopting them. buildFilters already anticipates exactly this: with no
-- taxonomy it bands the primary measurement instead, and capacity is a better
-- browse axis for an oven than a series name anyway. The thirds land on 50L
-- and 70L, which are both real capacities off real spec sheets.

-- ── combi oven: cooking functions, as a measured facet ─────────────────────
-- Same reasoning as the hob's burner count. Capacity is the only figure these
-- products publish in common, and getCompareColumns drops the whole comparison
-- section below two columns — so without a second measurement this page loses
-- the table it has been carrying "Compare VATTI Oven Models" as an H1 for.
--
-- The rule for the number, applied strictly: it is what the spec sheet prints,
-- and where a sheet prints two counts they are added. So VA03's "8 baking + 3
-- steam functions" is 11, and VA05's "9 baking + 3 steam" is 12. VA04 is 8 and
-- not 9, because "Steam function" on its sheet carries no number and we do not
-- get to invent one for it. VA01 and M626 print no count at all and are absent
-- rather than estimated; the table shows them a dash, which is the honest cell.
INSERT INTO product_facet (product_id, facet, value, unit, label, position, source_position)
SELECT p.id, 'functions', m.value, '', 'Cooking functions', 1, m.source
  FROM product p
  JOIN (SELECT 'vatti-built-in-oven-o7549' AS slug,          9 AS value, 0 AS source
  UNION ALL SELECT 'vatti-built-in-oven-o755p',             11, 1
  UNION ALL SELECT 'vatti-built-in-air-fryer-oven-07559',    9, 1
  UNION ALL SELECT 'built-in-combi-oven-va03',              11, 1
  UNION ALL SELECT 'built-in-combi-oven-va04',               8, 1
  UNION ALL SELECT 'built-in-combi-oven-va05',              12, 1
  UNION ALL SELECT 'vatti-magic-series-combi-oven-va06',    11, 1
  UNION ALL SELECT 'built-in-steam-oven-z4501',              8, 1
  ) m ON m.slug = p.slug;

-- The signature band prints the model's own intro. VA06 is the model this
-- category leads with, matching the homepage.
UPDATE product SET intro_md =
  'An oven that only bakes and a steamer that only steams are two appliances and two openings in the cabinet run. The VA06 is one 70L cavity that does both, and will run them together.'
  WHERE slug = 'vatti-magic-series-combi-oven-va06' AND intro_md IS NULL;

-- ── combi oven: how to choose ──────────────────────────────────────────────
INSERT INTO category_guide (category_id, position, heading, body_md, figure, figure_unit) VALUES
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 1,
   'Size it to the household, not to the kitchen',
   'Capacity here runs from 25L to 75L. Twenty-five litres suits a condo kitchen that mostly reheats; 70 to 75 litres is what a family baking and roasting for a full table needs. In practice the cabinet aperture decides it before the cooking does, so measure the opening first and choose inside what will fit.',
   '25-75', 'L'),

  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 2,
   'Count the functions you will actually use',
   'The published counts on this page run from 8 to 12. More is not automatically better: a second baking mode you never select is worth less than the steam stage that reheats rice without drying it out. Work out the three you would use in a week and buy for those.',
   '8-12', 'functions'),

  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 3,
   'Convection, steam, or both at once',
   'Convection circulates hot air for a crisp, evenly browned result. Steam holds moisture in, so food stays tender and keeps more of what is in it. A combi runs either, or the two together, which is what lets one cavity roast a chicken on Sunday and steam a fish on Monday.',
   NULL, NULL),

  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 4,
   'Built in, or standing free',
   'Most of this range is built in and drops into a cabinet run at eye level, which is where an oven is easiest to load and safest to unload. The VA01 stands free on a countertop instead: the answer for a kitchen with no cabinetry to give up, and for a rented one.',
   NULL, NULL),

  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 5,
   'The air fryer question',
   'The VA05 and the VA06 add an air-fry mode, using the fan and the element the oven already has to crisp food with little or no oil. If the household eats fried food and would rather it were not deep fried, it earns the step up. If not, it is a mode that will sit unused.',
   NULL, NULL),

  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 6,
   'What it will ask of you',
   'The steam side needs water in the tank to work, and it needs descaling every three to six months to keep working. Built-in units want a professional to fit them into the cabinetry. Looked after, expect eight to ten years.',
   NULL, NULL);

-- ── combi oven: why VATTI ──────────────────────────────────────────────────
-- Two of the six carry a figure and both are off the spec sheets: 68 menus on
-- the VA03, VA05 and VA06, and the A+ rating printed on all three built-in
-- ovens. figure is TEXT, which is what lets 'A+' sit in the same column as 68.
INSERT INTO category_reason (category_id, position, title, body_md, figure, figure_unit, icon) VALUES
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 1,
   'Convection and steam in one cavity',
   'Hot air for a crisp exterior, controlled steam for a moist interior, and the two together where a dish needs both. That is one appliance, one opening in the cabinet run and one thing to clean, doing the work of two.',
   NULL, NULL, 'heat'),

  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 2,
   'Steam that is measured, not guessed',
   'Humidity control sets how much moisture is in the cavity rather than injecting steam and hoping. The VA03 runs three grades of it, and dual temperature control holds the top and the bottom of the oven apart while it does.',
   NULL, NULL, 'water'),

  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 3,
   'Auto-clean, then a dry cycle',
   'Intelligent auto-clean on the combi models, followed by spraying steam and drying so the cavity is not left wet. The VA03 lines its interior in blue ceramic coating, which grease does not key into in the first place.',
   NULL, NULL, 'clean'),

  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 4,
   'Sixty-eight menus you are free to ignore',
   'The VA03, VA05 and VA06 carry 68 auto-cooking menus, plus multi-stage programmes that change temperature and steam partway through a cook. Use them, or set it yourself. Both are on the same panel.',
   '68', 'menus', 'smart'),

  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 5,
   'A door you can stand next to',
   'Three and four layer glazed doors, with low-E glass on the O755P, keep the outside cool enough to open with a child in the kitchen. Soft-close hinges on the same model, and every door on this page comes off for cleaning without tools.',
   NULL, NULL, 'safety'),

  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 6,
   'Rated A+ where it is rated at all',
   'All three built-in ovens carry an A+ energy rating. An oven that reaches temperature quickly and then holds it spends less time drawing full power than a cheaper one still struggling to get there.',
   'A+', NULL, 'power');

-- ── combi oven: FAQ ────────────────────────────────────────────────────────
-- All ten from the live page, which already emits FAQPage schema — so unlike
-- the hob these answers may be defending an existing rich result, and the
-- wording stays close. One correction: the live answer to the air fryer
-- question names the VA05 alone, and the VA06 spec sheet carries two air-fryer
-- modes of its own.
INSERT INTO category_faq (category_id, position, question, answer_md) VALUES
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 1,
   'When would you use a combi oven?',
   'Whenever you would use an oven, and in place of a steamer as well. It bakes, roasts, grills and steams, which covers most of what a kitchen asks of an oven in a week.'),

  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 2,
   'What is the life expectancy of a built-in combi oven?',
   'Eight to ten years with proper maintenance. Descaling the steam system on schedule is the part people skip, and it is the part that decides whether you get eight or ten.'),

  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 3,
   'Is a combi oven a steam oven?',
   'It contains one. A combi runs dry convection heat and steam, separately or together, so it does everything a dedicated steam oven does and bakes as well. The [Z4501](/built-in-steam-oven-z4501/) is the steam-only model here if that is all you need.'),

  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 4,
   'Is a combi oven an air fryer?',
   'Not usually, but two here are. The [VA05](/built-in-combi-oven-va05/) and the [VA06](/vatti-magic-series-combi-oven-va06/) both carry an air-fry mode alongside their baking and steam functions, and the [O7559](/vatti-built-in-air-fryer-oven-07559/) ships with its own air fry rack.'),

  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 5,
   'What is the temperature range of a built-in combi oven?',
   'Combi ovens typically run from around 85°C to 275°C, which covers gentle proving at the bottom and a hot roast at the top. Check the individual product page for the model you are looking at.'),

  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 6,
   'What maintenance does a combi oven need?',
   'Regular cleaning, descaling of the steam system, and a look at the door seals. Every three to six months is the right interval for the descale in Malaysian water.'),

  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 7,
   'Does a combi oven need water?',
   'Yes, for the steam side. These models carry their own tank rather than needing a plumbed supply, so filling it is part of using the steam function.'),

  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 8,
   'What is the difference between a convection oven and a combi oven?',
   'A convection oven circulates hot dry air and nothing else. A combi adds steam to that, which is what stops a reheated dish drying out and what makes a roast crisp outside while staying moist inside. Our [combi oven guide](/buying-guide/what-is-a-combi-oven/) goes through it in full.'),

  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 9,
   'Do combi ovens cook faster?',
   'Often, yes. Steam transfers heat more efficiently than dry air, so a combi programme can reach the same result in less time than convection alone.'),

  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 10,
   'Do you preheat a combi oven?',
   'Yes, for anything where the result depends on the temperature at the moment food goes in, which is most baking and all roasting. The auto-cooking menus handle the preheat as part of the programme.');

-- ── combi oven: the "Best for" row ─────────────────────────────────────────
UPDATE product SET best_for = CASE slug
  WHEN 'vatti-magic-series-combi-oven-va06'    THEN 'Everything in one 70L cavity'
  WHEN 'built-in-combi-oven-va05'              THEN 'Baking, steam and air fry'
  WHEN 'built-in-combi-oven-va03'              THEN 'Combi cooking, mid-size kitchens'
  WHEN 'built-in-combi-oven-va04'              THEN 'Straightforward combi, large cavity'
  WHEN 'vatti-built-in-oven-o755p'             THEN 'Serious baking, most functions'
  WHEN 'vatti-built-in-oven-o7549'             THEN 'Everyday baking and roasting'
  WHEN 'vatti-built-in-air-fryer-oven-07559'   THEN 'Air frying at full oven size'
  WHEN 'built-in-steam-oven-z4501'             THEN 'Steam only, nothing else'
  WHEN 'free-standing-combi-oven-va01'         THEN 'Rented and cabinet-free kitchens'
  WHEN 'built-in-microwave-m626'               THEN 'Reheating, with a grill'
  ELSE best_for END
 WHERE category_id = (SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia');


-- ═══════════════════════════════════════════════════════════════════════════
-- DISHWASHER
-- ═══════════════════════════════════════════════════════════════════════════
-- One published model, and that is the whole shape of this page.
--
-- Four sections of the template do not render here and none of it is a styling
-- decision: the model grid needs a second model before it is a grid rather
-- than a card, the questionnaire and the comparison table both need more than
-- two to have anything to narrow or to compare, and the range summary needs
-- two products carrying the same measurement before "best in range" means
-- anything. All four gates are counts, so all four open by themselves the day
-- a second dishwasher is published — the copy below needs no revisiting for
-- that, only the "Best for" row needs a second line.
--
-- What does render: the full-screen hero, the signature band carrying the
-- DWBB7 on its own, how to choose, six reasons, the reviews, the buying guide
-- and the FAQ. The band is the product section on this page, which is why it
-- is the one gate that is not a floor — it is suppressed at exactly two
-- models, where the grid underneath would say the same thing twice.

-- ── dishwasher: the measured figures ───────────────────────────────────────
-- So the one card in the grid carries numbers rather than a blank where the
-- figures go. Both come straight off the spec sheet.
INSERT INTO product_facet (product_id, facet, value, unit, label, position, source_position)
SELECT p.id, m.facet, m.value, m.unit, m.label, m.position, m.source
  FROM product p
  JOIN (SELECT 'capacity' AS facet, 17 AS value, '' AS unit, 'Place settings' AS label, 0 AS position, 0 AS source
  UNION ALL SELECT 'functions', 8, '', 'Wash programs', 1, 1
  ) m
 WHERE p.slug = 'vatti-dishwasher-dwbb7';

-- ── dishwasher: how to choose ──────────────────────────────────────────────
INSERT INTO category_guide (category_id, position, heading, body_md, figure, figure_unit) VALUES
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 1,
   'One machine, seventeen settings',
   'A place setting is roughly the dishes one person uses in a meal, so seventeen covers a large family and a table of guests without running it twice. Half load washes the top basket or the bottom one alone, which is what you want on the days it is not worth filling both.',
   '17', 'place settings'),

  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 2,
   'Heat is what cuts through wok grease',
   'The wash runs at 75°C and the drying air at 110°C. That is the part hand washing cannot match, and it is not about effort: water hot enough to lift cooking oil off a plate is water too hot to put your hands into.',
   '75-110', '°C'),

  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 3,
   'Built in, freestanding or countertop',
   'A built-in machine goes into the cabinet run and gives the best capacity and the tidiest finish, which is what to plan for in a kitchen being built or renovated. Freestanding goes anywhere with a water point and a socket. Countertop suits a condo with neither.',
   NULL, NULL),

  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 4,
   'What triple disinfection actually is',
   'Three stages, not a brand name: the 75°C wash, the 110°C hot-air dry, and a UVC lamp whose light breaks down what survives the first two. The machine then ventilates itself for up to 168 hours after the cycle, so it sits dry between washes rather than shut and damp.',
   NULL, NULL),

  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 5,
   'It costs less to run than it looks',
   'A full cycle uses less water than washing the same load under a running tap. Run it full rather than half empty, use the lighter programme for everyday plates, and scrape instead of pre-rinsing. Pre-rinsing is where most of the water people think they are saving actually goes.',
   NULL, NULL),

  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 6,
   'Where it goes, and who fits it',
   'It needs a water point, a drain and a socket, and it needs the cabinet aperture measured before you buy rather than after. Have the dealer who supplies it install it: a dishwasher plumbed badly is a leak under a cabinet that nobody finds for a week.',
   NULL, NULL);

-- ── dishwasher: why VATTI ──────────────────────────────────────────────────
-- The live page makes four claims; this makes six, because the grid runs three
-- across and four leaves a hole in it. The two added are the motor and the
-- display, both off the spec sheet rather than invented to fill the row.
INSERT INTO category_reason (category_id, position, title, body_md, figure, figure_unit, icon) VALUES
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 1,
   'Washes at 75°C, dries at 110°C',
   'Hot enough to lift cooking oil off a plate, and then hot enough to dry it without a towel mark. The hot-air dry runs independently too, so you can dry a load without washing it again.',
   '110', '°C', 'heat'),

  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 2,
   'Disinfection in three stages',
   'The high-temperature wash, the hot-air dry, and a UVC lamp behind them both. Three stages rather than one, because the first two do not reach everything on their own.',
   NULL, NULL, 'safety'),

  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 3,
   'Eight programmes and a half load',
   'Eight wash cycles, from a heavy programme for cookware down to a quick rinse, each setting its own water temperature, spray pressure and duration. Half load runs the top or the bottom basket alone.',
   '8', 'programmes', 'clean'),

  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 4,
   'A week of ventilation after the cycle',
   'The machine keeps circulating air through itself for up to 168 hours once the wash has finished. A dishwasher left shut and damp is where the smell comes from, and this is the answer to it.',
   '168', 'hours', 'water'),

  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 5,
   'A brushless motor',
   'A BLDC motor holds spray pressure at lower speed, draws less power for the same wash, and stays quiet as it ages. It is the part of a dishwasher that runs for every minute of every cycle.',
   NULL, NULL, 'motor'),

  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 6,
   'A panel that tells you where it is',
   'A digital display for the programme, the time left and the state of the machine, rather than a row of indicator lights you have to learn to read.',
   NULL, NULL, 'smart');

-- ── dishwasher: FAQ ────────────────────────────────────────────────────────
-- Ten, drawn from both accordions on the live page. That page emits no FAQPage
-- schema today, so this is new structured data rather than a defence of an
-- existing rich result.
INSERT INTO category_faq (category_id, position, question, answer_md) VALUES
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 1,
   'Do dishwashers clean oily wok dishes?',
   'Yes, and better than hand washing does. High-temperature water, dishwasher detergent and an intensive programme break down cooking oil far more effectively than warm tap water and a sponge. The 75°C rinse sanitises while it does it.'),

  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 2,
   'Built-in or freestanding for a Malaysian kitchen?',
   'Built-in if the kitchen is being built or renovated: it integrates into the cabinetry and gives the best capacity for the space. Freestanding if the kitchen already exists and has nowhere to lose a cabinet, since it only needs a water point and a socket.'),

  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 3,
   'How much does a dishwasher cost to run?',
   'Less than most people expect. A modern machine uses less water per cycle than the same load washed under a running tap. Run full loads, use the lighter programme for everyday plates, and scrape rather than pre-rinse.'),

  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 4,
   'Is it fine to use a dishwasher every day?',
   'Yes. Daily use is what these are built for. Keep the filter clean and run a maintenance cycle occasionally and daily use shortens nothing.'),

  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 5,
   'Is a dishwasher better than hand washing?',
   'For hygiene, clearly: it washes hotter than hands can stand and sanitises as it goes. For water, usually, provided you run it full. For time, always.'),

  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 6,
   'What is a good lifespan for a dishwasher?',
   'Ten to fifteen years, depending on how hard it is used and how well the filter is kept. Our [dishwasher buying guide](/buying-guide/is-a-dishwasher-necessary/) covers what to look at before buying one.'),

  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 7,
   'What is UVC ultraviolet disinfection?',
   'A lamp emitting ultraviolet light in the UVC band, which disrupts the DNA of bacteria and viruses so they cannot reproduce. It is the third stage behind the hot wash and the hot dry, and it works on what heat alone leaves behind.'),

  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 8,
   'Do dishwashers use a lot of electricity?',
   'Less than heating the same volume of water at the tap for hand washing. The bulk of a cycle''s energy goes into heating water, which is exactly what you would be doing by hand anyway.'),

  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 9,
   'Do dishwashers actually save water?',
   'Yes, when run full. A cycle uses a fixed and fairly small volume; a tap left running does not. A half-empty machine is where the saving disappears.'),

  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 10,
   'Do dishwashers clean, or only sanitise?',
   'Both, and in that order. Detergent and the spray arms remove the food, then the high temperature and the UVC stage sanitise what is left.');

-- ── dishwasher: the "Best for" row ─────────────────────────────────────────
-- One line, because there is one model. It reads in the comparison table,
-- which does not render at a single product — it is here so that the row is
-- already written the day a second dishwasher lands.
UPDATE product SET best_for = 'Large families, oily cookware'
  WHERE slug = 'vatti-dishwasher-dwbb7';


-- ═══════════════════════════════════════════════════════════════════════════
-- ONE TAP WATER PURIFIER
-- ═══════════════════════════════════════════════════════════════════════════
-- One published model, so the same four sections are absent for the same
-- reason as on the dishwasher page. See that block above.

-- ── purifier: the measured figures ─────────────────────────────────────────
-- The readout under the signature copy carries one figure otherwise — the flow
-- rate products.sql already reads off the spec sheet. These two come off the
-- same sheet: bullet 5, 'Hot Water Temperature range 45°C to 100°C', and
-- bullet 1, '4 Temperature mode'. source_position records which.
--
-- Positions 1 and 2, not 0 and 1: flow is already at 0 in products.sql, and
-- that file is generated.
INSERT INTO product_facet (product_id, facet, value, unit, label, position, source_position)
SELECT p.id, m.facet, m.value, m.unit, m.label, m.position, m.source
  FROM product p
  JOIN (SELECT 'temperature' AS facet, 100 AS value, '°C' AS unit, 'Hot water' AS label, 1 AS position, 5 AS source
  UNION ALL SELECT 'modes', 4, '', 'Temperatures', 2, 1
  ) m
 WHERE p.slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';

-- ── purifier: how to choose ────────────────────────────────────────────────
INSERT INTO category_guide (category_id, position, heading, body_md, figure, figure_unit) VALUES
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 1,
   'Four temperatures out of one tap',
   'Cold for drinking, ambient, 45°C, and 100°C for tea, coffee and instant noodles. The 45°C setting is not a rounding of "warm": it is the temperature baby formula is made at, which is the reason a household with an infant buys one of these.',
   '45-100', '°C'),

  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 2,
   'Enough flow to fill a pot',
   'Output at the tap is 1.5 litres a minute, so a litre jug takes about forty seconds. That is the difference between a purifier the kitchen uses for cooking and one that only ever fills a glass.',
   '1.5', 'L/min'),

  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 3,
   'What reverse osmosis removes',
   'RO pushes water through a membrane fine enough to stop heavy metals, chlorine and dissolved solids. It takes some naturally occurring minerals out with them, which is normal for the method and does not make the water less safe to drink.',
   NULL, NULL),

  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 4,
   'The stages in front of the membrane',
   'The VPC system runs sediment and activated carbon stages ahead of the RO membrane. They take out the particles and the chlorine taste first, and in doing so they are also what stops the expensive membrane behind them clogging early.',
   NULL, NULL),

  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 5,
   'It lives under the sink',
   'The filtration unit and the tank go into the cabinet below. All that shows on the counter is the slim SUS 304 stainless tap, which is why this suits a condo kitchen where a floor-standing dispenser and its bottles would not fit.',
   NULL, NULL),

  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 6,
   'Filters are the running cost',
   'The unit tracks filter life and tells you when one is due rather than leaving it to memory, which matters because a filter past its life is a purifier that has quietly stopped purifying. Budget for replacements, and have the dealer do the first change while you watch.',
   NULL, NULL);

-- ── purifier: why VATTI ────────────────────────────────────────────────────
INSERT INTO category_reason (category_id, position, title, body_md, figure, figure_unit, icon) VALUES
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 1,
   'Multi-stage first, then RO',
   'Sediment and activated carbon take out the particles and the chlorine. The reverse osmosis membrane behind them takes what is left: heavy metals, bacteria and dissolved solids.',
   NULL, NULL, 'filtration'),

  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 2,
   'Boiling water on demand',
   'Straight to 100°C at the tap, with no kettle to fill and nothing to wait for. It is the setting that quietly removes an appliance from the counter.',
   '100', '°C', 'heat'),

  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 3,
   'Four temperatures, one fixture',
   'Cold, ambient, 45°C and 100°C, selected at the tap. One fitting replaces the dispenser, the kettle and the jug in the fridge door.',
   '4', 'modes', 'water'),

  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 4,
   'Stainless steel where the water is',
   'The tap and the tank are both SUS 304 stainless rather than plastic. In a system that holds water at 100°C, that is what keeps the water tasting of nothing at all.',
   NULL, NULL, 'safety'),

  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 5,
   'It tells you when the filter is spent',
   'A filter change reminder on the display. The thing that decides whether the water is actually being purified is then not left to somebody remembering when it was last done.',
   NULL, NULL, 'smart'),

  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 6,
   'Nothing on the counter',
   'The whole system is undersink. In a condo kitchen the worktop is the scarcest thing in the room, and this gives back the corner a dispenser would have taken.',
   NULL, NULL, 'clean');

-- ── purifier: FAQ ──────────────────────────────────────────────────────────
INSERT INTO category_faq (category_id, position, question, answer_md) VALUES
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 1,
   'Is a single-tap purifier better than a water dispenser?',
   'For most homes, yes. It filters and delivers at four temperatures from one fixture at the sink, with no bottles to refill, no floor space given up, and no waiting for water to heat or chill.'),

  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 2,
   'Does reverse osmosis remove minerals?',
   'Some, yes. RO is thorough enough that it takes naturally occurring minerals out along with the heavy metals, chlorine and dissolved solids. That is normal for the method, and the water stays perfectly safe to drink.'),

  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 3,
   'Can it be installed under the sink?',
   'That is where it is designed to go. The filtration unit and the tank fit in the cabinet below and only the tap shows above. Use a professional installer so the connection to the supply is made properly.'),

  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 4,
   'Can I purify tap water by boiling it?',
   'Only partly. Boiling kills most bacteria, but it does nothing about chemicals, heavy metals or sediment, and it concentrates rather than removes them. Our [guide to how water filters work](/buying-guide/how-water-filters-work/) covers the difference.'),

  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 5,
   'Is tap water safe to drink in Malaysia?',
   'It is treated to a safe standard when it leaves the plant. What happens between there and your tap varies: old plumbing, local contamination and seasonal changes all affect what arrives.'),

  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 6,
   'Do I really need to filter my tap water?',
   'If the water tastes or smells of anything, if the building is old, or if there is an infant in the house, then yes. Otherwise it is a question of how much you want to think about it.'),

  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 7,
   'What are the signs of unsafe tap water?',
   'A bad taste or smell, cloudiness or discolouration, visible sediment, and stomach upsets that follow drinking it. Any of those is a reason to stop drinking it unfiltered and find out why.'),

  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 8,
   'What is the downside of a water purifier?',
   'The filters are a running cost and they have to be changed on time. RO systems also send some water to drain as part of how the membrane works. Both are the price of the purity, and worth knowing before you buy rather than after.'),

  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 9,
   'What should I consider when buying a water purifier?',
   'The quality of the water going in, the filtration type, how much the household actually drinks and cooks with, and what the replacement filters cost over a few years.'),

  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 10,
   'Why does reverse osmosis water taste flat?',
   'Because it is very pure and low in minerals, and minerals are most of what water tastes of. It is a matter of what you are used to rather than a fault.');

-- ── purifier: the "Best for" row ───────────────────────────────────────────
UPDATE product SET best_for = 'Condos, and homes with an infant'
  WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';


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
