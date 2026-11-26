-- Recipe refresh (2026-11-26): appliance-led rewrites of the four old English
-- recipes that still earn impressions, plus the "Cooked in" appliance line and
-- Recipe keywords on all nine November recipe cards (three editions).
--
-- Why recipes: the six November appliance recipes (steamed fish, steamed cake,
-- EN/MS/ZH) earned 84 clicks / 7,079 impressions from 5 to 23 Nov, while the 26
-- older generic recipes earned 10 clicks between them (GSC, 27 Oct to 23 Nov).
-- The four below are the old ones Google still shows; each is rewritten around
-- the VATTI appliance that cooks it. URLs, slugs and featured images unchanged.
--
-- Pattern (as refresh-tier1-2026-11-*): a title that leads with the searched
-- term, a "### Quick answer" panel, FAQs as "**Q?** A" (rendered as disclosures,
-- and since this change also emitted as FAQPage JSON-LD), product panels, links
-- between the appliance recipes. Every VATTI claim is from product_spec /
-- product_feature: VA05 low/mid/high steam and dual temperature control, VA06
-- three steaming modes and dual temperature control, 07559 nine baking
-- functions and 75 L. No oven temperature is claimed for steam modes. Calories
-- set NULL on rewritten cards: the ingredients changed and no figure is
-- measured. No prices, running costs, installation copy, rival brands or em
-- dashes. en-MY only for the article UPDATEs, per CLAUDE.md.
--
-- Search Console, 28 Aug to 26 Nov 2026, page filter (query rows undercount):
-- spicy-enoki (id 6): 1,462 impressions / 1 click in the 27 Oct to 23 Nov window,
--   pos 10.5. Queries: spicy enoki mushroom recipe (pos 8.9), enoki chili oil
--   (6.8), chili oil enoki mushrooms, cooking enoki mushrooms, do you need to
--   wash enoki. Fixed: "millet spicy" (a literal translation of 小米辣, bird's
--   eye chilli), "dark light sauce", a 15-minute cook that the photos show was
--   a steamed plate; the two step photos with those captions burnt in dropped.
-- cream-puff (id 3): 547 impressions / 2 clicks, pos 6.9. Queries: custard cream
--   puff (122 imp, pos 6.8), cream puff custard, easy cream puff recipe with
--   custard filling. Fixed: the card listed 21 eggs for 210 g flour and sugar
--   in the choux; replaced with a standard choux and pastry cream in grams.
-- granola (id 45): 751 impressions / 2 clicks. Queries: baked granola, bake
--   granola, baking granola temperature, can you use quick oats for granola.
--   The closing link pointed at hobs; now ovens.
-- chicken-lasagna (id 51): 403 impressions / 1 click; "chicken lasagna" 309
--   impressions at pos 10.7, "chicken lasagna recipe" 46 at 7.4, "...red sauce".
--   Fixed: a "What Do You Eat with Acai Bowl?" heading and a hob link; ricotta
--   replaced by a white sauce, matching the photo.

-- Spicy Enoki Mushrooms with Garlic Chilli Oil (Steamed)
UPDATE article SET
  title = 'Spicy Enoki Mushrooms with Garlic Chilli Oil (Steamed)',
  h1 = 'Spicy Enoki Mushroom Recipe with Garlic and Chilli Oil',
  meta_description = 'Steamed enoki mushrooms with garlic, bird''s eye chilli and a sizzling oil and soy dressing. Ready in 20 minutes in a steam oven or a wok, for 2 to 3.',
  word_count = 798,
  reading_minutes = 4,
  modified_at = '2026-11-26T20:00:00+08:00',
  body_md = 'Spicy enoki mushrooms are steamed until just tender, then dressed with garlic, bird''s eye chilli, spring onion, a soy and oyster sauce mix and a spoon of sizzling chilli oil. It is a 20-minute side dish that goes with rice, noodles or a hot pot, and it steams on a plate in a steam oven or a wok.

### Quick answer

- **Time:** 10 minutes to prepare, 6 to 8 minutes to steam.
- **Steam setting:** the highest steam level, or a wok over rapidly boiling water.
- **Done when:** the stems are soft and limp but still have a little bite.
- **Heat:** 3 bird''s eye chillies is medium; use 1 for mild or 6 for very hot.
- **Serves:** 2 to 3 as a side dish.

## Preparing enoki mushrooms

Enoki (金针菇, sometimes sold as golden needle mushroom) come in a vacuum pack with the roots still joined in a spongy base. Cut off the bottom 2 to 3 cm, then pull the clump apart into small bunches so the steam and the sauce reach every strand. Rinse them quickly in cold water and shake them dry: enoki grow in a growing medium and should always be rinsed and cooked, never eaten raw.

Lay the bunches flat on a shallow heatproof plate with a rim. The rim matters: the sauce and the mushroom liquid collect on the plate and become the dressing.

