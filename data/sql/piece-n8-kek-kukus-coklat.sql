-- N8, moist chocolate steamed cake (kek kukus coklat moist), English edition
-- (content schedule, November; swapped in 2026-11-05 for "best induction
-- hob"). The Malay and Chinese editions are
-- translation-n8-kek-kukus-coklat-{ms,zh}.sql, sharing translation_key
-- 'moist-chocolate-steamed-cake'.
--
-- Target (Ubersuggest MY, 2026-11-05): the schedule planned on `resepi kek
-- kukus` (320, SD 22), but `kek kukus coklat moist` measures 8,100 in the
-- Malay data (SD 25) and 9,900 in the English (SD 24), with `coklat moist kek
-- kukus` 1,900, `kek kukus coklat` 390 and `kek kukus` 720. Malaysians search
-- the Malay name whatever language they read in, so the English title carries
-- it beside the English. `kek kukus milo` (210) and `resepi kek kukus sukatan
-- cawan` (110 to 140) are answered by the Milo note and the cup measures.
--
-- Steam settings named as VATTI names them; no oven temperature. Cooking times
-- are kitchen practice for a 20 cm tin. The one oven temperature, in the FAQ
-- about baking it instead, is ordinary baking practice and not a VATTI figure.
-- Calories left NULL.
--
-- Image 9116 generated in Higgsfield (gpt_image_2, low, 2026-11-05): the
-- client has no photo of the dish. Food only, no oven.

INSERT INTO image (id, url, legacy_url, alt, width, height) VALUES
  (9116, 'https://cdn.vattimalaysia.com/2026/11/kek-kukus-coklat-moist.webp', NULL,
   'A moist chocolate steamed cake covered in glossy chocolate ganache, with one slice lifted out on a cake server to show the soft crumb, and a glass of teh tarik behind.', 1344, 752);

INSERT INTO article (id, slug, path, section, title, h1, meta_description, body_md, word_count, reading_minutes, author, featured_image_id, published_at, modified_at, schema_disabled, is_published, lang, translation_key)
VALUES (133, 'moist-chocolate-steamed-cake', 'recipe/moist-chocolate-steamed-cake', 'recipe',
'Kek Kukus Coklat Moist: Moist Chocolate Steamed Cake Recipe',
'Moist Chocolate Steamed Cake (Kek Kukus Coklat Moist), in a Steam Oven',
'A soft, moist chocolate steamed cake with a glossy ganache, in cup measures. How to steam it in a steam oven or a wok, a Milo version, and why it sinks.',
'Kek kukus coklat moist is the chocolate cake Malaysians make for birthdays, open houses and the office potluck: dark, soft, almost wet in the middle, under a thick layer of glossy chocolate. It is steamed, not baked, which is what keeps it so moist. This recipe uses cup measures, works in a steam oven or a wok, and comes with a Milo version.

### At a glance

- **Tin:** one 20 cm (8 inch) round tin, greased and lined.
- **Steaming:** 45 to 50 minutes on the highest steam setting.
- **Done when:** a skewer pushed into the centre comes out clean.
- **Makes:** 10 to 12 slices.

## Why a steamed cake stays so moist

In an oven, dry heat sets a crust and drives water out of the cake. In steam, the air around the cake is full of moisture, so the outside never dries and the crumb stays soft and damp all the way through. The batter for a kek kukus is runny on purpose: a lot of liquid, oil instead of butter, and both bicarbonate of soda and baking powder, so it rises in the steam without drying out.

## Why steam it in a steam oven

The classic way is a big steamer on the hob, with the lid wrapped in a cloth so that drops of water do not fall onto the cake and leave it pitted and soggy. You have to keep the water at a rolling boil for the best part of an hour and top it up with boiling water.

A steam oven does that job for you. Steam fills the cavity evenly, the oven controls it so nothing boils dry, and there is no lid dripping onto the cake. Both VATTI combi ovens steam: the [VA05](/built-in-combi-oven-va05/) has low, mid and high steam modes, and the [VA06](/vatti-magic-series-combi-oven-va06/) has three steaming modes and lists "no water dripping" on its spec sheet. Use the highest setting. Our guide to [what a steam oven is](/buying-guide/what-is-a-steam-oven/) explains what else it cooks.

[![VATTI VA05 combi oven](https://cdn.vattimalaysia.com/2026/08/built-in-combi-oven-va05-front.webp)](/built-in-combi-oven-va05/)
[![VATTI VA06 combi oven](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-combi-oven-va06-front.webp)](/vatti-magic-series-combi-oven-va06/)

## Tips for a moist, even cake

- **Eggs and milk at room temperature.** Cold liquid makes the batter set unevenly.
- **Spoon the flour into the cup.** Scooping packs it down and gives you too much flour, which makes a dry, heavy cake.
- **Mix until just combined.** Overmixing after the flour goes in makes the cake tough. A few small lumps are fine.
- **Tap the tin.** Drop it gently on the counter two or three times to knock out big air bubbles.
- **Do not open the door early.** Letting the steam out in the first 30 minutes is the usual reason a steamed cake sinks.

## The Milo version

For kek kukus Milo, use 1/4 cup cocoa powder and 1/2 cup Milo instead of the 1/2 cup cocoa, and cut the sugar to 3/4 cup, since Milo is already sweet. The cake comes out lighter in colour and malty. Everything else stays the same.

## The chocolate ganache

Pour the ganache over the cake only when the cake is completely cool, or it will slide off and soak in. Warm the cream until it steams, pour it over the chopped chocolate, wait two minutes and stir from the centre until glossy, then stir in the butter. Chill the finished cake for 30 minutes to set the top. Many Malaysians serve it straight from the fridge.

## Kek kukus coklat FAQs

**Why did my steamed cake sink?**
Usually because the door or lid was opened too early, the steam was not strong enough from the start, or there was too much raising agent. Preheat on full steam before the tin goes in, and do not open it for the first 30 minutes.

**Why is my steamed cake hard or dense?**
Too much flour, from scooping rather than spooning it into the cup, or overmixing once the flour is in. Mix until just combined.

**How long do you steam a chocolate cake?**
About 45 to 50 minutes for a 20 cm round tin on full steam. Cupcakes take 15 to 20 minutes. Test with a skewer in the centre.

**Can I bake this cake instead?**
Yes. Bake it at about 170°C for 40 to 45 minutes. It will have a firmer top and a slightly less moist crumb than the steamed version.

**How long does kek kukus coklat keep?**
Up to four days in the fridge in a covered container. Bring it out 15 minutes before serving if you like it softer.

## Final thoughts

Kek kukus coklat moist is forgiving if you measure the flour properly, mix lightly and keep the steam going. In a steam oven it is even easier: no cloth on the lid, no water to top up, and no drops on the top. If you steam fish, egg and kuih as well, see our [steamed fish recipe](/recipe/steamed-fish-recipe/), or compare the [VATTI combi and steam ovens](/combi-and-steam-oven-in-malaysia/).

[Compare VATTI combi ovens](/combi-and-steam-oven-in-malaysia/)
', 800, 5, 'Vatti Malaysia', 9116, '2026-11-05T21:00:00+08:00', '2026-11-05T21:00:00+08:00', 0, 1, 'en-MY', 'moist-chocolate-steamed-cake');
INSERT INTO article_category (article_id, category_id, is_primary) VALUES (133, (SELECT id FROM blog_category WHERE slug = 'recipe'), 1);

INSERT INTO recipe (id, article_id, position, name, description, prep_minutes, cook_minutes, total_minutes, yield_qty, yield_label, cuisine, meal_category, calories, notes, hero_image_id) VALUES
  (23, 133, 1, 'Moist Chocolate Steamed Cake (Kek Kukus Coklat Moist)',
   'A dark, soft and moist steamed chocolate cake under a glossy chocolate ganache, in cup measures.',
   15, 50, 65, '12', '10 to 12 slices', 'Malaysian', 'Dessert', NULL,
   'No steam oven? Bring a large steamer to a rolling boil, wrap the lid in a clean cloth so it does not drip, and steam on medium-high heat for the same time, topping up with boiling water. For the Milo version, use 1/4 cup cocoa and 1/2 cup Milo, and 3/4 cup sugar. Cool the cake completely before the ganache goes on.',
   9116);

INSERT INTO recipe_ingredient (recipe_id, position, text) VALUES
  (23, 1, '1 cup (130 g) plain flour'),
  (23, 2, '1/2 cup (45 g) cocoa powder'),
  (23, 3, '1 cup (200 g) caster sugar'),
  (23, 4, '1 tsp bicarbonate of soda'),
  (23, 5, '1 tsp baking powder'),
  (23, 6, '1/4 tsp salt'),
  (23, 7, '2 eggs, at room temperature'),
  (23, 8, '1/2 cup (120 ml) cooking oil'),
  (23, 9, '1/2 cup (120 ml) sweetened condensed milk'),
  (23, 10, '1 cup (250 ml) fresh milk, at room temperature'),
  (23, 11, '1 tsp vanilla essence'),
  (23, 12, 'For the ganache: 150 g dark cooking chocolate, chopped'),
  (23, 13, 'For the ganache: 100 ml whipping cream'),
  (23, 14, 'For the ganache: 1 tbsp butter');

INSERT INTO recipe_step (recipe_id, position, text) VALUES
  (23, 1, 'Fill the steam oven''s water tank and preheat it on the highest steam setting. Grease a 20 cm round tin and line the base with baking paper.'),
  (23, 2, 'Sift the flour, cocoa, bicarbonate of soda, baking powder and salt into a bowl, and stir in the sugar.'),
  (23, 3, 'In another bowl, whisk the eggs, oil, condensed milk, fresh milk and vanilla until smooth.'),
  (23, 4, 'Pour the wet mixture into the dry and whisk until just combined. The batter will be runny.'),
  (23, 5, 'Pour the batter into the tin and tap it on the counter two or three times to knock out large bubbles.'),
  (23, 6, 'Set the tin on the tray, cover it loosely with foil, and steam for 45 to 50 minutes without opening the door for the first 30.'),
  (23, 7, 'Test with a skewer in the centre; it should come out clean. Leave the cake in the tin for 10 minutes, then turn it out and cool completely.'),
  (23, 8, 'For the ganache, heat the cream until it steams, pour it over the chopped chocolate, wait 2 minutes, then stir until glossy and stir in the butter.'),
  (23, 9, 'Pour the ganache over the cooled cake, let it run down the sides, and chill for 30 minutes to set before slicing.');
