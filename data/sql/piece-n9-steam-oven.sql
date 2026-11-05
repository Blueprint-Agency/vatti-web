-- N9, what a steam oven is and what it cooks in a Malaysian kitchen, English
-- edition (content schedule, November). The Malay and Chinese editions are
-- translation-n9-steam-oven-{ms,zh}.sql, sharing translation_key
-- 'what-is-a-steam-oven'. Ships with N10 (steamed fish), which links back here.
--
-- Target (Ubersuggest MY en, 2026-11-05): `steam oven` 880 (SD 10), the
-- informational head term. NOT `steam oven malaysia` (210) or `best steam oven
-- malaysia`: the oven category page already holds those (Search Console,
-- 5 Aug to 3 Nov 2026: position 10.1 and 14.7), and the SERP for them is shop
-- and category pages. Baseline recorded so a drop on the pillar after this
-- ships can be read as cannibalisation. Long-tail questions the body answers:
-- microwave steam oven (140), combi steam oven (110), steam oven or microwave,
-- is a steam oven worth it, can a steam oven bake.
--
-- Does not overlap buying-guide/what-is-a-combi-oven (2023), which is about
-- the combi format in general; this is about cooking with steam, dish by dish,
-- and links to it for the format. That article's "110°C" and "90 minutes" are
-- not on any spec sheet and are not repeated here.
--
-- VATTI sells no steam-only oven now (the Z4501 is retired), so the VATTI
-- models named are the VA05 and VA06 combi ovens. Every VATTI figure is
-- product_facet or product_spec: 70 L, 12 and 11 functions, three steam or
-- humidity levels, the VA06's 1.3 L tank, 68 auto menus, steam rice, steam
-- clean and heat dry. No steam temperature is given, since neither sheet
-- states one. No other brand is named; no price, running cost or installation.
--
-- Images: the cover (9110) is the VA06 steam shot (2026/08/va06-steam.webp, a
-- real product photo) with its two text callouts removed and the frame widened
-- to 16:9 in Higgsfield (gpt_image_2, low, 2026-11-05); the lobster, tray and
-- cavity are the original's. New key 2026/11/steam-oven-cover.webp. The VA06
-- humidity strip (9111) sits in the body, already on R2 as a product_feature
-- crop. Both given image rows so an article can use them.

INSERT INTO image (id, url, legacy_url, alt, width, height) VALUES
  (9110, 'https://cdn.vattimalaysia.com/2026/11/steam-oven-cover.webp', NULL,
   'A lobster on a plate steaming on the perforated tray of a VATTI combi oven, the open cavity filled with steam.', 1344, 752),
  (9111, 'https://cdn.vattimalaysia.com/2026/08/va06-humidity.webp', NULL,
   'Asparagus steamed at the VA06''s low, medium and high humidity levels, side by side.', 998, 439);

