-- Recipe refresh, batch two (2026-11-26): four more old English recipes
-- rewritten around the VATTI appliance that cooks them, in the pattern of
-- refresh-recipes-2026-11.sql (quick answer, FAQs, product panels, "Cooked in"
-- appliance line, keywords). URLs, slugs and featured images unchanged.
--
-- Chosen on Malaysian search demand (Ubersuggest MY, 2026-11-26) rather than
-- current traffic, which is near nil: baked potato 1,900/mo (SD 61), roasted
-- potatoes 720 (SD 51, 1,300 in December), scallion pancake 720 (SD 25),
-- baked sweet potato 480 (SD 39), air fryer potato 390, keledek bakar 70.
-- GSC, 28 Aug to 26 Nov, page filter: cheesy-baked-potato 28 impressions /
-- 1 click; scallion-pancake 39 / 2 (葱油饼 recipe, pos 7.9); oven-roasted-
-- potatoes and baked-sweet-potato-recipes no data.
--
-- The three potato recipes lead with the air-fry modes. VATTI claims are from
-- product_spec / product_feature only: 07559 air fry function with an air fry
-- rack and 75 L; VA06 two air-fry modes, root crops and meat; VA05 an
-- air-fryer function. No air-fry temperature is claimed for any VATTI oven;
-- the times given are kitchen practice. Scallion pancake is a hob dish and
-- links the hob and hood categories, with no model claims.
--
-- Fixed: two "What Do You Eat with Acai Bowl?" style headings and a mislabelled
-- "Preparing the Filling" heading; the scallion dough at 96% hydration (250 g
-- flour, 240 ml water) replaced with a standard 70% hot-water dough; the sweet
-- potato card, which described a casserole while the photo and title are a
-- whole baked sweet potato, now matches both; an off-topic "how do I keep
-- pancakes fluffy" FAQ dropped. Calories NULL on all four (not measured). No
-- prices, running costs, installation copy, rival brands or em dashes.
-- en-MY only, per CLAUDE.md.

-- Cheesy Baked Potato Recipe, in the Oven or Air Fryer
UPDATE article SET
  title = 'Cheesy Baked Potato Recipe, in the Oven or Air Fryer',
  h1 = 'Cheesy Baked Potatoes: Crisp Skins, Fluffy Centres',
  meta_description = 'Bake potatoes at 200°C until the skins crisp, then fill them with a cheesy mash and bake again. Oven and air-fry times, and which potatoes to buy.',
  word_count = 767,
  reading_minutes = 4,
  modified_at = '2026-11-26T22:00:00+08:00',
  body_md = 'A cheesy baked potato is a whole potato baked until the skin is crisp and the inside is fluffy, then scooped out, mashed with cheese and cream, piled back into the skin and baked again until golden. It takes about an hour in the oven at 200°C, or a little less in an air-fry mode, and most of that time is hands-off.

### Quick answer

- **Oven:** 200°C top and bottom heat, potatoes straight on the rack, 50 to 60 minutes.
- **Air-fry mode:** about 40 to 45 minutes for a large potato, turned once.
- **Done when:** a skewer slides into the centre with no resistance.
- **Second bake:** 10 to 15 minutes after filling, until the cheese bubbles.
- **Potatoes:** large, floury potatoes of about 250 g each.

## Which potatoes to use

Choose large, floury potatoes. In Malaysian supermarkets the big brown-skinned potatoes sold for baking or for chips work best; small waxy potatoes stay dense and do not fluff. Pick potatoes of the same size so they finish together, scrub them and dry them well. A dry skin is a crisp skin.

## Baking potatoes in the oven

Prick each potato a few times with a fork, rub it with a little oil and salt, and bake it straight on the oven rack with a tray on the shelf below. On the rack, the hot air reaches the whole potato and the skin crisps all round. Foil steams the potato instead, which gives a soft skin: leave it off.

At 200°C a 250 g potato takes 50 to 60 minutes. Squeeze it in a cloth: it should give easily.

## Baking potatoes in an air fryer oven

An air-fry mode moves hot air quickly round the potatoes, which crisps the skin faster than a conventional bake. Lay the potatoes on the air fry rack with space between them and turn them once halfway.