![Garlic, chopped bird''s eye chilli and spring onion being spooned over raw enoki mushrooms laid flat on a white plate.](https://cdn.vattimalaysia.com/2023/11/step4_spicy-enoki-mushroom.webp)

## Steaming enoki in a steam oven

In a steam oven, the steam surrounds the plate evenly and nothing drips onto it, so the enoki cook through in one layer without going watery. Use the highest steam level for 6 to 8 minutes. Thin enoki overcook quickly: past 10 minutes they turn slippery and lose their bite.

Both VATTI combi ovens steam: the [VA05](/built-in-combi-oven-va05/) has low, mid and high steam modes and the [VA06](/vatti-magic-series-combi-oven-va06/) has three steaming modes. You can steam a plate of fish or a tray of rice at the same time on another shelf. Our guide to [what a steam oven is](/buying-guide/what-is-a-steam-oven/) explains how it works.

[![VATTI VA05 combi oven](https://cdn.vattimalaysia.com/2026/08/built-in-combi-oven-va05-front.webp)](/built-in-combi-oven-va05/)
[![VATTI VA06 combi oven](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-combi-oven-va06-front.webp)](/vatti-magic-series-combi-oven-va06/)

No steam oven? Set the plate on a rack in a wok over rapidly boiling water, cover and steam on high heat for the same time.

## The sauce and the sizzling oil

The sauce goes on before steaming so the enoki absorb it as they cook; the hot oil goes on after, to wake up the raw garlic and chilli on top.

![Soy and oyster sauce being spooned over enoki mushrooms topped with garlic and chilli before steaming.](https://cdn.vattimalaysia.com/2023/11/step9_spicy-enoki-mushroom.webp)

- **Oyster sauce and light soy** give the salt and depth.
- **A little sugar** rounds off the soy.
- **Sesame oil** goes in the sauce, not the hot oil: it burns at high heat.
- **Chilli oil** is optional. Without it the dish is garlicky rather than fiery.

## What to serve with spicy enoki

- **Steamed rice or plain noodles**, to soak up the sauce on the plate.
- **Steamed fish or tofu**, cooked in the same steam oven on another shelf.
- **Hot pot or steamboat**, as a ready-dressed side.
- **Stir-fried greens**, such as kailan or bok choy, for a contrast in texture.

## Spicy enoki FAQs

**How long do you steam enoki mushrooms?**
6 to 8 minutes on high steam, in a steam oven or a covered wok over boiling water. They are done when the stems are soft but still have a slight bite.

**Do you need to wash enoki mushrooms?**
Yes. Cut off the root base, separate the strands and rinse them quickly under cold water, then shake them dry. Enoki should always be cooked before eating.

**Can I cook enoki in the oven or air fryer instead?**
Yes, but it is a different dish. Dry heat crisps the tips and dries the strands; steam keeps them silky and lets them take up the sauce. For this recipe, steam.

**What is millet chilli?**
It is a translation of 小米辣, the Chinese name for bird''s eye chilli, which Malaysians call cili padi. It is small, thin and very hot.

**How long do enoki mushrooms keep?**
About a week in the fridge in their original pack. Once opened, wrap them in paper towel in a container and use them within two to three days. Throw them out if they turn brown or slimy.

**Are enoki mushrooms low in carbs?**
Yes. Enoki are mostly water and fibre and are low in calories and carbohydrate, which is why they turn up often in low-carb meals.

## More recipes for a VATTI oven

- [Steamed fish, Cantonese and Malay lime styles](/recipe/steamed-fish-recipe/)
- [Moist chocolate steamed cake (kek kukus coklat)](/recipe/moist-chocolate-steamed-cake/)
- [Cream puffs with custard filling](/recipe/cream-puff-with-custard-filing-recipe/)
- [Easy chicken lasagna](/recipe/simple-chicken-lasagna-recipe/)

## Final thoughts

Spicy enoki is one of the quickest dishes a steam oven makes: a plate in, eight minutes, a spoon of hot oil. See the [VATTI combi and steam ovens](/combi-and-steam-oven-in-malaysia/) for what else they steam.

[Compare VATTI combi ovens](/combi-and-steam-oven-in-malaysia/)'
WHERE id = 6 AND lang = 'en-MY';
UPDATE image SET alt = 'Steamed enoki mushrooms on a white plate, topped with chopped spring onion, garlic and red bird''s eye chilli in a soy and oyster sauce dressing.' WHERE id = 422;
UPDATE recipe SET name = 'Spicy Enoki Mushrooms with Garlic and Chilli Oil', description = 'Enoki mushrooms steamed under a soy and oyster sauce dressing with garlic, bird''s eye chilli and spring onion, finished with sizzling oil.', prep_minutes = 10, cook_minutes = 8, total_minutes = 18, yield_qty = '3', yield_label = '2 to 3 servings', cuisine = 'Chinese, Malaysian', meal_category = 'Side Dish', calories = NULL, notes = 'No steam oven? Steam the plate on a rack in a covered wok over rapidly boiling water for the same time. For a milder dish, use one chilli and leave out the chilli oil.', appliance_md = '[VA05](/built-in-combi-oven-va05/) or [VA06](/vatti-magic-series-combi-oven-va06/) combi oven, highest steam level', keywords = 'spicy enoki mushroom, enoki chilli oil, steamed enoki mushroom, garlic enoki, 金针菇, steam oven recipe' WHERE id = 2 AND article_id = 6;
DELETE FROM recipe_ingredient WHERE recipe_id = 2;
DELETE FROM recipe_step WHERE recipe_id = 2;
INSERT INTO recipe_ingredient (recipe_id, position, text) VALUES
  (2, 1, '200 g enoki mushrooms (1 pack), root base trimmed'),
  (2, 2, '4 cloves garlic, finely chopped'),
  (2, 3, '3 bird''s eye chillies (cili padi), chopped'),
  (2, 4, '2 stalks spring onion, chopped'),
  (2, 5, '1 tbsp oyster sauce'),
  (2, 6, '1 tbsp light soy sauce'),
  (2, 7, '1 tsp sugar'),
  (2, 8, '1 tsp sesame oil'),
  (2, 9, '1 tbsp water'),
  (2, 10, '2 tbsp cooking oil'),
  (2, 11, '1 tbsp chilli oil (optional)');
INSERT INTO recipe_step (recipe_id, position, text) VALUES
  (2, 1, 'Fill the steam oven''s water tank and preheat it on the highest steam level.'),
  (2, 2, 'Separate the enoki into small bunches, rinse quickly and shake dry, then lay them flat on a shallow heatproof plate.'),
  (2, 3, 'Scatter half the garlic and half the chilli over the enoki.'),
  (2, 4, 'Mix the oyster sauce, light soy sauce, sugar, sesame oil and water, and spoon it over the mushrooms.'),
  (2, 5, 'Steam for 6 to 8 minutes, until the stems are soft but still have a little bite.'),
  (2, 6, 'Take the plate out and top with the rest of the garlic and chilli and the spring onion.'),
  (2, 7, 'Heat the cooking oil until it shimmers and pour it over the garlic, chilli and spring onion so they sizzle.'),
  (2, 8, 'Drizzle with chilli oil if using, and serve at once with rice.');

-- Cream Puff Recipe with Custard Filling (Easy Choux)
UPDATE article SET
  title = 'Cream Puff Recipe with Custard Filling (Easy Choux)',
  h1 = 'Easy Cream Puffs with Custard Filling',
  meta_description = 'Crisp choux cream puffs filled with smooth vanilla custard, in grams. Oven settings, the custard method, and why cream puffs go flat or soggy.',
  word_count = 931,
  reading_minutes = 5,
  modified_at = '2026-11-26T20:00:00+08:00',
  body_md = 'Cream puffs are hollow choux pastry shells filled with a thick vanilla custard. The pastry is made on the hob in five minutes and puffs up in the oven on nothing but the steam from its own eggs and water, so the method matters more than the ingredients. This recipe makes about 20 puffs, in gram measures, with the custard filling and the reasons puffs go flat.

### Quick answer

- **Oven:** 200°C top and bottom heat for 15 minutes, then 180°C for 15 to 20 minutes.
- **Fan:** off. A fan can make the puffs rise lopsided.
- **Door:** keep it shut for the first 25 minutes, or the puffs collapse.
- **Done when:** deep golden, firm and light when lifted, with dry cracks.
- **Makes:** about 20 puffs, 5 cm across.

## Making the choux pastry

Choux pastry is cooked twice: once in the pan and once in the oven. Bring the water, milk, butter, sugar and salt to a full boil on the hob, so the butter is fully melted, then tip in all the flour at once and stir hard. Keep stirring over low heat for 1 to 2 minutes, until the dough comes away from the pan in one ball and a thin film forms on the base. That drying step is what lets the dough take the eggs.

Let the dough cool for 5 minutes, then beat in the eggs a little at a time. Stop when the dough is glossy and falls off the spoon in a thick V shape. You may not need the last of the egg: a dough that is too wet spreads instead of rising.

A steady low flame makes the drying step easy to control; any of the [VATTI cooker hobs](/cooker-hob-in-malaysia/) will hold it.

## Baking the puffs

Pipe 4 cm mounds onto a lined tray, 5 cm apart, and smooth any peaks with a wet finger. Bake at 200°C with top and bottom heat for 15 minutes, so the water in the dough turns to steam and blows the puffs up, then lower to 180°C for 15 to 20 minutes to dry the shells. Do not open the door in the first 25 minutes. When they are deep golden, turn the oven off, poke a small hole in the side of each puff and leave them in the oven with the door ajar for 10 minutes to dry out.

The [VATTI VA05](/built-in-combi-oven-va05/) and [VA06](/vatti-magic-series-combi-oven-va06/) combi ovens list dual temperature control, which sets the top and bottom elements apart: useful if the tops brown before the puffs have finished rising. The [VATTI 07559](/vatti-built-in-air-fryer-oven-07559/) has nine baking functions in a 75 litre cavity, room for two trays of puffs at once. Our guide to [oven settings for baking](/tips-tricks/baking-cake-oven-setting/) explains top and bottom heat.

[![VATTI VA05 combi oven](https://cdn.vattimalaysia.com/2026/08/built-in-combi-oven-va05-front.webp)](/built-in-combi-oven-va05/)
[![VATTI VA06 combi oven](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-combi-oven-va06-front.webp)](/vatti-magic-series-combi-oven-va06/)
[![VATTI 07559 built-in air fryer oven](https://cdn.vattimalaysia.com/2024/08/Built-in-air-fryer-oven-07559-product-photo.webp)](/vatti-built-in-air-fryer-oven-07559/)

## The custard filling

The filling is a pastry cream: milk thickened with egg yolks and cornflour, cooked on the hob until it is thick enough to hold a line. Whisk constantly once it starts to thicken, and let it bubble for one full minute so the cornflour cooks and does not taste floury. Press cling film onto the surface so no skin forms, and chill it for at least 2 hours.

For a lighter filling, fold 200 ml of whipped cream into the cold custard. This is what most bakeries in Malaysia use, and it pipes more easily.

## Filling the cream puffs

Fill the puffs only once they are completely cool, and as close to serving as you can. Either cut each puff in half and spoon or pipe the custard in, or push a small piping tip into the base and fill until the puff feels heavy. Dust with icing sugar, or pipe a swirl of custard on top.

## Cream puff FAQs

**Why did my cream puffs go flat?**
Usually the oven door was opened too early, the puffs were underbaked, or the dough was too wet. Keep the door shut for the first 25 minutes, bake until deep golden, and stop adding egg once the dough falls in a thick V.

**Why are my cream puffs soggy?**
They were filled while warm, filled too early, or not dried. Pierce each puff and dry it in the switched-off oven, let it cool fully, and fill it within a few hours of serving.

**What is the difference between custard and cream filling?**
Custard (pastry cream) is milk thickened with egg yolks and cornflour, cooked until thick. Cream filling is whipped cream. Folding the two together gives a lighter, richer filling.

**Can I use custard powder instead of cornflour?**
Yes. Replace the cornflour with the same weight of custard powder. It thickens the same way and adds a yellow colour and vanilla flavour.

**Can I make cream puffs ahead?**
Yes. Unfilled shells keep for two days in an airtight container, or a month in the freezer. Crisp them at 180°C for 5 minutes, let them cool, then fill.

**How long do filled cream puffs keep?**
Up to a day in the fridge. Do not leave them out overnight: the custard is made with eggs and milk and must stay cold.

## More recipes for a VATTI oven

- [Steamed fish, Cantonese and Malay lime styles](/recipe/steamed-fish-recipe/)
- [Moist chocolate steamed cake (kek kukus coklat)](/recipe/moist-chocolate-steamed-cake/)
- [Spicy enoki mushrooms with garlic chilli oil](/recipe/spicy-enoki-mushrooms-recipe-step-by-step-guide/)
- [Crunchy homemade granola](/recipe/how-to-prepare-granola/)

## Final thoughts

Good cream puffs come down to a dry dough, a hot oven and a door kept shut. Once the shells are right, the custard is the easy part. See the [VATTI built-in and combi ovens](/combi-and-steam-oven-in-malaysia/) for ovens with top and bottom control.

[Explore VATTI ovens](/combi-and-steam-oven-in-malaysia/)'
WHERE id = 3 AND lang = 'en-MY';
UPDATE image SET alt = 'Golden choux cream puffs dusted with icing sugar, each topped with a swirl of piped yellow custard and a flake of gold leaf, on a baking tray.' WHERE id = 414;
UPDATE recipe SET name = 'Cream Puffs with Custard Filling', description = 'Crisp, hollow choux pastry shells filled with a smooth vanilla custard pastry cream.', prep_minutes = 40, cook_minutes = 35, total_minutes = 75, yield_qty = '20', yield_label = '20 cream puffs', cuisine = 'French, Malaysian bakery', meal_category = 'Dessert', calories = NULL, notes = 'Chill the custard for at least 2 hours before filling. For a lighter filling, fold 200 ml whipped cream into the cold custard. Fill the puffs only when they are completely cool.', appliance_md = '[VA05](/built-in-combi-oven-va05/) or [VA06](/vatti-magic-series-combi-oven-va06/) combi oven, or the [07559](/vatti-built-in-air-fryer-oven-07559/) built-in oven, top and bottom heat', keywords = 'cream puff recipe, custard cream puff, choux pastry, custard filling for cream puffs, easy cream puffs' WHERE id = 1 AND article_id = 3;
DELETE FROM recipe_ingredient WHERE recipe_id = 1;
DELETE FROM recipe_step WHERE recipe_id = 1;
INSERT INTO recipe_ingredient (recipe_id, position, text) VALUES
  (1, 1, 'Choux pastry: 125 ml water'),
  (1, 2, 'Choux pastry: 125 ml full-cream milk'),
  (1, 3, 'Choux pastry: 100 g butter, cubed'),
  (1, 4, 'Choux pastry: 1 tsp sugar'),
  (1, 5, 'Choux pastry: 1/2 tsp salt'),
  (1, 6, 'Choux pastry: 150 g plain flour, sifted'),
  (1, 7, 'Choux pastry: 4 to 5 eggs (about 220 g), beaten'),
  (1, 8, 'Custard: 500 ml full-cream milk'),
  (1, 9, 'Custard: 4 egg yolks'),
  (1, 10, 'Custard: 100 g sugar'),
  (1, 11, 'Custard: 40 g cornflour or custard powder'),
  (1, 12, 'Custard: 30 g butter'),
  (1, 13, 'Custard: 1 tsp vanilla extract'),
  (1, 14, 'Icing sugar, to dust (optional)');
INSERT INTO recipe_step (recipe_id, position, text) VALUES
  (1, 1, 'Make the custard first: heat the milk until steaming. Whisk the egg yolks, sugar and cornflour until pale, then whisk in the hot milk.'),
  (1, 2, 'Return it to the pan and cook over medium-low heat, whisking constantly, until thick; let it bubble for 1 minute. Off the heat, stir in the butter and vanilla.'),
  (1, 3, 'Press cling film onto the surface and chill for at least 2 hours.'),
  (1, 4, 'Preheat the oven to 200°C, top and bottom heat with no fan, and line a baking tray.'),
  (1, 5, 'Bring the water, milk, butter, sugar and salt to a full boil. Add the flour all at once and stir hard over low heat for 1 to 2 minutes, until the dough forms a ball and a film forms on the pan.'),
  (1, 6, 'Cool the dough for 5 minutes, then beat in the egg a little at a time until glossy and the dough falls from the spoon in a thick V.'),
  (1, 7, 'Pipe 4 cm mounds 5 cm apart on the tray and smooth the tops with a wet finger.'),
  (1, 8, 'Bake for 15 minutes at 200°C, then 15 to 20 minutes at 180°C, without opening the door for the first 25 minutes.'),
  (1, 9, 'Turn the oven off, pierce the side of each puff and leave them in the oven with the door ajar for 10 minutes. Cool completely on a rack.'),
  (1, 10, 'Fill each puff with custard through the base or after cutting it in half, dust with icing sugar and serve.');

-- Homemade Granola Recipe: Crunchy Oven-Baked Clusters
UPDATE article SET
  title = 'Homemade Granola Recipe: Crunchy Oven-Baked Clusters',
  h1 = 'How to Prepare Granola at Home: Crunchy Oven-Baked Recipe',
  meta_description = 'Make crunchy homemade granola with oats, nuts and honey, baked at 150°C for 25 to 30 minutes. How to get big clusters, and how long it keeps.',
  word_count = 711,
  reading_minutes = 4,
  modified_at = '2026-11-26T20:00:00+08:00',
  body_md = 'To prepare granola, mix rolled oats, nuts and seeds with honey and oil, spread the mixture thinly on a tray, and bake it at 150°C for 25 to 30 minutes until golden. Let it cool on the tray without touching it, which is when it turns crunchy, then add the dried fruit. This recipe makes about 6 cups, enough for 12 breakfasts.

### Quick answer

- **Oven:** 150°C top and bottom heat, or 140°C with the fan.
- **Time:** 25 to 30 minutes, stirring once halfway for loose granola.
- **Clusters:** press the mixture flat and do not stir it.
- **Crunch:** comes as it cools, so take it out while it still feels slightly soft.
- **Keeps:** two weeks in an airtight jar.

## Ingredients and swaps

- **Oats:** rolled oats give the best texture. Quick oats work but bake faster and give a finer, sandier granola.
- **Nuts and seeds:** almonds, cashews, walnuts, pumpkin or sunflower seeds, in any mix.
- **Sweetener:** honey or maple syrup. Gula melaka syrup gives a caramel, Malaysian flavour.
- **Oil:** coconut oil for a richer taste, or any neutral oil.
- **Add after baking:** dried fruit and chocolate. Baked, raisins turn hard and chocolate melts.

## Baking granola in the oven

Low heat is the whole trick. At 150°C the oats toast slowly and evenly, and the honey caramelises without burning; at 180°C the edges burn before the middle is dry. Spread the granola in a thin, even layer, no more than 1 cm deep, and bake it on the middle shelf.

If you use the fan, take the temperature down to 140°C and check five minutes early, because moving air browns the edges faster. In a 75 litre oven such as the [VATTI 07559 built-in oven](/vatti-built-in-air-fryer-oven-07559/), two trays fit side by side, so a double batch takes no longer. The [VA05](/built-in-combi-oven-va05/) and [VA06](/vatti-magic-series-combi-oven-va06/) combi ovens bake it the same way on a conventional setting.

[![VATTI 07559 built-in air fryer oven](https://cdn.vattimalaysia.com/2024/08/Built-in-air-fryer-oven-07559-product-photo.webp)](/vatti-built-in-air-fryer-oven-07559/)
[![VATTI VA05 combi oven](https://cdn.vattimalaysia.com/2026/08/built-in-combi-oven-va05-front.webp)](/built-in-combi-oven-va05/)

## How to get big granola clusters

- **Add an egg white.** Whisk one egg white until frothy and stir it through the mixture before baking. It glues the oats into clumps.
- **Press it down.** Flatten the mixture firmly on the tray with a spatula.
- **Do not stir.** Bake it in one sheet and leave it to cool completely before breaking it up.

## Ways to eat granola

- With yoghurt and fresh fruit, such as mango, banana or papaya.
- With cold milk or soy milk, as a cereal.
- On top of a [smoothie bowl](/recipe/blueberry-smoothie-bowl-with-almond-butter-recipes/) or an [acai bowl](/recipe/acai-bowl-recipes-quick-and-easy/).
- As a crunchy topping on ice cream.

## Granola FAQs

**What temperature do you bake granola at?**
150°C with top and bottom heat, or 140°C with the fan, for 25 to 30 minutes. Low heat toasts the oats evenly without burning the honey.

**Why is my homemade granola not crunchy?**
It was taken out too early, spread too thickly, or stored before it cooled. Bake until golden, spread it no more than 1 cm deep, and let it cool completely on the tray.

**Can you use quick oats for granola?**
Yes, but the granola is finer and less chunky, and it bakes a few minutes faster. Rolled oats give the classic texture.

**Can I make granola in an air fryer?**
Yes, in small batches at about 150°C for 8 to 12 minutes, stirring every 3 minutes. The fan is strong, so watch it closely. An oven is easier for a full batch.

**How long does homemade granola last?**
About two weeks in an airtight jar at room temperature, and up to three months in the freezer. In Malaysian humidity, close the jar well or it goes soft.

**Is homemade granola healthy?**
It can be, because you choose the sugar and oil. Granola is energy-dense, so a serving is about half a cup.

## More recipes for a VATTI oven

- [Steamed fish, Cantonese and Malay lime styles](/recipe/steamed-fish-recipe/)
- [Moist chocolate steamed cake (kek kukus coklat)](/recipe/moist-chocolate-steamed-cake/)
- [Cream puffs with custard filling](/recipe/cream-puff-with-custard-filing-recipe/)
- [Spicy enoki mushrooms with garlic chilli oil](/recipe/spicy-enoki-mushrooms-recipe-step-by-step-guide/)

## Final thoughts

Homemade granola needs a low oven, a thin layer and patience while it cools. Make a double batch: it keeps for weeks. See the [VATTI built-in and combi ovens](/combi-and-steam-oven-in-malaysia/) for ovens that bake two trays at once.

[Explore VATTI ovens](/combi-and-steam-oven-in-malaysia/)'
WHERE id = 45 AND lang = 'en-MY';
UPDATE image SET alt = 'A glass bowl of homemade granola with oats, almonds and dark chocolate pieces on a wooden board, with a spoon, mandarin segments and whole nuts beside it.' WHERE id = 505;
UPDATE recipe SET name = 'Crunchy Homemade Granola', description = 'Rolled oats, nuts and seeds tossed with honey and oil and baked low and slow until golden and crunchy.', prep_minutes = 10, cook_minutes = 30, total_minutes = 40, yield_qty = '12', yield_label = '12 servings (about 6 cups)', cuisine = 'Western', meal_category = 'Breakfast', calories = NULL, notes = 'For big clusters, stir in one frothy egg white before baking, press the mixture flat and do not stir it. Add dried fruit and chocolate only after the granola has cooled.', appliance_md = '[07559](/vatti-built-in-air-fryer-oven-07559/) built-in oven, or the [VA05](/built-in-combi-oven-va05/) or [VA06](/vatti-magic-series-combi-oven-va06/) combi oven, conventional bake', keywords = 'homemade granola, how to prepare granola, baked granola, oven granola, granola clusters, granola temperature' WHERE id = 10 AND article_id = 45;
DELETE FROM recipe_ingredient WHERE recipe_id = 10;
DELETE FROM recipe_step WHERE recipe_id = 10;
INSERT INTO recipe_ingredient (recipe_id, position, text) VALUES
  (10, 1, '3 cups (270 g) rolled oats'),
  (10, 2, '1 cup (130 g) nuts, such as almonds or cashews, roughly chopped'),
  (10, 3, '1/2 cup (70 g) seeds, such as pumpkin or sunflower'),
  (10, 4, '1/2 cup (40 g) desiccated coconut (optional)'),
  (10, 5, '1/3 cup (110 g) honey or maple syrup'),
  (10, 6, '1/4 cup (60 ml) coconut oil, melted, or a neutral oil'),
  (10, 7, '1 tsp vanilla extract'),
  (10, 8, '1/2 tsp ground cinnamon'),
  (10, 9, '1/4 tsp salt'),
  (10, 10, '1 egg white, whisked until frothy (optional, for clusters)'),
  (10, 11, '1 cup (150 g) dried fruit, such as raisins or cranberries');
INSERT INTO recipe_step (recipe_id, position, text) VALUES
  (10, 1, 'Preheat the oven to 150°C, top and bottom heat (140°C with the fan), and line a large tray with baking paper.'),
  (10, 2, 'Mix the oats, nuts, seeds and coconut in a large bowl.'),
  (10, 3, 'Whisk the honey, oil, vanilla, cinnamon and salt together and pour over the dry mixture. Stir until everything is coated.'),
  (10, 4, 'For clusters, stir in the frothy egg white.'),
  (10, 5, 'Spread the mixture on the tray no more than 1 cm deep, and press it down firmly for clusters.'),
  (10, 6, 'Bake on the middle shelf for 25 to 30 minutes, until golden. Stir once halfway for loose granola; leave it unstirred for clusters.'),
  (10, 7, 'Cool completely on the tray without touching it, then break it up and stir in the dried fruit.'),
  (10, 8, 'Store in an airtight jar.');

-- Chicken Lasagna Recipe (Easy, with Red and White Sauce)
UPDATE article SET
  title = 'Chicken Lasagna Recipe (Easy, with Red and White Sauce)',
  h1 = 'Easy Chicken Lasagna with Tomato and White Sauce',
  meta_description = 'A simple baked chicken lasagna: tomato chicken sauce, creamy white sauce and mozzarella. Oven setting, layering order and make-ahead tips.',
  word_count = 757,
  reading_minutes = 4,
  modified_at = '2026-11-26T20:00:00+08:00',
  body_md = 'Chicken lasagna layers pasta sheets with a tomato and chicken sauce, a creamy white sauce and mozzarella, then bakes at 190°C until the top is bubbling and brown. This version uses shredded or minced chicken instead of beef, a quick white sauce instead of ricotta, and no-boil lasagna sheets, so it is in the oven in about 30 minutes. It serves 6 to 8.

### Quick answer

- **Oven:** 190°C, top and bottom heat.
- **Time:** 25 minutes covered with foil, then 15 to 20 minutes uncovered.
- **Browning:** 3 to 5 minutes under top heat or the grill at the end.
- **Rest:** 15 minutes before cutting, or the layers slide.
- **Dish:** about 23 x 33 cm, serves 6 to 8.

## The chicken sauce

Brown minced chicken, or shred a cooked chicken, in a little oil with onion and garlic, then simmer it with crushed tomatoes, tomato paste and dried herbs for 15 minutes until thick. A thick sauce matters: a watery one makes a lasagna that falls apart on the plate. Season it well, because the pasta and white sauce take up a lot of salt.

## The white sauce

White sauce (béchamel) is what makes a lasagna creamy, and it is cheaper and easier to find in Malaysia than ricotta. Melt butter, stir in flour for a minute, then whisk in warm milk a little at a time and simmer until it coats a spoon. Season with salt, pepper and a pinch of nutmeg.

## How to layer chicken lasagna

1. A thin layer of chicken sauce on the base, so the pasta does not stick.
2. Lasagna sheets, in one layer, broken to fit.
3. Chicken sauce, then white sauce, then a handful of mozzarella.
4. Repeat twice more, ending with sheets, white sauce, the rest of the mozzarella and the Parmesan.

No-boil sheets need the sauce to cook in, so make sure every sheet is fully covered.

## Baking it in the oven

Cover the dish with foil and bake at 190°C with top and bottom heat for 25 minutes, so the pasta softens in the steam under the foil. Take the foil off and bake for 15 to 20 minutes more, until the edges bubble and the top is golden. For a browner top, finish with 3 to 5 minutes of top heat or grill.

An oven that sets the top and bottom elements separately makes that finish easy: the [VATTI VA05](/built-in-combi-oven-va05/) and [VA06](/vatti-magic-series-combi-oven-va06/) combi ovens list dual temperature control, so the top can brown the cheese while the base stays steady. The [VATTI 07559](/vatti-built-in-air-fryer-oven-07559/) has a 75 litre cavity that takes a large lasagna dish with room to spare.

[![VATTI VA05 combi oven](https://cdn.vattimalaysia.com/2026/08/built-in-combi-oven-va05-front.webp)](/built-in-combi-oven-va05/)
[![VATTI VA06 combi oven](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-combi-oven-va06-front.webp)](/vatti-magic-series-combi-oven-va06/)
[![VATTI 07559 built-in air fryer oven](https://cdn.vattimalaysia.com/2024/08/Built-in-air-fryer-oven-07559-product-photo.webp)](/vatti-built-in-air-fryer-oven-07559/)

## What to serve with chicken lasagna

- **Garlic bread**, for the sauce left on the plate.
- **A green or Caesar salad**, to cut the richness.
- **Roasted vegetables**, such as pumpkin, zucchini or capsicum, in the oven alongside.

## Chicken lasagna FAQs

**What temperature do you bake chicken lasagna at?**
190°C with top and bottom heat: 25 minutes covered with foil, then 15 to 20 minutes uncovered until golden and bubbling.

**Can I make chicken lasagna without ricotta?**
Yes. This recipe uses a white sauce (béchamel) instead, which is creamier and easier to find in Malaysia.

**Do I need to boil the lasagna sheets?**
Not if you use no-boil sheets. Cover them completely with sauce and bake under foil first so they soften. Regular sheets need to be boiled until just soft.

**Why is my lasagna watery?**
The meat sauce was too thin, or it was cut straight out of the oven. Simmer the sauce until thick, and rest the lasagna for 15 minutes before cutting.

**Can I make chicken lasagna ahead?**
Yes. Assemble it, cover and chill for up to a day, then bake for 10 minutes longer. Baked lasagna keeps for three days in the fridge and reheats well.

**Can I freeze chicken lasagna?**
Yes, for up to three months, baked or unbaked. Thaw it in the fridge overnight and bake covered at 180°C until hot in the middle.

## More recipes for a VATTI oven

- [Steamed fish, Cantonese and Malay lime styles](/recipe/steamed-fish-recipe/)
- [Moist chocolate steamed cake (kek kukus coklat)](/recipe/moist-chocolate-steamed-cake/)
- [Crunchy homemade granola](/recipe/how-to-prepare-granola/)
- [Cream puffs with custard filling](/recipe/cream-puff-with-custard-filing-recipe/)

## Final thoughts

A good chicken lasagna needs a thick sauce, a proper white sauce and a rest before cutting. Bake it covered, then uncovered, and finish the top under the heat. See the [VATTI built-in and combi ovens](/combi-and-steam-oven-in-malaysia/) for ovens with separate top and bottom heat.

[Explore VATTI ovens](/combi-and-steam-oven-in-malaysia/)'
WHERE id = 51 AND lang = 'en-MY';
UPDATE image SET alt = 'A slice of baked chicken lasagna on a white serving tray, with shredded chicken in tomato sauce between pasta layers under a browned, bubbling cheese and white sauce top.' WHERE id = 514;
UPDATE recipe SET name = 'Easy Chicken Lasagna', description = 'Layers of pasta, tomato chicken sauce, creamy white sauce and mozzarella, baked until golden and bubbling.', prep_minutes = 30, cook_minutes = 45, total_minutes = 75, yield_qty = '6-8', yield_label = '6 to 8 servings', cuisine = 'Italian', meal_category = 'Main Course', calories = NULL, notes = 'Rest the lasagna for 15 minutes before cutting. To make ahead, assemble and chill for up to a day, then bake 10 minutes longer.', appliance_md = '[VA05](/built-in-combi-oven-va05/) or [VA06](/vatti-magic-series-combi-oven-va06/) combi oven, or the [07559](/vatti-built-in-air-fryer-oven-07559/) built-in oven, top and bottom heat', keywords = 'chicken lasagna, chicken lasagna recipe, easy chicken lasagna, chicken lasagna with red sauce, baked chicken lasagna' WHERE id = 16 AND article_id = 51;
DELETE FROM recipe_ingredient WHERE recipe_id = 16;
DELETE FROM recipe_step WHERE recipe_id = 16;
INSERT INTO recipe_ingredient (recipe_id, position, text) VALUES
  (16, 1, 'Chicken sauce: 2 tbsp cooking oil'),
  (16, 2, 'Chicken sauce: 1 onion, finely chopped'),
  (16, 3, 'Chicken sauce: 4 cloves garlic, minced'),
  (16, 4, 'Chicken sauce: 500 g minced chicken, or 3 cups shredded cooked chicken'),
  (16, 5, 'Chicken sauce: 1 can (400 g) crushed tomatoes'),
  (16, 6, 'Chicken sauce: 2 tbsp tomato paste'),
  (16, 7, 'Chicken sauce: 1 tsp dried oregano and 1 tsp dried basil'),
  (16, 8, 'Chicken sauce: salt, pepper and 1 tsp sugar, to taste'),
  (16, 9, 'White sauce: 50 g butter'),
  (16, 10, 'White sauce: 50 g plain flour'),
  (16, 11, 'White sauce: 600 ml milk, warmed'),
  (16, 12, 'White sauce: a pinch of nutmeg, salt and pepper'),
  (16, 13, '12 no-boil lasagna sheets'),
  (16, 14, '200 g shredded mozzarella'),
  (16, 15, '40 g grated Parmesan');
INSERT INTO recipe_step (recipe_id, position, text) VALUES
  (16, 1, 'Heat the oil and soften the onion and garlic. Add the chicken and cook until it is no longer pink.'),
  (16, 2, 'Stir in the crushed tomatoes, tomato paste and herbs, and simmer for 15 minutes until thick. Season to taste.'),
  (16, 3, 'For the white sauce, melt the butter, stir in the flour for 1 minute, then whisk in the warm milk a little at a time. Simmer until it coats a spoon, and season with nutmeg, salt and pepper.'),
  (16, 4, 'Preheat the oven to 190°C, top and bottom heat.'),
  (16, 5, 'Spread a little chicken sauce in a 23 x 33 cm dish and cover with a layer of lasagna sheets.'),
  (16, 6, 'Add chicken sauce, white sauce and a handful of mozzarella. Repeat twice, ending with sheets, white sauce, the rest of the mozzarella and the Parmesan.'),
  (16, 7, 'Cover with foil and bake for 25 minutes, then uncover and bake for 15 to 20 minutes until golden and bubbling.'),
  (16, 8, 'Finish with 3 to 5 minutes of top heat or grill for a browner top, then rest for 15 minutes before cutting.');

-- November recipes, English cards: appliance line and keywords. The ms/zh
-- cards are set at the end of their translation files, which load after this one.
UPDATE recipe SET appliance_md = '[VA05](/built-in-combi-oven-va05/) or [VA06](/vatti-magic-series-combi-oven-va06/) combi oven, highest steam level', keywords = 'cantonese steamed fish, steamed fish recipe, steamed sea bass, siakap stim, steam oven recipe' WHERE id = 17;
UPDATE recipe SET appliance_md = '[VA05](/built-in-combi-oven-va05/) or [VA06](/vatti-magic-series-combi-oven-va06/) combi oven, highest steam level', keywords = 'ikan stim limau, steamed fish with lime, thai steamed fish, siakap stim limau, steam oven recipe' WHERE id = 18;
UPDATE recipe SET appliance_md = '[VA05](/built-in-combi-oven-va05/) or [VA06](/vatti-magic-series-combi-oven-va06/) combi oven, highest steam level', keywords = 'kek kukus coklat moist, chocolate steamed cake, moist chocolate cake, steamed cake recipe, steam oven recipe' WHERE id = 23;
