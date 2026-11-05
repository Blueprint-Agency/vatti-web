-- N6, wet kitchen and dry kitchen: which appliance goes where, English edition
-- (content schedule, November). Replaced "Vatti vs Rubine" on 2026-10-19 when
-- the owner ruled out rival comparisons. The Malay and Chinese editions are
-- translation-n6-wet-dry-kitchen-{ms,zh}.sql, sharing translation_key
-- 'wet-kitchen-vs-dry-kitchen'.
--
-- Target (Ubersuggest MY en, 2026-11-05): the "wet and dry kitchen" cluster,
-- not the "design" terms. `wet and dry kitchen` 320 (SD 13), `dry and wet
-- kitchen` 320 (SD 11), `wet kitchen dry kitchen` 320 (SD 13), `dry kitchen vs
-- wet kitchen` 110 (SD 9); `wet kitchen` 590 (SD 16) and `dry kitchen` 390
-- (SD 11) as secondaries. `wet kitchen design` (720) and `design wet kitchen`
-- (880) lead with an image pack and Pinterest boards (SERP last collected
-- 2026-09-02), so the page does not chase them.
--
-- The SERP is cabinet makers and renovators (signature.my, cartekitchen,
-- iqiconcept, qanvast, weiken): all of them on layout, cabinets and tiles, none
-- on which appliance belongs in which room. That is the piece. No existing
-- article mentions a wet kitchen except N4, once, so it competes with nothing.
--
-- No other brand is named. Every VATTI figure is product_facet or product_spec.
-- No price, running cost, renovation or installation arrangement (client,
-- 2026-10-03): placement is described as which room, never as how it is fitted.
-- Smart Auto Link is stated as the spec sheets state it, "selected models",
-- without promising a pairing the sheets do not list.
--
-- Featured image: the home page hero kitchen, already on R2 behind cdn() in
-- HomeView.tsx; given an image row (9109, after 9108) so an article can use it.

INSERT INTO image (id, url, legacy_url, alt, width, height) VALUES
  (9109, 'https://cdn.vattimalaysia.com/2026/09/home-hero-kitchen.webp', NULL,
   'An open-plan kitchen with a dining table and an island, two built-in ovens in a tall unit, and a VATTI cooker hood drawing steam off a wok on a gas hob.', 1774, 887);

