-- Tier 1 refresh (content schedule, 2026-11-05): five English hood articles that
-- already rank on page one but earn few clicks. Same URLs, same topics, same
-- target terms; the change is a search-led title and meta, a "Quick answer"
-- panel under the intro, an FAQ section, VATTI product panels where a model is
-- genuinely relevant, and WordPress leftovers cleaned out.
--
-- Baselines are Search Console, 5 Aug to 3 Nov 2026 (clicks / impressions /
-- CTR / average position). Every VATTI figure is product_facet, product_spec or
-- product_dimension (product section). No prices, running costs, installation
-- copy or rival brands. Every UPDATE is scoped to lang = 'en-MY'.
-- tips-tricks/how-to-install-chimney-hood is deliberately not in this file.
--
-- tips-tricks/kitchen-hood-without-vent (id 88): 49 clicks / 2,902 impressions / 1.69% CTR / position 7.6.
--   Top queries are "ductless kitchen hood" (75 imp, pos 3.8), "ductless kitchen hood malaysia", "kitchen hood without exhaust", "hood without ducting". Title now promises the answer and names ductless; the duplicated intro posing as a quick answer is replaced by five answer bullets; the broken comparison table (its headers read "Noise Type | Possible Fix") is rebuilt; "more affordable installation" and "replacement cost" are gone (no-prices rule); the dead [Enquire With Us](#) link is now the WhatsApp button; FAQ added; V929, V995, V917 panels (all "Ducted or recycled" in product_spec; V929 odour reduction 97% from product_spec).
--
-- buying-guide/which-is-better-ducted-or-ductless-range-hood (id 62): 31 clicks / 1,968 impressions / 1.58% CTR / position 7.0.
--   Top queries are "ductless kitchen hood" (66 imp), "ductless kitchen hood malaysia" (64), "ductless hood" (40, pos 2.4), "range hood ductless vs ducted". Title leads with "Ducted vs Ductless". Removed: the install-cost and running-cost arguments ("costs less to fit and more to run", Ongoing cost row, "running cost" in the meta) under the no-prices rule; the installation section (duct diameter, link to the install guide) and the hood-height and duct-conversion FAQs under the no-installation rule. Corrected "Every VATTI kitchen hood is a ducted extractor": product_spec lists "Ducted or recycled" on most models. Quick answer rebuilt as bullets; panels V960, V919, V995. en-MY only: the ms-MY and zh-MY editions sharing translation_key are untouched.
--
-- tips-tricks/how-to-clean-kitchen-hood-filter (id 87): 23 clicks / 821 impressions / 2.80% CTR / position 8.0.
--   Most impressions are charcoal filter queries ("charcoal filter hood" 17 imp, pos 4.7, zero clicks; "can you wash charcoal filters"). Added a charcoal filter section and put charcoal in the meta; quick answer rebuilt as bullets; filter types as term rows; FAQs trimmed from six to five (the "how long" answer moved into the quick answer). Panels V929 and V998 (no mesh, product_feature) and V937 (filter comes apart, steam and hot wash, product_spec/product_feature).
--
-- tips-tricks/how-to-measure-suction-power (id 99): 12 clicks / 876 impressions / 1.37% CTR / position 5.2.
--   Top queries are "kitchen hood suction power" (20 imp) and "hood suction power" (17, pos 4.3, zero clicks). Title leads with that term. Fixed two wrong product claims: "Vatti premium hoods reach up to 1300Pa" (V960 is 1,700 Pa) and V929 "in the middle for average family use" (it is 3,125 m3/h, 1,300 Pa). Removed the unsupported claim that VATTI publishes IEC and unrestricted airflow, the IEC 20-40% and "two bends cut 40-50%" figures, and the 75cm mounting height (installation). Steps are now a numbered list; FAQ added; the web.whatsapp.com link is now the wa.me button. Panels V996, V937, V929, V960, figures from product_facet.
--
-- tips-tricks/range-hood-maintenance (id 64): 10 clicks / 467 impressions / 2.14% CTR / position 17.0.
--   Queries are cleaning intent: "clean hood" (22 imp), "clean inside range hood" (13), "hood cleaning" (10), "how do i clean and maintain a kitchen hood". Title and h1 target cleaning inside and out. Fixed broken WordPress bold (tips 5 and 6 were wholly bold), the stray quote after the degreaser answer, and the FAQ that mixed paragraphs and bullets; removed "avoid costly repairs" (no-prices rule). Added quick answer, a cleaning schedule table, numbered steps, an auto-clean section and a signs-of-trouble list. Panels V919 (steam wash) and V917 (heat auto-clean), from product_spec/product_feature.

UPDATE article SET
  title = 'Kitchen Hood Without Vent: Do Ductless Hoods Really Work?',
  h1 = 'Kitchen Hood Without Vent: Is a Ductless Hood Safe, Effective and Worth It?',
  meta_description = 'A kitchen hood without vent catches grease and cuts odour, but heat and steam stay in the room. When a ductless hood is worth it in a Malaysian condo.',
  word_count = 1490,
  reading_minutes = 8,
  modified_at = '2026-11-05T22:00:00+08:00',
  body_md = 'A **kitchen hood without vent**, also called a ductless or recirculating hood, cleans the air and blows it back into the kitchen instead of sending it outside. It is the usual answer in Malaysian condos, apartments and rentals where no duct can reach an outside wall. This guide explains whether a ductless kitchen hood is safe, how well it copes with daily frying and wok cooking, and when it is worth it.

![kitchen hood without vent](https://cdn.vattimalaysia.com/2026/01/kitchen-hood-without-vent.webp)

### Quick answer

- **Does a kitchen hood without vent work?** Yes for grease and some odour: it catches oil in a grease filter, absorbs part of the smell in a charcoal filter, then returns the air to the room.

- **What can it not do?** It cannot remove heat, steam or the gases from a gas flame, because nothing leaves the kitchen.

- **Is it safe?** It is safer than cooking with no hood at all, as long as the charcoal filter is changed on time and the kitchen gets fresh air from a window or door.

- **Is it worth it?** Yes where a duct is impossible, such as a condo kitchen with no outside wall; where a duct can be run, a ducted hood is the better choice.

- **How often do the filters need attention?** Wash the grease filter monthly and replace the charcoal filter every three to six months under Malaysian cooking.

[Ask us which hood suits your kitchen](https://wa.me/60123366082)

## What is a kitchen hood without vent?

A kitchen hood without vent does not push air outdoors. It pulls the air from above the hob through a grease filter, then through a charcoal (activated carbon) filter, and releases it back into the kitchen through vents on the hood. You will also see it called a ductless, recirculating, recycling or non-ducted hood. They all mean the same thing.

A vented, or ducted, hood takes the same air out of the house through a duct, so the smoke, heat, moisture and smell all leave together. Our guide to [ducted vs ductless range hoods](/buying-guide/which-is-better-ducted-or-ductless-range-hood/) compares the two in detail.

Kitchens that usually end up ductless:

- Condos and apartments where the kitchen has no outside wall

- Rental homes where the landlord will not allow a new wall opening

- Island or open kitchens far from any outside wall

## Hidden health risks of cooking without ventilation

Cooking releases more than smell.

- **Gas cooking:** A gas flame gives off nitrogen dioxide, carbon monoxide and some formaldehyde. A charcoal filter does little against these gases, which is why fresh air still matters.

- **Frying and stir-frying:** Hot oil throws up smoke and fine grease particles, including ultrafine particles small enough to reach deep into the lungs.

- **Small kitchens:** In a compact condo kitchen, pollutants build up faster because there is less air to dilute them.

- **Smell is not the measure:** A kitchen can smell fine while fine particles still hang in the air. Odour fades faster than the particles do.

## Is a kitchen hood without vent effective?

It depends on what you expect from it.

What a ductless hood does well:

- Catches grease before it settles on cabinets, walls and ceiling

- Reduces cooking odour while the charcoal filter is fresh

- Draws smoke up from the hob so it does not drift across the room

What it cannot do:

- Remove heat and steam, which stay in the kitchen

- Remove combustion gases from a gas hob

- Keep up with heavy daily wok cooking the way a ducted hood does

Filter condition decides most of the result. A saturated charcoal filter stops absorbing odour, and a hood running on one is simply a fan moving greasy air around. Even so, a ductless hood is far better than cooking with no ventilation at all.

## Kitchen hood without vent vs vented hood

| | Kitchen hood without vent | Vented (ducted) hood |
| --- | --- | --- |
| Where the air goes | Back into the kitchen | Outside |
| Grease | Caught by the filter | Caught by the filter |
| Odour | Reduced while the charcoal is fresh | Removed |
| Heat and steam | Stay in the room | Removed |
| Heavy wok cooking | Struggles | Handles it |
| Filters | Grease filter plus a charcoal filter to replace | Grease filter only |
| Needs a route outside | No | Yes |
| Best for | Condos and rentals with no outside wall | Landed homes, condos with a duct path |

**Advantages:** no duct to run, it works in kitchens with no outside wall, and it can sit wherever the hob is.

**Disadvantages:** heat and moisture stay in a kitchen that is already warm in Malaysia, odour is reduced rather than removed, and the charcoal filter has to be replaced on schedule.

## How to improve air quality if you cannot vent outside

- **Keep the charcoal filter fresh:** Replace it every three to six months, sooner if you fry daily.

- **Wash the grease filter monthly:** A clogged mesh cuts the airflow. See [how to clean a kitchen hood filter](/tips-tricks/how-to-clean-kitchen-hood-filter/).

- **Switch the hood on before you start:** Leave it running for a few minutes after you finish cooking.

- **Cook on the back burners:** They sit closer to the hood''s intake, so more of the smoke is caught.

- **Bring in fresh air:** Open a window or the service yard door while you cook, especially on gas.

- **Do the heaviest frying in the wet kitchen:** If your home has one, keep wok work where it can be aired out. Our guide to the [wet kitchen vs dry kitchen](/buying-guide/wet-kitchen-vs-dry-kitchen/) explains the split.

## What to look for in a ductless kitchen hood

- **Airflow (m³/h):** More airflow pulls more smoke into the filters before it spreads. Our guide on [how to measure suction power](/tips-tricks/how-to-measure-suction-power/) explains the numbers.

- **Oil and odour figures:** Look for a stated oil filtration rate and, where given, an odour reduction rate. Those are the two jobs a ductless hood is doing.

- **Filter availability:** Check that replacement charcoal filters are easy to get for that model.

- **Noise:** You will run it for every meal, so compare decibel ratings.

- **Width:** The hood should be at least as wide as the hob. See [what hood size you need](/tips-tricks/what-hood-size-do-i-need/).

- **Both modes:** If you might renovate later, a hood that runs ducted or recirculating keeps the option open.

Every VATTI hood can run ducted or recycled, so the same hood can serve a condo kitchen now and a ducted kitchen later. The [VATTI Aetheris V929](/vatti-aetheris-series-cooker-hood-v929/) lists oil filtration up to 92%, odour reduction up to 97% and PM2.5 purification, at 46.5 dB. The [VATTI Slim Series V995](/slim-series-type-range-hood-v995/), made for condos and small kitchens, moves 2,050 m³/h with oil filtration up to 92% in a body 315 mm deep. The [VATTI V917](/vatti-cooker-hood-v917-carbon-grey/) gives 2,250 m³/h at 48 dB and cleans itself with a heat auto-clean cycle.

[![VATTI V929 cooker hood](https://cdn.vattimalaysia.com/2026/08/vatti-aetheris-series-cooker-hood-v929-front.webp)](/vatti-aetheris-series-cooker-hood-v929/)
[![VATTI V995 cooker hood](https://cdn.vattimalaysia.com/2026/08/slim-series-type-range-hood-v995-front.webp)](/slim-series-type-range-hood-v995/)
[![VATTI V917 cooker hood](https://cdn.vattimalaysia.com/2026/08/vatti-cooker-hood-v917-carbon-grey-front.webp)](/vatti-cooker-hood-v917-carbon-grey/)

### The honeycomb filter that makes a VATTI hood ductless

Every VATTI hood can run ducted or recycled. To run recycled, the hood uses a honeycomb recirculation filter on its air outlet in place of the duct: a round filter about 200 mm across and 215 mm tall that cleans the air before it returns to the kitchen. It is made for condos where management does not allow a hole in the kitchen wall.

![The VATTI honeycomb recirculation filter, a round black mesh cylinder, beside a drawing of it on the hood''s outlet: 200 mm across the top, 170 mm at the base, 215 mm tall.](https://cdn.vattimalaysia.com/2026/11/hood-honeycomb-filter-photo-and-size.webp)

## Kitchen hood without vent FAQs

**Are ductless range hoods worth it?**
Yes, where a duct cannot be run. They catch grease and reduce odour, which protects your cabinets and makes the kitchen more pleasant to cook in. Where a duct is possible, a ducted hood does more.

**Do ductless hoods remove smoke?**
They catch the grease in the smoke and some of the smell, but the air itself comes back into the kitchen. Fine smoke and heat are reduced rather than removed, so fresh air from a window still helps.

**Can I use a kitchen hood without vent with a gas stove?**
Yes, but keep a window or door open while you cook. A charcoal filter does not remove the nitrogen dioxide and carbon monoxide that a gas flame produces.

**How often should I change the charcoal filter?**
Every three to six months for most Malaysian households, and closer to three if you fry or stir-fry daily. A charcoal filter cannot be washed, and once cooking smells stop clearing, it is spent.

**Is a ductless hood enough for wok cooking?**
For occasional wok cooking, it helps. For heavy daily wok cooking, the heat, steam and smoke outpace it, and a ducted hood is the better choice if your kitchen allows one.

## Final thoughts

A kitchen hood without vent will not clear heat and fumes the way a vented hood does, but it is a practical and safer choice for Malaysian homes that cannot vent outside. Keep the grease filter clean, change the charcoal on time, and let fresh air in while you cook. To compare airflow, oil filtration and noise across the range, see [VATTI cooker hoods in Malaysia](/kitchen-hood-in-malaysia/), or see them in person at a [VATTI dealer near you](/store-locations/).

[Explore VATTI Kitchen Hood](/kitchen-hood-in-malaysia/)'
WHERE path = 'tips-tricks/kitchen-hood-without-vent' AND lang = 'en-MY';

UPDATE article SET
  title = 'Ducted vs Ductless Range Hood: Which Is Better in Malaysia?',
  h1 = 'Ducted or Ductless Range Hood: Which Is Better in Malaysia?',
  meta_description = 'Ducted is better wherever a duct can reach outside: it removes smoke, heat and odour. Ductless only filters the air. Which suits wok cooking and condos.',
  word_count = 1330,
  reading_minutes = 7,
  modified_at = '2026-11-05T22:00:00+08:00',
  body_md = 'A ducted range hood pushes smoke, steam and grease out of the house through a duct. A ductless hood, also called a recirculating hood, pulls the air through filters and blows it back into the kitchen. Which one is better depends on one question: can a duct reach an outside wall or a ceiling void that leads outside? If it can, ducted wins on almost every measure. If it cannot, ductless is the option you have, and this guide explains what to expect from it.

![which is better ducted or ductless range hood](https://cdn.vattimalaysia.com/2025/02/which-is-better-ducted-or-ductless-range-hood.webp)

### Quick answer

- **Which is better?** A ducted range hood, whenever the building lets a duct reach outside.

- **Why ducted wins:** It removes heat, humidity and odour along with the smoke, and it keeps up with daily wok cooking.

- **When ductless is right:** When no duct can reach an outside wall or ceiling void, as in some condo kitchens and rentals.

- **What ductless can do:** Catch grease and reduce odour through a charcoal filter, then return the air to the kitchen.

- **Can one hood do both?** Yes: every VATTI hood can run ducted or recycled.

[Ask us whether your kitchen suits ducted or ductless](https://wa.me/60123366082)

## How each type works

A **ducted hood** draws air through a grease filter or an oil-separating chamber, then drives it along a duct to a vent on an external wall or through the roof. The grease stays in the hood; everything else leaves the house.

A **ductless hood** draws air through the same grease stage, then through a charcoal filter that absorbs some of the odour, and returns the air to the room through vents on the hood. The grease is caught, some of the smell is caught, and the heat and moisture stay in the kitchen.

## Ducted vs ductless at a glance

| | Ducted | Ductless |
| --- | --- | --- |
| Where the air goes | Outside | Back into the kitchen |
| Smoke and grease | Removed | Grease caught, fine smoke partly returned |
| Odour | Removed | Reduced, not removed |
| Heat and humidity | Removed | Stay in the room |
| Wok and high-heat cooking | Handles it | Struggles |
| Needs a route outside | Yes | No |
| Upkeep | Wash the grease filter | Wash the grease filter, replace the charcoal every 3 to 6 months |
| Best for | Landed homes, condos with a duct path | Kitchens with no route outside |

## Performance: what a Malaysian kitchen asks of a hood

Stir-frying at high heat produces more smoke and oil mist in five minutes than an oven does in an hour. A hood should turn the kitchen''s air over 10 to 15 times an hour, and a wok pushes that well up. Our guide on [how to measure suction power](/tips-tricks/how-to-measure-suction-power/) works through the sum for your kitchen.

A ducted hood can meet it, and the figure to compare is not only airflow but air pressure: the push a hood keeps once the air has to climb a riser and turn corners. The [VATTI kitchen hoods](/kitchen-hood-in-malaysia/) run from 420 Pa up to 1,700 Pa. At the top, the [VATTI Stellar V960](/vatti-stellar-series-cooker-hood-v960/) moves 3,690 m³/h at 1,700 Pa, for long ducts and high-rise units, and the [VATTI Magic V919](/vatti-magic-series-cooker-hood-v919/) gives 3,050 m³/h at 1,300 Pa for high-heat cooking every day. Our guide to [what hood size you need](/tips-tricks/what-hood-size-do-i-need/) explains how to match width and airflow to the hob.

[![VATTI V960 cooker hood](https://cdn.vattimalaysia.com/2026/08/vatti-stellar-series-cooker-hood-v960-front.webp)](/vatti-stellar-series-cooker-hood-v960/)
[![VATTI V919 cooker hood](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-cooker-hood-v919-front.webp)](/vatti-magic-series-cooker-hood-v919/)

A ductless hood has no such number to win on. It can catch the grease and part of the smell, but the hot, wet air is still in the room, and charcoal saturates quickly under daily frying.

## The deciding factor: can the air get outside?

A ducted hood needs a route from the hood to an external wall, or into a ceiling void that leads outside. In a landed house that route is almost always there. In a condominium it depends on the unit: many have a kitchen on an external wall or beside a service yard, some have a duct provision built in, and some management rules forbid new wall openings. Check with management before you buy.

A ductless hood needs only a wall and a socket. That simplicity is its whole appeal.

## Maintenance

A ducted hood''s grease filter is washed rather than replaced, and hoods with an auto-clean cycle wash their own impeller with steam or hot water. See [how to clean a kitchen hood filter](/tips-tricks/how-to-clean-kitchen-hood-filter/).

A ductless hood has the same grease filter to wash, plus a charcoal filter that cannot be washed and needs replacing every three to six months under Malaysian cooking. A hood run on a spent charcoal filter is a fan that blows greasy air around the room.

## When ductless is the right call

- **No route outside:** The kitchen has no external wall and no ceiling route, and management will not allow one.

- **A rental:** The landlord will not permit ducting.

- **Light cooking:** Reheating, boiling and the occasional pan-fry rather than daily wok work.

In those cases a ductless hood is far better than no hood, and our guide to a [kitchen hood without a vent](/tips-tricks/kitchen-hood-without-vent/) explains how to choose one and what to expect. If the kitchen may be ducted later, any VATTI hood will do: every model runs both ways, recycled through a honeycomb filter about 200 mm across and 215 mm tall. The [VATTI Slim Series V995](/slim-series-type-range-hood-v995/) moves 2,050 m³/h with oil filtration up to 92%, and is 315 mm deep, sized for condos and small kitchens.

[![VATTI V995 cooker hood](https://cdn.vattimalaysia.com/2026/08/slim-series-type-range-hood-v995-front.webp)](/slim-series-type-range-hood-v995/)

![The VATTI honeycomb recirculation filter, a round black mesh cylinder, beside a drawing of it on the hood''s outlet: 200 mm across the top, 170 mm at the base, 215 mm tall.](https://cdn.vattimalaysia.com/2026/11/hood-honeycomb-filter-photo-and-size.webp)

## So which is better?

Ducted, if the duct can be run. It is the only kind that actually removes the smoke, the smell, the heat and the humidity from a kitchen, and it is the only kind that keeps up with a wok. Ductless is the fallback for kitchens where a duct is impossible, and it is a real improvement over nothing, but it should not be chosen for convenience where ducting was possible.

## Ducted vs ductless FAQs

**Are ductless range hoods any good?**
Yes, within limits. They catch grease and reduce smell, which is a real improvement over no hood. They do not remove heat, steam or fine smoke, so they suit light cooking better than daily wok cooking.

**Do ductless range hoods need filters?**
Yes, two. A grease filter that you wash, and a charcoal filter that you replace every three to six months. The charcoal filter does the deodorising, and it cannot be cleaned.

**Where does the air go in a ductless range hood?**
Through the grease filter, through the charcoal filter, and back out into the kitchen through vents on the hood. None of it leaves the house, which is why the heat and steam stay in the room.

**What is a good airflow for a range hood?**
Work it out from the kitchen: its volume in cubic metres times 10 to 15 air changes an hour, then allow far more for wok cooking. If a spec sheet quotes CFM, multiply by 1.7 to get m³/h: 600 CFM is about 1,020 m³/h.

**Is a ductless hood enough for wok cooking?**
No. It will catch some grease and some smell, but the smoke, heat and steam of high-heat frying stay in the room. If you cook that way, find a route for a duct.

## Final thoughts

The choice between ducted and ductless is really the choice between removing the problem and filtering part of it. Run a duct if the building allows, and pick a hood with the air pressure to push through that run. The [VATTI kitchen hood](/kitchen-hood-in-malaysia/) range lists airflow, pressure and noise for each model so you can match one to your kitchen, and every model can run ducted or recycled.

[Explore VATTI Kitchen Hood Malaysia](/kitchen-hood-in-malaysia/)'
WHERE path = 'buying-guide/which-is-better-ducted-or-ductless-range-hood' AND lang = 'en-MY';

UPDATE article SET
  title = 'How to Clean a Kitchen Hood Filter in 5 Steps, Every Type',
  h1 = 'How to Clean a Kitchen Hood Filter: Mesh, Baffle and Charcoal',
  meta_description = 'Soak in hot water, dish soap and baking soda for 15 to 30 minutes, scrub, rinse, dry. How often, the dishwasher, and why charcoal filters are replaced.',
  word_count = 1500,
  reading_minutes = 8,
  modified_at = '2026-11-05T22:00:00+08:00',
  body_md = 'In a Malaysian kitchen the hood filter fills with grease faster than anywhere else in the house. Daily frying and stir-frying send oil mist straight into it, and once the mesh is clogged the hood loses suction, smells start to linger, and the grease itself becomes a fire risk. Cleaning the filter is a 30-minute job and the single most useful thing you can do for a cooker hood. This guide explains how, for every filter type, and how often.

![how to clean kitchen hood filter](https://cdn.vattimalaysia.com/2026/01/how-to-clean-kitchen-hood-filter.webp)

### Quick answer

- **How to clean it:** Soak the filter in very hot water with grease-cutting dish soap and two to three tablespoons of baking soda for 15 to 30 minutes, scrub with a soft brush, rinse and dry fully.

- **How often:** Monthly for daily home cooking, and every two to four weeks for heavy frying or wok cooking.

- **Dishwasher:** Stainless steel baffle filters are usually fine; aluminium mesh can turn dull, so check the manual first.

- **Charcoal filters:** A charcoal (carbon) filter cannot be washed. Replace it every three to six months.

- **How long it takes:** About 30 to 45 minutes, most of it soaking.

[Ask us about a hood that is easier to clean](https://wa.me/60123366082)

## Why a clean filter matters

- **Suction:** Grease in the mesh blocks the airflow, and a hood pulling through a clogged filter cannot clear the smoke it was rated for.

- **Fire safety:** Cooking grease is flammable, and a filter caked with it sits directly above the flame.

- **Smell:** Old grease holds odour. A kitchen that smells of yesterday''s cooking usually has a filter that needs washing.

- **Motor life:** A blocked filter makes the motor work harder for less air, and that is what wears it out early.

## Know your filter type first

- **Aluminium mesh filters:** The most common in home hoods. Layered mesh in a frame, light and reusable. This guide is mostly about them.

- **Stainless steel baffle filters:** Angled plates that trap grease by making the air change direction. They clean the same way and take harder scrubbing.

- **Charcoal or carbon filters:** Fitted to ductless hoods behind the grease filter. They absorb odour and cannot be washed.

- **No mesh at all:** Some hoods separate the oil without a mesh and collect it in an oil cup that you empty and wash.

## How often to clean a hood filter

| Cooking habit | Clean the filter |
| --- | --- |
| Light cooking, little frying | Every 2 to 3 months |
| Daily home cooking | Monthly |
| Heavy frying or wok cooking | Every 2 to 4 weeks |

A quick check: hold the filter up to the light. If you cannot see through the mesh, it is overdue.

## How to clean a kitchen hood filter, step by step

### Step 1: Switch off and remove the filter

Turn the hood off at the switch. Most mesh filters have a spring clip or a latch on the front edge: press it and the filter drops down. Have a tray underneath, because a full filter drips. Gloves help, since the edges are sharp and the grease is unpleasant.

### Step 2: Soak in hot water, soap and baking soda

Fill the sink or a large basin with water as hot as the tap gives, around 60 to 70°C. Add a good squirt of grease-cutting dish soap and two to three tablespoons of baking soda, then submerge the filter fully. Leave it for 15 to 30 minutes. The heat softens the grease, and the baking soda, which is alkaline, breaks it down.

If the filter does not fit the sink, lay it in the bath or a storage box, or do one half at a time.

### Step 3: Scrub

Use a soft brush, a non-scratch sponge or an old toothbrush for the corners. After the soak most of the grease lifts with light pressure. Avoid steel wool and stiff brushes: they bend the mesh and scratch the frame.

For a filter that has been neglected for months, drain the basin, sprinkle baking soda straight onto the mesh, scrub, then soak again.

### Step 4: Rinse and dry completely

Rinse under warm running water until it runs clear and no suds remain. Then dry the filter fully. Standing it on edge on a towel overnight is safest; a hairdryer on low speeds it up. A filter refitted damp will smell and, on aluminium, can start to corrode.

### Step 5: Refit and wipe the hood

Clip the filter back in the way it came out. While it is out, wipe the inside and underside of the hood with a cloth and the same hot soapy water. Our guide to [range hood maintenance](/tips-tricks/range-hood-maintenance/) covers the rest of the hood.

## Can you put a hood filter in the dishwasher?

Often, but check the manual first. Stainless steel baffle filters are dishwasher-safe. Aluminium mesh filters usually are too, but alkaline dishwasher detergent can leave aluminium dull and grey, and a heavily greased filter can clog the dishwasher''s own filter. If you use the dishwasher, run the filter on its own on a hot programme and clean the dishwasher filter afterwards. Never put a charcoal filter in.

## Charcoal filters: replace, do not wash

A charcoal filter, also sold as a carbon filter, sits behind the grease filter on a hood that recirculates air instead of venting it outside. It works by absorbing odour into the activated charcoal, and once that charcoal is full it stops working. Soaking or washing it does not empty it; it ruins it.

- **When to replace:** Every three to six months, closer to three if you fry or stir-fry daily.

- **Signs it is spent:** Cooking smells hang around longer, or the air coming out of the hood smells stale.

- **Protect it:** Keep the grease filter in front of it clean. Grease that gets past a clogged mesh coats the charcoal and shortens its life.

- **When you change it:** Wipe the housing it sits in with a damp, soapy cloth before the new one goes in.

Our guide to a [kitchen hood without vent](/tips-tricks/kitchen-hood-without-vent/) explains how recirculating hoods work.

## Hoods that make the job smaller

Many current hoods carry an auto-clean cycle. Steam, hot water or a turbo wash runs through the fan chamber and loosens the oil on the impeller before it hardens, which is the part a filter wash never reaches. It does not replace washing the filter, but it keeps the suction from fading between washes. Our guide to [what auto-clean is](/tips-tricks/what-is-auto-clean/) explains how the cycle works.

Some VATTI hoods go further and remove the mesh altogether. The [VATTI Aetheris V929](/vatti-aetheris-series-cooker-hood-v929/) lets oil run down a tempered glass panel into an oil cup you empty, with oil filtration up to 92% and a turbo wash auto-clean cycle. The [VATTI Smart Oxygen V998](/vatti-smart-oxygen-range-hood-v998/) has no mesh filter to lift out either, with oil filtration up to 92% and the same turbo wash. Where a mesh is kept, the [VATTI Triple Intake V937](/triple-intake-series-t-type-cooker-hood-v937/) has a main oil filter that comes apart completely for the sink, plus a steam and hot wash auto-clean, at 2,500 m³/h.

[![VATTI V929 cooker hood](https://cdn.vattimalaysia.com/2026/08/vatti-aetheris-series-cooker-hood-v929-front.webp)](/vatti-aetheris-series-cooker-hood-v929/)
[![VATTI V998 cooker hood](https://cdn.vattimalaysia.com/2026/08/vatti-smart-oxygen-range-hood-v998-front.webp)](/vatti-smart-oxygen-range-hood-v998/)
[![VATTI V937 cooker hood](https://cdn.vattimalaysia.com/2023/11/VATTI_V937_front_NEW.webp)](/triple-intake-series-t-type-cooker-hood-v937/)

## Hood filter cleaning FAQs

**Can I use vinegar to clean a hood filter?**
Yes, as a second step for light grease. Do not add it to the baking soda soak, because the two neutralise each other and you lose the effect of both.

**Does baking soda really remove grease?**
Yes. It is alkaline, and alkalis break cooking oil down into compounds that rinse away. It is also mild enough not to harm aluminium.

**Can you wash a charcoal filter?**
No. Washing destroys the charcoal''s ability to absorb odour, and a wet carbon filter can grow mould. Replace it every three to six months instead.

**Why does the hood still smell after cleaning the filter?**
Grease inside the fan chamber, a spent charcoal filter on a ductless hood, or grease in the duct itself. An auto-clean cycle handles the first, the second needs a new filter, and the third needs a service visit.

**Should I replace an aluminium mesh filter?**
When the mesh is torn, bent so it no longer sits flat, or corroded. A filter that still fits and washes clean can last the life of the hood.

## Final thoughts

A clean filter is what keeps a hood pulling at the airflow it was sold with. Wash it monthly, more often if you fry every day, let it dry before it goes back, and replace a charcoal filter rather than washing it. If you are replacing the hood, the [VATTI kitchen hood range](/kitchen-hood-in-malaysia/) includes models with auto-clean cycles and models with no mesh filter at all, which are the two ways to make this job smaller.

[Explore VATTI Kitchen Hood](/kitchen-hood-in-malaysia/)'
WHERE path = 'tips-tricks/how-to-clean-kitchen-hood-filter' AND lang = 'en-MY';

UPDATE article SET
  title = 'Kitchen Hood Suction Power: How to Measure What You Need',
  h1 = 'How to Measure the Suction Power of a Kitchen Hood',
  meta_description = 'Suction power is airflow (m³/h) plus air pressure (Pa). Work out what your kitchen needs, test a hood at home, and why condo ducts need more pressure.',
  word_count = 1710,
  reading_minutes = 9,
  modified_at = '2026-11-05T22:00:00+08:00',
  body_md = 'Walk into any kitchen appliance showroom in Malaysia and you will see hoods sold on **big suction numbers**: 1,500 m³/h, 2,500 m³/h, sometimes far higher. Most shoppers have no idea what those figures mean or whether a bigger number guarantees a better hood. Suction power is not a single number. It is two specs working together, and knowing how to read and measure them is the difference between a hood that clears your kitchen and one that only sounds powerful on paper. This guide explains how kitchen hood suction power is measured, how much your kitchen needs, and how to test a hood at home.

![How to Measure the Suction Power of a Kitchen Hood](https://cdn.vattimalaysia.com/2026/05/How-to-Measure-the-Suction-Power-of-a-Kitchen-Hood.webp)

### Quick answer

- **What suction power means:** Two figures together: airflow in m³/h (how much air the hood moves) and air pressure in Pa (how hard it pushes that air through filters and ducting).

- **How much airflow you need:** Multiply the kitchen''s volume (length × width × height in metres) by 10 to 15 air changes an hour, then allow three to four times that for daily wok cooking.

- **A worked example:** A 3 m × 4 m × 2.7 m kitchen holds 32.4 m³, so it needs 324 to 486 m³/h for light cooking and about 1,300 to 1,500 m³/h for daily wok frying.

- **Air pressure for condos:** Long shared ducts in high-rise units call for 800 Pa or more.

- **How to test at home:** On full speed, a tissue held under the filter should cling, and incense smoke or kettle steam should rise straight into the hood.

[Ask us how much suction your kitchen needs](https://wa.me/60123366082)

## What does suction power actually mean?

When people say suction power, they mean how strongly a kitchen hood pulls smoke and air away from the hob. That strength comes from two things: **how much air the hood can move** and **how forcefully it can move that air** past filters, ducting and bends.

In Malaysia this matters more than most homeowners realise. **High-rise condos often use long, shared service ducts**, and landed homes have ducts of different lengths to an outside wall. A hood with strong airflow on paper can still underperform if it lacks the pressure to push air through those real conditions.

## The two numbers on the spec sheet

- **Airflow (m³/h):** Cubic metres of air moved per hour at full speed. The higher the number, the more air the motor shifts. Airflow is the most quoted figure, but on its own it does not tell the full story.

- **Air pressure (Pa):** Measured in pascals, it tells you how forcefully the hood pushes air against resistance. Filters, long duct runs, bends and wind at the outlet all reduce airflow, and a hood with high pressure keeps pulling through them. VATTI hoods run from 420 Pa to 1,700 Pa. In a condo, this number matters even more than airflow.

## How to work out the suction your kitchen needs

The standard method is to multiply your kitchen''s volume by the number of air changes an hour you want. For kitchens, that is **10 to 15 air changes an hour**, depending on how hard you cook.

1. **Measure the kitchen.** Note the length, width and ceiling height in metres, for example 3 m × 4 m × 2.7 m.
2. **Work out the volume.** 3 × 4 × 2.7 = 32.4 cubic metres.
3. **Apply the air change rate.** 32.4 × 10 = 324 m³/h for light cooking, and 32.4 × 15 = 486 m³/h for heavier cooking.
4. **Add a Malaysian cooking allowance.** Those baselines assume mild cooking. For wok stir-frying, deep-frying and grilling, multiply by three or four. The same 32.4 m³ kitchen used for daily wok cooking realistically needs around 1,300 to 1,500 m³/h.

That is why most hoods sold for Malaysian kitchens are rated well above 1,500 m³/h: local cooking produces far more smoke and oil than the baseline formula assumes.

## How airflow figures are measured

Not every airflow figure is measured the same way, which is why two hoods with the same headline number can perform differently at home.

- **Maximum airflow:** The fan is measured with nothing in its way, no filter and no duct. It gives the biggest number, and it is the figure most often printed in marketing.

- **Airflow against resistance:** The hood is tested with its filters in place and a duct attached. The figure is lower, but it is closer to what you will get in a real kitchen.

When you compare two models, look at the air pressure as well as the airflow. A hood with a high pressure figure loses less of its airflow once the duct and filter are in the way. If a spec sheet does not say how its airflow was measured, ask.

## How to test the suction power of a hood at home

You cannot measure exact m³/h or Pa without lab equipment, but four quick checks tell you whether a hood is doing its job:

- **The tissue test:** Turn the hood to its highest setting and hold a piece of tissue just under the filter. It should cling firmly. If it drops away, the hood is underpowered or the filter is clogged.

- **The incense or steam test:** Light a stick of incense, or boil a kettle, directly under the hood on full speed. The smoke or steam should be drawn up cleanly, not drift sideways or hover.

- **The smoke clearance test:** After a heavy stir-fry, time how long the hood takes to clear the visible smoke. A well-sized hood should clear most of it within 30 to 60 seconds.

- **The side-leak check:** Hold your hand near the edge of the hood while it runs. You should feel air drawn upward. Air spilling sideways means the hood is too narrow for the hob or short on pressure.

If a hood that used to pass these tests now fails them, clean the filter first. See [how to clean a kitchen hood filter](/tips-tricks/how-to-clean-kitchen-hood-filter/).

## Recommended suction power for Malaysian kitchens

These benchmarks are based on Malaysian cooking habits and kitchen layouts. Use them as a starting point when comparing models:

| Cooking style | Recommended airflow (m³/h) | Recommended air pressure (Pa) |
| --- | --- | --- |
| Light cooking (occasional stir-fry, mainly boiling and reheating) | 800 to 1,000 | 400 to 600 |
| Average family wok cooking | 1,000 to 1,500 | 600 to 800 |
| Heavy daily Asian cooking (deep-frying, grilling, daily wok) | 1,500 to 2,500 | 800 to 1,300 |
| High-rise condo (any cooking style, long shared duct) | 1,200 to 2,000 | 1,000 and above (prioritise this) |

How the VATTI range lines up against that table: for tight spaces and lighter cooking, the [VATTI Slim Series V995](/slim-series-type-range-hood-v995/) gives 2,050 m³/h at 450 Pa. For heavy daily cooking across a wide hob, the [VATTI Triple Intake V937](/triple-intake-series-t-type-cooker-hood-v937/) delivers 2,500 m³/h at 1,050 Pa. For heavy wok cooking and open kitchens, the [VATTI Aetheris V929](/vatti-aetheris-series-cooker-hood-v929/) moves 3,125 m³/h at 1,300 Pa. For long ducts and high-rise units, the [VATTI Stellar V960](/vatti-stellar-series-cooker-hood-v960/) is the strongest in the range at 3,690 m³/h and 1,700 Pa.

[![VATTI V995 cooker hood](https://cdn.vattimalaysia.com/2026/08/slim-series-type-range-hood-v995-front.webp)](/slim-series-type-range-hood-v995/)
[![VATTI V937 cooker hood](https://cdn.vattimalaysia.com/2023/11/VATTI_V937_front_NEW.webp)](/triple-intake-series-t-type-cooker-hood-v937/)
[![VATTI V929 cooker hood](https://cdn.vattimalaysia.com/2026/08/vatti-aetheris-series-cooker-hood-v929-front.webp)](/vatti-aetheris-series-cooker-hood-v929/)
[![VATTI V960 cooker hood](https://cdn.vattimalaysia.com/2026/08/vatti-stellar-series-cooker-hood-v960-front.webp)](/vatti-stellar-series-cooker-hood-v960/)

## Other factors that affect real-world suction

Even with the right figures on paper, a hood''s real performance depends on the kitchen it works in:

- **Duct length and bends:** Every metre of duct and every bend takes away some of the airflow. The longer and more winding the run, the more air pressure the hood needs.

- **Filter type and condition:** Baffle filters let air through more freely than mesh, but both clog with oil, and a grease-loaded filter can halve the real suction.

- **Distance from the pan:** The further the hood sits above the hob, the more smoke escapes before it is caught, whatever the motor''s rating.

- **Hood width against hob width:** A 60 cm hood over a 90 cm hob lets smoke escape at the sides. The hood should be at least as wide as the hob. See [what hood size you need](/tips-tricks/what-hood-size-do-i-need/).

- **Motor type:** A BLDC (brushless DC) motor holds its suction more consistently over the years than a conventional motor.

- **Canopy design:** A hood with a wide capture area and well-shaped airflow can outperform a higher-rated hood with a poor design.

## Kitchen hood suction power FAQs

**What is a good suction power for a kitchen hood in Malaysia?**
For average family wok cooking, aim for 1,000 to 1,500 m³/h. For heavy daily frying, 1,500 m³/h and above. In a high-rise condo with a long shared duct, look for 1,000 Pa of air pressure or more as well.

**Is a higher m³/h always better?**
Not on its own. A hood with high airflow but low pressure loses much of that airflow once filters and a long duct are in the way. Compare the two figures together.

**What is the difference between m³/h and Pa?**
m³/h is the volume of air the hood moves in an hour. Pa is the pressure it can push that air with. Airflow tells you how much, pressure tells you how far.

**How do I convert CFM to m³/h?**
Multiply CFM by 1.7. A hood rated at 600 CFM moves about 1,020 m³/h.

**Why has my hood lost suction?**
Usually a clogged grease filter or oil built up on the fan. Wash the filter, run the auto-clean cycle if the hood has one, and if suction is still weak, have the duct checked. Our guide to [range hood maintenance](/tips-tricks/range-hood-maintenance/) covers the routine.

## Final thoughts

Suction power is airflow and air pressure read together, matched to your kitchen''s size and the way you cook. Work out your kitchen''s volume, allow for wok cooking, and give pressure extra weight if you live in a condo. To compare every model''s figures side by side, see the [VATTI kitchen hoods in Malaysia](/kitchen-hood-in-malaysia/), or send us your kitchen size and cooking style for a recommendation.

[Ask us to match a hood to your kitchen](https://wa.me/60123366082)

[Explore VATTI Kitchen Hood](/kitchen-hood-in-malaysia/)'
WHERE path = 'tips-tricks/how-to-measure-suction-power' AND lang = 'en-MY';

UPDATE article SET
  title = 'Range Hood Maintenance: How to Clean It Inside and Out',
  h1 = 'Range Hood Maintenance: How to Clean a Range Hood Inside and Out',
  meta_description = 'Wipe the outside weekly, wash the filter monthly, clean inside the hood every 3 to 6 months. A simple range hood cleaning routine for Malaysian kitchens.',
  word_count = 1160,
  reading_minutes = 6,
  modified_at = '2026-11-05T22:00:00+08:00',
  body_md = 'A range hood in a Malaysian kitchen takes in oil mist from frying and stir-frying every day, and that grease settles on the filter, inside the hood and on the fan. Regular range hood maintenance keeps the air clean, keeps the suction strong, and stops grease from becoming a fire risk. This guide gives you a simple cleaning schedule and shows how to clean a range hood inside and out.

![range hood maintenance](https://cdn.vattimalaysia.com/2025/03/range-hood-maintanence.webp)

### Quick answer

- **Weekly:** Wipe the outside and underside of the hood with warm soapy water and a soft cloth.

- **Monthly:** Wash the grease filter, or every two to four weeks if you cook with a wok daily.

- **Every three to six months:** Clean inside the hood and around the fan, or run the auto-clean cycle if your hood has one, and replace any charcoal filter.

- **Once a year:** If the hood vents outside, have the duct checked for grease and leaks.

- **Every time:** Switch off at the mains first, and use mild detergent rather than abrasive cleaners.

[Ask us about a hood that cleans itself](https://wa.me/60123366082)

## Range hood maintenance: 7 simple tips

- **Clean regularly:** A monthly clean stops grease building up on the filter, the fan and the outside of the hood, where it cuts performance and dulls the finish.

- **Wash or replace the filters:** Metal mesh and baffle filters are washed, monthly for most homes. Charcoal filters on ductless hoods cannot be washed and are replaced every three to six months.

- **Check the duct for leaks:** If your hood vents outside, a cracked or loose duct lets smoke and smell leak back into the kitchen.

- **Use mild detergents:** Dish soap or an all-purpose cleaner on a soft cloth. Abrasive cleaners and scourers scratch the surface and can lead to rust or discolouration.

- **Keep the fan clean:** Grease on the fan blades reduces airflow and adds noise.

- **Check the lights:** A burnt-out lamp makes it harder to see the pan, especially at night. Replace it promptly.

- **Clean the duct yearly:** Grease and dust collect inside the duct over time. A vacuum or brush reaches the ends; a full duct clean is a job for a service technician.

## Range hood cleaning schedule

| How often | What to clean |
| --- | --- |
| After heavy frying | Wipe splashes off the underside while they are fresh |
| Weekly | Outside panels, control panel and underside |
| Monthly | Grease filter, or every 2 to 4 weeks for daily wok cooking |
| Every 3 to 6 months | Inside the hood, the fan area, the oil cup; replace any charcoal filter |
| Yearly | Duct check for grease build-up and leaks |

## How to clean a range hood, step by step

1. **Switch off at the mains.** Turn the hood off at the switch and isolate the power before you reach inside.
2. **Remove and soak the filters.** Soak them in very hot water with dish soap and baking soda for 15 to 30 minutes. Our guide on [how to clean a kitchen hood filter](/tips-tricks/how-to-clean-kitchen-hood-filter/) covers each filter type.
3. **Clean the outside.** Wipe stainless steel along the grain with a soft cloth and mild cleaner, and clean glass panels with a glass cleaner. See our [stainless steel cleaning tips](/tips-tricks/stainless-steel-cleaning-solutions-5-tips/).
4. **Clean inside the hood.** With the filters out, spray a kitchen degreaser onto a cloth, not into the hood, and wipe the inner surfaces. Empty and wash the oil cup or tray if your hood has one.
5. **Wipe the fan blades if you can reach them.** Use a damp cloth or sponge and do not bend the blades. If the fan is behind a cover, leave it to the auto-clean cycle or a service visit.
6. **Dry and refit.** Let everything dry fully, refit the filters and switch the power back on.

## Let the hood clean itself

Many current hoods have an auto-clean cycle that loosens the oil inside the fan chamber, the part you cannot reach with a cloth. It does not replace washing the filter, but it keeps the inside of the hood and the suction in good shape between cleans. Our guide to [what auto-clean is](/tips-tricks/what-is-auto-clean/) explains the different types.

On the [VATTI Magic V919](/vatti-magic-series-cooker-hood-v919/), a high pressure steam wash runs at the press of one key: take the oil cup off, put the filled water cup in, start the cycle, then pour away the dirty water. It does this on a hood rated at 3,050 m³/h with oil filtration up to 92%. The [VATTI V917](/vatti-cooker-hood-v917-carbon-grey/) uses heat instead: with no water cup to fill, it heats the cavity until the oil dissolves and the fan throws it clear, on a 2,250 m³/h hood running at 48 dB.

[![VATTI V919 cooker hood](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-cooker-hood-v919-front.webp)](/vatti-magic-series-cooker-hood-v919/)
[![VATTI V917 cooker hood](https://cdn.vattimalaysia.com/2026/08/vatti-cooker-hood-v917-carbon-grey-front.webp)](/vatti-cooker-hood-v917-carbon-grey/)

## Signs your range hood needs attention

- **Weaker suction:** Smoke drifts past the hood. Clean the filter first.

- **More noise than before:** Usually grease on the fan or a loose part. See [why a range hood makes noise](/tips-tricks/range-hood-making-noise/).

- **Smells that linger:** A dirty filter, grease inside the hood, or a spent charcoal filter.

- **Grease dripping:** The filter or oil cup is full.

If the hood still struggles after a thorough clean, it may be time to look at [when to replace your range hood](/buying-guide/when-to-replace-your-range-hood/).

## Range hood maintenance FAQs

**Do range hoods need to be cleaned?**
Yes. Grease and oil build-up reduces performance and increases the risk of fire. Regular cleaning keeps the airflow up and extends the life of the hood.

**How often should I clean my range hood?**
Wipe the outside weekly and wash the filter monthly, more often with daily wok cooking. Clean inside the hood every three to six months, or let an auto-clean cycle do it.

**Can I use WD-40 to clean my cooker hood?**
No. WD-40 is a lubricant and rust preventer, not a cleaner, and it leaves an oily film that collects more grease. Use dish soap or a kitchen degreaser instead.

**What is a degreaser used for?**
A degreaser breaks down oil, grease and sticky residue. It is useful inside a range hood, where grease builds up, and it helps restore the hood''s airflow. Apply it to a cloth rather than spraying it into the hood.

**How long do range hoods last?**
A range hood can last 10 to 15 years with proper maintenance. Cleaning the filter, the inside of the hood and the duct regularly is what gets you there.

## Final thoughts

Range hood maintenance is a few minutes a week and a proper clean every month or so, and it is what keeps a hood quiet, strong and safe. If you are choosing a new hood, an auto-clean cycle takes the hardest part of the job off your hands. Compare the range at [VATTI kitchen hoods](/kitchen-hood-in-malaysia/).

[Explore VATTI products](/kitchen-hood-in-malaysia/)'
WHERE path = 'tips-tricks/range-hood-maintenance' AND lang = 'en-MY';

-- Product-shot panels: hero image of each model named in the body.
INSERT INTO article_image (article_id, image_id, position) VALUES (88, 9018, 1);
INSERT INTO article_image (article_id, image_id, position) VALUES (88, 9011, 2);
INSERT INTO article_image (article_id, image_id, position) VALUES (88, 9035, 3);
INSERT INTO article_image (article_id, image_id, position) VALUES (62, 9030, 1);
INSERT INTO article_image (article_id, image_id, position) VALUES (62, 9016, 2);
INSERT INTO article_image (article_id, image_id, position) VALUES (62, 9011, 3);
INSERT INTO article_image (article_id, image_id, position) VALUES (87, 9018, 1);
INSERT INTO article_image (article_id, image_id, position) VALUES (87, 9026, 2);
INSERT INTO article_image (article_id, image_id, position) VALUES (87, 41, 3);
INSERT INTO article_image (article_id, image_id, position) VALUES (99, 9011, 1);
INSERT INTO article_image (article_id, image_id, position) VALUES (99, 41, 2);
INSERT INTO article_image (article_id, image_id, position) VALUES (99, 9018, 3);
INSERT INTO article_image (article_id, image_id, position) VALUES (99, 9030, 4);
INSERT INTO article_image (article_id, image_id, position) VALUES (64, 9016, 1);
INSERT INTO article_image (article_id, image_id, position) VALUES (64, 9035, 2);

-- The honeycomb recirculation filter, 2026-11-18. The client confirmed that every
-- VATTI hood runs ducted or recycled, and that recycled operation uses this filter
-- on the hood's outlet (200 mm across, 170 mm at the base, 215 mm tall, per the
-- drawing the client supplied). The client's photo and drawing, set side by side as one
-- landscape figure (the photo alone is portrait and ran 940px tall in the column). Shown in the two English ductless guides here and in their Malay and
-- Chinese editions (refresh-tier1-2026-11-hoods-i18n.sql).
INSERT INTO image (id, url, legacy_url, alt, width, height) VALUES
  (9117, 'https://cdn.vattimalaysia.com/2026/11/hood-honeycomb-filter-photo-and-size.webp', NULL,
   'The VATTI honeycomb recirculation filter, a round black mesh cylinder, beside a drawing of it on the hood''s outlet: 200 mm across the top, 170 mm at the base, 215 mm tall.', 1896, 840);
INSERT INTO article_image (article_id, image_id, position) VALUES
  (88, 9117, 4),
  (62, 9117, 4),
  (108, 9117, 3),
  (110, 9117, 3);

-- The V991 and V996 were retired on 2026-11-07 (retired-products-2026-11.sql).
-- what-is-a-chimney-hood still recommended both by name; its body is importer
-- output (articles.sql, do not hand-edit), so the swap is made here. The V995 is
-- the slim model still sold; the V999, same Athena lifting series as the V991,
-- is 2,500 m³/h at 1,000 Pa (product_facet), stronger than the V991 it replaces.
-- how-to-install-chimney-hood also names the V996 and is left alone: the client
-- asked on 2026-11-18 to keep that article as it is.
UPDATE article SET body_md = replace(body_md,
  'For tight condo kitchens, the [Vatti Slim Series V996](/vatti-slim-series-type-range-hood-v996/) fits where a full size unit would not, and the [Vatti Athena Lifting V991](/athena-series-lifting-type-range-hood-v991/) is built for households that cook heavily every day.',
  'For tight condo kitchens, the [Vatti Slim Series V995](/slim-series-type-range-hood-v995/) fits where a full size unit would not, and the [Vatti Athena Lifting V999](/athena-series-lifting-type-range-hood-v999/), at 2,500 m³/h and 1,000 Pa, suits households that cook heavily every day.'),
  modified_at = '2026-11-18T12:00:00+08:00'
WHERE path = 'tips-tricks/what-is-a-chimney-hood' AND lang = 'en-MY';
