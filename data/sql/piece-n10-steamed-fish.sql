-- N10, steamed fish, Cantonese and Malay styles, in a steam oven, English
-- edition (content schedule, November). Ships beside N9 (what is a steam
-- oven) and links to it. The Malay and Chinese editions are
-- translation-n10-steamed-fish-{ms,zh}.sql, sharing translation_key
-- 'steamed-fish-recipe'.
--
-- Target (Ubersuggest MY en, schedule 2026-10-07): `steamed fish recipe` 880
-- (SD 38), `steamed fish recipe cantonese` 390, `thai steamed fish recipe`
-- 210. The lime card answers the Thai search too (it is the same dish family),
-- without calling the Malay dish Thai.
--
-- Two recipe cards, so two Recipe JSON-LD nodes. Steam-oven method first, the
-- wok method in each card's notes. The steam oven settings are named the way
-- VATTI names them (VA05: low, mid and high steam; VA06: three steaming
-- modes); no oven temperature is given, as no spec sheet states one. Cooking
-- times are kitchen practice for a 600 to 700 g fish, not a VATTI figure.
-- Calories left NULL rather than estimated.
--
-- Images: generated in Higgsfield (gpt_image_2, low, 2026-11-05), because the
-- client has no photo of the dish. They show only the food, never an oven, so
-- nothing about a VATTI product is invented. 9114 is the Cantonese plate
-- (featured here and in zh), 9115 the lime plate (featured in ms, and in the
-- body here).

INSERT INTO image (id, url, legacy_url, alt, width, height) VALUES
  (9114, 'https://cdn.vattimalaysia.com/2026/11/steamed-fish-cantonese.webp', NULL,
   'A whole Cantonese steamed sea bass on a white plate, topped with shredded ginger, spring onion and red chilli in light soy sauce, with a bowl of rice beside it.', 1344, 752),
  (9115, 'https://cdn.vattimalaysia.com/2026/11/ikan-stim-limau.webp', NULL,
   'Ikan stim limau: a whole steamed sea bass in a clear lime and chilli broth, topped with coriander, garlic, bird''s eye chilli and lime slices.', 1344, 752);