INSERT INTO article (id, slug, path, section, title, h1, meta_description, body_md, word_count, reading_minutes, author, featured_image_id, published_at, modified_at, schema_disabled, is_published, lang, translation_key)
VALUES (121, 'wet-kitchen-vs-dry-kitchen', 'buying-guide/wet-kitchen-vs-dry-kitchen', 'buying-guide',
'Wet Kitchen vs Dry Kitchen: Which Appliance Goes Where',
'Wet Kitchen and Dry Kitchen: Which Appliance Goes Where',
'A wet and dry kitchen splits heavy cooking from light cooking. Which hood, hob, oven, dishwasher and water purifier belongs in each, and what to do with only one kitchen.',
'Many Malaysian homes have two kitchens. The wet kitchen, usually at the back, is where the wok comes out, the fish gets cleaned and the sambal gets fried. The dry kitchen, usually open to the dining area, is where you make coffee, heat a meal, bake and serve. Most guides to a wet and dry kitchen are about cabinets and tiles. This one is about the appliances, because the two rooms ask for different ones, and putting the right one in the wrong room is the most common mistake.

### Quick answer

- **Wet kitchen:** the most powerful hood you can fit, a high-output gas hob, and the dishwasher, because that is where the oily pots are.
- **Dry kitchen:** a quiet hood that looks like part of the cabinets, a flame-free or gentle hob, the built-in ovens and the microwave.
- **Water purifier:** at whichever sink you fill the kettle and the rice pot from.
- **Only one kitchen?** Choose the wet-kitchen hood and hob, and the quietest hood that can do the job, since the kitchen is also the living room.

[Ask us what to put in your kitchens](https://wa.me/60123366082)

## What makes a kitchen wet or dry

The names describe the mess, not the floor. A **wet kitchen** is built for cooking that throws up smoke, oil and steam: stir-frying at high heat, deep-frying, boiling soup for hours, cleaning fish and poultry. It is usually closed off, often near the back door or the yard, so the smell and the oil stay there.

A **dry kitchen** is built for cooking that stays clean: breakfast, reheating, baking, steaming, drinks and plating up. It is usually open to the dining or living area and is part of how the home looks, so finishes and noise matter more than raw power.

## Wet kitchen vs dry kitchen, side by side

| | Wet kitchen | Dry kitchen |
| --- | --- | --- |
| Typical cooking | Wok frying, deep-frying, sambal, soups, cleaning fish | Breakfast, reheating, baking, steaming, drinks |
| Smoke and oil | Heavy, daily | Light |
| Where it sits | Closed, at the back or by the yard | Open to the dining or living area |
| What matters in a hood | Airflow, suction pressure, oil capture | Low noise, a clean look, running without a duct |
| What matters in a hob | Heat output, wok support | Easy cleaning, no open flame, safety |
| Other appliances | Dishwasher | Built-in ovens, microwave |

## Which appliance goes where

### Cooker hood

**In the wet kitchen**, the hood does its hardest work, so choose it on airflow, suction pressure and oil capture. The [V960](/vatti-stellar-series-cooker-hood-v960/) moves the most air in the VATTI range, 3,690 m³/h at 1,700 Pa, which also suits a wet kitchen with a long duct in a high-rise unit. The [V919](/vatti-magic-series-cooker-hood-v919/) moves 3,050 m³/h at 1,300 Pa for high-heat cooking every day. If oil is the problem, the [V959](/vatti-cooker-hood-v959/) captures 95% of it, the highest in the range.

[![VATTI V960 cooker hood](https://cdn.vattimalaysia.com/2026/08/vatti-stellar-series-cooker-hood-v960-front.webp)](/vatti-stellar-series-cooker-hood-v960/)
[![VATTI V919 cooker hood](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-cooker-hood-v919-front.webp)](/vatti-magic-series-cooker-hood-v919/)
[![VATTI V959 cooker hood](https://cdn.vattimalaysia.com/2026/08/vatti-cooker-hood-v959-front.webp)](/vatti-cooker-hood-v959/)

**In the dry kitchen**, the hood is in full view and within earshot of the dining table. The [V929](/vatti-aetheris-series-cooker-hood-v929/) is the quietest VATTI hood at 46.5 dB and still moves 3,125 m³/h, so it copes when the dry kitchen gets used for real cooking. The [V938](/vatti-hidden-series-range-hood-v938/) sits flush with the cabinets with no chimney, at 48 dB. An open dry kitchen often has no outside wall; 13 VATTI hoods can run **ducted or recycled**, cleaning the air through a charcoal filter instead of a duct. Our guide to the [best kitchen hood in Malaysia](/buying-guide/best-kitchen-hood-malaysia/) compares every model.

[![VATTI V929 cooker hood](https://cdn.vattimalaysia.com/2026/08/vatti-aetheris-series-cooker-hood-v929-front.webp)](/vatti-aetheris-series-cooker-hood-v929/)
[![VATTI V938 cooker hood](https://cdn.vattimalaysia.com/2026/08/vatti-hidden-series-range-hood-v938-front.webp)](/vatti-hidden-series-range-hood-v938/)

Do not rely on an exhaust fan in either room for oily cooking. It clears the room, not the pan; our guide to [kitchen exhaust fans and cooker hoods](/buying-guide/kitchen-exhaust-fan-vs-cooker-hood/) explains the difference.

### Cooker hob

**In the wet kitchen**, it is a gas hob, and the more heat the better. The [C830G](/vatti-3-burner-gas-hob-c830g/) has three burners and 6.0 kW, the most in the range, for a family that cooks several dishes at once. The [C720S](/professional-series-c720s/) has a stainless steel top, three burners and 5.2 kW for heavy wok work. The [C836G](/vatti-flexi-hob-c836g/) turns the most of its gas into heat, with 73% efficiency.

[![VATTI C830G gas hob](https://cdn.vattimalaysia.com/2026/08/vatti-3-burner-gas-hob-c830g-front.webp)](/vatti-3-burner-gas-hob-c830g/)
[![VATTI C720S gas hob](https://cdn.vattimalaysia.com/2026/08/professional-series-c720s-front.webp)](/professional-series-c720s/)
[![VATTI C836G gas hob](https://cdn.vattimalaysia.com/2026/08/vatti-flexi-hob-c836g-front.webp)](/vatti-flexi-hob-c836g/)

**In the dry kitchen**, many families want no flame at all. The [ER3601T](/ceramic-cooker-hob-er3601t/) is a three-zone ceramic hob with a child lock and a residual heat warning, and a flat glass top that wipes clean. The [VH-IC9-LA](/vatti-cooker-hob-vh-ic9-la/) puts an induction zone, boosting to 2,300 W, beside a ceramic zone of up to 2,200 W. If you still want gas in the dry kitchen, the [C835G](/vatti-ai-hob-c835g/) has a cooking timer and an eight-speed flame for gentler cooking. Our [best gas hob guide](/buying-guide/best-gas-hob-malaysia/) and our comparison of [induction cookers and gas stoves](/buying-guide/induction-cooker-vs-gas-stove/) go further.

[![VATTI ER3601T ceramic hob](https://cdn.vattimalaysia.com/2024/08/Top-front-View-On.webp)](/ceramic-cooker-hob-er3601t/)
[![VATTI VH-IC9-LA induction and ceramic hob](https://cdn.vattimalaysia.com/2026/08/vatti-cooker-hob-vh-ic09al-front.webp)](/vatti-cooker-hob-vh-ic9-la/)
[![VATTI C835G gas hob](https://cdn.vattimalaysia.com/2026/08/vatti-ai-hob-c835g-front.webp)](/vatti-ai-hob-c835g/)

### Ovens and microwave

The built-in ovens belong in the **dry kitchen**, usually stacked at eye level in a tall unit, where you can watch the food and serve straight from them. A combi oven steams as well as bakes, so steamed fish, steamed egg and kuih can move out of the wet kitchen altogether: the [VA05](/built-in-combi-oven-va05/) and [VA06](/vatti-magic-series-combi-oven-va06/) each hold 70 L. The [O7559 air fryer oven](/vatti-built-in-air-fryer-oven-07559/) holds 75 L and air fries at full oven size, which takes a lot of frying off the wok. The [M626](/built-in-microwave-m626/) is a 25 L built-in microwave with a grill for reheating. See the [VATTI combi and steam ovens](/combi-and-steam-oven-in-malaysia/).

[![VATTI VA05 combi oven](https://cdn.vattimalaysia.com/2026/08/built-in-combi-oven-va05-front.webp)](/built-in-combi-oven-va05/)
[![VATTI VA06 combi oven](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-combi-oven-va06-front.webp)](/vatti-magic-series-combi-oven-va06/)
[![VATTI O7559 air fryer oven](https://cdn.vattimalaysia.com/2024/08/Built-in-air-fryer-oven-07559-product-photo.webp)](/vatti-built-in-air-fryer-oven-07559/)
[![VATTI M626 built-in microwave](https://cdn.vattimalaysia.com/2026/08/built-in-microwave-m626-front.webp)](/built-in-microwave-m626/)

### Dishwasher

Put the dishwasher where the dirty pots end up, which in most homes is the **wet kitchen**. Wok oil is the hard part of Malaysian washing up, and hot water is what removes it. The [DWBB7](/vatti-dishwasher-dwbb7/) washes at 75°C, dries at 110°C, takes 17 place settings and has an oil-intensive programme. The [DWID3](/vatti-dishwasher-dwid3-ag-grey/) takes 20 place settings plus a fruit and vegetable basket, for a family that cooks for guests. Compare both on the [dishwasher page](/dishwasher-in-malaysia/).

[![VATTI DWBB7 dishwasher](https://cdn.vattimalaysia.com/2024/08/Vatti-DWBB7-Dishwasher-photo-2.webp)](/vatti-dishwasher-dwbb7/)
[![VATTI DWID3 dishwasher](https://cdn.vattimalaysia.com/2026/08/vatti-dishwasher-dwid3-ag-grey-front.webp)](/vatti-dishwasher-dwid3-ag-grey/)

### Water purifier

Put it at the sink you fill the kettle and the rice pot from. In many homes that is the dry kitchen for drinks and the wet kitchen for cooking; choose the one you use more. The [WDHG01 One Tap](/vatti-one-tap-water-purifier-wdhg01-with-v818wd/) filters through an RO membrane and gives hot water at 45°C, 85°C or 100°C from the same tap, so it can stand in for a kettle in the dry kitchen. More on the [water purifier page](/one-tap-purifier-in-malaysia/).

[![VATTI WDHG01 One Tap water purifier](https://cdn.vattimalaysia.com/2026/08/vatti-one-tap-water-purifier-wdhg01-with-v818wd-front.webp)](/vatti-one-tap-water-purifier-wdhg01-with-v818wd/)

## If you have only one kitchen

Most condos have one kitchen, often open to the living room, that has to do both jobs. Plan it like a wet kitchen that guests can see.

- **Hood:** take the airflow of a wet-kitchen hood and the noise of a dry-kitchen one. The V929, at 3,125 m³/h and 46.5 dB, is the closest to both. If there is no outside wall, choose one of the 13 hoods that can run ducted or recycled; our guide to [ducted or ductless range hoods](/buying-guide/which-is-better-ducted-or-ductless-range-hood/) explains what changes.
- **Hob:** a gas hob for the wok. If you also want a flame-free zone, a ceramic or induction hob beside it covers both.
- **Hood and hob together:** selected VATTI hoods and hobs carry **Smart Auto Link**, so the hood switches on when the hob does. In an open kitchen that means the hood is already drawing when the first smoke rises. The V929, V938, V959, V960 and V997 hoods list it, and so do the C836G and VH-IC9-LA hobs; ask us which pairs work together.

## Wet and dry kitchen FAQs

**What is the difference between a wet kitchen and a dry kitchen?**
A wet kitchen is for heavy cooking that makes smoke, oil and mess, such as wok frying and deep-frying. A dry kitchen is for light cooking, baking, drinks and serving, and is usually open to the dining area.

**Do I need a cooker hood in the dry kitchen?**
Yes, if there is a hob there. Even light cooking puts steam and oil mist into an open room. A quiet hood such as the V929, at 46.5 dB, keeps it out of the living area without drowning out conversation.

**Should the oven go in the wet kitchen or the dry kitchen?**
The dry kitchen, in most homes. Ovens are used for baking, roasting and steaming, which make little smoke, and they are easier to use at eye level in a tall unit near where you serve.

**Where should the dishwasher go?**
Where the dirty pots and pans end up. In most Malaysian homes that is the wet kitchen, where the oily wok and pots are washed.

**Can a dry kitchen have a gas hob?**
Yes. Choose one with finer flame control for lighter cooking, such as the C835G with its eight-speed flame, and pair it with a quiet hood.

## Final thoughts

A wet and dry kitchen works when each room gets the appliances its cooking needs: power and oil capture at the back, quiet and clean lines at the front. Start with the hood and hob for the wet kitchen, since that is where the smoke is, then fit the dry kitchen around how you serve and entertain. Compare every model''s airflow, noise and oil capture on the [VATTI kitchen hood page](/kitchen-hood-in-malaysia/), or find a dealer near you on our [store locations page](/store-locations/).

[Compare VATTI kitchen hoods](/kitchen-hood-in-malaysia/)
', 1550, 8, 'Vatti Malaysia', 9109, '2026-11-05T12:00:00+08:00', '2026-11-05T12:00:00+08:00', 0, 1, 'en-MY', 'wet-kitchen-vs-dry-kitchen');
INSERT INTO article_category (article_id, category_id, is_primary) VALUES (121, (SELECT id FROM blog_category WHERE slug = 'buying-guide'), 1);