Three VATTI ovens air-fry in the oven cavity itself, so a whole tray cooks at once instead of a basket at a time. The [VATTI 07559 built-in air fryer oven](/vatti-built-in-air-fryer-oven-07559/) comes with an air fry rack and has a 75 litre cavity. The [VA06](/vatti-magic-series-combi-oven-va06/) combi oven has two air-fry modes, one for root crops and one for meat; use the root crops mode for potatoes. The [VA05](/built-in-combi-oven-va05/) combi oven lists an air-fryer function alongside its baking modes.

[![VATTI 07559 built-in air fryer oven](https://cdn.vattimalaysia.com/2024/08/Built-in-air-fryer-oven-07559-product-photo.webp)](/vatti-built-in-air-fryer-oven-07559/)
[![VATTI VA06 combi oven](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-combi-oven-va06-front.webp)](/vatti-magic-series-combi-oven-va06/)

## Making the cheesy filling

Let the potatoes cool for 10 minutes, cut them in half lengthways and scoop out the flesh, leaving a shell about 5 mm thick. Mash the flesh with butter, sour cream and most of the cheese, and season it well. Greek yoghurt or cream cheese works in place of sour cream. Pile the filling back into the skins, top with the rest of the cheese and bake for 10 to 15 minutes until golden and bubbling.

## Toppings to try

- **Chicken and cheese:** stir shredded roast chicken into the filling.
- **Tuna and corn:** a Malaysian favourite, with a little mayonnaise.
- **Broccoli and cheddar:** blanched florets folded into the mash.
- **Spring onion and chilli:** for heat, with a spoon of sambal on the side.

## Cheesy baked potato FAQs

**How long do you bake a potato at 200°C?**
50 to 60 minutes for a large potato of about 250 g, straight on the oven rack. Smaller potatoes take 40 to 45 minutes. A skewer should slide into the centre with no resistance.

**Should I wrap baked potatoes in foil?**
No, not if you want a crisp skin. Foil traps the steam and leaves the skin soft. Bake the potato bare, rubbed with oil and salt.

**Can I bake potatoes in an air fryer?**
Yes. A large potato takes about 40 to 45 minutes in an air-fry mode, turned once. The skin comes out crisper than in a conventional oven.

**Why is my baked potato hard in the middle?**
It needed longer, or it was a waxy potato. Test with a skewer rather than the clock, and use large floury potatoes.

**Can I make cheesy baked potatoes ahead?**
Yes. Fill the skins, cover and chill for up to a day, then bake at 200°C for 20 to 25 minutes until hot through and golden.

## More recipes for a VATTI oven

- [Crispy roasted potatoes](/recipe/oven-roasted-potatoes/)
- [Baked sweet potatoes](/recipe/baked-sweet-potato-recipes/)
- [Easy chicken lasagna](/recipe/simple-chicken-lasagna-recipe/)
- [Steamed fish, Cantonese and Malay lime styles](/recipe/steamed-fish-recipe/)

## Final thoughts

A good baked potato needs a floury potato, a bare skin and enough time. The cheesy filling turns it into a meal. See the [VATTI built-in and combi ovens](/combi-and-steam-oven-in-malaysia/) for ovens that bake and air-fry in one cavity.

[Explore VATTI ovens](/combi-and-steam-oven-in-malaysia/)'
WHERE id = 48 AND lang = 'en-MY';
UPDATE image SET alt = 'Two twice-baked cheesy potatoes with golden melted cheddar and chopped parsley on baking paper.' WHERE id = 511;
UPDATE recipe SET name = 'Cheesy Baked Potatoes', description = 'Whole potatoes baked until crisp-skinned and fluffy, filled with a cheesy mash and baked again until golden.', prep_minutes = 15, cook_minutes = 70, total_minutes = 85, yield_qty = '4', yield_label = '4 servings', cuisine = 'Western', meal_category = 'Side Dish', calories = NULL, notes = 'In an air-fry mode, bake the potatoes for about 40 to 45 minutes, turning once, then fill and finish as below. Greek yoghurt or cream cheese can replace the sour cream.', appliance_md = '[07559](/vatti-built-in-air-fryer-oven-07559/) built-in air fryer oven, or the [VA05](/built-in-combi-oven-va05/) or [VA06](/vatti-magic-series-combi-oven-va06/) combi oven, bake or air-fry', keywords = 'baked potato, cheesy baked potato, twice baked potato, baked potato in oven, air fryer baked potato' WHERE id = 13 AND article_id = 48;
DELETE FROM recipe_ingredient WHERE recipe_id = 13;
DELETE FROM recipe_step WHERE recipe_id = 13;
INSERT INTO recipe_ingredient (recipe_id, position, text) VALUES
  (13, 1, '4 large floury potatoes, about 250 g each'),
  (13, 2, '1 tbsp cooking oil'),
  (13, 3, '1 tsp salt, plus more to season'),
  (13, 4, '30 g butter'),
  (13, 5, '1/2 cup (120 g) sour cream, Greek yoghurt or cream cheese'),
  (13, 6, '1 cup (100 g) grated cheddar'),
  (13, 7, '2 stalks spring onion or a few chives, chopped'),
  (13, 8, 'Black pepper, to taste');
INSERT INTO recipe_step (recipe_id, position, text) VALUES
  (13, 1, 'Preheat the oven to 200°C, top and bottom heat.'),
  (13, 2, 'Scrub and dry the potatoes, prick them with a fork and rub with the oil and salt.'),
  (13, 3, 'Bake directly on the rack, with a tray below, for 50 to 60 minutes until a skewer slides in easily.'),
  (13, 4, 'Cool for 10 minutes, halve lengthways and scoop out the flesh, leaving a 5 mm shell.'),
  (13, 5, 'Mash the flesh with the butter, sour cream, three quarters of the cheese and the spring onion, and season with salt and pepper.'),
  (13, 6, 'Pile the filling back into the skins and top with the rest of the cheese.'),
  (13, 7, 'Bake for 10 to 15 minutes more, until golden and bubbling, and serve hot.');

-- Crispy Roasted Potatoes in the Oven or Air Fryer
UPDATE article SET
  title = 'Crispy Roasted Potatoes in the Oven or Air Fryer',
  h1 = 'Crispy Oven Roasted Potatoes, and the Air Fryer Method',
  meta_description = 'Crispy roasted potatoes: parboil, rough up and roast at 220°C for 35 to 40 minutes, or air-fry in about 25. The steps that make them crunchy.',
  word_count = 677,
  reading_minutes = 4,
  modified_at = '2026-11-26T22:00:00+08:00',
  body_md = 'Crispy roasted potatoes are parboiled for a few minutes, shaken in the pot to rough up their edges, tossed in hot oil and roasted at 220°C for 35 to 40 minutes until deep golden. The rough edges are what turn crunchy. In an air-fry mode the same potatoes take about 25 minutes with less oil.

### Quick answer

- **Oven:** 220°C top and bottom heat for 35 to 40 minutes, turned once.
- **Air-fry mode:** about 25 minutes, shaken halfway, with half the oil.
- **Parboil:** 7 to 8 minutes in salted water, until the edges soften.
- **Crunch:** comes from roughed-up edges and a single, uncrowded layer.
- **Serves:** 4 as a side dish.

## Why parboil potatoes before roasting

Raw potatoes roasted straight from the board brown on the outside before the inside is soft, and their surface stays smooth. A short boil cooks them partly through and softens the outside, and a shake in the pot roughs up that surface into a fluffy layer. In the oven, that layer fries in the oil and becomes the crust.

Cut the potatoes into even 4 to 5 cm chunks, boil them for 7 to 8 minutes in well-salted water, drain them and let them steam dry for a few minutes before shaking.

## Roasting in the oven

Heat the oil in the roasting tray in the oven for 5 minutes first, so the potatoes sizzle when they go in. Spread them in one layer with space between: crowded potatoes steam instead of roasting. Roast at 220°C for 20 minutes, turn them, and roast for 15 to 20 minutes more until deep golden.

## Roasting potatoes in an air fryer oven

In an air-fry mode, fast-moving hot air crisps the potatoes with about half the oil, and they are ready in roughly 25 minutes. Spread them on the air fry rack or tray in one layer and shake or turn them halfway.

Three VATTI ovens air-fry in the oven cavity itself, so a whole tray cooks at once instead of a basket at a time. The [VATTI 07559 built-in air fryer oven](/vatti-built-in-air-fryer-oven-07559/) comes with an air fry rack and has a 75 litre cavity. The [VA06](/vatti-magic-series-combi-oven-va06/) combi oven has two air-fry modes, one for root crops and one for meat; use the root crops mode for potatoes. The [VA05](/built-in-combi-oven-va05/) combi oven lists an air-fryer function alongside its baking modes.

[![VATTI 07559 built-in air fryer oven](https://cdn.vattimalaysia.com/2024/08/Built-in-air-fryer-oven-07559-product-photo.webp)](/vatti-built-in-air-fryer-oven-07559/)
[![VATTI VA06 combi oven](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-combi-oven-va06-front.webp)](/vatti-magic-series-combi-oven-va06/)
[![VATTI VA05 combi oven](https://cdn.vattimalaysia.com/2026/08/built-in-combi-oven-va05-front.webp)](/built-in-combi-oven-va05/)

## Flavours to try

- **Garlic and rosemary:** add crushed garlic cloves and rosemary for the last 10 minutes.
- **Paprika and cumin:** toss in the spices with the oil.
- **Parmesan:** scatter grated Parmesan over for the last 5 minutes.
- **Sambal:** toss the hot potatoes in a spoon of sambal and top with fried shallots.

## Roasted potato FAQs

**What temperature do you roast potatoes at?**
220°C with top and bottom heat, for 35 to 40 minutes, turned once. With the fan on, use 200°C.

**Why are my roasted potatoes not crispy?**
The tray was crowded, the oil was not hot, or the potatoes were wet. Parboil and dry them, heat the oil first, and roast in a single layer with space between.

**Do I have to parboil potatoes before roasting?**
No, but they are crisper and fluffier if you do. Unboiled potatoes need about 45 minutes at 220°C and come out smoother on the outside.

**How long do potatoes take in an air fryer?**
About 25 minutes for parboiled 4 cm chunks, or 25 to 30 minutes from raw, shaken halfway. Check them from 20 minutes.

**Which potatoes are best for roasting?**
Floury or all-purpose potatoes, which go fluffy inside. Small waxy potatoes stay firm and can be roasted whole without parboiling.

## More recipes for a VATTI oven

- [Cheesy baked potatoes](/recipe/cheesy-baked-potato/)
- [Baked sweet potatoes](/recipe/baked-sweet-potato-recipes/)
- [Easy chicken lasagna](/recipe/simple-chicken-lasagna-recipe/)
- [Spicy enoki mushrooms with garlic chilli oil](/recipe/spicy-enoki-mushrooms-recipe-step-by-step-guide/)

## Final thoughts

Parboil, rough up, hot oil, one layer: that is the whole method for crispy roasted potatoes, in an oven or in an air-fry mode. See the [VATTI built-in and combi ovens](/combi-and-steam-oven-in-malaysia/) for ovens that air-fry a full tray.

[Explore VATTI ovens](/combi-and-steam-oven-in-malaysia/)'
WHERE id = 49 AND lang = 'en-MY';
UPDATE image SET alt = 'Golden, crisp-edged roasted potato cubes in a white baking dish, with a bottle of olive oil and a sprig of rosemary beside it.' WHERE id = 512;
UPDATE recipe SET name = 'Crispy Roasted Potatoes', description = 'Parboiled potato chunks roughed up and roasted in hot oil until deep golden and crunchy outside, fluffy inside.', prep_minutes = 15, cook_minutes = 40, total_minutes = 55, yield_qty = '4', yield_label = '4 servings', cuisine = 'Western', meal_category = 'Side Dish', calories = NULL, notes = 'In an air-fry mode, use 2 tbsp oil and cook for about 25 minutes, shaking halfway. With a fan oven, roast at 200°C.', appliance_md = '[07559](/vatti-built-in-air-fryer-oven-07559/) built-in air fryer oven, or the [VA06](/vatti-magic-series-combi-oven-va06/) (root crops air-fry mode) or [VA05](/built-in-combi-oven-va05/) combi oven', keywords = 'roasted potatoes, crispy roasted potatoes, oven roasted potatoes, air fryer potatoes, roast potatoes recipe' WHERE id = 14 AND article_id = 49;
DELETE FROM recipe_ingredient WHERE recipe_id = 14;
DELETE FROM recipe_step WHERE recipe_id = 14;
INSERT INTO recipe_ingredient (recipe_id, position, text) VALUES
  (14, 1, '1 kg potatoes, peeled and cut into 4 to 5 cm chunks'),
  (14, 2, '1 tbsp salt, for the boiling water'),
  (14, 3, '4 tbsp cooking oil or olive oil'),
  (14, 4, '1 tsp paprika (optional)'),
  (14, 5, '1/2 tsp garlic powder or 4 cloves garlic, crushed'),
  (14, 6, 'Salt and black pepper, to taste'),
  (14, 7, 'Chopped parsley or rosemary, to serve');
INSERT INTO recipe_step (recipe_id, position, text) VALUES
  (14, 1, 'Preheat the oven to 220°C, top and bottom heat, and put the oil in a roasting tray to heat for 5 minutes.'),
  (14, 2, 'Boil the potatoes in salted water for 7 to 8 minutes, until the edges soften.'),
  (14, 3, 'Drain, leave to steam dry for 3 minutes, then shake in the pot to rough up the edges.'),
  (14, 4, 'Toss with the paprika, garlic, salt and pepper.'),
  (14, 5, 'Tip into the hot oil, turn to coat and spread in a single layer with space between.'),
  (14, 6, 'Roast for 20 minutes, turn, then roast 15 to 20 minutes more until deep golden.'),
  (14, 7, 'Scatter with parsley or rosemary and serve at once.');

-- Baked Sweet Potato (Keledek) in the Oven or Air Fryer
UPDATE article SET
  title = 'Baked Sweet Potato (Keledek) in the Oven or Air Fryer',
  h1 = 'How to Bake Sweet Potatoes: Soft, Caramelised and Easy',
  meta_description = 'Bake whole sweet potatoes (keledek) at 200°C for 45 to 60 minutes until soft and caramelised, or air-fry in about 35. Toppings, cubes and fries.',
  word_count = 734,
  reading_minutes = 4,
  modified_at = '2026-11-26T22:00:00+08:00',
  body_md = 'To bake a sweet potato, prick it, put it on a lined tray and bake it whole at 200°C for 45 to 60 minutes, until it is soft right through and its sugary juice starts to caramelise on the tray. Split it open, fluff the flesh and add butter and a pinch of salt. In an air-fry mode, a medium sweet potato takes about 35 to 40 minutes.

### Quick answer

- **Oven:** 200°C top and bottom heat, 45 to 60 minutes, on a lined tray.
- **Air-fry mode:** about 35 to 40 minutes, turned once.
- **Cubes:** 2.5 cm cubes roast in 25 to 30 minutes at 200°C.
- **Done when:** a knife slides in with no resistance and the skin puffs away from the flesh.
- **Keledek:** orange, purple and Japanese sweet potatoes all bake the same way.

## Which sweet potato to buy

Malaysian markets sell three common kinds of keledek: orange-fleshed, which is the softest and sweetest when baked; purple, which is drier and denser; and Japanese, with red skin and pale, chestnut-sweet flesh. All three bake the same way. Choose medium sweet potatoes of a similar size, about 200 to 250 g each, so they finish together.

## Baking sweet potatoes in the oven

Scrub and dry the sweet potatoes, prick them a few times, and bake them on a tray lined with baking paper. The lining matters: as they bake, a sticky syrup leaks out and burns onto a bare tray. Bake at 200°C for 45 to 60 minutes. Long, slow baking is what makes a sweet potato taste sweeter, because its starch turns to sugar as it heats through.

## Baking sweet potatoes in an air fryer oven

An air-fry mode bakes a sweet potato faster and gives a firmer, slightly crisp skin. Place them on the air fry rack with space between them and turn them once. For sweet potato fries, cut 1 cm batons, toss them in a spoon of oil and a little cornflour, and air-fry in one layer, shaking halfway.

Three VATTI ovens air-fry in the oven cavity itself, so a whole tray cooks at once instead of a basket at a time. The [VATTI 07559 built-in air fryer oven](/vatti-built-in-air-fryer-oven-07559/) comes with an air fry rack and has a 75 litre cavity. The [VA06](/vatti-magic-series-combi-oven-va06/) combi oven has two air-fry modes, one for root crops and one for meat; use the root crops mode for potatoes. The [VA05](/built-in-combi-oven-va05/) combi oven lists an air-fryer function alongside its baking modes.

[![VATTI 07559 built-in air fryer oven](https://cdn.vattimalaysia.com/2024/08/Built-in-air-fryer-oven-07559-product-photo.webp)](/vatti-built-in-air-fryer-oven-07559/)
[![VATTI VA06 combi oven](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-combi-oven-va06-front.webp)](/vatti-magic-series-combi-oven-va06/)

## Ways to serve baked sweet potato

- **Simple:** butter and a pinch of salt.
- **Sweet:** a drizzle of honey or gula melaka syrup and a pinch of cinnamon.
- **Savoury and filling:** black beans, corn, tomato and avocado, with a spoon of yoghurt.
- **Mashed:** scooped out and mashed with butter, as a side for roast chicken.

## Baked sweet potato FAQs

**How long do you bake a sweet potato at 200°C?**
45 to 60 minutes for a whole medium sweet potato of 200 to 250 g. Cubes take 25 to 30 minutes. A knife should slide in with no resistance.

**Do you need to poke holes in sweet potatoes before baking?**
It is a good habit. A few holes let the steam escape so the skin does not split. Line the tray, because the sweet potato will leak a sticky syrup.

**Can I bake sweet potatoes in an air fryer?**
Yes. A whole medium sweet potato takes about 35 to 40 minutes in an air-fry mode, turned once, and the skin comes out firmer than in an oven.

**Should I wrap sweet potatoes in foil?**
Only if you want a soft, steamed skin. For caramelised flesh and a drier skin, bake them bare on a lined tray.

**Is baked sweet potato healthy?**
Sweet potatoes are a good source of fibre, and orange ones are rich in beta-carotene. Baking needs no oil, so it is one of the lightest ways to cook them.

## More recipes for a VATTI oven

- [Crispy roasted potatoes](/recipe/oven-roasted-potatoes/)
- [Cheesy baked potatoes](/recipe/cheesy-baked-potato/)
- [Moist chocolate steamed cake (kek kukus coklat)](/recipe/moist-chocolate-steamed-cake/)
- [Steamed fish, Cantonese and Malay lime styles](/recipe/steamed-fish-recipe/)

## Final thoughts

A baked sweet potato needs nothing but heat and time: a lined tray, 200°C and an hour, or a little less in an air-fry mode. See the [VATTI built-in and combi ovens](/combi-and-steam-oven-in-malaysia/) for ovens that bake and air-fry in one cavity.

[Explore VATTI ovens](/combi-and-steam-oven-in-malaysia/)'
WHERE id = 50 AND lang = 'en-MY';
UPDATE image SET alt = 'Baked orange sweet potatoes split open on a wooden board, the soft flesh fluffed with a fork and topped with melting butter.' WHERE id = 513;
UPDATE recipe SET name = 'Baked Sweet Potatoes', description = 'Whole sweet potatoes baked until soft and caramelised, split open and finished with butter and salt.', prep_minutes = 5, cook_minutes = 55, total_minutes = 60, yield_qty = '4', yield_label = '4 servings', cuisine = 'Western, Malaysian', meal_category = 'Side Dish', calories = NULL, notes = 'In an air-fry mode, cook for about 35 to 40 minutes, turning once. For 2.5 cm cubes, toss in 1 tbsp oil and roast at 200°C for 25 to 30 minutes.', appliance_md = '[07559](/vatti-built-in-air-fryer-oven-07559/) built-in air fryer oven, or the [VA06](/vatti-magic-series-combi-oven-va06/) (root crops air-fry mode) or [VA05](/built-in-combi-oven-va05/) combi oven', keywords = 'baked sweet potato, how to bake sweet potato, keledek bakar, sweet potato in oven, air fryer sweet potato' WHERE id = 15 AND article_id = 50;
DELETE FROM recipe_ingredient WHERE recipe_id = 15;
DELETE FROM recipe_step WHERE recipe_id = 15;
INSERT INTO recipe_ingredient (recipe_id, position, text) VALUES
  (15, 1, '4 medium sweet potatoes (keledek), about 200 to 250 g each'),
  (15, 2, '30 g butter'),
  (15, 3, 'Salt, to taste'),
  (15, 4, 'Honey, gula melaka syrup or cinnamon, to serve (optional)');
INSERT INTO recipe_step (recipe_id, position, text) VALUES
  (15, 1, 'Preheat the oven to 200°C, top and bottom heat, and line a tray with baking paper.'),
  (15, 2, 'Scrub and dry the sweet potatoes and prick each one a few times with a fork.'),
  (15, 3, 'Bake on the tray for 45 to 60 minutes, until a knife slides in easily and the skin puffs.'),
  (15, 4, 'Split each one open lengthways and fluff the flesh with a fork.'),
  (15, 5, 'Add butter and a pinch of salt, or honey and cinnamon, and serve hot.');

-- Scallion Pancake Recipe (葱油饼): Crispy and Flaky Layers
UPDATE article SET
  title = 'Scallion Pancake Recipe (葱油饼): Crispy and Flaky Layers',
  h1 = 'Scallion Pancakes (葱油饼): Crispy, Flaky, Made at Home',
  meta_description = 'Make crispy, flaky Chinese scallion pancakes (cong you bing) with a hot-water dough, an oil paste and the coil method. Dipping sauce and freezing tips.',
  word_count = 762,
  reading_minutes = 4,
  modified_at = '2026-11-26T22:00:00+08:00',
  body_md = 'Scallion pancakes (葱油饼, cōng yóu bǐng) are Chinese flatbreads made from a hot-water dough that is rolled thin, spread with an oil and flour paste and spring onion, rolled up, coiled and flattened again, then pan-fried until crisp. The coil is what makes the flaky layers. This recipe makes 4 large pancakes on a medium flame in about an hour, most of it resting time.

### Quick answer

- **Dough:** 300 g plain flour, 150 ml boiling water and 60 ml cold water.
- **Rest:** 30 minutes for the dough, then 10 minutes for the coils.
- **Layers:** roll thin, spread the oil paste, roll into a rope, coil like a snail and flatten.
- **Cooking:** medium flame, 3 to 4 minutes a side with a thin film of oil.
- **Makes:** 4 pancakes of about 20 cm.

## The dough: hot water, then cold

Boiling water partly cooks the flour, which makes the dough soft, easy to roll thin and tender after frying. A splash of cold water afterwards keeps some chew. Stir the boiling water into the flour with chopsticks, add the cold water, then knead for 5 minutes until smooth. Rest it, covered, for 30 minutes. A rested dough rolls thin without springing back.

## The oil paste and the coil

The flakiness comes from an oil paste (油酥): hot oil poured over flour, salt and a pinch of five-spice. Spread it thinly over the rolled dough before the spring onion goes on. As the pancake fries, the paste keeps the layers apart, and each one crisps on its own.

![Assembling Scallion Pancakes](https://cdn.vattimalaysia.com/2024/11/Assembling-Scallion-Pancakes.webp)

Roll each piece of dough into a thin rectangle, spread the paste, scatter the spring onion, then roll it up from the long side into a rope. Coil the rope into a snail, tuck the end underneath and rest it for 10 minutes. Then flatten it gently into a 20 cm round. Do not press hard: you want to keep the layers.

## Pan-frying on the hob

![Pan-frying Scallion Pancakes](https://cdn.vattimalaysia.com/2024/11/Pan-Frying-Scallion-Pancakes.webp)

Heat a thin film of oil in a flat pan over a medium flame. Fry each pancake for 3 to 4 minutes a side until golden and crisp, pressing it gently. Too high a flame browns the outside before the inner layers cook; too low and the pancake soaks up oil. As soon as it comes off the heat, push the sides in towards the centre with two spatulas. The scrunch breaks the layers apart and makes them flaky.

A gas hob that holds a steady medium flame makes this easy, and a hood on high pulls away the frying smoke. See the [VATTI cooker hobs](/cooker-hob-in-malaysia/) and [kitchen hoods](/kitchen-hood-in-malaysia/). To reheat leftovers, a few minutes in an air-fry mode, as on the [VATTI 07559 oven](/vatti-built-in-air-fryer-oven-07559/), brings back the crunch without more oil.

## Dipping sauce and serving

![Scallion Pancake with chili](https://cdn.vattimalaysia.com/2024/11/Scallion-Pancakes-with-chili.webp)

Mix 2 tbsp light soy sauce, 1 tbsp black vinegar, 1 tsp sugar, 1 tsp chilli oil and a little chopped garlic. Cut the pancakes into wedges and serve them hot with the sauce, with a fried egg rolled inside for breakfast, or alongside soup and noodles.

## Scallion pancake FAQs

**Why are my scallion pancakes not flaky?**
The dough was pressed too hard when flattened, the oil paste was left out, or the pancake was not scrunched after frying. Flatten the coil gently and scrunch it while hot.

**Why are my scallion pancakes tough?**
The dough used only cold water or was not rested. Use mostly boiling water, and rest the dough for 30 minutes before rolling.

**Can I make scallion pancakes ahead and freeze them?**
Yes. Freeze the flattened, uncooked pancakes between sheets of baking paper for up to 2 months, and fry them from frozen on a medium flame, a minute or two longer each side.

**What is the difference between Chinese and Korean green onion pancakes?**
Chinese scallion pancakes (葱油饼) are a layered, flaky flatbread made from dough. Korean pajeon is made from a batter, with whole spring onions and often seafood, and is softer.

**What are scallion pancakes called in Chinese?**
葱油饼, cōng yóu bǐng, which means spring onion oil pancake. They are also called green onion pancakes or spring onion pancakes.

## More recipes from VATTI

- [Spicy enoki mushrooms with garlic chilli oil](/recipe/spicy-enoki-mushrooms-recipe-step-by-step-guide/)
- [Steamed fish, Cantonese and Malay lime styles](/recipe/steamed-fish-recipe/)
- [Moist chocolate steamed cake (kek kukus coklat)](/recipe/moist-chocolate-steamed-cake/)
- [Cheesy baked potatoes](/recipe/cheesy-baked-potato/)

## Final thoughts

Scallion pancakes take a little practice and very few ingredients: a hot-water dough, an oil paste, a coil and a steady medium flame. See the [VATTI cooker hobs](/cooker-hob-in-malaysia/) for a flame that holds steady.

[Explore VATTI cooker hobs](/cooker-hob-in-malaysia/)'
WHERE id = 47 AND lang = 'en-MY';
UPDATE image SET alt = 'Golden, flaky Chinese scallion pancakes (葱油饼) cut into wedges on a dark plate with a bowl of soy and chilli dipping sauce.' WHERE id = 507;
UPDATE recipe SET name = 'Scallion Pancakes (葱油饼)', description = 'Flaky Chinese flatbreads of hot-water dough layered with an oil paste and spring onion, coiled, flattened and pan-fried until crisp.', prep_minutes = 50, cook_minutes = 15, total_minutes = 65, yield_qty = '4', yield_label = '4 pancakes', cuisine = 'Chinese', meal_category = 'Snack', calories = NULL, notes = 'Flatten the coils gently so the layers stay separate, and scrunch each pancake with two spatulas as soon as it comes off the heat. Uncooked pancakes freeze for up to 2 months; fry from frozen.', appliance_md = 'A gas hob on a medium flame, such as the [VATTI cooker hobs](/cooker-hob-in-malaysia/)', keywords = 'scallion pancake, 葱油饼, cong you bing, green onion pancake, spring onion pancake, chinese pancake recipe' WHERE id = 12 AND article_id = 47;
DELETE FROM recipe_ingredient WHERE recipe_id = 12;
DELETE FROM recipe_step WHERE recipe_id = 12;
INSERT INTO recipe_ingredient (recipe_id, position, text) VALUES
  (12, 1, '300 g plain flour'),
  (12, 2, '150 ml boiling water'),
  (12, 3, '60 ml cold water'),
  (12, 4, 'Oil paste: 3 tbsp cooking oil'),
  (12, 5, 'Oil paste: 2 tbsp plain flour'),
  (12, 6, 'Oil paste: 1 tsp salt'),
  (12, 7, 'Oil paste: 1/4 tsp five-spice powder (optional)'),
  (12, 8, '5 stalks spring onion, finely chopped'),
  (12, 9, 'Cooking oil, for frying');
INSERT INTO recipe_step (recipe_id, position, text) VALUES
  (12, 1, 'Stir the boiling water into the flour with chopsticks, add the cold water and knead for 5 minutes until smooth. Cover and rest for 30 minutes.'),
  (12, 2, 'For the oil paste, heat the oil until hot and pour it over the flour, salt and five-spice. Stir to a smooth paste.'),
  (12, 3, 'Divide the dough into 4 and roll each piece into a thin rectangle, about 20 x 30 cm.'),
  (12, 4, 'Spread a quarter of the oil paste over each rectangle and scatter with spring onion.'),
  (12, 5, 'Roll each one up from the long side into a rope, coil it into a snail, tuck the end under and rest for 10 minutes.'),
  (12, 6, 'Flatten each coil gently into a 20 cm round.'),
  (12, 7, 'Fry in a thin film of oil over a medium flame for 3 to 4 minutes a side, until golden and crisp.'),
  (12, 8, 'Push the sides towards the centre with two spatulas to separate the layers, cut into wedges and serve hot.');