INSERT INTO article (id, slug, path, section, title, h1, meta_description, body_md, word_count, reading_minutes, author, featured_image_id, published_at, modified_at, schema_disabled, is_published, lang, translation_key)
VALUES (130, 'steamed-fish-recipe', 'recipe/steamed-fish-recipe', 'recipe',
'Steamed Fish Recipe: Cantonese and Malay Lime Styles',
'Steamed Fish Recipe, Cantonese and Malay Lime Styles, in a Steam Oven',
'Two steamed fish recipes for a Malaysian kitchen: Cantonese with soy, ginger and spring onion, and ikan stim limau with lime and chilli. Steam oven and wok methods.',
'Steamed fish is one of the simplest dishes in a Malaysian kitchen and one of the easiest to get wrong. A few minutes too long and the flesh goes dry and tight; too short and it clings to the bone. This page gives two recipes, Cantonese steamed fish with soy, ginger and spring onion, and Malay ikan stim limau with lime and chilli, and shows how to steam both in a steam oven, with the wok method alongside.

### At a glance

- **Fish:** a whole siakap (sea bass), red snapper or pomfret of 600 to 700 g serves 3 to 4.
- **Time:** about 10 to 12 minutes of steaming for a fish that size.
- **Done when:** the flesh at the thickest part, near the head, is white all the way through and lifts off the bone.
- **Steam oven setting:** the highest steam level.

## Choosing the fish

Any firm white fish works. **Siakap** (sea bass) is the most common choice in Malaysia and the one most restaurants use. **Red snapper** (ikan merah) and **grouper** (kerapu) are firmer and sweeter; **pomfret** (bawal) is thinner and cooks a couple of minutes faster. Ask the fishmonger to scale and gut it. A fresh fish has clear eyes, red gills and flesh that springs back when pressed.

For a fish over 3 cm thick at its thickest point, cut two or three diagonal slashes on each side down to the bone. The steam reaches the centre faster, and the thick part is done at the same time as the tail.

## Why steam it in a steam oven

On the hob, a fish steams over boiling water with a lid on. The heat comes from below, the water can boil dry, and condensation drips off the lid onto the fish and dilutes the sauce. In a steam oven, steam fills the whole cavity, so the fish cooks evenly from every side and nothing drips onto it. You can also steam the rice and a vegetable on a second tray at the same time.

Both VATTI combi ovens steam: the [VA05](/built-in-combi-oven-va05/) has low, mid and high steam modes, and the [VA06](/vatti-magic-series-combi-oven-va06/) has three steaming modes and a 1.3 L water tank. Use the highest setting for fish. Our guide to [what a steam oven is](/buying-guide/what-is-a-steam-oven/) explains how it works and what else it cooks.

[![VATTI VA05 combi oven](https://cdn.vattimalaysia.com/2026/08/built-in-combi-oven-va05-front.webp)](/built-in-combi-oven-va05/)
[![VATTI VA06 combi oven](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-combi-oven-va06-front.webp)](/vatti-magic-series-combi-oven-va06/)

## Cantonese steamed fish

The Cantonese way is about the fish itself: a short steam, the cooking liquid poured away, then fresh ginger and spring onion, hot oil and a light soy dressing. The ingredients and method are in the first recipe card below.

Three things make the difference:

- **Pour off the steaming liquid.** It carries the fishy taste. Tip it away before you add the dressing.
- **Fresh aromatics on top.** Steam the fish on old ginger and spring onion, then throw those away and top it with fresh shreds.
- **Sizzle the oil.** Heat the oil until it shimmers and pour it over the ginger and spring onion. That is what releases their fragrance.

## Ikan stim limau, the Malay lime style

Ikan stim limau is sharper and hotter: the fish is steamed with lemongrass and ginger, then bathed in a hot broth of lime juice, garlic, bird''s eye chilli and fish sauce. It is close to the Thai lime-steamed fish, and the method is the same. The second recipe card below has the ingredients and steps.

![Ikan stim limau: a whole steamed sea bass in a clear lime and chilli broth, topped with coriander, garlic, bird''s eye chilli and lime slices.](https://cdn.vattimalaysia.com/2026/11/ikan-stim-limau.webp)

Add the lime juice off the heat. Boiled lime juice turns bitter, so heat the broth first and squeeze the limes into it just before you pour.

## Steamed fish FAQs

**How long do you steam a fish?**
About 10 to 12 minutes for a whole fish of 600 to 700 g on full steam, and 6 to 8 minutes for fillets or a thin fish such as pomfret. Check the thickest part near the head: the flesh should be white all the way through and lift off the bone.

**Can I steam fish without a steamer?**
Yes. In a wok, stand the plate on a rack above boiling water, cover and steam on high heat. In a steam oven, put the plate on the tray and use the highest steam setting.

**Why does my steamed fish taste fishy?**
Usually because the steaming liquid was served with it. Pour it off, and steam the fish on ginger and spring onion. A fresh fish matters most of all.

**Can I steam frozen fish?**
Thaw it in the fridge first and pat it dry. Steaming from frozen leaves the outside overcooked before the centre is done.

**Which fish is best for steaming?**
Siakap (sea bass) is the most common. Red snapper and grouper are firmer and sweeter; pomfret is thinner and quicker.

## Final thoughts

Steamed fish rewards a fresh fish, a short steam and a dressing added at the end. In a steam oven it is close to foolproof: the steam is even, nothing drips onto the fish, and the rice can steam on the tray below. See the [VATTI combi and steam ovens](/combi-and-steam-oven-in-malaysia/), or read [what a steam oven is](/buying-guide/what-is-a-steam-oven/) to see what else it cooks.

[Compare VATTI combi ovens](/combi-and-steam-oven-in-malaysia/)
', 880, 5, 'Vatti Malaysia', 9114, '2026-11-05T20:00:00+08:00', '2026-11-05T20:00:00+08:00', 0, 1, 'en-MY', 'steamed-fish-recipe');
INSERT INTO article_category (article_id, category_id, is_primary) VALUES (130, (SELECT id FROM blog_category WHERE slug = 'recipe'), 1);
INSERT INTO article_image (article_id, image_id, position) VALUES (130, 9115, 1);

INSERT INTO recipe (id, article_id, position, name, description, prep_minutes, cook_minutes, total_minutes, yield_qty, yield_label, cuisine, meal_category, calories, notes, hero_image_id) VALUES
  (17, 130, 1, 'Cantonese Steamed Fish',
   'A whole fish steamed until just done, then dressed with fresh ginger, spring onion, sizzling oil and a light soy sauce.',
   15, 12, 27, '4', '3 to 4 servings', 'Cantonese, Malaysian', 'Main Course', NULL,
   'No steam oven? Stand the plate on a rack in a wok over rapidly boiling water, cover and steam on high heat for the same time. For pomfret or fillets, steam for 6 to 8 minutes.',
   9114),
  (18, 130, 2, 'Ikan Stim Limau (Steamed Fish with Lime and Chilli)',
   'A whole fish steamed with lemongrass and ginger, then bathed in a hot broth of lime juice, garlic, bird''s eye chilli and fish sauce.',
   15, 15, 30, '4', '3 to 4 servings', 'Malaysian', 'Main Course', NULL,
   'No steam oven? Stand the plate on a rack in a wok over rapidly boiling water, cover and steam on high heat for the same time. Taste the broth before pouring: it should be sour first, then salty, then hot.',
   9115);

INSERT INTO recipe_ingredient (recipe_id, position, text) VALUES
  (17, 1, '1 whole siakap (sea bass) or red snapper, 600 to 700 g, scaled and gutted'),
  (17, 2, '4 cm old ginger, sliced, for steaming'),
  (17, 3, '3 stalks spring onion, 2 cut in lengths for steaming, 1 finely shredded'),
  (17, 4, '3 cm young ginger, finely shredded, for topping'),
  (17, 5, '1 red chilli, finely shredded (optional)'),
  (17, 6, 'A few sprigs of coriander (optional)'),
  (17, 7, '3 tbsp light soy sauce'),
  (17, 8, '1 tsp sugar'),
  (17, 9, '3 tbsp water'),
  (17, 10, '1 tsp sesame oil'),
  (17, 11, '3 tbsp cooking oil'),
  (18, 1, '1 whole siakap (sea bass), 600 to 700 g, scaled and gutted'),
  (18, 2, '2 stalks lemongrass, bruised'),
  (18, 3, '3 cm ginger, sliced'),
  (18, 4, '6 cloves garlic, finely chopped'),
  (18, 5, '6 to 8 bird''s eye chillies (cili padi), chopped'),
  (18, 6, '4 to 5 limes (limau nipis), juiced, plus a few slices to garnish'),
  (18, 7, '2 tbsp fish sauce'),
  (18, 8, '1 tbsp sugar'),
  (18, 9, '150 ml chicken stock or water'),
  (18, 10, 'A handful of coriander or Chinese celery, chopped');

INSERT INTO recipe_step (recipe_id, position, text) VALUES
  (17, 1, 'Fill the steam oven''s water tank and preheat it on the highest steam setting.'),
  (17, 2, 'Rinse the fish, pat it dry inside and out, and cut two or three slashes on each side if it is thick.'),
  (17, 3, 'Lay the old ginger and the spring onion lengths on a heatproof plate and put the fish on top.'),
  (17, 4, 'Set the plate on the tray and steam for 10 to 12 minutes, until the flesh at the thickest part is white through and lifts off the bone.'),
  (17, 5, 'Meanwhile, warm the soy sauce, sugar, water and sesame oil in a small pan until the sugar dissolves.'),
  (17, 6, 'Take the plate out, pour away the steaming liquid and discard the ginger and spring onion underneath.'),
  (17, 7, 'Pile the shredded young ginger, spring onion and chilli on the fish.'),
  (17, 8, 'Heat the cooking oil until it shimmers and pour it over the ginger and spring onion so they sizzle.'),
  (17, 9, 'Pour the warm soy dressing around the fish, add the coriander and serve at once with rice.'),
  (18, 1, 'Fill the steam oven''s water tank and preheat it on the highest steam setting.'),
  (18, 2, 'Rinse the fish, pat it dry and cut two or three slashes on each side.'),
  (18, 3, 'Lay the lemongrass and ginger on a deep heatproof plate and put the fish on top.'),
  (18, 4, 'Set the plate on the tray and steam for 10 to 12 minutes, until the flesh at the thickest part is white through.'),
  (18, 5, 'Meanwhile, bring the stock, garlic, chilli, fish sauce and sugar to the boil, then take it off the heat.'),
  (18, 6, 'Stir the lime juice into the hot broth off the heat, and taste for sour, salty and hot.'),
  (18, 7, 'Take the plate out, pour away the steaming liquid and remove the lemongrass and ginger.'),
  (18, 8, 'Pour the hot lime broth over the fish, scatter the coriander and lime slices, and serve at once.');