INSERT INTO article (id, slug, path, section, title, h1, meta_description, body_md, word_count, reading_minutes, author, featured_image_id, published_at, modified_at, schema_disabled, is_published, lang, translation_key)
VALUES (124, 'what-is-a-steam-oven', 'buying-guide/what-is-a-steam-oven', 'buying-guide',
'What Is a Steam Oven? What It Cooks in a Malaysian Kitchen',
'What Is a Steam Oven, and What Does It Cook in a Malaysian Kitchen?',
'What a steam oven is, how it differs from a combi oven and a steamer pot, and the Malaysian dishes it cooks best: steamed fish, egg, pau, kuih and rice.',
'A steam oven cooks food with steam inside a closed oven, instead of in a wok or a steamer pot on the hob. In a Malaysian kitchen that covers a lot: steamed fish, steamed egg, pau and dim sum, kuih, steamed cake, glutinous rice and the rice for tonight. This guide explains what a steam oven does, how it differs from a combi oven and a steamer pot, and which local dishes it cooks better than the wok.

### Quick answer

- **What it is:** an oven that heats water from a tank into steam and fills the cavity with it, so food cooks evenly from every side.
- **What it cooks best:** fish, egg, pau, dim sum, kuih, steamed cake, rice and vegetables, and reheating leftovers without drying them out.
- **Steam oven or combi oven:** a combi oven steams and bakes in the same cavity. Every VATTI model with steam is a combi oven.
- **Why not the wok:** nothing boils dry, no water drips onto the food, several trays cook at once, and the wok stays free for frying.

[Ask us about steam cooking](https://wa.me/60123366082)

## What is a steam oven?

A steam oven is a closed oven with a water tank and a steam generator. You fill the tank, choose a steam level and close the door. The oven turns the water into steam and fills the whole cavity with it, so the food is surrounded on every side rather than sitting over a pot of boiling water.

That is the difference from steaming on the hob. In a wok or a steamer pot, the heat comes from below, the water level drops as you cook, and condensation gathers on the lid and drips back onto the food. In a steam oven, the oven controls the steam, and there is no lid to drip.

## Steam oven, combi oven or steamer pot?

| | Steamer pot or wok | Steam oven | Combi oven |
| --- | --- | --- | --- |
| How it steams | Boiling water below the food | Steam fills a closed cavity | Steam fills a closed cavity |
| Can it bake and roast? | No | No | Yes, and steam and bake together |
| Space | One or two tiers | Several trays | Several trays |
| Watching it | Top up the water, check it has not boiled dry | Set and leave | Set and leave |
| Where it lives | On the hob | Built into the cabinets | Built into the cabinets |

A steamer pot (periuk kukus) is good for a quick plate of fish, but it ties up a burner and needs watching. A steam-only oven frees the hob but cannot bake. A **combi oven** does both in one cavity, and adds modes that use steam and dry heat together, which is why most built-in ovens with steam sold in Malaysia are combi ovens. Our guide to [what a combi oven is](/buying-guide/what-is-a-combi-oven/) explains the format in more detail.

## What a steam oven cooks in a Malaysian kitchen

### Steamed fish

Fish is the dish that sells most people on steam cooking. Steam on every side cooks a whole fish evenly from head to tail, so the thick part near the head is done when the tail is still moist. Cantonese style with soy, ginger and spring onion, and Malay style with lime and chilli, both start the same way: the fish on a plate, the plate on the tray, and the steam doing the rest. Our [steamed fish recipe](/recipe/steamed-fish-recipe/) gives both styles, step by step.

### Steamed egg

A smooth Chinese steamed egg (蒸蛋) is mostly about gentle, steady heat and no water dripping onto the surface. A lower steam setting and a closed cavity give you both, which is how you get a surface like glass instead of a honeycomb.

### Pau, dim sum and kuih

Pau, siu mai, har gow, kuih seri muka, kuih talam and steamed cake (kek kukus) all need even steam for a set time. With several trays in one cavity, a whole batch cooks at once instead of in rounds on a stacked steamer, and the bottom tier does not overcook while the top one catches up. Our [moist chocolate steamed cake](/recipe/moist-chocolate-steamed-cake/) is a good first bake.

### Rice and glutinous rice

Both VATTI combi ovens have a steam rice function. Glutinous rice for lo mai gai, and plain rice when the rice cooker is busy, both work on a tray.

### Vegetables and reheating

Steamed vegetables keep their colour and bite. For leftovers, steam brings rice, noodles and pau back without the hard edges a microwave leaves, though it takes longer. A [built-in microwave](/built-in-microwave-m626/) is still the faster choice for a quick reheat.

[![VATTI M626 built-in microwave](https://cdn.vattimalaysia.com/2026/08/built-in-microwave-m626-front.webp)](/built-in-microwave-m626/)

![Asparagus steamed at the VA06''s low, medium and high humidity levels, side by side.](https://cdn.vattimalaysia.com/2026/08/va06-humidity.webp)

## Why steam in an oven instead of the wok

- **It does not boil dry.** The oven controls the steam, so you are not topping up the water halfway through.
- **No water dripping.** There is no lid gathering condensation over the food, which is what spoils a steamed egg and dilutes the sauce on a fish. It is on the VA06 spec sheet as "no water dripping".
- **More at once.** A 70 L cavity takes several trays, so the fish, the egg and the vegetables can steam together.
- **The wok is free.** While the fish steams, the hob is free for the stir-fry.
- **It moves steaming to the dry kitchen.** Steaming makes little smoke or oil, so a built-in oven can sit in the dry kitchen at eye level. Our guide to the [wet kitchen and dry kitchen](/buying-guide/wet-kitchen-vs-dry-kitchen/) explains which appliance goes where.

## Steam and dry heat together

This is what a combi oven adds over a steam oven. **Steam-grill** roasts with steam in the cavity, so a chicken crisps outside and stays juicy inside. **Steam-bake** adds steam in the first minutes of baking, which gives bread its rise and a crisp, shiny crust. The VA06 lists steam grill and steam bake as combination functions, and the VA05 lists two combi functions.

## What to look for in a steam oven

- **Steam levels.** Different dishes want different amounts of steam. Both VATTI combi ovens have three: the VA05 has low, mid and high steam modes, and the VA06 has three humidity levels.
- **Capacity.** A family steaming several dishes at once needs room for more than one tray. Both models hold 70 L.
- **The water tank.** It sets how long the oven can steam before a refill. The VA06 has a 1.3 L tank.
- **Cleaning and descaling.** Steam leaves water and, over time, scale. Both models have two auto clean functions, steam clean and heat dry, so the cavity is cleaned and dried rather than left damp.
- **Auto menus.** Both have 68 auto cooking menus, which is the easiest way to learn the oven in the first week.

## VATTI combi ovens with steam

| | [VA05](/built-in-combi-oven-va05/) | [VA06](/vatti-magic-series-combi-oven-va06/) |
| --- | --- | --- |
| Capacity | 70 L | 70 L |
| Cooking functions | 12 (9 baking, 3 steam) | 11 |
| Steam levels | Low, mid and high steam | 3 humidity levels |
| Combination modes | 2 combi functions | Steam grill and steam bake |
| Air fryer | Yes | 2 air-fryer modes |
| Stew | | Porridge, meat and soup |
| Dual temperature control | Yes | Yes |
| Extras | Meat probe | 1.3 L water tank, no water dripping |
| Steam rice | Yes | Yes |
| Auto menus | 68 | 68 |
| Auto clean | Steam clean and heat dry | Steam clean and heat dry |

Choose the **VA05** if you roast meat often: it has a meat probe and one more cooking function. Choose the **VA06** if you steam and stew often: it adds three stew modes for porridge, meat and soup, and two air-fryer modes. Both are on the [combi and steam oven page](/combi-and-steam-oven-in-malaysia/).

[![VATTI VA05 combi oven](https://cdn.vattimalaysia.com/2026/08/built-in-combi-oven-va05-front.webp)](/built-in-combi-oven-va05/)
[![VATTI VA06 combi oven](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-combi-oven-va06-front.webp)](/vatti-magic-series-combi-oven-va06/)

## Steam oven FAQs

**Is a steam oven the same as a combi oven?**
No. A steam oven only steams. A combi oven steams, bakes and roasts in the same cavity, and can use steam and dry heat together. Every VATTI oven with steam is a combi oven.

**Can a steam oven replace a microwave?**
For reheating rice, noodles and pau, steam gives a better result because the food does not dry out. A microwave is faster, so many kitchens keep both.

**Can you bake in a steam oven?**
Not in a steam-only oven. A combi oven bakes like a normal oven and can add steam for bread and roasts.

**Where does the water come from?**
From a tank you fill before cooking. The VA06 has a 1.3 L tank.

**How do you clean a steam oven?**
Wipe the cavity once it has cooled and let it dry. Both VATTI combi ovens have a steam clean function that loosens grease and a heat dry function that takes the moisture out afterwards.

## Final thoughts

A steam oven makes steaming something you set and leave, which suits a Malaysian kitchen where fish, egg, pau and kuih are steamed every week. If you also bake or roast, a combi oven does both in one cavity. Compare the [VATTI combi and steam ovens](/combi-and-steam-oven-in-malaysia/), or find a dealer on our [store locations page](/store-locations/).

[Compare VATTI combi ovens](/combi-and-steam-oven-in-malaysia/)
', 1470, 8, 'Vatti Malaysia', 9110, '2026-11-05T15:00:00+08:00', '2026-11-05T15:00:00+08:00', 0, 1, 'en-MY', 'what-is-a-steam-oven');
INSERT INTO article_category (article_id, category_id, is_primary) VALUES (124, (SELECT id FROM blog_category WHERE slug = 'buying-guide'), 1);
INSERT INTO article_image (article_id, image_id, position) VALUES (124, 9111, 1);
