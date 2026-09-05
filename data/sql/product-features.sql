-- Feature blocks: the product story as real text beside a picture of the
-- product, replacing the stack of JPEGs that carried both in the same pixels.
-- Source of truth, hand-authored and hand-editable — NOT generated from a
-- scrape. Runs after products.sql (db-build.mjs orders the rest alphabetically,
-- and 'product-features.sql' sorts after 'products.sql' either way).
--
-- A product with rows here renders these blocks INSTEAD of the legacy image
-- stack — see ProductView in src/app/[slug]/page.tsx. product_image keeps every
-- original row, so nothing is deleted and a product with no rows here is
-- unchanged.
--
-- Copy is faithful to the words in the source pixels, with the source site's
-- own English errors corrected: "Speading" -> "spreading", "Hitting-proof" ->
-- "knock-resistant", "More Durable Life Service" -> "longer service life". The
-- verbatim wording is still on file in product-captions.sql, which is the
-- transcription record and stays uncorrected on purpose. A typo rendered as
-- 18px type on a page a buyer is judging the brand by is not the same thing as
-- a typo inside a photograph.
--
-- Every image_url is a crop of the original composite, uploaded to R2 under a
-- NEW key. The crop boxes are recorded per row as fractions of the source so
-- the same picture can be cut again from the same original.

-- athena-series-lifting-type-range-hood-v993 --------------------------------
-- Nine blocks became one banner, four highlight cards and four detail splits.
-- Source composites: V993-Kitchen-Hood-1 (no text, used whole), -7 (the four
-- cards), -2, -3, -4, -6 (the four splits).

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2023/11/V993-Kitchen-Hood-1.webp',
  'The V993 running over a gas hob, clearing smoke from a wok and a stockpot',
  1920, 900
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';

-- The four panels of V993-Kitchen-Hood-7. Its heading named the China-market
-- model (J663BH), which is not what this page sells, so it is dropped rather
-- than transcribed. The turbo figures were burnt into the fourth panel and are
-- now the sentence under it.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'card', 'Lifting type air inlet',
  'The inlet drops toward the hob, so smoke is pulled in before it spreads into the room.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v993-highlight-lifting-inlet.webp',
  'The V993 lowered over a wok, drawing smoke straight off the pan',
  338, 355
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'card', 'Closer to the smoke source',
  'The inlet sits about 350mm above the pot where a T-type hood sits about 580mm away. Large suction, applied at the pan rather than at the ceiling.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v993-highlight-inlet-height.webp',
  'A T-type hood at 580mm beside the V993 at 350mm above the same pot',
  344, 355
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'card', 'Flow deflecting oil filter',
  'A fluid-type filter net separates oil from smoke on the way through, so less of it reaches the motor.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v993-highlight-oil-filter.webp',
  'Cutaway of the V993 filter panel with the air path drawn through it',
  344, 355
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'card', 'Turbo suction',
  'Turbo is there for wok flare and deep frying: 22 m³/min against 20 m³/min in normal running.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v993-highlight-turbo-suction.webp',
  'The V993 on turbo over a wok and a stockpot on a gas hob',
  344, 276
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';

-- V993-Kitchen-Hood-2, product on the left, text on the right. Crop x 0 - 0.47.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', 'Aesthetic and industrial design',
  'Integrated finishing in brushed stainless steel, laser seamless welding.

Elegant to look at, and one continuous surface to wipe down.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v993-finish-detail.webp',
  'The brushed stainless canopy of the V993, lit from below',
  809, 571
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';

-- V993-Kitchen-Hood-3, text on the left, product on the right. Crop x 0.555 - 1.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'split', 'Laser seamless welding',
  'The body is welded by robotic arm along its whole length. Precise laser pulses join each board so the panels read as one piece rather than as a seam that traps grease.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v993-laser-welding.webp',
  'The welded joint along the front of the V993 body',
  766, 543
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';

-- V993-Kitchen-Hood-4, product on the left. Crop x 0 - 0.45.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 8, 'split', 'Curved body finishing',
  'Filament-finished curved corners: no hard edge at the height a cook walks past, and a knock-resistant shape where a square corner would dent.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v993-curved-body.webp',
  'The curved corner of the V993 where the glass panel meets the steel',
  775, 587
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';

-- V993-Kitchen-Hood-6. The motor sat in the left half under four callout labels
-- and their leader lines; the crop keeps the part and the labels become the
-- bullets below. Crop x 0.130 - 0.435, y 0.325 - 1.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 9, 'split', 'Water-proof motor',
  'Sealed against the water the auto-clean cycle puts through the canopy, which is what makes that cycle safe to run.

- Segregates water from oil
- Lower working temperature, longer service life
- Less noise while it is running',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v993-waterproof-motor.webp',
  'The sealed motor unit of the V993, out of the housing',
  525, 482
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993';

-- vatti-aetheris-series-cooker-hood-v929 ------------------------------------
-- A different source template from the V993's: fourteen SQUARE panels with the
-- copy set OVER the photograph rather than beside it. Three treatments, chosen
-- per panel and recorded in data/crops/v929.json:
--   cropped   text sits in a band at the top or the foot, so cut the band off
--   as-is     the labels ARE the diagram (the hand-sensor panel), so keep them
--   dropped   the panel is a spec sheet in pixels (PG-15). Its figures went
--             into product_dimension and the FAQ instead
-- PG-9 and PG-10 were filed as gallery images. They carry text, so they are
-- re-roled to 'feature' at the foot of this block and superseded by their
-- crops: the gallery is for pictures of the appliance, not for slides.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v929-clean-air-kitchen.webp',
  'The V929 running over a gas hob, clearing steam from a wok', 1080, 848
  FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', 'Glass, not a filter mesh',
  'Oil runs down the panel into a cup instead of setting in a metal mesh you have to lift out and soak.

- AG tempered glass
- No filter mesh
- Built-in oil cup
- Nano coating',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v929-glass-panel.webp',
  'The V929 glass panel opened, with its four numbered features marked', 1080, 880
  FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'BLDC motor, 3,125 m³/h at 1,300 Pa',
  'The highest static pressure in the VATTI range. Airflow is the figure a showroom quotes; pressure is the one that decides whether a long shared duct on a high floor actually clears.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v929-bldc-motor.webp',
  'Cutaway of the V929 BLDC motor and its impeller', 1080, 751
  FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', '46.5 dB at full tilt',
  'Quiet enough to leave running through a whole dinner, and quiet enough that the kitchen stays part of the room rather than somewhere you shout across.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v929-quiet-kitchen.webp',
  'The V929 installed in an open kitchen looking out over water', 1080, 875
  FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', 'It reads the air, not the clock',
  'A PM2.5 sensor measures what is actually in the kitchen and holds the fan on until the number comes down, rather than running for a fixed few minutes after you switch off.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v929-pm25-kitchen.webp',
  'A kitchen with the V929 and a PM2.5 reading of 068 shown beside it', 1080, 821
  FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', 'Booster clean',
  'The fifth generation of the VATTI auto-clean cycle, patented, and over a wider area than the generation before it. Hot water is thrown across the impeller rather than dribbled onto it.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v929-booster-clean.webp',
  'Water spinning through the V929 impeller during an auto-clean cycle', 1080, 621
  FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';

-- Kept whole on purpose: the three gesture labels are annotations ON the
-- diagram, each in the place its gesture is made. Cropping them off would leave
-- a photograph of a blank panel with nothing to say.
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'split', 'Wave at it with oily hands',
  'A hand sensor under the panel, so nothing has to be touched mid-cook.

- Wave right to start intelligent suction
- Wave right twice for stir-fry suction
- Wave left to delay the shutdown

An ambient light sits under the same panel.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2025/07/V929-PG-13.webp',
  'The V929 hand sensor, with its three gestures marked under the panel', 1080, 1080
  FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 8, 'split', 'It starts when the hob does',
  'Light the hob and the hood turns itself on, catching the smoke before it leaves the pan. Available with the [C836G hob](/vatti-flexi-hob-c836g/) only.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v929-ai-auto-link.webp',
  'The V929 turning itself on above a lit gas burner', 1080, 837
  FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 9, 'split', '79% more smoke collection area',
  'The panel is wider than the one it replaces, so the catch area sits over the whole hob rather than over the back burners.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v929-smoke-capture.webp',
  'Airflow drawn into the underside of the V929 above a pan', 1080, 594
  FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 10, 'split', '1.2 cm of panel',
  'The visible edge is 12mm, divided on the golden ratio. Over an island, where the hood hangs at eye level, that edge is most of what anyone actually sees.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v929-slim-panel.webp',
  'The slim front edge of the V929 panel', 1080, 594
  FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 11, 'card', 'Built into the cabinet',
  'Set into the run with a removable shelf above it, so only the panel shows.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v929-cabinet-integrated.webp',
  'The V929 built into an overhead cabinet run', 529, 475
  FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 12, 'card', 'Standing on its own',
  'Hung on the wall with the chimney exposed, against a splashback.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v929-independent.webp',
  'The V929 wall-mounted with its chimney showing', 691, 594
  FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 13, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v929-art-design.webp',
  'The V929 above a marble splashback in a pale kitchen', 1080, 610
  FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';

-- The two panels that were filed as gallery images. They are slides, not
-- pictures of the appliance, and their crops are blocks 4 and 8 above.
UPDATE product_image SET role = 'feature'
  WHERE product_id = (SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929')
    AND position IN (2, 3);

-- athena-series-lifting-type-range-hood-v999 --------------------------------
-- The third source template: tall dark posters, each holding two or three
-- panels with the copy between them, and six of the seven shipped as 100-frame
-- GIFs weighing 53MB between them. On a page where two thirds of the traffic is
-- on a phone that is a defect, not a feature, so each crop takes the LAST frame
-- and the animation is dropped. Chinese overlay labels are left where they sit
-- on the photograph: they are set into the picture itself, not beside it, and
-- cropping them out would take the product with them.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v999-side-hood.webp',
  'The V999 drawing steam off a pan from the side', 720, 624
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', 'The dome holds the smoke',
  'A side hood, not a T-shape. The canopy is a dome that gathers smoke into a chamber rather than a flat plate that lets it roll off the edges, and VATTI puts the difference at 50% better smoke capture.

It also solves the T-shape''s other problem: there is nothing at head height to walk into.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v999-smoke-chamber.webp',
  'A T-shape hood beside a side hood, with the smoke path drawn under each', 498, 180
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'A wide angle over the whole hob',
  'The intake spans the width of the canopy, so fumes are pulled in from every direction across the hob rather than only from under the middle of it.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v999-wide-angle.webp',
  'The V999 seen from below, drawing smoke across its whole width', 498, 241
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'Inverter DC motor',
  'An inverter motor rather than a fixed-speed one: 2,500 m³/h of airflow against up to 1,000 Pa of static pressure, and 50 dB while it does it.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v999-dc-motor.webp',
  'The V999 inverter DC motor turning', 349, 202
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', 'Boaster suction, for the wok minute',
  'The one minute in a stir-fry where everything goes up at once. Air volume decides how fast the smoke is taken; static pressure decides how fast it leaves the building.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v999-suction.webp',
  'The V999 pulling a column of steam straight off a pan', 498, 171
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', 'R80 curved body',
  'The curve is a smoke deflector, not styling. Air follows a curved surface rather than separating from a corner, which is the Coanda effect, and it is what turns the underside of the canopy into part of the intake.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v999-r80-curve.webp',
  'The R80 curve where the V999 glass meets the body', 247, 173
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'split', 'Laser seamless welding',
  'The body is welded along its whole length rather than folded and screwed, so there is no joint across the front for grease to sit in.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v999-laser-weld.webp',
  'A laser welding the seam of the V999 body', 247, 209
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 8, 'split', 'Wave to control the smoke',
  'A hand sensor under the panel, so the hood is started and stopped without putting oily fingers on glass.

- No fingerprints and no oil marks on the controls
- One less surface to wipe down',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v999-hand-sensor.webp',
  'A hand waving under the V999 control panel', 498, 184
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 9, 'split', 'Steam, then hot water, then dry',
  'The auto-clean cycle runs in three stages, and the labels on the diagram are the stages:

- 110°C steam to melt the grease off
- 80°C high-pressure water to scour what is left
- 30 seconds of high-speed spinning to dry the motor',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v999-steam-clean.webp',
  'The three stages of the V999 auto-clean cycle, each labelled', 498, 673
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 10, 'split', 'Water-proof motor',
  'Sealed against the water the clean cycle puts through the canopy, which is what makes running that cycle safe.

- Segregates water from oil
- Lower working temperature, longer service life
- Less noise while it is running',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v999-waterproof-motor.webp',
  'The sealed motor unit of the V999', 309, 173
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 11, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v999-impeller.webp',
  'The V999 impeller under airflow', 498, 281
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999';
-- vatti-smart-oxygen-range-hood-v998 ----------------------------------------
-- Twelve tall posters, each a heading, a paragraph and one or more photographs
-- stacked under it. The words become the block text; the photographs are cut
-- out per data/crops/v998.json. V998-PG15 is a specification sheet set in
-- pixels and is dropped: every figure on it is in product_dimension and the
-- readout strip instead.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v998-hero.webp',
  'The V998 taking steam off a pan against a bright window', 1024, 1068
  FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', '12.6 cm of panel',
  'The body is 136mm deep at the front, so it sits flush into a wall cabinet instead of hanging out of it. No exposed pipe, nothing to duck under, and the cabinet above it keeps its shelf.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v998-ultraslim.webp',
  'The V998 fitted flush under a wall cabinet above a hob', 1024, 637
  FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'Flat into any cabinet run',
  'Because nothing protrudes, the hood follows the line of the cabinets rather than interrupting it. That is the whole argument for a hidden hood: the kitchen reads as joinery, not as appliances.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v998-flat-install.webp',
  'The V998 installed flat in a run of pale kitchen cabinets', 1024, 609
  FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', '2,850 m³/h at 1,250 Pa',
  'Top-side dual suction with a 2+2 four-way exhaust: the intake is taken from above and from the side at once, and the smoke is caught at the pan rather than after it has risen.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v998-dual-suction.webp',
  'Smoke drawn into the underside of the V998 from two directions', 1024, 852
  FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', 'A wide screen over the smoke',
  'The smoke control screen runs the width of the hob and opens at 31°, which holds a pocket of low pressure over the pan. Smoke is locked in rather than pushed out at the sides.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v998-wide-screen.webp',
  'The V998 smoke control screen open over a pan', 1024, 522
  FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', 'Why the screen is wide, not narrow',
  'A wide screen sits lower and holds a larger area of negative pressure, so nothing escapes at the edges. A narrow screen has to sit higher and pulls harder through a smaller mouth, which is what lets smoke slip out at the sides.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v998-screen-compared.webp',
  'A wide screen and a narrow screen compared over the same pan', 1024, 384
  FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'split', 'It starts when the hob does',
  'Light the hob and the hood starts extracting by itself, so the first minute of smoke is caught rather than missed. Available with selected VATTI hobs.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v998-auto-link.webp',
  'The V998 starting itself as a gas burner is lit below it', 1024, 1098
  FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 8, 'split', 'It measures what it has missed',
  'A PM2.5 sensor watches the room, not the clock: the fan keeps running while there are still particles to catch, and stops when the reading comes down. VATTI calls the logic VNIA.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v998-particle-capture.webp',
  'Air being drawn from across the kitchen into the V998', 1024, 1097
  FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 9, 'split', 'Baby skin touch glass',
  'AG matte glass across the front: fingerprint and smudge resistant, and smooth enough that a wipe takes the oil off rather than moving it around.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v998-ag-glass.webp',
  'The matte glass front of the V998 with its readout lit', 963, 410
  FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 10, 'split', 'Five layers, not one sheet',
  'The panel is built up rather than cut from plate glass.

- Explosion-proof protection layer
- High-temperature oil layer, which loosens stubborn oil
- Acid-resistant layer against corrosion from cooking fumes
- Enhanced AG matte glass, resistant to cuts and scratches
- Nanometre oil-repellent surface',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v998-glass-layers.webp',
  'The layers of the V998 glass panel peeled apart', 389, 415
  FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 11, 'split', 'Steam and hot water together',
  'The fifth-generation wash runs a heating pump: high-temperature steam dissolves the grease while a paddle brush scrubs the blades and the cavity. VATTI measures the cleaned area at up to 99.1%, against under 50% for a plain water wash.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v998-steam-wash.webp',
  'The V998 impeller being washed by steam and water', 891, 442
  FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 12, 'card', 'Oil-repellent guide plate',
  'Enamelled, so one wipe takes the residue off rather than smearing it.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v998-guide-plate.webp',
  'The enamelled guide plate inside the V998', 389, 284
  FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 13, 'card', 'Nothing to remove',
  'No mesh filter to lift out, soak and refit. There is nothing to take down at all.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v998-meshless.webp',
  'The meshless underside of the V998', 451, 269
  FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 14, 'card', 'An oil cup you empty less',
  'Larger than the one it replaces, so it is emptied less often.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v998-oil-cup.webp',
  'The oil cup under the V998 body', 451, 269
  FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 15, 'split', 'The panel tells you where you are',
  'PM2.5 reading, extraction state and fan step, all on one readout, with soft LED light thrown down onto the hob.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v998-ui-panel.webp',
  'The V998 readout showing a PM2.5 figure and the fan step', 922, 237
  FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998';

-- triple-intake-series-t-type-cooker-hood-v937 ------------------------------
-- Nine tall posters. Two of them (V937-8 and V937-9) are measured drawings and
-- are dropped from the page entirely: every figure on them is in
-- product_dimension, where it can be read.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v937-hero.webp',
  'The V937 lit from below, its three intakes showing', 790, 739
  FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', 'Three cavities, in a 1:5:1',
  'Most hoods pull through one cavity. This one is divided into three, a wide one between two narrow ones, which spreads the negative pressure zone across the whole hob instead of concentrating it under the middle of the canopy.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v937-three-cavity.webp',
  'The three intake cavities of the V937 seen from below', 790, 495
  FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'It matches the duct it is fitted to',
  'The hood measures the resistance of the run it is pushing into and sets its pressure against it: low pressure where the duct is short, which is quieter and cheaper to run, and full pressure where the duct fights back.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v937-smart-suction.webp',
  'The V937 control chip and panel', 790, 764
  FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'Steamed auto-clean, in four steps',
  'Frequency-conversion auto-clean with steam rather than a cold rinse:

- Take the oil cup out from under the hood
- Fill the cleaning water cup and put it in the cup''s place
- Hold the auto-clean key for one second to start
- Pour the dirty water out and put the oil cup back',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v937-auto-clean.webp',
  'The V937 impeller being steam cleaned', 790, 634
  FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', 'The whole filter comes out',
  'The main oil filter disassembles completely, so it is cleaned in the sink rather than wiped at arm''s length above a hob. The labels on the diagram are the parts: an airfoil suspended siphon cavity above an oval oil filter.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v937-oil-filter.webp',
  'The V937 oil filter separated from the siphon cavity, each part labelled', 783, 431
  FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', 'Quiet in three places at once',
  '50 dB, which VATTI reaches by treating noise where it is made rather than muffling it afterwards.

- A frequency-conversion chip and ball bearings, for mechanical noise
- A patented V-shaped housing, for aerodynamic noise
- Porous sound-absorbing material, for what is left',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v937-noise.webp',
  'The V937 motor housing on a plinth', 790, 388
  FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'card', 'LED soft light',
  'Thrown down onto the hob rather than into your eyes.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v937-led-light.webp',
  'The V937 light over a hob', 363, 166
  FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 8, 'card', 'Detachable oil filter',
  'Out in one piece, into the sink, back in.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v937-filter-out.webp',
  'The V937 filter being washed under a tap', 363, 183
  FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 9, 'card', 'Hand gesture control',
  'Started and stopped without touching the glass.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v937-gesture.webp',
  'A hand held under the V937 panel', 363, 192
  FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 10, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2023/11/VATTI_V937_side-NEW.webp',
  'The V937 from the side, chimney and canopy', 386, 277
  FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937';

-- vatti-hidden-series-range-hood-v938 ---------------------------------------
-- Seventeen posters, each a heading set over a photograph. The headings become
-- the block text and the photographs are cut out per data/crops/v938.json.
-- V938-PG17 is a specification sheet in pixels and is dropped: its figures are
-- in product_dimension and in the readout strip.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v938-hero.webp',
  'The V938 with its front panel open over mist', 1152, 1167
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', 'Half hidden, and that is the point',
  'The body sits inside the cabinet run and only the front shows, so the wall above the hob reads as joinery rather than as an appliance. 325mm of slim depth, with 105mm of opening clearance when it runs.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v938-half-hidden.webp',
  'The V938 concealed in a cabinet run above a hob, its depth marked', 1152, 887
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', '3,650 m³/h against 1,600 Pa',
  'The most of both in the range. High airflow moves the air in an open kitchen; 1,600 Pa of static pressure is what gets it down a long shared duct on a high floor, and this is the model to reach for when that duct is the problem.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v938-clean-cooking.webp',
  'The V938 clearing smoke from a wok in an open kitchen', 1152, 604
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'BLDC inverter motor',
  'A 490 W motor with a 3.2 kg solid core, turning at 2,000 rpm and rated past 30,000 hours. The weight is the point: mass is what keeps a fast motor from vibrating itself loud.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v938-bldc-motor.webp',
  'Cutaway of the V938 BLDC inverter motor', 576, 543
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', 'Vertical capture, at the pan',
  'The intake pulls straight down over the hob rather than across it, so fumes are taken at the source: from a high-heat stir-fry to a slow simmer, nothing is left to drift into the room.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v938-vertical-capture.webp',
  'Smoke pulled vertically off a wok into the V938', 1152, 987
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', 'Capture ratio 1:5:1',
  'Three intake zones, a wide one between two narrow ones. The wide zone holds the pressure over the pan and the narrow ones close the sides, which is where smoke escapes on a single-cavity hood.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v938-capture-ratio.webp',
  'The V938 intake seen from below over two pots', 1083, 604
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'split', '47 dB, and it decides for itself',
  'Smart sensing reads the resistance of the duct and sets extraction to match, so it is not running at full tilt to overcome a run that does not need it. No manual adjustment, and no smoke overflow either.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v938-quiet.webp',
  'A quiet kitchen with the V938 running at 47 dB', 1152, 1286
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 8, 'split', 'Wave, do not touch',
  'Gesture sensing switches modes with a wave, so the controls stay clean and nothing has to be hunted for with a hand full of pan.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v938-gesture.webp',
  'A hand waved under the V938 to change mode', 1152, 946
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 9, 'split', 'It starts and stops on its own',
  'Ignition triggers extraction. When cooking ends, the airflow carries on to clear what is left, then powers down by itself after three minutes.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v938-auto-start.webp',
  'The V938 extracting as a burner is lit beneath it', 1152, 1184
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 10, 'split', 'It keeps working when you are not cooking',
  'On standby it samples the air and ventilates in real time: formaldehyde, ammonia, nitrogen oxides, benzene, carbon monoxide, alcohol and odours. A kitchen is the room that collects all of them.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v938-air-manager.webp',
  'The V938 purifying a kitchen with no pan on the hob', 1152, 967
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 11, 'split', 'The display tells you the air',
  'Air quality and running state on one crystal readout, with a colour band for the reading: red for poor air on high-speed extraction, through to blue on standby.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v938-display.webp',
  'The V938 floating display lit along the front edge', 1152, 655
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 12, 'split', 'Steam and hot water, together',
  'The fifth-generation cycle cleans the fan and the inner chamber, not just the blades: steam dissolves the grease and hot water flushes it away. VATTI measures 99.1% coverage, 99.2% deep clean and 99.99% sterilisation.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v938-steam-clean.webp',
  'The V938 impeller in the middle of a steam and water wash', 1152, 795
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 13, 'split', 'From the phone, if you want',
  'Connected to the smart home ecosystem: adjust airflow, start a self-clean, read the auto-clean reminder or book a service, all from the app.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v938-app.webp',
  'The V938 being controlled from a phone in a kitchen', 1152, 922
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 14, 'card', 'Classic elegant',
  'Warm timber, brass, and the hood disappearing into the run.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v938-style-classic.webp',
  'The V938 in a classic timber kitchen', 1083, 229
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 15, 'card', 'Light luxury Italian',
  'Stone and sheen, with the front panel flush to the cabinet face.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v938-style-italian.webp',
  'The V938 in a stone and steel kitchen', 1083, 266
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 16, 'card', 'Modern minimal',
  'One uninterrupted line above the hob, and nothing else.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v938-style-minimal.webp',
  'The V938 in a minimal timber kitchen', 1083, 266
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 17, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/05/VATTI-Kitchen-Hood-V938_front_open.webp',
  'The V938 seen from the front with the panel open', 800, 477
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';

-- vatti-magic-series-cooker-hood-v919 ---------------------------------------
-- Thirteen landscape slides, text on one side and picture on the other, plus
-- two clean product renders that need no crop. Slide13 is a specification slide
-- and is dropped: its figures are in product_dimension.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v919-hero.webp',
  'The V919 against an image of the earth from orbit', 1040, 518
  FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', 'A slim body, in a cabinet',
  'Between 270mm and 330mm deep, so it goes into a cabinet run and stops there. The depth is what decides whether a hood is a fitted appliance or a box hanging off the wall.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v919-ultra-thin.webp',
  'The V919 fitted into a cabinet, its depth marked 270 to 330mm', 1040, 533
  FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', '3,050 m³/h of turbo suction',
  'Enough to hold a wok flare in an open kitchen, and enough that the hob can be used hard without the room filling up behind you.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v919-suction.webp',
  'The V919 pulling steam off a hob', 489, 720
  FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', '1,300 Pa of static pressure',
  'The number that decides whether a high-floor flat actually clears. Rated pressure is 450 Pa and it peaks at 1,300 Pa, which is what a long shared duct with several bends asks for.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v919-pressure.webp',
  'The V919 exhausting smoke rapidly with no backflow', 1040, 475
  FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', 'It reads the duct while you cook',
  'Intelligent volume adjustable suction watches the resistance of the central tunnel in real time and sets wind pressure and air volume to match, which is what keeps it working during the peak hour when every flat on the riser is cooking at once.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v919-adjustable.webp',
  'The V919 control electronics', 1040, 418
  FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', 'A closed negative pressure bottom',
  'The underside is closed rather than open, 513mm across, so the low-pressure pocket forms under the whole canopy instead of leaking out at the edges.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v919-negative-pressure.webp',
  'The closed underside of the V919 over a pan', 1040, 576
  FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'split', 'Steam washing, then dry',
  'High-pressure hot water flushes continuously, then the motor spins itself dry at high speed so nothing is left sitting wet inside the cavity.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v919-steam-wash.webp',
  'The V919 impeller during a steam wash', 624, 504
  FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 8, 'split', 'Four steps to a clean hood',
  'The cycle you actually run, in the order you run it. The captions on the four panels are the steps:

- Take the oil cup off the bottom of the hood
- Put the water cup, filled, on the rack
- Press the one-key auto-clean
- Pour the water cup off and put the oil cup back',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v919-four-steps.webp',
  'The four steps of the V919 auto-clean cycle, each panel labelled', 998, 576
  FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 9, 'card', 'Quick-release oil filter',
  'The filter unclips with a pull, with nothing to unscrew above a hot hob.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v919-quick-release.webp',
  'The V919 oil filter being released by hand', 478, 137
  FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 10, 'card', 'Segmented, for the dishwasher',
  'The screen comes apart into two sections, each small enough to go in the dishwasher.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v919-segmented-filter.webp',
  'A section of the V919 oil screen under running water', 478, 137
  FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 11, 'split', 'A 5.1 inch screen, and a hand sensor',
  'Recipes, timers and fan steps on the screen; start and stop with a wave when your hands are not clean enough to touch it.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v919-touch-screen.webp',
  'The V919 touch screen with a hand held under the panel', 728, 490
  FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 12, 'split', 'Quiet at 50 dB',
  'Multi-dimensional noise reduction, which in practice means the hood sits nearer a conversation than a busy street: the marks on the curve are 15, 30, 41 and 70 dB.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v919-noise.webp',
  'A noise curve drawn across a kitchen with the V919 in it', 1040, 562
  FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 13, 'split', 'Three ways to fit it',
  'Open, into a cabinet, or fully built in. The labels under the three panels are the three concepts, and which one applies is a joinery decision rather than a different model.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v919-installations.webp',
  'The V919 shown open, in a cabinet and built in', 967, 428
  FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 14, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2024/03/Megic-Series-Hood-V919_Product-Image-3.webp',
  'The V919 from the side, panel open', 1920, 1524
  FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';

-- vatti-range-hood-v997 -----------------------------------------------------
-- Eight posters. Product-Picture-3-1 is a specification sheet and Picture-10 a
-- tick-list against a traditional hood: both are dropped, and what they said is
-- now the dimension table and the block copy below.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v997-hero.webp',
  'The V997 drawing smoke down over two burners', 790, 996
  FROM product WHERE slug = 'vatti-range-hood-v997';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', 'Top suction, or side suction',
  'A top-suction hood puts the inlet further from the pan, so smoke has room to spread before it is caught. A side-suction hood catches it low but lets fumes escape past the edges. The panels are labelled with what each one does.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v997-suction-types.webp',
  'Top suction and side suction compared over the same pan', 758, 524
  FROM product WHERE slug = 'vatti-range-hood-v997';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'The V997 does both',
  'An upgraded three-chamber system pulling from above, and an ultra-slim close that seals the side. The combination is the point: caught low, and held long enough to leave.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v997-combination.webp',
  'The V997 top-suction and side-suction paths drawn together', 758, 428
  FROM product WHERE slug = 'vatti-range-hood-v997';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'Four chambers, three generations in',
  'VATTI has been adding chambers for three generations: two chambers captured 70% of the smoke, three captured 80%, and the four-chamber system in the V997 captures 99%. Airflow is up 50% on the generation before it, and the inlet sits 4cm closer to the pan.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v997-generations.webp',
  'Two, three and four chamber hoods compared, each labelled with its capture rate', 743, 444
  FROM product WHERE slug = 'vatti-range-hood-v997';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', 'BLDC motor, 2,800 m³/h at 1,200 Pa',
  'Brushless, so it holds its figures without the noise a brushed motor makes getting there: 48 dB, and a Grade 1 energy rating on 208 W.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v997-bldc-motor.webp',
  'The V997 motor with its airflow and pressure figures over the picture', 790, 1298
  FROM product WHERE slug = 'vatti-range-hood-v997';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', 'Turbo wash, the fifth generation',
  'The wash expands in a wave rather than spraying at one spot, so it covers a wider area of the impeller in a cycle. VATTI puts it at 99.1% effective, against 35% for the first generation. Patented design ZL201811044634.1.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v997-turbo-wash.webp',
  'Five generations of the VATTI auto-clean cycle compared', 790, 1042
  FROM product WHERE slug = 'vatti-range-hood-v997';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'card', 'AG grey',
  'Against a pale kitchen with a pop of colour.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v997-colour-grey.webp',
  'The V997 in AG grey in a lemon kitchen', 758, 230
  FROM product WHERE slug = 'vatti-range-hood-v997';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 8, 'card', 'Pearl white',
  'Where crisp white meets a calm blue run of cabinets.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v997-colour-white.webp',
  'The V997 in pearl white in a blue and white kitchen', 758, 204
  FROM product WHERE slug = 'vatti-range-hood-v997';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 9, 'card', 'Black',
  'Sleek black against crisp white, which is the bolder of the three.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v997-colour-black.webp',
  'The V997 in black in a white kitchen', 758, 189
  FROM product WHERE slug = 'vatti-range-hood-v997';

-- athena-series-lifting-type-range-hood-v991 --------------------------------
-- Two posters holding two panels each, plus two clean studio renders that
-- needed no crop at all.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2023/11/J-657AZ-4.webp',
  'The V991 from the front with its baffle plate open', 8268, 5512
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', 'Swing a hand at it',
  'Five gestures, none of which need a clean finger:

- Swing left to right to set the suction volume
- One swing turns on the light and the suction
- A second swing starts turbo
- A third returns to the second volume
- Swing right to left to switch it off',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v991-hand-gesture.webp',
  'The V991 control panel and its gesture sensor', 324, 397
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'A baffle plate that closes behind the smoke',
  'Open, the plate separates escaping smoke from the face of the hood. Closed, it stops smoke leaking back out of the centre tunnel, which is where a hood that has stopped running lets the kitchen back in.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v991-baffle-plate.webp',
  'The V991 baffle plate under the canopy, with the airflow drawn on it', 648, 429
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'Patented V-shaped housing',
  'The volute is shaped to let the air leave the impeller without fighting the wall of the housing, which is where a cheaper hood makes both its noise and its losses.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v991-v-housing.webp',
  'The V991 V-shaped motor housing', 576, 422
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', 'Piano black, with a champagne line',
  'A shining piano-black body that wipes clean, and a champagne gold decoration line along the front edge.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v991-piano-black.webp',
  'The V991 in piano black with its gold trim line', 648, 499
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991';

-- artemis-series-t-type-range-hood-v931 -------------------------------------
-- One image, a clean studio render, and no marketing composites at all. The
-- story is written from the spec bullets and the drawing.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2023/11/V931-C.webp',
  'The V931 T-type hood seen from the front', 6720, 4500
  FROM product WHERE slug = 'artemis-series-t-type-range-hood-v931';

-- vatti-slim-series-type-range-hood-v996 ------------------------------------
-- Eight posters, heading over photograph. V996-PG8 is an installation drawing
-- and is dropped; its figures are in product_dimension. PG2's main photograph
-- has its explanation printed across the picture and cannot be cut free of it,
-- so only the two summary tiles at its foot are used.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v996-hero.webp',
  'The V996 drawing a column of smoke down into its inlet', 790, 1039
  FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', 'Side and top inlet, in one body',
  'The top inlet collects smoke steadily as it rises. The side inlet sits lower and takes it before it gets there. Together they let a slim body do the work of a deep one.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v996-depth-tiles.webp',
  'Two diagrams: the hood at 345mm deep in a cabinet, and 720mm of clear space under it', 758, 358
  FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', '500 Pa of static pressure',
  'Enough to push back against a central tunnel at the hour when every flat on the riser is cooking: no backflow into the kitchen, and no smoke standing in the duct.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v996-pressure.webp',
  'The V996 impeller and its airflow path', 569, 1131
  FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'Heat auto clean',
  'Not a water wash: the cavity is heated until the oil lets go, and the fan throws it off. Nothing to fill, and nothing to pour away afterwards.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v996-heat-clean.webp',
  'The V996 impeller glowing during a heat clean cycle', 790, 463
  FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', 'Seventeen minutes, in seven stages',
  'The wheel is the cycle, and the labels on it are its stages: three minutes of first heating, two more to peel the oil off, thirty seconds of high-speed fan to throw it clear, five minutes of second heating to dissolve what is left, thirty seconds more of fan, five minutes of third heating for the stubborn film, and a final minute drying the inner cabinet.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v996-clean-cycle.webp',
  'The seventeen-minute V996 cleaning cycle drawn as a labelled wheel', 758, 617
  FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', 'A guide plate that lifts out',
  'Hook-type embedded: one lift and a push and the smoke guide plate is off, which is the part that gets dirtiest and the part most hoods make hardest to reach.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v996-guide-plate.webp',
  'The V996 smoke guide plate coming away from the body', 790, 1106
  FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'split', 'Left to right on, right to left off',
  'A hand sensor under the panel: swing left to right to start it and step the air volume, right to left to switch it off.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v996-hand-sensor.webp',
  'A hand swung under the V996 while a wok is going', 790, 715
  FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 8, 'card', 'Under the cabinets',
  'The body tucks into the run and the front sits flush with it.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v996-in-cabinets.webp',
  'The V996 fitted under a run of wall cabinets', 758, 539
  FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 9, 'card', 'On the wall',
  'Hung on its own against a plain wall, with the chimney showing.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v996-on-wall.webp',
  'The V996 wall-mounted with its chimney exposed', 758, 581
  FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996';

-- vatti-stellar-series-cooker-hood-v960 -------------------------------------
-- Twelve posters on one template: heading, paragraph, bullet row, photograph.
-- The words become the blocks; the photographs are cut out per
-- data/crops/v960.json. V960-PG13 is a specification sheet and is dropped.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/05/VATTI-Kitchen-Hood-V960_front_open.webp',
  'The V960 from the front with its panel open', 800, 622
  FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', '225mm slim, and it opens without protruding',
  'The body is 225mm deep and the panel opens downward rather than outward, so nothing swings into the room and the line of the cabinets is unbroken.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v960-slim.webp',
  'The V960 open above a hob, its depth marked 225mm', 1054, 895
  FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', '3,690 m³/h, and 25.9 seconds',
  'The most airflow in the VATTI range, and VATTI''s own measure of how long it takes to clear a kitchen of heavy smoke: 25.9 seconds. Four levels, from delicate simmering to full wok heat.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v960-airflow.webp',
  'An open kitchen with the V960 clearing it', 1055, 552
  FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', '1,700 Pa of static pressure',
  'High pressure is what breaks through duct resistance when every flat on the riser is cooking at once. This is the highest figure VATTI Malaysia sells, and it is the reason to choose this hood on a high floor.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v960-pressure.webp',
  'The V960 against a high-rise skyline, pushing air out', 1055, 656
  FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', 'A chamber for each burner',
  'Dual chambers with dual exhausts, so each burner is extracted on its own rather than sharing one throat. Certified Level 1 for smoke extraction.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v960-dual-chamber.webp',
  'The V960 taking smoke from two burners at once', 1054, 746
  FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', '48 dB, held under power',
  'An inverter DC motor, a top-mounted air chamber, a V-shaped patented volute and micro-perforated sound absorption. Four separate pieces of engineering, all aimed at the same number.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v960-quiet.webp',
  'The V960 motor and body, marked as low as 48 dB', 611, 716
  FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'split', 'The display wakes as you walk in',
  'A motion display that lights softly as someone enters the kitchen and fades again when they leave, so there is no bright panel glowing at an empty room.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v960-motion-display.webp',
  'A person approaching the V960 as its display lights', 1054, 880
  FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 8, 'split', 'Radar, not a proximity sensor',
  'Microwave radar tracks the motion of a hand precisely enough to tell several gestures apart, so power and fan step are set without touching anything.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v960-radar.webp',
  'A hand gesturing under the V960', 1054, 597
  FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 9, 'split', 'It syncs with the hob, and with the phone',
  'Ignition starts extraction. Wi-Fi control runs it from anywhere. A three-minute delay finishes the clearing after cooking stops, then it powers down.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v960-auto-sync.webp',
  'The V960 syncing with a hob, a phone app, and its delay shutdown', 675, 1029
  FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 10, 'split', 'PM2.5, measured rather than assumed',
  'A high-precision sensor reads the air and sets the fan to match, and keeps reading after the pan is off, so the extraction stops when the kitchen is actually clear.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v960-pm25.webp',
  'The V960 managing air across a kitchen', 1055, 567
  FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 11, 'split', 'Pulse-wave wash',
  'One tap runs a deep clean: a high-pressure rinse breaks the grease down and a turbo dry finishes it, so the cavity is not left damp.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v960-self-clean.webp',
  'The V960 impeller mid-wash, with the three stages named beneath', 1054, 567
  FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 12, 'split', 'AG glass, not ordinary glass',
  'Low reflection so it is easy on the eyes, anti-fingerprint so it stays clean-looking, and scratch resistant. The comparison in the picture is against a conventional glass panel.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v960-surface.webp',
  'A finger drawn across AG glass beside conventional glass', 1054, 418
  FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 13, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v960-hero.webp',
  'The V960 against a winter landscape', 633, 746
  FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';

-- athena-series-lifting-type-range-hood-v936 --------------------------------
-- Twelve portrait cards, each a photograph with its caption set above or below
-- it, plus two clean studio renders that need no crop. This is the one hood
-- with no dimension drawing published, so there are no installation rows for it
-- below and the fit checker does not render: better an honest gap than an
-- invented figure.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v936-hero.webp',
  'The V936 tower-type hood against a night sky', 559, 397
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', 'A tower, after the Eiffel',
  'The chimney tapers the way a tower does rather than dropping straight, which is the whole look of the Artemis series: the hood reads as a structure over the hob instead of a box.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v936-tower.webp',
  'The V936 canopy and its lit control strip', 464, 293
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'R-arc edges and corners',
  'Filament-finished curved corners: no hard edge at the height a cook walks past, and a shape that takes a knock without denting.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v936-arc-corner.webp',
  'The curved corner of the V936 where the panel meets the canopy', 464, 351
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'Two cavities, two pressure zones',
  'A second negative-pressure zone behind the first, so smoke that gets past the inlet is caught rather than rolling back out under the canopy.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v936-double-cavity.webp',
  'Smoke drawn up into the V936 through both cavities', 464, 555
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', '98mm deeper hood cavity',
  'The cavity is 98mm deeper than the generation before it, which makes the negative-pressure zone larger and gives the smoke somewhere to go before the fan takes it.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v936-deeper-cavity.webp',
  'The underside of the V936 with its 98mm cavity depth marked', 464, 369
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', '35mm deeper filter area',
  'The 3D filter sits 35mm deeper as well, which is what builds the second pressure zone rather than simply adding mesh for the air to fight through.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v936-filter-area.webp',
  'The V936 3D filter panel, its depth marked 3.5cm', 464, 415
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'split', '450 Pa, before the smoke escapes',
  'Patented exhaust technology holding a 450 Pa negative-pressure zone under the canopy: the smoke is taken at the pan rather than chased across the kitchen.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v936-negative-pressure.webp',
  'The V936 over a wok, pulling smoke straight up', 454, 313
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 8, 'split', 'Patented V-shaped motor housing',
  'Patent ZL201320743850.1. The volute lets air leave the impeller without fighting the wall of the housing, which is where a cheaper hood loses both pressure and quiet.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v936-v-housing.webp',
  'A conventional motor housing beside the V-shaped one', 464, 389
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 9, 'split', 'Steam, 125 times over',
  'The new-generation cycle melts the oil with 125 bursts of steam and then scours it away with high-pressure hot water, so the interior stays clean enough to keep its suction.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v936-steam-clean.webp',
  'The V936 impeller being cleaned by steam and water', 464, 392
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 10, 'split', 'Eighteen seconds of scouring, then spin dry',
  'The cycle ends the way it should: 18 seconds of continuous hot water, then 30 seconds of cleaning and 30 of spin-dry, so nothing is left standing inside the housing.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v936-spin-dry.webp',
  'The V936 impeller spinning dry after a wash', 232, 522
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 11, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2023/11/V936-Product-Detail-12.webp',
  'The V936 seen from below, filter and canopy', 5174, 3593
  FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v936';

-- vatti-cooker-hood-v917-carbon-grey / -white --------------------------------
-- One appliance, two legacy URLs, and two DIFFERENT sets of source posters:
-- the Carbon Grey pages ship English panels of a grey hood, the White pages
-- ship Malaysian-market panels in Malay of a white one, including four batik
-- cabinet settings. So the blocks are written twice rather than once against
-- variant_group: the same claims, each beside a picture of the colour the page
-- is actually selling.

-- Carbon Grey ---------------------------------------------------------------
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'split', '2,250 m³/h of turbo suction',
  'Hurricane suction, in VATTI''s own words: enough to stop smoke standing in the kitchen while several stir-fry dishes go at once.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v917g-turbo.webp',
  'The V917 in carbon grey pulling smoke off a hob', 626, 756
  FROM product WHERE slug = 'vatti-cooker-hood-v917-carbon-grey';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', '900 Pa of static pressure',
  'The figure that matters when the ducting is complicated: no backflow into the kitchen and no smoke standing in the run, even at the hour when every flat on the riser is cooking.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v917g-pressure.webp',
  'Airflow drawn through the V917 body and out of the duct', 670, 756
  FROM product WHERE slug = 'vatti-cooker-hood-v917-carbon-grey';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'Wave, do not print',
  'Gesture control from a distance, so greasy fingertips never touch the panel: left to right turns it on and steps the air volume, right to left switches it off.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v917g-gesture.webp',
  'A hand raised to the V917 while a wok is going', 1080, 605
  FROM product WHERE slug = 'vatti-cooker-hood-v917-carbon-grey';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'Heat auto-clean',
  'No water cup to fill: the cavity is heated in two high-frequency steps until the oil dissolves, and the fan throws it clear.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v917g-heat-clean.webp',
  'The V917 impeller glowing during a heat clean', 648, 421
  FROM product WHERE slug = 'vatti-cooker-hood-v917-carbon-grey';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', 'Seventeen minutes, seven stages',
  'The wheel is the cycle and its labels are the stages: three minutes of first heating, two to peel the oil off, thirty seconds of fan to throw it clear, five minutes of second heating, thirty seconds more of fan, five minutes of third heating for the stubborn film, and a minute drying the inside.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v917g-clean-cycle.webp',
  'The seventeen-minute V917 cleaning cycle drawn as a labelled wheel', 1037, 432
  FROM product WHERE slug = 'vatti-cooker-hood-v917-carbon-grey';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', 'The guide plate comes off',
  'A hinged front panel that opens with one hand, and a smoke guide plate behind it that lifts out. The part that gets dirtiest is the part you can actually reach.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v917g-guide-plate.webp',
  'The V917 front panel hinged open, guide plate showing', 583, 918
  FROM product WHERE slug = 'vatti-cooker-hood-v917-carbon-grey';

-- White ---------------------------------------------------------------------
INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'split', '2,250 m³/h of turbo suction',
  'Hurricane suction, in VATTI''s own words: enough to stop smoke standing in the kitchen while several stir-fry dishes go at once.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v917-turbo.webp',
  'The V917 in white pulling smoke off a hob', 803, 1104
  FROM product WHERE slug = 'vatti-cooker-hood-v917-white';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', 'Wave, do not print',
  'Gesture control from a distance, so greasy fingertips never touch the panel: left to right turns it on and steps the air volume, right to left switches it off.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v917-gesture.webp',
  'A hand raised to the white V917 while a wok is going', 477, 1003
  FROM product WHERE slug = 'vatti-cooker-hood-v917-white';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'A 3D body, made for Malaysian kitchens',
  'The upper inlet gathers the smoke and the lower one takes it at the pan, which is what lets a slim body handle wok heat. Designed with Batik Malaysia: local pattern, local cooking.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v917-3d-design.webp',
  'The white V917 with its two inlets marked', 727, 1141
  FROM product WHERE slug = 'vatti-cooker-hood-v917-white';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'The guide plate comes off',
  'A hinged front panel that opens with one hand, and a smoke guide plate behind it that lifts out for washing.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v917-guide-plate.webp',
  'The white V917 panel hinged open and being wiped', 828, 928
  FROM product WHERE slug = 'vatti-cooker-hood-v917-white';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', 'Heat auto-clean',
  'No water cup to fill: the cavity is heated in two high-frequency steps until the oil dissolves, and the fan throws it clear.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v917-heat-clean.webp',
  'The white V917 with its front open during a clean cycle', 727, 451
  FROM product WHERE slug = 'vatti-cooker-hood-v917-white';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', 'Seventeen minutes, seven stages',
  'The wheel is the cycle and its labels are the stages, from the first heating through to the minute that dries the inside out.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v917-clean-cycle.webp',
  'The seventeen-minute V917 cleaning cycle drawn as a labelled wheel', 602, 903
  FROM product WHERE slug = 'vatti-cooker-hood-v917-white';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'card', 'Calm and composed',
  'Blue batik against grey, which is the quietest of the four settings.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v917-batik-blue.webp',
  'The white V917 in a blue and grey batik kitchen', 1254, 752
  FROM product WHERE slug = 'vatti-cooker-hood-v917-white';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 8, 'card', 'Classic and warm',
  'Timber and batik together, for a kitchen that wants to feel lived in.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v917-batik-timber.webp',
  'The white V917 in a timber batik kitchen', 1254, 752
  FROM product WHERE slug = 'vatti-cooker-hood-v917-white';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 9, 'card', 'Clean and fresh',
  'Pure white with a batik accent, which is where this colourway disappears.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v917-batik-white.webp',
  'The white V917 in an all-white batik kitchen', 1254, 727
  FROM product WHERE slug = 'vatti-cooker-hood-v917-white';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 10, 'card', 'Warm and modern',
  'Warm tones with batik accents, the most contemporary of the four.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/v917-batik-warm.webp',
  'The white V917 in a warm-toned batik kitchen', 1254, 752
  FROM product WHERE slug = 'vatti-cooker-hood-v917-white';

-- vatti-dishwasher-dwbb7 ----------------------------------------------------
-- Sixteen portrait posters on one template: heading at the top, picture under
-- it. description-9 is the parameter sheet and is dropped; its figures are in
-- product_dimension. Where a poster carries labels ON the diagram (the
-- condensation ducts, the three pumps, the filter stack) they stay: they name
-- the parts they point at.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/dwbb7-hero.webp',
  'The DWBB7 with its four jobs marked around it: wash, dry, sterilise, store', 595, 720
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', '17 place settings',
  'A full 60cm machine: seventeen sets, which is a family dinner and the pots it came out of, in one load rather than two.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/dwbb7-capacity.webp',
  'The DWBB7 loaded, both baskets pulled out', 595, 733
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'Three spray levels, counter-rotating',
  'Arms on three levels turning against each other, so the water reaches the back of a stockpot on the bottom rack and the inside of a glass on the top one in the same cycle.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/dwbb7-spray-arms.webp',
  'The three spray levels of the DWBB7 seen from inside', 595, 354
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'BLDC inverter motor',
  'V-wash technology: variable speed rather than one fixed pump rate, so pressure is turned up for a dirty load and down for a light one instead of running flat out every time.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/dwbb7-motor.webp',
  'Cutaway of the DWBB7 BLDC inverter motor', 595, 640
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', 'Triple disinfection',
  'A 75°C high-temperature wash, a UV light steriliser and the drying heat, which VATTI measures together at better than 99.99% of bacteria removed.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/dwbb7-disinfection.webp',
  'The DWBB7 cavity under UV light, and the 75°C wash below it', 595, 733
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', 'It keeps working after the cycle',
  'An automatic ventilation system refreshes the air inside and runs the UV steriliser, so tableware can be left in the machine for up to seven days and still come out fresh. 99.99% bacteria removal.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/dwbb7-ventilation.webp',
  'Air circulating through the closed DWBB7', 595, 547
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'split', 'Hybrid condensation drying',
  'The labels on the cutaway are the parts: a condensing fan, a mixed condensation duct, a dehumidifier and a filtered air inlet. Together they take the steam out rather than leaving it to settle on the dishes.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/dwbb7-condensation.webp',
  'Cutaway of the DWBB7 condensation system with each duct labelled', 595, 711
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 8, 'split', '110°C independent drying',
  'A 108mm PTC infrared ceramic heater with a high-speed fan behind it, which VATTI rates above a separate steriliser box. Hot air at 110°C, and UVC with it.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/dwbb7-drying.webp',
  'The DWBB7 cavity glowing during the drying stage', 595, 463
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 9, 'split', 'Two pumps, no standing water',
  'A main pump, a net discharge pump and a large-flow centrifugal pump between them clear both the water and the food waste, which is what actually makes a load dry rather than damp.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/dwbb7-pumps.webp',
  'The DWBB7 pump assembly, each pump labelled', 595, 619
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 10, 'split', 'Zero residual detergent',
  'Nothing left of the wash water or the detergent at the end of the cycle, which matters on a machine that is also asked to store clean dishes for a week.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/dwbb7-zero-residual.webp',
  'A zero shaped from water, for zero residue', 595, 657
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 11, 'split', 'It looks at the load first',
  'An infrared detector reads how dirty the dishes are and picks the wash mode to match, so a light load is not given a heavy cycle. Utility model patent ZL2018212529 65.X.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/dwbb7-load-modes.webp',
  'Six loading arrangements the DWBB7 recognises', 559, 269
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 12, 'split', 'Seven core programmes, and twelve more',
  'Seven core programmes, five additional ones and eight auto menus, which covers everything from a rinse to a pot cycle without reading the manual each time.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/dwbb7-programme-tiles.webp',
  'The DWBB7 programme tiles laid out above the machine', 595, 530
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 13, 'split', 'Three stages of filtration',
  'A PP plastic net, a 304 stainless steel flow net and a 304 stainless flat filter, each of which lifts out to be rinsed under a tap.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/dwbb7-filtration.webp',
  'The DWBB7 filter stack separated, each layer labelled', 595, 682
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 14, 'split', 'Level 1 water efficiency',
  'Ranked first for energy efficiency on its market, and it will run a half load, top or bottom, rather than making you wait to fill it.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/dwbb7-energy.webp',
  'The DWBB7 open, with its energy label beside it', 595, 522
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 15, 'card', 'Black crystal glass',
  'Oil marks wipe straight off the front.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/dwbb7-glass.webp',
  'The black crystal glass front of the DWBB7', 220, 194
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 16, 'card', 'All-steel liner',
  'Quick-drying, easy to clean, and antibacterial above 91%.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/dwbb7-steel-liner.webp',
  'The stainless steel liner of the DWBB7', 351, 202
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 17, 'card', 'Self-cleaning',
  'The machine washes its own cavity, so nobody has to reach into it.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/dwbb7-self-clean.webp',
  'The DWBB7 cavity being self-cleaned', 351, 244
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 18, 'card', '108mm PTC heater',
  'The element behind the drying stage, with a high-speed fan on it.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/dwbb7-heater.webp',
  'The extended PTC infrared ceramic heater', 268, 194
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 19, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/dwbb7-programmes.webp',
  'Vegetables, feeding bottles and toys, each loaded in the DWBB7', 559, 269
  FROM product WHERE slug = 'vatti-dishwasher-dwbb7';

-- vatti-one-tap-water-purifier-wdhg01-with-v818wd ---------------------------
-- Thirteen portrait posters, heading at the top and picture beneath. Labels
-- that name a filter stage, a temperature mode or a replacement interval stay
-- on the picture: they are the diagram, and the copy repeats them as text.
-- This product is two boxes under one tap, so the blocks say which is which.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/wdhg01-hero.webp',
  'The WDHG01 purifier and V818WD heater under a counter, with the tap above', 595, 640
  FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', 'Two boxes, one tap',
  'The WDHG01 filters and the V818WD heats, both under the sink, and a single tap on the counter gives you either. Nothing stands on the worktop and nothing has to be refilled.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/wdhg01-under-cabinet.webp',
  'The purifier hidden inside a kitchen cabinet', 595, 370
  FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'Hot water in three seconds',
  'Instant heating rather than a tank: the water is heated as it passes, so there is no kettle to boil and nothing kept hot in the cupboard while you are out.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/wdhg01-fast-heat.webp',
  'Cutaway of the V818WD instant heating element', 595, 522
  FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', '600G, and a glass in six seconds',
  'A 600 gallon-per-day membrane, which is 1.5 litres a minute at the tap. Fast enough to fill a jug without standing over it, and fast enough that nobody goes back to bottled water out of impatience.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/wdhg01-flow.webp',
  'A glass being filled at the tap', 595, 648
  FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', 'Four stages, in order',
  'The labels on the diagram are the stages, and they run in this order:

- PP cotton, for sediment
- Pre activated carbon, for chlorine and taste
- RO reverse osmosis membrane
- Post activated carbon, for the taste of what comes out',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/wdhg01-filters.webp',
  'The four filter stages of the WDHG01, each labelled', 595, 674
  FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', '0.0001 micron',
  'That is the pore size of the RO membrane, and it is the stage that takes out bacteria, viruses and the microbes too small to see. Everything before it is there to keep this one working longer.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/wdhg01-ro.webp',
  'The folded RO membrane with water passing through it', 595, 556
  FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'split', 'Four temperatures, one touch',
  'The tap is set by temperature rather than by guesswork, which is the difference between tea that brews and tea that stews.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/wdhg01-modes.webp',
  'The four temperature modes: 100°C, 85°C, 45°C and room temperature', 559, 808
  FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 8, 'split', 'The tap tells you which',
  'A digital display on the tap itself, with the four levels marked and one touch to pick between them. No app, and no menu.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/wdhg01-display.webp',
  'The lit display on the WDHG01 tap', 595, 623
  FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 9, 'split', 'One water channel, fewer joints',
  'The waterway is moulded as one integrated circuit rather than assembled from lengths of pipe: less to install, and fewer places for a leak to start inside a cabinet you rarely open.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/wdhg01-water-channel.webp',
  'The integrated water channel of the WDHG01', 595, 556
  FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 10, 'split', 'You change the filters yourself',
  'Patented, and the reason there is no service call: lift the top cover off, turn the cap handle to unlock, pull the filter up and drop the new one in.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/wdhg01-filter-change.webp',
  'The WDHG01 with its top cover off and a filter exposed', 595, 429
  FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 11, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/wdhg01-change-steps.webp',
  'The three steps of a filter change, each numbered and captioned', 571, 227
  FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 12, 'split', 'What it costs to keep running',
  'Two consumables, and both prices are the manufacturer''s:

- Four-layer carbon filter, every 12 months, RM189
- RO membrane, every 24 months, RM499

Which is roughly RM24 a month for the water a household drinks.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/wdhg01-consumables.webp',
  'The two replaceable filters standing on top of the purifier', 595, 556
  FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 13, 'split', 'Certified, and testable',
  'The unit carries international authorised certification, and the test reports are the ones VATTI publishes rather than a claim on a box.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/wdhg01-certificates.webp',
  'The WDHG01 certification documents', 595, 581
  FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 14, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/wdhg01-temperatures.webp',
  'The tap running into a glass on a counter', 595, 589
  FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd';

-- vatti-magic-series-combi-oven-va06 ----------------------------------------
-- A 27-slide deck, curated to the fifteen that carry a distinct argument; the
-- rest restate them. Slide32 is the specification slide and is dropped, its
-- figures going to product_dimension. Mode labels printed on a picture (LOW /
-- MEDIUM / HIGH, STEW 1/2/3, ROOT CROPS / MEAT) stay: they name what is in the
-- frame, and the copy repeats them in text.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va06-hero.webp',
  'The VA06 combi oven standing on rock over water', 624, 547
  FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', 'Five ovens in one cavity',
  'Steam, stew, bake, air-fry and steam-bake, which is the argument for a combi oven in a Malaysian kitchen: one 70-litre box instead of a steamer, an oven and an air fryer fighting over the same worktop.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va06-five-in-one.webp',
  'The five VA06 modes, each with the dish it produces', 998, 619
  FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'A colour touch screen, partitioned by function',
  'The controls are grouped by what you are doing rather than by a menu tree, so a mode is two touches away and the response does not lag behind your finger.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va06-screen.webp',
  'The VA06 high-definition touch screen', 582, 720
  FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'Steam System 4.0',
  'Through-type power dual steam: two hidden direct-injection evaporators and a steam-flow nozzle layout, which is boiler-type evaporation without a boiler taking up the cavity.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va06-steam.webp',
  'Steam filling the VA06 cavity around a tray of seafood', 541, 720
  FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', 'Three humidity levels',
  'Low, medium and high, set against what is in the oven: the wetter the setting, the less water the ingredient loses and the more of its own flavour stays in it.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va06-humidity.webp',
  'Asparagus steamed at low, medium and high humidity', 998, 439
  FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', 'Steam grill, against a dry oven',
  'Steam moisturising while it roasts: the outside crisps and the inside stays juicy, where a conventional oven takes the water out of both.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va06-steam-grill.webp',
  'The same cut of meat steam-grilled and roasted dry, side by side', 1040, 432
  FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'split', 'Humidity is the control, not the timer',
  'High humidity leaves it tender, medium crisps the skin, low gives it a slight burn. The labels on the picture are those three settings on the same piece of chicken.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va06-humidity-roast.webp',
  'One chicken leg roasted at three humidity levels, each labelled', 936, 569
  FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 8, 'split', 'Which setting for which dish',
  'High humidity for a rib roast, medium for a whole chicken, low for vegetables. It is the part of a combi oven that usually takes a year to learn.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va06-ingredients.webp',
  'A rib roast, a whole chicken and roast vegetables, each labelled with its humidity', 936, 569
  FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 9, 'split', 'Steam bake, for bread',
  'Steam in the first minutes is what gives a loaf its oven spring, its shine and its shatter. A regular oven cannot do it, which is why bakers inject steam into theirs.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va06-bake-compare.webp',
  'The same dough proved and baked in a regular oven and with steam', 666, 295
  FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 10, 'split', 'Air-fry, in two modes',
  'A root crops mode and a meat mode, because a potato and a chicken thigh want different air. Less fat than a pan and fewer calories than a fryer, in a cavity you were going to have anyway.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va06-air-fry.webp',
  'Prawns crisping on the VA06 air-fry rack', 603, 720
  FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 11, 'split', 'Root crops, or meat',
  'The two air-fry modes, and what each is for.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va06-air-fry-modes.webp',
  'Root vegetables and raw meat, each under its air-fry mode label', 728, 547
  FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 12, 'split', 'Stew, on a curve',
  'An intelligent stewing curve holds time and temperature together so the meat goes tender and the nutrients end up in the soup rather than boiled off. 360 degree hot air with steam heat behind it.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va06-stew.webp',
  'A pot of soup stewing inside the VA06', 437, 720
  FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 13, 'split', 'Three stews',
  'Porridge, soup and meat, each with its own curve. Traditional stovetop cooking needs watching and turning; this does not.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va06-stew-modes.webp',
  'Porridge, soup and a meat stew, each under its stew-mode label', 998, 605
  FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 14, 'split', '68 recipes, already in it',
  'Sixty-eight programmes built into the screen, plus defrost, dough fermentation, a 60°C warm setting, yogurt and rice. It is a lot of oven to learn, and this is how you start using it in the first week.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va06-recipes.webp',
  'Dishes arranged around the open VA06', 1040, 374
  FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 15, 'split', 'Auto-clean',
  'High temperature softens the oil on the cavity walls so it wipes off, instead of being scraped off cold. The picture is the same cavity before and after.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va06-auto-clean.webp',
  'The VA06 cavity mid-clean, one half hot and one half clean', 1040, 533
  FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06';

-- vatti-flexi-hob-c836g -----------------------------------------------------
-- Thirteen tall posters: heading and subheading at the top, photograph beneath,
-- and on several a comparison table at the foot. The headings become the block
-- copy and the tables become bullets. description-8 is a materials comparison
-- with no photograph worth keeping and is dropped; its claim is in the copy.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c836g-hero.webp',
  'The C836G lit on both burners beside a plated dish', 1024, 1075
  FROM product WHERE slug = 'vatti-flexi-hob-c836g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', '5.5 kW, and the smell of it',
  'Enough heat to take a wok past the Maillard reaction in seconds rather than stewing the ingredients while it gets there. 5.5 kW on natural gas, 5.0 kW on LPG.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c836g-power.webp',
  'A wok flaring over the C836G burner', 1024, 1167
  FROM product WHERE slug = 'vatti-flexi-hob-c836g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'Three rings, not two',
  'A third ring spreads the burn across the base of the wok instead of concentrating it in a circle:

- Inner ring, for a balanced and stable flame
- Middle ring, to compensate for the heat gaps a dual ring leaves
- Outer ring, which widens the combustion area by 11% for large cookware',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c836g-triple-ring.webp',
  'The triple-ring flame of the C836G burner', 451, 553
  FROM product WHERE slug = 'vatti-flexi-hob-c836g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'Five flame levels, with a click',
  'Mechanical five-step control rather than a smooth sweep, so the same setting is repeatable by feel: level 1 for a gentle simmer, level 4 for a quick stir-fry, level 5 for full wok heat.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c836g-flame-control.webp',
  'The C836G control knob with its five flame levels marked', 1024, 538
  FROM product WHERE slug = 'vatti-flexi-hob-c836g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', 'The left burner watches the oil',
  'A temperature sensor under the left burner reads the pan and steps in:

- Hot oil protection, which cuts the flame and alerts when oil reaches temperature with nothing added
- Empty pan protection, which reduces the flame on a long idle and then shuts off
- Dry-burn protection, which reacts to a rapid heat change',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c836g-temperature.webp',
  'The C836G smart burner sensor reading a pan at 290°C', 1024, 737
  FROM product WHERE slug = 'vatti-flexi-hob-c836g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', 'A timer for each side',
  'Zero to 180 minutes per zone, so a slow braise on one burner is not something you have to stand next to. Set it and leave the kitchen.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c836g-timer.webp',
  'The C836G dual-zone timer, marked at 10, 60 and 180 minutes', 1024, 1260
  FROM product WHERE slug = 'vatti-flexi-hob-c836g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'split', 'It starts the hood for you',
  'Light the hob and a compatible VATTI hood begins extracting, at low flame or high to match. It is the pairing the [V929](/vatti-aetheris-series-cooker-hood-v929/) advertises from the other side.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c836g-hood-link.webp',
  'The C836G signalling the hood above it to start', 1024, 1014
  FROM product WHERE slug = 'vatti-flexi-hob-c836g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 8, 'split', 'It fits the hole you already have',
  'An adjustable base takes a front cut-out anywhere between 650 and 710 mm and a side cut-out between 350 and 400 mm. Inside that range a replacement goes in without re-cutting the countertop, which is the expensive part of changing a hob.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c836g-cutout.webp',
  'The C836G above its cut-out, the compatible range marked on the counter', 1024, 645
  FROM product WHERE slug = 'vatti-flexi-hob-c836g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 9, 'split', 'Nano coating, against the oil',
  'A water and oil repellent nano-polymer on the glass, so grease beads and slides instead of sticking. The test panel is the same oil on coated and uncoated glass.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c836g-nano-glass.webp',
  'A cloth wiping the C836G glass surface clean', 1024, 507
  FROM product WHERE slug = 'vatti-flexi-hob-c836g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 10, 'split', 'Made to come apart',
  'The labels on the picture are the four parts that make a hob easy or awful to clean: a concave flame cap that guides spills, a removable burner head, a smooth rounded wok support and a raised spill tray that directs overflow outward.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c836g-easy-clean.webp',
  'The C836G with its burner parts separated and labelled', 1024, 1229
  FROM product WHERE slug = 'vatti-flexi-hob-c836g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 11, 'split', 'The wok support holds the flame in',
  'Anti-slip locking tabs to keep a round-bottomed wok where you put it, reinforced edges that do not deform over time, and curved drainage grooves that take soup and oil away rather than baking it on.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c836g-wok-support.webp',
  'The C836G wok support with its features labelled', 1024, 737
  FROM product WHERE slug = 'vatti-flexi-hob-c836g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 12, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c836g-flame-art.webp',
  'The C836G installed in a pale kitchen counter', 1024, 1075
  FROM product WHERE slug = 'vatti-flexi-hob-c836g';

-- vatti-flexi-hob-c822g -----------------------------------------------------
-- Eight tall posters, heading over photograph, several with an icon row or a
-- comparison table at the foot. The white studio render needs no crop.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c822g-hero.webp',
  'The C822G set into a pale counter with one burner lit', 742, 713
  FROM product WHERE slug = 'vatti-flexi-hob-c822g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', '5.2 kW, and the flame wraps the pan',
  'The burner is shaped to take the flame around the base of a wok rather than up its sides, which is what shortens the cooking and keeps the wok hei in the food.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c822g-firepower.webp',
  'A wok of stir-fry over the C822G at full flame', 738, 602
  FROM product WHERE slug = 'vatti-flexi-hob-c822g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'The difference it makes',
  'The same dish stir-fried at 5.2 kW and on an ordinary gas hob. Slow fire steams the ingredients; fast fire sears them, which is the whole argument for a high-output burner in a Malaysian kitchen.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c822g-wok-compare.webp',
  'The same dish cooked at 5.2 kW and on a slower hob, side by side', 694, 327
  FROM product WHERE slug = 'vatti-flexi-hob-c822g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'Torch-level co-combustion',
  'A brass burner fire cap that resists high temperature without deforming, an aviation-grade burner cap under it, and a square drill pan in high-temperature ceramic glaze that stays put and wipes clean.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c822g-burner.webp',
  'The C822G burner assembly, each part labelled', 748, 540
  FROM product WHERE slug = 'vatti-flexi-hob-c822g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', '63% thermal efficiency',
  'First-class energy efficiency: a higher share of the gas ends up in the pan rather than around it, which is both a lower bill and a cooler kitchen.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c822g-efficiency.webp',
  'The C822G with both burners lit, marked 63%', 749, 559
  FROM product WHERE slug = 'vatti-flexi-hob-c822g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', 'Set the time and walk away',
  'A timer per zone: set it for a steam, a stew or a braise, and the hob turns the fire off when the time is up. The tiles under the picture are eight minutes, twenty and ninety-nine.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c822g-timer.webp',
  'Someone reading while the C822G times a braise', 745, 898
  FROM product WHERE slug = 'vatti-flexi-hob-c822g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'split', 'It comes apart to clean',
  'The burner lifts out, so soup, oil and crumbs are wiped from a flat surface rather than fished out of a burner ring. That is 360 degrees of access, and no blind spots.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c822g-detachable.webp',
  'The C822G burner detached from the hob', 745, 1063
  FROM product WHERE slug = 'vatti-flexi-hob-c822g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 8, 'split', 'Tempered glass, anti-scratch',
  'Anti-explosion tempered glass with an oil and dirt resistant surface: no stains, no scratches from a pan set down hard, and one wipe after dinner.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c822g-glass.webp',
  'The glass top of the C822G, lit from the side', 741, 447
  FROM product WHERE slug = 'vatti-flexi-hob-c822g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 9, 'split', 'X-shaped pan support',
  'Non-slip, so a round-bottomed wok stays where it is put through a hard stir-fry instead of walking across the hob.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c822g-pan-support.webp',
  'The X-shaped non-slip pan support of the C822G', 741, 605
  FROM product WHERE slug = 'vatti-flexi-hob-c822g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 10, 'split', 'The details that decide it',
  'The labels on the picture are the four: no restriction on replacement cut-out, an anti-leakage knob pad that keeps grease out of the base shell, an easy-to-remove battery box, and an adjustable damper for a stable flame on less gas.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c822g-details.webp',
  'Four C822G details, each labelled', 745, 1137
  FROM product WHERE slug = 'vatti-flexi-hob-c822g';

-- built-in-combi-oven-va05 --------------------------------------------------
-- Nine tall posters, heading over photograph. VA05-PI14 is the specification
-- poster and is dropped; its figures are in product_dimension.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va05-hero.webp',
  'The VA05 built into a dark kitchen column, roasting', 790, 779
  FROM product WHERE slug = 'built-in-combi-oven-va05';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', 'Steam and bake, in one cavity',
  'Seventy litres with twelve functions: professional steaming and full baking in the same box, which is the point of a combi oven rather than a steamer sitting beside an oven.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va05-in-kitchen.webp',
  'The VA05 in a fitted kitchen with a roast inside', 790, 1082
  FROM product WHERE slug = 'built-in-combi-oven-va05';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'Double steam, 360 degrees',
  'Two steam outlets rather than one, so the surrounding steam fills the cavity quickly and reaches the food from every direction. Ingredients keep their water, and their nutrition with it.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va05-steam.webp',
  'A lobster steaming inside the VA05', 790, 1036
  FROM product WHERE slug = 'built-in-combi-oven-va05';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'Heat from every side',
  'Two top elements, a back element and a bottom one, with a 4D fan balancing them. That is what makes a tray of biscuits at the back of the oven match the ones at the front.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va05-heating.webp',
  'The VA05 heating elements and fan, each labelled', 790, 1387
  FROM product WHERE slug = 'built-in-combi-oven-va05';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', 'Top and bottom, controlled apart',
  'Set the upper and lower elements to different temperatures: crisp on the top and tender underneath, or the other way round for a pizza base. The difference can run to 30°C.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va05-dual-control.webp',
  'A chicken roasting between the VA05 upper and lower elements', 790, 880
  FROM product WHERE slug = 'built-in-combi-oven-va05';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', 'A probe, for doneness',
  'The food probe reads the internal temperature of the meat and stops the oven when it is reached, which is the difference between a medium-rare steak and a guess.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va05-probe.webp',
  'The VA05 food probe in a steak, with temperature steps marked', 790, 1122
  FROM product WHERE slug = 'built-in-combi-oven-va05';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'split', 'An enamel cavity',
  'Anti-corrosion and wear-resistant, and smooth enough that what splashes onto it comes off with a cloth rather than a scraper.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va05-enamel.webp',
  'The open VA05 cavity, lit', 790, 796
  FROM product WHERE slug = 'built-in-combi-oven-va05';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 8, 'split', 'It descales and dries itself',
  'Two maintenance modes, both one key: intelligent descaling runs steam through the system to clear the scale a steam oven accumulates, and intelligent drying takes the water out afterwards so nothing is left standing inside.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va05-descale.webp',
  'The VA05 descaling and drying cycles, each labelled', 743, 1377
  FROM product WHERE slug = 'built-in-combi-oven-va05';

-- vatti-3-burner-gas-hob-c830g ----------------------------------------------
-- Five square posters with the claim printed across the picture. Where it sits
-- over the photograph the crop takes the clean half; labels that name a part or
-- a dish stay.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'split', 'Three dishes at once',
  'Three burners rather than two, which is the difference between cooking a meal and cooking it in shifts: a powerful stir-fry, a slow braise and a medium stew all going together.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c830g-three-pans.webp',
  'Three pans on the C830G, each labelled with what it is doing', 800, 624
  FROM product WHERE slug = 'vatti-3-burner-gas-hob-c830g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', '6 kW across the three',
  'The most output of any VATTI hob, spread across three burners so the big one can take a wok while the others hold a simmer.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c830g-power.webp',
  'The C830G burner at full flame under a wok', 800, 360
  FROM product WHERE slug = 'vatti-3-burner-gas-hob-c830g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'A 99 minute timer',
  'Set a burner and leave it: the hob counts down and turns the fire off, which is what makes an unattended braise a reasonable thing to start.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c830g-timer.webp',
  'The C830G with its timer counting on both zones', 800, 656
  FROM product WHERE slug = 'vatti-3-burner-gas-hob-c830g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'A 1,059 g pan support',
  'Heavy, and shaped to do two jobs: the widened shield keeps the wind off so the flame stays stable, and it protects the knobs from spillage while gathering heat back toward the pan.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c830g-pan-support.webp',
  'The energy-concentrated pan support of the C830G', 768, 384
  FROM product WHERE slug = 'vatti-3-burner-gas-hob-c830g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', 'Six things that make it safe',
  'The labels on the shield are the six: an energy-gathering pan support, a child-safe push-type rotary ignition, a three-layer explosion-proof tempered glass panel, an X-shaped non-slip pot support, thermocouple flameout protection that shuts the gas off, and pulse electronic ignition. Tested through hot and cold shock, gravity shock and violent shock.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c830g-safety.webp',
  'The six C830G safety features arranged in a shield, each labelled', 640, 624
  FROM product WHERE slug = 'vatti-3-burner-gas-hob-c830g';

-- vatti-flexi-hob-c823g -----------------------------------------------------
-- Four square posters plus a clean studio render. C823G-PG-7 is the
-- specification panel and is dropped; its figures are in product_dimension.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2025/07/VATTI-C823G-cooker-hob-4.webp',
  'The C823G seen from above, both burners and the control knobs', 6891, 4188
  FROM product WHERE slug = 'vatti-flexi-hob-c823g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', '4.8 kW, at 38 degrees',
  'The burner lid is angled at 38 degrees to push the flame outward across the base of the pan, and the air supply chain behind it is sized to feed that flame without scorching the pot.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c823g-power.webp',
  'The C823G burner at full flame, its lid angle marked', 761, 426
  FROM product WHERE slug = 'vatti-flexi-hob-c823g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'It fits the hole you have',
  'A recommended die-cut of 650 to 710 mm across by 350 to 400 mm front to back. Inside that range the C823G replaces an older hob without the countertop being cut again.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c823g-cutout.webp',
  'The C823G above its cut-out, the compatible range marked', 761, 350
  FROM product WHERE slug = 'vatti-flexi-hob-c823g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'Gas off, automatically',
  'A thermocouple flame failure device on each burner: if the flame goes out, the gas is cut rather than left running under a pot.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c823g-safety.webp',
  'The C823G burner lit, with its safety device marked', 441, 365
  FROM product WHERE slug = 'vatti-flexi-hob-c823g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', 'Lights immediately',
  'Auto ignition with no waiting and no repeated clicking, which matters most on the day the battery is halfway through its life.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c823g-ignition.webp',
  'The C823G burner head and its igniter', 441, 335
  FROM product WHERE slug = 'vatti-flexi-hob-c823g';

-- vatti-magic-series-cooker-hob-c861g ---------------------------------------
-- Landscape slides, heading over or beside the picture, plus two clean studio
-- renders that need no crop.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2024/03/Magic-Stove-02.webp',
  'The C861G Magic Stove seen from above', 8032, 6016
  FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', 'The burner flips up',
  'A 90 degree vertical reversible burner head, patent ZL201921462957.2. It is the whole idea of the Magic Stove: the burner stands up out of the way instead of sitting in a well you have to clean around.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c861g-reversible.webp',
  'The C861G burner head standing vertical', 520, 396
  FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'Which means it wipes flat',
  'With the burners folded up the top is a flat sheet of glass: one pass with a cloth, no reaching into a burner ring, and no baked-on ring around each one.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c861g-easy-clean.webp',
  'A cloth wiping the C861G flat, beside a burner ring caked with grease', 1040, 590
  FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'And it gives back the drawer',
  'Folded down the hob sits shallow, so the drawer beneath it is a drawer rather than a cupboard built around a gas box.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c861g-save-space.webp',
  'A drawer under the C861G, open and usable', 478, 274
  FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', 'Oxygen from three sides',
  'Multiple suspension O2 injection: air is fed to the flame from around the burner rather than only underneath it, which is what keeps combustion clean in a hob that folds.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c861g-oxygen.webp',
  'The C861G burner mount and its air paths', 478, 360
  FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', '4.8 kW, in seven gears',
  '65% thermal efficiency, first-class energy band, and seven steps of flame rather than a smooth sweep: stir-fry, deep fry, boil, steam, stew, grill and keep warm, each a position you can find by feel.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c861g-power.webp',
  'A wok over the C861G beside its seven cooking positions', 1040, 446
  FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'split', 'It reads the pot',
  'A sensor watches what is in the pan: cold contents get the highest setting, and as they come up to temperature the flame comes down. The three panels are that sequence.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c861g-sensor.webp',
  'The same pot at three temperatures, each with the sensor response captioned', 1040, 518
  FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 8, 'split', 'Left and right, managed separately',
  'Assisted cooking on both zones, each holding its own set temperature against the actual one, with overflow and burn-dry detection watching the pot.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c861g-management.webp',
  'The C861G temperature trace beside a boiling and a dry pot', 1040, 446
  FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 9, 'split', 'Three protections on the left burner',
  'A temperature probe in the left burner watches for the three ways a hob starts a fire: an empty pot, a dry burn and oil past its point. Each cuts the flame and says why.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c861g-temperature.webp',
  'The C861G protection modes, each labelled', 1040, 504
  FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 10, 'split', 'A full touch interface',
  'The controls are printed under the glass rather than standing proud of it, so there are no knobs to work around: 360 degrees of flat surface, and nowhere for grease to collect.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c861g-touch.webp',
  'The C861G touch control strip lit under the glass', 1040, 518
  FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g';

-- vatti-ai-hob-c835g --------------------------------------------------------
-- Tall posters, heading over photograph, several of them infographics where the
-- picture is a small part of the panel: those crops take the photograph and the
-- text becomes the block copy. One source is a 100-frame GIF, cut at its last
-- frame the same way the V999 animations were.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c835g-hero.webp',
  'The C835G on a plinth, both burners lit', 720, 624
  FROM product WHERE slug = 'vatti-ai-hob-c835g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', 'Spinning and even fire',
  'Two fire covers doing different jobs: the inner one throws a double-layer straight flame, the outer one a whirling flame that spreads the heat around the base of the pan. 4.5 kW between them.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c835g-flame.webp',
  'The C835G burner lit, its inner and outer fire covers labelled', 720, 437
  FROM product WHERE slug = 'vatti-ai-hob-c835g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'Eight speeds, 400 W to 4,500 W',
  'A tactile card position for each: stir-fry, deep fry, soup boil, fry, grill, stewing, simmer and keep warm. You find the setting by the click rather than by watching the flame.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c835g-eight-speed.webp',
  'The C835G control dial with its eight cooking positions around it', 720, 624
  FROM product WHERE slug = 'vatti-ai-hob-c835g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'It holds a soup at 100°C',
  'In intelligent mode the hob adjusts the flame itself to keep the pot at temperature: a soup or a porridge sits at 100°C without boiling over the side, which is the failure mode of an unattended pot.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c835g-intelligent.webp',
  'Two pots on the C835G, one held at 100°C', 498, 302
  FROM product WHERE slug = 'vatti-ai-hob-c835g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', 'It matches the pot',
  'Different pots take heat differently, so the hob runs a different algorithm for each: the trace on the screen is the actual temperature chasing the set one, and the gap between them is what the matching closes.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c835g-pot-mode.webp',
  'The C835G temperature trace, actual against setting', 720, 832
  FROM product WHERE slug = 'vatti-ai-hob-c835g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', 'Anti-dry burning, and a 99 minute timer',
  'The left burner carries a temperature probe: past the critical value it cuts the flame by itself. The timer runs to 99 minutes with an on-screen reminder and an automatic gas cut-off at the end.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c835g-timer.webp',
  'Two pots timed on the C835G', 720, 291
  FROM product WHERE slug = 'vatti-ai-hob-c835g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'split', '3D oxygen input',
  'Air is taken in on three levels, and the labels on the diagram are those levels: twelve intake slots spiralling the top air, a skeletonizer guiding the central air, and a wide pilot tube siphoning the bottom air.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c835g-oxygen.webp',
  'The three air paths into the C835G burner, each labelled', 720, 845
  FROM product WHERE slug = 'vatti-ai-hob-c835g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 8, 'card', 'Jet rotor fire cover',
  'Sixteen rotating wings, which is where the whirling flame comes from.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c835g-gold-trim.webp',
  'The black jet rotor fire cover of the C835G', 324, 364
  FROM product WHERE slug = 'vatti-ai-hob-c835g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 9, 'card', 'Enamel cross pot holder',
  'Flat steel, wear and corrosion resistant, spreading the load of a heavy wok.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c835g-panel.webp',
  'The enamel cross pot holder on the C835G', 324, 374
  FROM product WHERE slug = 'vatti-ai-hob-c835g';

-- professional-series-c720s -------------------------------------------------
-- Tall posters, heading over photograph. VATTI-C720S-Cooker-Hob_11-1 is the
-- specification panel and is dropped; its figures, cut-out included, are in
-- product_dimension.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c720s-hero.webp',
  'The C720S three-burner hob set into a light counter', 640, 645
  FROM product WHERE slug = 'professional-series-c720s';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', 'The "Thor" burner',
  'A patented wok burner with stepless control: the flame holds steady through multiple segments rather than jumping between settings, which is what lets one burner sear and then simmer without being relit.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c720s-thor.webp',
  'The C720S wok burner at full flame', 384, 629
  FROM product WHERE slug = 'professional-series-c720s';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'X-Max square pan support',
  'A square frame rather than a star: it converges the heat back toward the pan, and it holds a wok steady enough that a hard stir-fry does not walk it off the burner.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c720s-pan-support.webp',
  'The X-Max square pan support of the C720S', 640, 804
  FROM product WHERE slug = 'professional-series-c720s';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'One integrated top sheet',
  'The top is a single piece of 0.8 mm stainless steel with no seam around the burners, so what spills wipes off rather than settling into a joint.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c720s-easy-clean.webp',
  'A hand wiping water off the C720S top', 640, 685
  FROM product WHERE slug = 'professional-series-c720s';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', 'A child lock in the valve',
  'The knob has to be pressed down and turned counter-clockwise to light, and there is a micro-switch behind it. A curious hand cannot start the gas by turning a knob.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c720s-child-lock.webp',
  'A child beside a kitchen counter with the C720S locked', 640, 563
  FROM product WHERE slug = 'professional-series-c720s';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', 'A Spanish flame failure device',
  'If the flame goes out, because a pan has boiled over or a draught has taken it, the device senses it and stops the gas. It is the original Spanish part rather than a copy of it.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c720s-flame-failure.webp',
  'The C720S burner ring and its flame failure sensor', 640, 332
  FROM product WHERE slug = 'professional-series-c720s';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c720s-detail.webp',
  'A design sketch of the C720S being drawn', 640, 888
  FROM product WHERE slug = 'professional-series-c720s';

-- professional-series-c821g -------------------------------------------------
-- Four tall posters. Cooker-hob-C821G_5 is the dimension panel and is dropped;
-- its figures are in product_dimension.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'split', 'Rotational polythermal force',
  'Two flame rings doing different work: an inner double-layer flame for concentrated heat under the base, and an outer ring that turns the heat around the sides of the pan. 4.5 kW on each burner, at Grade 1 energy efficiency.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c821g-hero.webp',
  'The C821G burner lit, its inner and outer flame rings marked', 720, 486
  FROM product WHERE slug = 'professional-series-c821g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', '3D oxygen input',
  'Air enters on three levels, and the labels on the diagram are those levels: twelve intake slots spiralling the top air, a skeletonizer guiding the central air, and a wide pilot tube siphoning the bottom air.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c821g-oxygen.webp',
  'The three air paths into the C821G burner, each labelled', 720, 870
  FROM product WHERE slug = 'professional-series-c821g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'On the counter, or into it',
  'The same hob sits on a table top or drops into a cut-out, which is worth knowing before the joinery is ordered rather than after.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c821g-install.webp',
  'The C821G shown both on a counter and built in', 720, 205
  FROM product WHERE slug = 'professional-series-c821g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'The valve closes itself',
  'On an accidental shutdown the safety device senses it instantly, closes the gas valve and cuts the supply. Ignition is auto spark, from a battery.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/c821g-safety.webp',
  'The C821G safety valve mechanism', 396, 486
  FROM product WHERE slug = 'professional-series-c821g';

-- vatti-oylimpic-hob-m822g --------------------------------------------------
-- Landscape posters plus one 109-frame GIF, cut at its last frame the same way
-- the V999 animations were. The Olympic torch imagery is VATTI's own story
-- about this burner and stays as the picture it is.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'split', 'Micro-flame combustion',
  'Nearly ten thousand precision fire holes across the plate instead of a ring of jets: 3.5 kW that reaches 1,000°C, with the heat spread evenly rather than concentrated in a circle.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/m822g-microflame.webp',
  'The M822G micro-flame plate glowing red', 1280, 562
  FROM product WHERE slug = 'vatti-oylimpic-hob-m822g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', 'The Olympic plate',
  'The plate is angled at 13.6 degrees so the air outlet is uniform across it, which is what stops a micro-flame burner developing quiet spots. It is the burner VATTI built for the Beijing Olympic torch.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/m822g-plate.webp',
  'The M822G burner plate, its angle marked 13.6 degrees', 576, 475
  FROM product WHERE slug = 'vatti-oylimpic-hob-m822g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'It was a torch first',
  'The Beijing Olympic torch had to stay lit in 65 km/h wind and 55 mm/hour rain. This is the same combustion idea, put under a wok.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/m822g-torch.webp',
  'The Beijing Olympic torch beside the M822G burner', 1280, 518
  FROM product WHERE slug = 'vatti-oylimpic-hob-m822g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'Steam on the left, stir-fry on the right',
  'The two sides are partitioned rather than identical: one burner is set up to hold a steady steam or simmer, the other to take a wok hard. Most cooking is both at once.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/m822g-partition.webp',
  'A steamer and a wok going together on the M822G', 1280, 490
  FROM product WHERE slug = 'vatti-oylimpic-hob-m822g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', '3D oxygen input',
  'Twelve intake slots spiralling the top air, a skeletonizer guiding the central air and a wide pilot tube siphoning the bottom air, which is how a plate of tiny holes gets enough oxygen to burn clean.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/m822g-oxygen.webp',
  'The three air paths into the M822G burner, each labelled', 1280, 490
  FROM product WHERE slug = 'vatti-oylimpic-hob-m822g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', 'Safety, and the glass',
  'On an accidental shutdown the safety device closes the gas valve and cuts the supply. The top is high-quality tempered glass, rated for high temperature and impact.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/m822g-safety.webp',
  'The M822G safety valve and glass top', 1280, 360
  FROM product WHERE slug = 'vatti-oylimpic-hob-m822g';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/m822g-kitchen.webp',
  'The M822G installed in two different kitchens', 1280, 446
  FROM product WHERE slug = 'vatti-oylimpic-hob-m822g';

-- vatti-built-in-oven-o755p -------------------------------------------------
-- Tall posters on the VATTI oven template, plus two 100-frame GIFs cut at their
-- last frame. Built-in-Oven-O755P-6 carries the dimension drawing and is
-- dropped; its figures are in product_dimension.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/o755p-hero.webp',
  'The O755P built into a dark kitchen column', 720, 832
  FROM product WHERE slug = 'vatti-built-in-oven-o755p';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', '75 litres, on five levels',
  'Five shelf positions in a 75 litre cavity, which is two trays of baking and a roast at the same time rather than one thing at a time in a full oven.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/o755p-capacity.webp',
  'The O755P loaded on several levels at once', 720, 998
  FROM product WHERE slug = 'vatti-built-in-oven-o755p';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'Eleven baking modes',
  'Enough separate programmes to cover a roast, a pizza, a tray bake and a slow finish without improvising with the fan setting.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/o755p-modes.webp',
  'Eight dishes the O755P bakes, arranged in a grid', 691, 1024
  FROM product WHERE slug = 'vatti-built-in-oven-o755p';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'A ceramic cavity, not enamel',
  'The surface is scratch-resistant and non-stick, so residue wipes off with a wet cloth rather than being soaked or scraped.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/o755p-ceramic.webp',
  'A cloth wiping the O755P ceramic cavity clean', 584, 400
  FROM product WHERE slug = 'vatti-built-in-oven-o755p';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', 'The difference against enamel',
  'The same spill on conventional enamel and on VATTI easy-clean ceramic. The labels on the picture are which is which.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/o755p-enamel.webp',
  'Conventional enamel beside VATTI easyclean ceramic, each labelled', 584, 367
  FROM product WHERE slug = 'vatti-built-in-oven-o755p';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', 'Telescopic runners',
  'The shelves slide out to you and lock in place, so a hot tray is lifted at arm''s length rather than reached for over a 200°C door.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/o755p-runners.webp',
  'A tray sliding out of the O755P on its telescopic runners', 584, 421
  FROM product WHERE slug = 'vatti-built-in-oven-o755p';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'split', 'Soft open, soft close',
  'A cushioning mechanism on the door: it neither drops open nor slams, which matters when what is in it has just risen.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/o755p-soft-close.webp',
  'The O755P door closing softly', 584, 346
  FROM product WHERE slug = 'vatti-built-in-oven-o755p';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 8, 'split', 'Child lock, and an alarm',
  'The control panel locks so a child cannot start the oven by leaning on it, and a timer alert tells you when the cooking is done rather than leaving you to remember.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/o755p-child-lock.webp',
  'The O755P control panel with the child lock engaged', 691, 973
  FROM product WHERE slug = 'vatti-built-in-oven-o755p';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 9, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/o755p-layers.webp',
  'The O755P cavity showing its five shelf levels', 720, 512
  FROM product WHERE slug = 'vatti-built-in-oven-o755p';

-- vatti-built-in-air-fryer-oven-07559 ---------------------------------------
-- Six tall posters on the same template. description-5 is the dimension panel
-- and is dropped; its figures are in product_dimension.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/o7559-hero.webp',
  'The 07559 air-fryer oven built into a kitchen column', 720, 896
  FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', 'Air-fry, in a full-size oven',
  'Double wall-mounted M-shaped elements across the top and one at the back: even heat, and the top of the cavity left clear. It air-fries a tray rather than a basket.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/o7559-airfry.webp',
  'The 07559 heating elements, each labelled', 720, 1075
  FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', '75 litres',
  'Several dishes and trays at once, which is the reason to give an air fryer a whole cabinet instead of a corner of the worktop.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/o7559-capacity.webp',
  'The 07559 loaded on several levels', 720, 998
  FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'Nine baking modes',
  'The air-fry programme sits alongside eight conventional ones, so it is an oven that also air-fries rather than an air fryer pretending to be an oven.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/o7559-modes.webp',
  'Eight dishes the 07559 cooks, arranged in a grid', 691, 973
  FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', 'The door comes off without tools',
  'Special latches release it, and the glass is three-layer low-E with high heat resistance. Taking the door off is how the inside of the glass gets cleaned.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/o7559-door.webp',
  'The 07559 door being lifted off, its glass layers labelled', 691, 1024
  FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559';

-- vatti-built-in-oven-o7549 -------------------------------------------------
-- Four tall posters plus two clean studio renders that need no crop.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/o7549-hero.webp',
  'The O7549 convection oven built into a kitchen column', 720, 896
  FROM product WHERE slug = 'vatti-built-in-oven-o7549';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', '75 litres of convection',
  'A full-size cavity with the fan doing the work: several trays at once, and the one at the back browning like the one at the front.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/o7549-capacity.webp',
  'The O7549 loaded on several levels', 720, 998
  FROM product WHERE slug = 'vatti-built-in-oven-o7549';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'Nine baking modes',
  'Nine separate programmes rather than a dial with three positions, which is what makes an oven repeatable from one weekend to the next.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/o7549-modes.webp',
  'Eight dishes the O7549 bakes, arranged in a grid', 691, 973
  FROM product WHERE slug = 'vatti-built-in-oven-o7549';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'The door comes off without tools',
  'Latches release it by hand, and the glass is three-layer low-E with high heat resistance and a high-quality enamel liner behind it.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/o7549-door.webp',
  'The O7549 door being lifted off, its glass layers labelled', 691, 1024
  FROM product WHERE slug = 'vatti-built-in-oven-o7549';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2023/11/Built-in-Oven-O754-3.webp',
  'The O7549 seen from the front, door closed', 1920, 864
  FROM product WHERE slug = 'vatti-built-in-oven-o7549';

-- built-in-combi-oven-va03 --------------------------------------------------
-- Ten tall posters plus a clean studio render. VA03-10-1 is a table of steaming
-- times and VA03-11-1 a function list: both are text set as pixels and are
-- dropped, their content moving into the FAQ and the block copy.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2023/11/Built-in-Combi-Oven-VA03-2-1.webp',
  'The VA03 combi oven, door open', 6000, 4000
  FROM product WHERE slug = 'built-in-combi-oven-va03';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', 'Fourteen cooking functions',
  'Three steam settings (low, standard and high), eight oven functions and three combi modes that run steam and heat together. The icons on the picture are the six the marketing leads with.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va03-hero.webp',
  'The VA03 open with a roast inside, its six headline functions marked', 720, 845
  FROM product WHERE slug = 'built-in-combi-oven-va03';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'Two nozzles, no dripping',
  'Most steam ovens put the steam pressure at the top, which loses steam and drips condensation onto the food. The VA03 uses two nozzles with a heating tape above and a heating plate below, so the water goes into the cooking rather than onto it.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va03-nozzle.webp',
  'The VA03 double nozzle steam system', 720, 640
  FROM product WHERE slug = 'built-in-combi-oven-va03';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', 'A 1.3 litre tank you can reach',
  'The water tank is external, so it is refilled without opening the oven, and the cavity is seamless with a bottom heating plate that stops condensation collecting under the food.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va03-tank.webp',
  'The VA03 external water tank and cavity, each part labelled', 720, 896
  FROM product WHERE slug = 'built-in-combi-oven-va03';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 5, 'split', '3D convection',
  'An upper multi-dimension baking tube, hot air circulating in three dimensions and a dual-dimension tube at the bottom. Between them the temperature at the back of the oven matches the front.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va03-convection.webp',
  'The VA03 heating elements and air circulation, each labelled', 720, 845
  FROM product WHERE slug = 'built-in-combi-oven-va03';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 6, 'split', 'Top and bottom, set apart',
  'The upper and lower elements hold their own temperatures, so each part of a dish can be given the heat it actually wants rather than a compromise between them.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va03-dual-temp.webp',
  'The VA03 dual temperature control diagram', 720, 691
  FROM product WHERE slug = 'built-in-combi-oven-va03';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 7, 'split', 'Three humidity levels, three results',
  'High humidity for meat, medium for chicken, low for vegetables: juicy at one end and crisp at the other, which is the whole reason to put steam in an oven.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va03-humidity.webp',
  'Meat, chicken and vegetables, each labelled with its humidity level', 720, 896
  FROM product WHERE slug = 'built-in-combi-oven-va03';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 8, 'split', '68 auto menus',
  'Master chef recipes with the temperature and time already set, plus fermentation, yogurt, steamed rice, keep warm, defrost and a self-clean cycle.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va03-menus.webp',
  'The VA03 auto menu functions, each labelled', 720, 845
  FROM product WHERE slug = 'built-in-combi-oven-va03';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 9, 'split', 'Blue enamel, and a cycle that cleans it',
  'A high-temperature blue enamel panel with a smooth surface, an auto-clean that softens the grease with steam and kills bacteria, and a bacteriostatic drying cycle after it. There is a timer alert, a lack-of-water alert and an error alert.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va03-enamel.webp',
  'The VA03 enamel cavity and its cleaning cycle, each labelled', 720, 742
  FROM product WHERE slug = 'built-in-combi-oven-va03';

-- built-in-steam-oven-z4501 -------------------------------------------------
-- Two posters and two animations, the GIFs cut at their last frame.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'split', '42 litres, and a dual nozzle',
  'A pure steam oven rather than a combi: 42 litres, six auto menus plus two, dual steam nozzles and accurate temperature control across the cavity.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/z4501-hero.webp',
  'The Z4501 steam oven with its four headline features marked', 720, 845
  FROM product WHERE slug = 'built-in-steam-oven-z4501';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', 'Steam and grill, 100°C to 230°C',
  'Steam alone keeps food tender but pale; the grill above it browns the surface. Running both is how a steamed dish comes out looking cooked.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/z4501-steam-grill.webp',
  'The Z4501 grilling under steam', 608, 346
  FROM product WHERE slug = 'built-in-steam-oven-z4501';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'Top and bottom heating tape',
  'Elements above and below the cavity keep the ceiling hot enough that steam does not condense there and drip onto the food, which is the usual complaint about a cheap steam oven.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/z4501-no-drip.webp',
  'The Z4501 cavity with its top and bottom heating tapes', 720, 422
  FROM product WHERE slug = 'built-in-steam-oven-z4501';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 4, 'split', '68 chef recipes, adjusted to the portion',
  'Set the dish and the amount and the oven works out the time and the temperature: two fish or five, 150 grams or 400. The labels on the dial are those portions.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/z4501-recipes.webp',
  'The Z4501 dial with portion sizes marked around it', 608, 799
  FROM product WHERE slug = 'built-in-steam-oven-z4501';

-- free-standing-combi-oven-va01 ---------------------------------------------
-- One poster and two animations. Picture1.gif is a Chinese-language panel and
-- is dropped rather than shown untranslated on an English page; its claim, a
-- 1200W sauna steam reaching steam in 30 seconds, is in the copy instead.

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 1, 'banner', NULL, NULL,
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va01-hero.webp',
  'The VA01 free-standing combi oven on a counter', 720, 717
  FROM product WHERE slug = 'free-standing-combi-oven-va01';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 2, 'split', 'Steam and grill together',
  '100°C to 230°C with steam behind it: tender inside, browned outside, in a 25 litre box that stands on the counter rather than needing a cabinet.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va01-steam-grill.webp',
  'The VA01 grilling under steam', 608, 346
  FROM product WHERE slug = 'free-standing-combi-oven-va01';

INSERT INTO product_feature (product_id, position, layout, title, body_md, image_url, image_alt, image_w, image_h)
SELECT id, 3, 'split', 'One machine, six other jobs',
  'Fermentation, yogurt, keep warm, dehydration, defrost and disinfection, each on the intelligent menu with the temperature and time already worked out.',
  'https://pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev/2026/08/va01-functions.webp',
  'The VA01 functions, each with the dish it produces', 720, 512
  FROM product WHERE slug = 'free-standing-combi-oven-va01';


