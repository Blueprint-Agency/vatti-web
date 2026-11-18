-- Tier 1 refresh, ovens and auto clean (content schedule, 2026-11-05).
-- Six English articles that already rank on page one but earn few clicks.
-- Each keeps its URL, topic, target terms and substantive sections; the
-- changes are for click-through and snippet / AI Overview extraction:
-- a title that leads with the searched term and promises the answer, a
-- "### Quick answer" panel of term rows under the intro, an FAQ section
-- rendered as disclosures, and product panels where a VATTI model is named.
-- Every VATTI figure is from product_facet, product_spec or product_dimension
-- (product section). No steam temperature or preheat time is claimed for any
-- VATTI oven. No prices, no running costs, no installation copy, no rival
-- brands, no em dashes. Queries quoted below are Search Console, page filter,
-- 5 Aug to 3 Nov 2026. Scoped to en-MY per CLAUDE.md: the ms/zh editions
-- (if any) are untouched.
--
-- tips-tricks/baking-cake-oven-setting (id 90): 93 clicks / 10,991 impressions / 0.85% CTR / position 5.8.
--   Top queries: oven setting for cake, oven settings for baking cake, top or
--   bottom heat for baking cakes. Title cut to 60 and now answers the top-or-bottom
--   question; quick answer as five term rows; top-or-bottom heat added to the FAQ;
--   unsupported "hold their set temperature precisely" claim replaced with the
--   VA05/VA06 dual temperature control from the spec sheet; VA05, VA06, 07559 panel.
-- tips-tricks/oven-symbols-and-meanings (id 91): 78 clicks / 6,928 impressions / 1.13% CTR / position 10.2.
--   Top queries: oven symbols, convection oven symbol, bake symbol on oven, fan
--   oven symbol, conventional oven symbol. Title names fan, grill and bake; quick
--   answer as five icon rows; air fry and steam icons added (steam links the new
--   steam oven guide); a dish-to-symbol table replaces the loose list; Final
--   thoughts folded into the VATTI passage; VA06, VA05, 07559 panel. Stays the
--   general guide; the baking-specific page is oven-symbol-for-baking.
-- tips-tricks/oven-symbol-for-baking (id 89): 43 clicks / 3,879 impressions / 1.11% CTR / position 5.3.
--   Top queries: bake icon on oven, bake oven icon, cake oven setting symbol, bake
--   mode symbol. Title now leads with "bake symbol on oven"; quick answer as five
--   term rows; steps renumbered; "which symbol is bake" added to the FAQ; links to
--   the cookie and pizza symbol guides; VA06, VA05, 07559 panel. Kept
--   baking-specific so it does not compete with oven-symbols-and-meanings.
-- tips-tricks/how-long-to-preheat-oven (id 92): 28 clicks / 16,974 impressions / 0.16% CTR / position 6.3.
--   Google answers the snippet itself, so the title now promises the chart
--   (minutes by temperature) rather than the one number. Quick answer states the
--   minutes per temperature band; conversion table gains fan-oven and exact-
--   Fahrenheit figures (the page shows for bare "200 c" and "220 celsius to
--   fahrenheit" queries). Removed: the energy FAQ (a running-cost argument) and
--   the unsupported claim that VATTI steam modes heat faster (no preheat time is
--   published). VA05, VA06, 07559 panel.
-- tips-tricks/which-oven-symbol-for-pizza (id 95): 26 clicks / 1,816 impressions / 1.43% CTR / position 5.5.
--   Top queries: which oven symbol for pizza, best oven setting for pizza. Biggest
--   clean-up of the six: duplicated Conclusion and Final thoughts merged, bullets
--   that ran into paragraphs fixed, the inconsistent "fan assisted" table row
--   dropped, the O755P recommendation removed (unpublished, and its link pointed at
--   the category), web.whatsapp.com link replaced by the wa.me button. Quick answer
--   and five FAQs added; VA05, VA06, 07559 panel on dual temperature control.
-- tips-tricks/what-is-auto-clean (id 106): 32 clicks / 1,474 impressions / 2.17% CTR / position 7.0.
--   Top queries: vatti v938, auto clean range hood, cooker hood auto clean. Quick
--   answer and five FAQs added; airflow and pressure from product_facet added to
--   each system and the table; oven and microwave auto clean (VA05, VA06, M626)
--   added for the generic "what is auto clean" intent. Removed: cleaning
--   percentages and cycle minutes (99.1%, 99.2%, 99.99%, 99%, 99.9%, 60 and 17
--   minutes), none of which is in product_facet/spec/dimension; the italic caption
--   links (now product panels); the wrong "V997" alt on the V917 image; the
--   web.whatsapp.com link. Panels: V938, V960, V917, V929, V919, VA05, VA06, M626.

-- tips-tricks/baking-cake-oven-setting
UPDATE article SET
  title = 'Oven Setting for Cake: Top and Bottom Heat at 160 to 180°C',
  h1 = 'Best Oven Setting for Baking Cakes: Mode, Temperature and Rack',
  meta_description = 'Bake cakes on top and bottom heat with no fan, at 160 to 180°C on the middle rack. Settings and times by cake type, fan adjustments and fixes for faults.',
  word_count = 1200,
  reading_minutes = 6,
  modified_at = '2026-11-05T22:00:00+08:00',
  body_md = 'If your cake sinks, cracks or bakes unevenly, the problem is usually the oven setting rather than the recipe. Cakes need steady, moderate heat from above and below, a tin in the middle of the oven, and a door that stays shut. This guide gives the exact settings for every common kind of cake: which mode, what temperature, how long, and which rack. If you are not sure which icon on your dial is which, read our guide to the [oven symbol for baking cakes](/tips-tricks/oven-symbol-for-baking/) first.

### Quick answer

- **Mode:** conventional, which is top and bottom heat with no fan, shown as two horizontal lines.
- **Temperature:** 160 to 180°C for most cakes, lower for sponges and higher for butter cakes.
- **Rack:** the middle rack, with the tin centred.
- **Fan:** use it only for cupcakes and several trays, and take 10 to 20°C off the temperature.
- **Cheesecake:** 150°C on bottom heat or conventional, one rack below the middle.

![baking cake oven setting](https://cdn.vattimalaysia.com/2026/02/baking-cake-oven-setting.webp)

## Oven settings by cake type

| Cake | Mode | Temperature | Time | Rack |
| --- | --- | --- | --- | --- |
| Sponge or chiffon | Conventional | 160 to 170°C | 25 to 35 min | Middle |
| Butter or pound cake | Conventional | 170 to 180°C | 45 to 60 min | Middle |
| Cupcakes and muffins | Conventional or fan | 170°C (fan 160°C) | 18 to 22 min | Middle |
| Brownies | Conventional | 170°C | 25 to 30 min | Middle |
| Cheesecake | Bottom heat or conventional | 150°C | 50 to 70 min | Lower middle |
| Fruit cake | Conventional | 150°C | 2 to 3 hours | Middle |
| Sheet cake, thin layers | Fan | 160°C | 15 to 20 min | Middle |

Times are for a standard 20 to 23 cm tin and are a range, not a promise. Test with a skewer in the centre: it should come out clean or with a few dry crumbs. A steamed cake (kek kukus) is not baked at all; our [moist chocolate steamed cake](/recipe/moist-chocolate-steamed-cake/) recipe covers that method.

## Top or bottom heat for baking cakes?

Both together. Conventional mode runs the top and bottom elements at once, which gives a cake even heat from all sides. Bottom heat alone leaves the top pale and underdone. Top heat alone browns the surface and leaves the centre raw. The only cake that suits bottom heat on its own is a cheesecake, which must not colour on top.

## Fan or conventional for a cake?

Conventional for anything tall or delicate. The still air lets the cake rise fully before the crust sets. Use the fan for cupcakes, thin layers and several trays at once, where even heat across the shelves matters more than a gentle rise. When you use the fan, lower the temperature by 10 to 20°C and check five minutes early.

## Which rack for a cake?

The middle rack suits almost every cake. Heat rises, so the top of the oven runs hotter than the bottom: a tin on the top rack browns before it cooks through, and a tin on the bottom rack overcooks its base. Cheesecakes go one notch below the middle. For two tins at once, use the fan and place them side by side rather than one above the other.

## Preheat before the cake goes in

Preheat for 10 to 15 minutes at the recipe temperature, then give it a few minutes beyond the beep. A cake that goes into an oven still warming up spreads before it rises and comes out dense. Our guide to [how long to preheat an oven](/tips-tricks/how-long-to-preheat-oven/) gives the time for each temperature.

## What each cake fault means

| What you see | What went wrong | Fix |
| --- | --- | --- |
| Cracked, domed top | Too hot, or fan on a sponge | Lower by 10 to 20°C, use conventional |
| Sunken middle | Underbaked, or door opened early | Bake longer, keep the door shut until two thirds through |
| Burnt top, raw centre | Grill or top heat, or tin too high | Conventional, middle rack |
| Dry, crumbly | Too long or too hot, or fan without lowering the temperature | Check earlier, reduce heat |
| Pale, soft base | Tin too high, or oven not preheated | Middle rack, full preheat |
| Uneven rise | Tin not centred, or oven runs hot on one side | Centre the tin, rotate once at two thirds |

## Baking in a warm Malaysian kitchen

A kitchen at 30°C softens butter and speeds up raising agents, so batters are looser and rise faster than a recipe written for a cooler climate expects. Chill a butter cake batter for ten minutes before it goes in, and check sponges five minutes early. An oven thermometer is worth having: many ovens run 10 to 20°C off the dial, and in baking that gap is the difference between a level top and a cracked one.

## Ovens with separate top and bottom control

Most ovens run the top and bottom elements at the same temperature in conventional mode. The [VATTI VA05](/built-in-combi-oven-va05/) and [VA06](/vatti-magic-series-combi-oven-va06/) combi ovens list dual temperature control, so the two can be set apart: useful when a cake browns on top before the base is done. The VA05 has 9 baking and 3 steam functions and the VA06 has 8 baking and 3 steaming modes, both in a 70 litre cavity with 68 auto cooking menus. For baking without steam, the [VATTI 07559 built-in air fryer oven](/vatti-built-in-air-fryer-oven-07559/) has 9 baking functions in a 75 litre cavity. All three are on our [combi and steam oven page](/combi-and-steam-oven-in-malaysia/).

[![VATTI VA05 combi oven](https://cdn.vattimalaysia.com/2026/08/built-in-combi-oven-va05-front.webp)](/built-in-combi-oven-va05/)
[![VATTI VA06 combi oven](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-combi-oven-va06-front.webp)](/vatti-magic-series-combi-oven-va06/)
[![VATTI 07559 built-in air fryer oven](https://cdn.vattimalaysia.com/2024/08/Built-in-air-fryer-oven-07559-product-photo.webp)](/vatti-built-in-air-fryer-oven-07559/)

## Cake oven setting FAQs

**What temperature should a cake be baked at?**
160 to 180°C for most cakes in a conventional oven. Light sponges go at the lower end and dense butter cakes at the upper end. Cheesecakes and fruit cakes bake at about 150°C.

**How long does a cake take to bake?**
About 25 to 35 minutes for a sponge and 45 to 60 minutes for a butter cake in a 20 cm tin. Test with a skewer in the centre rather than trusting the clock.

**Should I bake a cake with the fan on or off?**
Off for a single tall cake, so it rises before the crust sets. On, at 10 to 20°C lower, for cupcakes and several trays.

**Is top or bottom heat better for baking a cake?**
Use both together, which is conventional mode. Bottom heat on its own is only for cheesecake, and top heat on its own is only for colouring a pale top in the last minute or two.

**Can I open the oven to check the cake?**
Not before two thirds of the baking time has passed. The drop in temperature stalls the rise and the centre sinks.

[Ask us about baking ovens](https://wa.me/60123366082)'
WHERE path = 'tips-tricks/baking-cake-oven-setting' AND lang = 'en-MY';

-- tips-tricks/oven-symbols-and-meanings
UPDATE article SET
  title = 'Oven Symbols and Meanings: Fan, Grill and Bake Icons',
  h1 = 'Oven Symbols and Meanings: Every Icon Explained',
  meta_description = 'Two lines is bake, a fan in a circle is convection, a zigzag is the grill and one bottom line is bottom heat. Every oven icon and what to cook with it.',
  word_count = 1800,
  reading_minutes = 9,
  modified_at = '2026-11-05T22:00:00+08:00',
  body_md = 'Every oven symbol tells the oven where to make heat and whether to move it. Get the symbol right and the temperature usually looks after itself. Get it wrong and a cake crusts over before it has risen, a pizza base stays pale, or a roast chars on top while the middle is still raw. The core icons are standardised across almost every oven sold in Malaysia, so once you know them you can use any oven.

### Quick answer

- **Two horizontal lines:** conventional or bake mode, top and bottom heat with no fan, for cakes, bread and single roasts.
- **Fan in a circle:** convection or fan mode, hot air blown around the cavity, for cookies and several trays at once.
- **Fan with a line underneath:** fan plus bottom heat, the pizza symbol, for crisp bases.
- **Zigzag line at the top:** the grill, full power from above, for toast, cheese and thin cuts.
- **One line at the bottom:** bottom heat only, for finishing a pale base or keeping a dish warm.

![oven symbols and meanings](https://cdn.vattimalaysia.com/2026/02/oven-symbols-and-meanings.webp)

## Oven symbols chart

| Symbol | What it looks like | What the oven does | Use it for |
| --- | --- | --- | --- |
| Conventional (bake) | Two horizontal lines, top and bottom | Top and bottom elements, no fan | Cakes, pastries, bread, roasts |
| Fan or convection | Fan inside a circle | Rear element with the fan running | Cookies, multi-tray baking, even roasting |
| Fan with bottom heat | Fan with a line underneath | Fan plus the bottom element | Pizza, tarts, anything that needs a crisp base |
| Bottom heat | One line at the bottom | Bottom element only | Finishing bases, casseroles, gentle reheating |
| Top heat | One line at the top | Top element only | Browning a gratin, finishing a dish |
| Grill | Zigzag line at the top | Grill element at full power | Toast, melting cheese, searing thin cuts |
| Fan grill | Zigzag line with a fan | Grill element with the fan running | Chicken pieces, thicker cuts, sausages |
| Fan only | Fan without any lines | Fan with no heat | Defrosting |
| Light | A bulb | Interior light only | Checking on food |
| Cleaning | A burst, or water droplets | Pyrolytic or steam cleaning cycle | Oven maintenance |

## Conventional oven symbol: two horizontal lines

The conventional symbol, also called bake, top and bottom heat or static heat, shows one line at the top of the square and one at the bottom. Both elements run and nothing moves the air. Heat rises, so the top of the oven runs a little hotter than the bottom, which is why recipes written for this mode tell you to use the middle rack.

Use it for cakes, sponges, cheesecakes, bread and pastries, and for a single roast. It is the gentlest of the main modes and the one most recipes assume unless they say otherwise. Our guide to the [oven symbol for baking cakes](/tips-tricks/oven-symbol-for-baking/) covers it in detail.

## Fan oven symbol: a fan in a circle

The fan symbol, also labelled convection, shows a fan inside a circle. A heating element around the fan at the back of the oven warms the air and the fan pushes it around the cavity. Every shelf gets the same temperature, so three trays of cookies colour evenly at once.

Fan mode cooks faster and browns more, so lower the temperature by about 20°C from a recipe written for a conventional oven. It suits cookies, biscuits, roast vegetables and anything on more than one tray. It does not suit a delicate sponge, which sets on the outside before it has finished rising. See the [oven symbol for baking cookies](/tips-tricks/oven-symbol-for-baking-cookies/) for fan mode in practice.

## Fan with bottom heat: the pizza symbol

A fan with a single line underneath runs the bottom element together with the fan. The base gets direct heat while the moving air cooks the top, which is what a pizza, a quiche or a fruit tart needs to avoid a soggy bottom. Some ovens print a small pizza icon for the same thing. See [which oven symbol to use for pizza](/tips-tricks/which-oven-symbol-for-pizza/) for temperatures and rack positions.

## Bottom heat and top heat: one line

One line at the bottom of the square means only the lower element runs. It is a finishing mode more than a cooking mode: the last ten minutes of a pie whose base is still pale, keeping a casserole warm, or slow cooking where the top should not colour further.

One line at the top runs only the upper element. It browns the surface of a dish that is already cooked through, such as a gratin, a lasagne or a shepherd''s pie. It is gentler than the grill and easier to control.

## Grill symbols: the zigzag line

A zigzag line at the top is the grill. The element runs at full power and the food sits close to it, so this is for toast, melting cheese, and thin cuts that cook in minutes. Follow the manual on the door: most ovens grill with it closed.

Add a fan to the zigzag line and you have fan grill, which turns the grill into a slower, more even roaster. It suits chicken thighs, sausages and thicker chops, which would burn under a plain grill before the middle cooked. Our [oven symbol for grill](/tips-tricks/oven-symbol-for-grill/) guide covers both.

## Steam, air fry and other special symbols

Newer ovens add a handful of icons on top of the classic set. These vary more between brands, so check the manual for the exact drawing.

- **Fan only, no lines:** the defrost setting. The fan moves room-temperature air over frozen food so it thaws evenly without starting to cook.

- **Bread or dough:** a loaf, or a bowl of rising dough, sets a low, steady temperature for proving.

- **Steam:** droplets or a cloud mean the steam generator is running, on its own for fish, vegetables and rice, or with dry heat for crusty bread and moist roasts. Our guide to [what a steam oven is](/buying-guide/what-is-a-steam-oven/) explains the modes.

- **Air fry:** a basket, or a fan with heat lines, runs fast hot air for a fried finish with little oil.

- **Keep warm:** a plate or a low thermometer holds food at serving temperature without cooking it further.

- **Meat probe:** a thermometer icon means the oven stops when the probe inside the joint reaches the temperature you set.

Combi ovens carry most of these. The [VATTI VA06](/vatti-magic-series-combi-oven-va06/) has 8 baking modes, 3 steaming modes, 2 air-fryer modes and 3 stew modes in a 70 litre cavity. The [VATTI VA05](/built-in-combi-oven-va05/) has 9 baking and 3 steam functions, an air-fryer function and a meat probe. The [VATTI 07559 built-in air fryer oven](/vatti-built-in-air-fryer-oven-07559/) has 9 baking functions in 75 litres, including air fry. See the full range on our [combi and steam oven page](/combi-and-steam-oven-in-malaysia/).

[![VATTI VA06 combi oven](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-combi-oven-va06-front.webp)](/vatti-magic-series-combi-oven-va06/)
[![VATTI VA05 combi oven](https://cdn.vattimalaysia.com/2026/08/built-in-combi-oven-va05-front.webp)](/built-in-combi-oven-va05/)
[![VATTI 07559 built-in air fryer oven](https://cdn.vattimalaysia.com/2024/08/Built-in-air-fryer-oven-07559-product-photo.webp)](/vatti-built-in-air-fryer-oven-07559/)

## Cleaning and safety symbols

- **Pyrolytic cleaning:** a burst or sun-like symbol. The oven heats to around 500°C and reduces grease to ash you wipe out afterwards. The door locks for the duration.

- **Steam cleaning:** droplets in the cavity. A short cycle loosens grime with moisture so it wipes off. Our guide to [what auto clean is](/tips-tricks/what-is-auto-clean/) explains how these cycles work.

- **Child lock:** a padlock. The controls are frozen until you hold the button to release them.

- **Door lock:** a padlock on a door, shown during pyrolytic cleaning.

- **Light:** a bulb, which switches the interior lamp on so you can check on food without opening the door.

## Which oven symbol to use for each dish

Match the mode to the dish before you touch the temperature. The mode decides where the heat comes from; the temperature only decides how much of it there is.

| Dish | Symbol | Note |
| --- | --- | --- |
| Cakes, sponges, pastries | Two lines (conventional) | Middle rack |
| Cookies, two or three trays | Fan | About 20°C lower |
| Pizza, quiche, tarts | Fan with bottom heat | Lower rack |
| A single roast | Conventional or fan | Grill for a few minutes at the end for colour |
| Gratins and finishing | Top heat or grill | Watch closely |
| Frozen food to thaw | Fan only | No heat |

Then preheat properly. Our guide to [how long to preheat an oven](/tips-tricks/how-long-to-preheat-oven/) gives the time for each temperature.

## Common mistakes with oven symbols

- **Fan mode for a sponge:** the moving air sets the surface before the batter has risen, and the cake cracks or domes. Use conventional heat.

- **Grill for a thick joint:** the grill sears the top and never reaches the middle. Roast first, grill for colour at the end.

- **Not lowering the temperature in fan mode:** a recipe written for conventional heat overbrowns at the same temperature with the fan on.

- **Opening the door early:** every opening drops the temperature and stalls the rise. Wait until two thirds of the baking time has passed.

- **Ignoring the manual:** brands add their own icons for auto programmes and special modes. The manual explains those; this guide covers the ones every oven shares.

## Oven symbol FAQs

**What is the conventional oven symbol?**
Two horizontal lines, one at the top of the square and one at the bottom. It runs both elements without the fan and is the mode most baking recipes assume.

**What does the fan symbol on an oven mean?**
Convection. A heating element around the fan warms the air and the fan circulates it, so every shelf cooks at the same temperature. Lower the recipe temperature by about 20°C.

**Which oven symbol is bake?**
The two horizontal lines, conventional heat, on the middle rack. See our guides to the [oven symbol for baking cakes](/tips-tricks/oven-symbol-for-baking/) and the [best oven setting for baking cakes](/tips-tricks/baking-cake-oven-setting/).

**Are oven symbols the same on every brand?**
The core set is: conventional, fan, grill, bottom heat and fan grill look the same almost everywhere. Special programmes such as steam, air fry and auto menus differ, so check the manual for those.

**What is the difference between the fan symbol and the fan with a line underneath?**
The plain fan is convection. The fan with a line underneath adds the bottom element, which crisps the base, so use it for pizza and tarts.

[Ask us about oven modes](https://wa.me/60123366082)'
WHERE path = 'tips-tricks/oven-symbols-and-meanings' AND lang = 'en-MY';

-- tips-tricks/oven-symbol-for-baking
UPDATE article SET
  title = 'Bake Symbol on Oven: Which Icon to Use for Cakes',
  h1 = 'Oven Symbol for Baking Cakes: Which Icon to Use',
  meta_description = 'The bake symbol is two horizontal lines: top and bottom heat, no fan. Use it on the middle rack for cakes. What the fan, grill and cake icons do instead.',
  word_count = 1100,
  reading_minutes = 6,
  modified_at = '2026-11-05T22:00:00+08:00',
  body_md = 'The bake symbol on an oven is two horizontal lines, one at the top of the square and one at the bottom. It runs both heating elements with no fan, which gives a cake the steady, still heat it needs to rise evenly and set without cracking. This guide shows what the bake icon and its alternatives look like, what each does to a cake, and when to choose one over another. For temperatures, times and rack positions, see our companion guide to the [best oven setting for baking cakes](/tips-tricks/baking-cake-oven-setting/).

### Quick answer

- **The bake symbol:** two horizontal lines, top and bottom, also called conventional, static or top and bottom heat.
- **Where to put the cake:** on the middle rack, with the tin centred.
- **Fan symbol:** a fan in a circle, only for cupcakes, thin layers and several trays, set 10 to 20°C lower.
- **Cheesecake:** the single bottom line, or the two lines at about 150°C.
- **Never for cakes:** the zigzag grill line, which burns the top and leaves the middle raw.

![oven symbol for baking](https://cdn.vattimalaysia.com/2026/02/oven-symbol-for-baking.webp)

## Oven baking symbols and what they do to a cake

| Symbol | What it looks like | What it does to a cake |
| --- | --- | --- |
| Conventional (bake) | Two horizontal lines, top and bottom | Even, gentle heat; the standard for cakes |
| Fan or convection | Fan inside a circle | Faster and drier; good for cupcakes, risky for sponges |
| Bottom heat | One line at the bottom | Cooks the base; for cheesecake or a pale bottom |
| Top heat | One line at the top | Colours the top only; a finishing setting |
| Grill | Zigzag line at the top | Burns the top, leaves the middle raw; never for cakes |
| Cake or bake preset | A cake or a cupcake | Usually conventional heat at a set temperature |

## Two lines: the bake symbol for most cakes

The two-line symbol heats from both elements and leaves the air still. Heat reaches the tin from below and above at the same rate, the batter rises evenly, and the crust forms only once the inside has set. This is what a recipe means when it says "bake at 180°C" without naming a mode.

Use it for sponges, butter cakes, pound cakes, brownies, loaf cakes, banana bread and anything in a single tin on the middle rack.

## The fan symbol: when it works and when it does not

The fan symbol circulates hot air, so every shelf bakes at the same temperature. That suits two or three trays of cupcakes, thin sheet cakes and cookies. It is the wrong choice for a tall sponge: the moving air sets the surface before the centre has risen, and the cake domes, cracks or sinks. If a recipe gives a conventional temperature and you use the fan, lower it by 10 to 20°C. For biscuits, see the [oven symbol for baking cookies](/tips-tricks/oven-symbol-for-baking-cookies/).

## Bottom heat: cheesecakes and pale bases

The single bottom line heats from below only. It is the setting for a cheesecake that must not colour on top, and for the last few minutes of a cake whose base is still soft when the top is done.

## The cake preset icon

Some ovens carry a cake or cupcake icon. It is a shortcut that selects conventional heat at a preset temperature, sometimes with a gentle fan. It works well for standard recipes. For anything unusual, choose the mode and temperature yourself, and check the manual for the temperature the preset uses.

## Symbols to avoid for cakes

- **Grill:** the top element runs at full power, so the top burns while the middle stays raw.

- **Fan grill:** the same problem, a little slower.

- **Top heat alone:** colours the surface without cooking through. Use it for a minute at the end if the top is pale, never for the whole bake.

- **Fan with bottom heat:** this is the pizza symbol. It is built to crisp a base, and on a cake it dries the bottom out. See [which oven symbol to use for pizza](/tips-tricks/which-oven-symbol-for-pizza/).

## How to bake with the right symbol

1. Choose the mode before the temperature.
2. Preheat for 10 to 15 minutes, and a few minutes beyond the beep. Our guide to [how long to preheat an oven](/tips-tricks/how-long-to-preheat-oven/) explains why.
3. Place the tin on the middle rack, centred.
4. Keep the door shut for at least two thirds of the baking time.
5. Lower the temperature by 10 to 20°C if you switch to the fan.

For a map of every icon on the dial, not just the baking ones, see [oven symbols and meanings](/tips-tricks/oven-symbols-and-meanings/).

## Baking symbols on a VATTI oven

A VATTI spec sheet counts an oven''s modes rather than drawing them, and each model''s manual shows its icons. The [VATTI VA06](/vatti-magic-series-combi-oven-va06/) has 8 baking modes and 3 steaming modes, and the [VA05](/built-in-combi-oven-va05/) has 9 baking and 3 steam functions, both with 68 auto cooking menus that choose the mode and time for you. The [VATTI 07559 built-in air fryer oven](/vatti-built-in-air-fryer-oven-07559/) has 9 baking functions, one of them air fry. All three are on our [combi and steam oven page](/combi-and-steam-oven-in-malaysia/).

[![VATTI VA06 combi oven](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-combi-oven-va06-front.webp)](/vatti-magic-series-combi-oven-va06/)
[![VATTI VA05 combi oven](https://cdn.vattimalaysia.com/2026/08/built-in-combi-oven-va05-front.webp)](/built-in-combi-oven-va05/)
[![VATTI 07559 built-in air fryer oven](https://cdn.vattimalaysia.com/2024/08/Built-in-air-fryer-oven-07559-product-photo.webp)](/vatti-built-in-air-fryer-oven-07559/)

## Oven symbol for baking FAQs

**Which oven symbol is bake?**
Two horizontal lines, one at the top of the square and one at the bottom. In a manual it is called bake, conventional, static or top and bottom heat, and it runs both elements with no fan.

**Can I use fan mode instead of conventional for a cake?**
For cupcakes, thin layers and several trays, yes, at 10 to 20°C lower. For a tall sponge or a rich butter cake, no: the moving air sets the top before the cake has risen.

**What if my oven has a cake symbol?**
Use it for ordinary recipes. It is usually conventional heat at a preset temperature, so it suits most cakes; the manual gives the temperature it uses.

**Why does my cake burn on top but stay raw inside?**
Almost always the grill or top-heat symbol, or a tin placed too high. Switch to the two-line bake symbol and use the middle rack.

**Which symbol for a cheesecake?**
Bottom heat, or conventional at a low temperature around 150°C, on the rack just below the middle. Many bakers also put a tray of water underneath.

[Ask us about baking ovens](https://wa.me/60123366082)'
WHERE path = 'tips-tricks/oven-symbol-for-baking' AND lang = 'en-MY';

-- tips-tricks/how-long-to-preheat-oven
UPDATE article SET
  title = 'How Long to Preheat an Oven? Minutes by Temperature Chart',
  h1 = 'How Long to Preheat an Oven: 10 to 15 Minutes, and When It Takes Longer',
  meta_description = 'About 10 to 15 minutes for 180°C, 15 to 20 for 200°C and up to 25 for 230°C. Full chart by temperature, °C to °F and fan, and why the beep comes early.',
  word_count = 1250,
  reading_minutes = 7,
  modified_at = '2026-11-05T22:00:00+08:00',
  body_md = 'Preheating means bringing the oven up to the recipe''s temperature before the food goes in. Most home ovens take 10 to 15 minutes to reach 180°C, longer for hotter settings, and the beep usually comes a few minutes before the oven is truly ready. The chart below gives the time for every common temperature, with the Fahrenheit and fan equivalents beside it.

### Quick answer

- **180°C, for most cakes and cookies:** preheat for 10 to 15 minutes.
- **200 to 220°C, for bread, roast chicken and pastry:** preheat for 15 to 20 minutes.
- **230 to 250°C, for pizza and roast potatoes:** preheat for 20 to 25 minutes, or 30 to 45 minutes with a pizza stone inside.
- **Fan mode:** reaches temperature a few minutes faster, and is set about 20°C lower than a conventional recipe.
- **The beep:** it means the sensor has reached the setting, so wait 5 more minutes before baking.

![how long to preheat oven](https://cdn.vattimalaysia.com/2026/03/how-long-to-preheat-oven.webp)

## Preheat time by temperature

| Temperature | Typical preheat time | What bakes at this temperature |
| --- | --- | --- |
| 120 to 150°C (250 to 300°F) | 8 to 10 minutes | Meringues, slow roasts, cheesecake |
| 160 to 180°C (325 to 350°F) | 10 to 15 minutes | Cakes, cookies, brownies, casseroles |
| 190 to 200°C (375 to 400°F) | 15 to 20 minutes | Bread, roast chicken, pastries |
| 220 to 250°C (425 to 480°F) | 20 to 25 minutes | Pizza, roast potatoes, searing |

These times are typical for a domestic oven with the door shut and an empty cavity. A small tabletop oven is quicker. A full-size built-in oven of 70 litres or more sits at the slower end, because there is more air and more metal to heat.

## Oven temperature chart: Celsius, Fahrenheit and fan

Recipes from overseas often give Fahrenheit, and many are written for a conventional oven. Use this chart to convert both at once.

| Conventional | Fan oven | Fahrenheit in recipes | Gas mark |
| --- | --- | --- | --- |
| 120°C | 100°C | 250°F | 1/2 |
| 150°C | 130°C | 300°F | 2 |
| 160°C | 140°C | 325°F | 3 |
| 170°C | 150°C | 325 to 340°F | 3 |
| 180°C | 160°C | 350°F | 4 |
| 190°C | 170°C | 375°F | 5 |
| 200°C | 180°C | 400°F | 6 |
| 220°C | 200°C | 425°F | 7 |
| 230°C | 210°C | 450°F | 8 |
| 250°C | 230°C | 480°F | 9 |

Recipe Fahrenheit figures are rounded. The exact conversion is °F = °C times 1.8, plus 32, so 180°C is 356°F, 200°C is 392°F and 220°C is 428°F. The rounded figures are close enough for any home oven.

## Why preheating matters

- **Rise:** a cake or a loaf needs a burst of heat the moment it goes in, so the raising agent works before the structure sets. In a cold oven the batter spreads and the crumb turns dense.

- **Texture:** pastry puffs and cookies hold their shape only when the fat melts fast. A slow start makes them greasy and flat.

- **Timing:** every time in a recipe assumes the oven is already at temperature. Start cold and the times are all wrong.

- **Browning:** a crust colours at high heat. Food that spends its first ten minutes warming up with the oven dries out before it browns.

Some dishes do not need it: slow roasts, casseroles and stews cooked for hours can go into a cold oven.

## Why the beep is not the end of preheating

The preheat light or beep tells you the sensor near the element has reached the setting, not that the air, the walls and the racks have. For baking, where the first minutes decide the rise, give it five more minutes. An oven thermometer hung from the middle rack settles the question and shows whether the display is honest: many domestic ovens run 10 to 20°C off the number they show.

## What makes an oven slow to preheat

- **Oven type:** fan ovens reach temperature fastest because the moving air heats the whole cavity at once. Conventional electric heat is steadier but slower.

- **Size:** a larger cavity has more air to heat. Ovens with a hidden bottom element, common on models with a smooth base for easy cleaning, also take a little longer.

- **What is inside:** extra racks, a roasting tray or a pizza stone all absorb heat. Take out what you do not need, and allow 30 to 45 minutes for a stone.

- **The door:** every opening loses heat and restarts the climb. Use the oven light to check instead.

- **Age:** a worn door seal or a tired element adds minutes. If a familiar oven has become slow, those are the usual reasons.

## How to preheat, step by step

1. Take out racks and trays you will not use, and set the rack you need in position.
2. Choose the mode first, then the temperature: conventional for cakes and pastry, fan for cookies and several trays. Our guide to [oven symbols and meanings](/tips-tricks/oven-symbols-and-meanings/) shows which icon is which.
3. Press start on a digital oven. Some do not begin heating until you do.
4. Wait for the indicator, then five minutes more for baking.
5. Open the door only when the food is ready to go in, and close it promptly.

For the full settings by cake type, see our guide to the [best oven setting for baking cakes](/tips-tricks/baking-cake-oven-setting/).

## Preheating in a combi oven or built-in oven

A combi oven''s auto menus include the preheat in the programme, so you choose the dish and the oven sets the mode, temperature and timing. The [VATTI VA05](/built-in-combi-oven-va05/) and [VA06](/vatti-magic-series-combi-oven-va06/) combi ovens carry 68 auto cooking menus each in a 70 litre cavity, with steam modes alongside the baking modes. The [VATTI 07559 built-in air fryer oven](/vatti-built-in-air-fryer-oven-07559/) has 9 baking functions in a 75 litre cavity. All three are on our [combi and steam oven page](/combi-and-steam-oven-in-malaysia/). Whichever you use, the steps above still apply for manual baking: right mode, full preheat, door shut.

[![VATTI VA05 combi oven](https://cdn.vattimalaysia.com/2026/08/built-in-combi-oven-va05-front.webp)](/built-in-combi-oven-va05/)
[![VATTI VA06 combi oven](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-combi-oven-va06-front.webp)](/vatti-magic-series-combi-oven-va06/)
[![VATTI 07559 built-in air fryer oven](https://cdn.vattimalaysia.com/2024/08/Built-in-air-fryer-oven-07559-product-photo.webp)](/vatti-built-in-air-fryer-oven-07559/)

## Oven preheating FAQs

**How long to preheat an oven to 180°C?**
Ten to fifteen minutes in most home ovens, a little less with the fan on. For a cake, give it five more minutes after the beep.

**How long to preheat an oven to 200°C?**
Fifteen to twenty minutes. At 220°C allow about twenty minutes, and at 230 to 250°C allow up to twenty-five.

**Can I put food in before the oven is preheated?**
For a casserole, a stew or a slow roast, yes. For cakes, bread, cookies and pastry, no: the rise and the texture depend on the first minutes at full heat.

**Why does my oven take 30 minutes to preheat?**
Usually a worn door seal, a weakening element, or a heavy tray or pizza stone inside. An oven thermometer will show whether the oven is reaching the temperature at all.

**Is preheating different for a fan oven?**
It is faster, and the target is lower. Set a fan oven about 20°C below a recipe''s conventional temperature and check the food a few minutes early.

[Ask us about built-in ovens](https://wa.me/60123366082)'
WHERE path = 'tips-tricks/how-long-to-preheat-oven' AND lang = 'en-MY';

-- tips-tricks/which-oven-symbol-for-pizza
UPDATE article SET
  title = 'Which Oven Symbol for Pizza? Fan Plus Bottom Heat Explained',
  h1 = 'Which Oven Symbol for Pizza? Guide to the Perfect Crust',
  meta_description = 'Use fan with bottom heat, the fan icon with one line beneath it, at 200 to 230°C on a low rack. No pizza symbol? Here are the best settings to use instead.',
  word_count = 1180,
  reading_minutes = 6,
  modified_at = '2026-11-05T22:00:00+08:00',
  body_md = 'A pizza with a soft, doughy base and over-browned cheese is almost always a settings problem, not a recipe problem. The oven symbol you choose decides whether the heat goes into the base or only onto the toppings. This guide shows which symbol to use for pizza, what to do if your oven does not have it, and the rack and temperature that give a crisp crust. For every other icon on the dial, see our guide to [oven symbols and meanings](/tips-tricks/oven-symbols-and-meanings/).

### Quick answer

- **The pizza symbol:** a fan with one horizontal line underneath it, which runs the fan and the bottom element together.
- **Temperature:** 200 to 230°C for homemade pizza, fully preheated.
- **Rack:** the lower third of the oven for thin crust, the middle for thick crust.
- **No pizza symbol:** use fan mode on the lowest rack with a preheated tray.
- **Thick crust or deep dish:** conventional heat, the two horizontal lines, for a slower, steadier bake.

![Which Oven Symbol for Pizza A Simple](https://cdn.vattimalaysia.com/2026/04/Which-Oven-Symbol-for-Pizza-A-Simple.webp)

## The pizza symbol: fan with bottom heat

On most ovens the pizza symbol is a fan icon with a single horizontal line at the bottom of the square. Some ovens show a sliced pizza instead. Either way the function is the same: the fan circulates hot air around the cavity while the bottom element drives heat up into the base.

- **The bottom element:** heats the base directly, which gives a crisp crust without a pizza stone.

- **The fan:** cooks the toppings evenly and melts the cheese across the whole surface.

- **Heat from below first:** the toppings are less likely to burn before the base has cooked through.

Set 200 to 230°C, preheat fully, and put the pizza in the lower third of the oven to get the most from the bottom element.

## What if your oven has no pizza symbol?

Not every oven has one. The aim is to copy what it does: moving air plus strong heat from below.

- **Fan mode:** the most common alternative. Set 210 to 230°C, use the lowest rack, and put the pizza on a tray that has been preheated in the oven.

- **Fan plus bottom heat set by hand:** if your oven lets you choose the fan and the elements separately, switching on both is the same as the pizza mode.

- **Conventional, top and bottom heat:** better for thick crust and deep dish, where a slower bake suits. Less good for thin crust, because the base cooks more slowly than the top.

## Fan mode for pizza

Fan mode is a capable backup. The moving air cooks the pizza more evenly than still heat, and it works well for frozen pizza.

1. Set 210 to 230°C.
2. Use the lowest rack, nearest the heat at the base of the oven.
3. Preheat the baking tray with the oven, then slide the pizza onto the hot tray.
4. Use a flat, thin tray for thin crust rather than a deep dish.

## Conventional heat for thick-crust pizza

The conventional symbol, two horizontal lines at the top and bottom of the square, runs both elements without the fan. It suits a thick crust or deep-dish pizza that needs a longer bake, a pizza with heavy toppings or a wet sauce that needs time to set, and anyone who wants deeper colour on top. For thin crust, put it on the bottom rack and watch the base closely.

## Which symbol for which pizza

| Oven symbol | Best for | Key tip |
| --- | --- | --- |
| Fan with bottom heat (pizza) | Thin crust, homemade | Lower rack, 200 to 230°C |
| Fan | All types, especially frozen | Preheated tray, lowest rack |
| Conventional | Thick crust, deep dish | Bottom or middle rack, watch the base |

## Rack position and temperature tips

- **Thin crust:** the lower third, closest to the bottom element.

- **Thick crust:** the middle rack, for balanced heat from top and bottom.

- **Preheat fully:** dough that goes into a cold oven absorbs heat slowly and stays soft. Our guide to [how long to preheat an oven](/tips-tricks/how-long-to-preheat-oven/) gives 20 to 25 minutes for 220 to 250°C.

- **Hot tray:** a tray preheated with the oven acts like a pizza stone and crisps the base from the first second.

- **Light toppings:** a heavy layer of wet toppings releases steam and softens the base, whatever the setting.

## Fresh or frozen pizza: does the symbol change?

For fresh homemade pizza, use the pizza symbol, or fan mode on the lower rack. The base is raw dough that needs direct heat to cook and crisp, so it is the priority.

For frozen pizza, fan mode works reliably. Frozen pizza is partly cooked already, so the job is to heat it through and colour the base, and even air heats the centre at the same rate as the edges. Follow the packet temperature, put it one rack lower for a crisper base, and if the packet gives a conventional temperature, take 10 to 20°C off for the fan and check a couple of minutes early.

## Ovens with separate top and bottom control

Some ovens let you set the top and bottom elements to different temperatures, so the base can run hotter than the toppings. The [VATTI VA05](/built-in-combi-oven-va05/) and [VA06](/vatti-magic-series-combi-oven-va06/) combi ovens both list dual temperature control, in a 70 litre cavity with 68 auto cooking menus; the VA06 also lists steam bake as a combination function, for doughs that benefit from steam early in the bake. The [VATTI 07559 built-in air fryer oven](/vatti-built-in-air-fryer-oven-07559/) has 9 baking functions in a 75 litre cavity. All three are on our [combi and steam oven page](/combi-and-steam-oven-in-malaysia/).

[![VATTI VA05 combi oven](https://cdn.vattimalaysia.com/2026/08/built-in-combi-oven-va05-front.webp)](/built-in-combi-oven-va05/)
[![VATTI VA06 combi oven](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-combi-oven-va06-front.webp)](/vatti-magic-series-combi-oven-va06/)
[![VATTI 07559 built-in air fryer oven](https://cdn.vattimalaysia.com/2024/08/Built-in-air-fryer-oven-07559-product-photo.webp)](/vatti-built-in-air-fryer-oven-07559/)

## Pizza oven setting FAQs

**Which oven symbol is for pizza?**
The fan with a single line underneath it, which runs the fan and the bottom element together. Some ovens show a small pizza icon for the same mode.

**What temperature should I bake pizza at in a home oven?**
200 to 230°C for homemade pizza, with the oven fully preheated. For frozen pizza, follow the packet, and take 10 to 20°C off if the packet assumes a conventional oven and you use the fan.

**Should pizza go on the top or bottom rack?**
The lower third for thin crust, so the base sits closest to the bottom heat. Use the middle rack for thick crust or deep dish.

**Why is my pizza base soggy?**
Usually the oven was not fully preheated, the pizza sat too high, or the toppings were too wet. Use the pizza or fan symbol on a low rack, and preheat the tray with the oven.

**Can I use the grill for pizza?**
Only for the last minute or two, to colour the cheese. The grill heats from above, so on its own it burns the top before the base cooks.

[Ask us which oven suits your cooking](https://wa.me/60123366082)'
WHERE path = 'tips-tricks/which-oven-symbol-for-pizza' AND lang = 'en-MY';

-- tips-tricks/what-is-auto-clean
UPDATE article SET
  title = 'What Is Auto Clean? Self-Cleaning Cooker Hoods Explained',
  h1 = 'What Is Auto Clean? VATTI Self-Cleaning Hoods Compared',
  meta_description = 'Auto clean lets a cooker hood wash its own fan and inner chamber with steam, water or heat. How each VATTI system works and what it still leaves to you.',
  word_count = 1290,
  reading_minutes = 7,
  modified_at = '2026-11-05T22:00:00+08:00',
  body_md = 'Auto clean is the function that lets an appliance clean its own insides. On a cooker hood it washes the fan and inner chamber, the greasy parts you cannot reach without taking the hood apart, so suction stays strong. VATTI uses several auto-clean systems across its hoods, and its combi ovens carry their own. Here is how each works and how to tell them apart.

### Quick answer

- **What auto clean is:** a built-in cycle that cleans a hood''s fan and inner chamber at the press of a button, with no dismantling.
- **How it cleans:** with steam, hot or pressurised water, or high heat, depending on the model, to dissolve grease and throw it off the fan.
- **Why it matters:** a greasy fan loses suction, so cleaning it keeps extraction strong and odours down.
- **What it does not do:** you still wipe the outside and rinse the grease filter now and then.
- **In an oven:** auto clean usually means a steam or heat cycle that loosens grime in the cavity so it wipes off.

![auto clean](https://cdn.vattimalaysia.com/2026/06/auto-clean-hero.webp)

## Why auto clean matters in a Malaysian kitchen

Frequent frying and wok cooking send a lot of grease into the hood. Over time it coats the fan and inner chamber, and a greasy fan loses suction, works harder and wears faster. Cleaning those parts by hand is difficult and unpleasant, which is why most people never do it.

Auto clean washes the inside of the hood for you. The payoff is stronger, longer-lasting suction, fewer cooking odours, less grease build-up near the hob, and far less manual maintenance. It handles the hardest part, the part you cannot easily reach.

## 1. Steam and hot water dual clean (V938)

![VATTI Kitchen Hood V938 Description](https://cdn.vattimalaysia.com/2026/05/V938-PG13.webp)

The [VATTI V938](/vatti-hidden-series-range-hood-v938/) uses VATTI''s fifth-generation steam and hot water dual clean, listed on its spec sheet as turbo wash with a nano coating. It works in two stages: steam softens and dissolves the hardened grease on the fan and inner chamber, then hot water flushes the loosened residue away. Because it cleans the whole chamber and not only the fan blades, very little grease is left behind. It pairs that with 3,650 m³/h airflow, 1,600 Pa pressure and oil filtration up to 92%.

[![VATTI V938 cooker hood](https://cdn.vattimalaysia.com/2026/08/vatti-hidden-series-range-hood-v938-front.webp)](/vatti-hidden-series-range-hood-v938/)

## 2. Pulse-wave wash (V960)

![VATTI Kitchen Hood V960 Description](https://cdn.vattimalaysia.com/2026/05/V960-PG12.webp)

The [VATTI V960](/vatti-stellar-series-cooker-hood-v960/) uses VATTI''s pulse-wave wash, also listed as turbo wash with a nano coating, and is designed around convenience. It runs in three stages: a one-tap wash starts the deep clean, a high-pressure rinse breaks the grease down and blasts it away, and a turbo dry finishes the cycle so the cavity is not left damp. It pairs that with 3,690 m³/h airflow and 1,700 Pa pressure, for long ducts on high floors.

[![VATTI V960 cooker hood](https://cdn.vattimalaysia.com/2026/08/vatti-stellar-series-cooker-hood-v960-front.webp)](/vatti-stellar-series-cooker-hood-v960/)

## 3. Heat auto clean (V917)

![VATTI Cooker Hood V917 Carbon Grey Description](https://cdn.vattimalaysia.com/2026/05/V917-Carbon-Grey-Cooker-Hood-description-5.webp)

The [VATTI V917](/vatti-cooker-hood-v917-carbon-grey/) takes a different approach: its spec sheet lists a heater heat auto clean, which uses high temperature instead of water. The cycle alternates stages of heating, which dissolve and peel the oil off, with bursts of high-speed fan that throw the loosened grease clear, and ends by running the fan to dry the inside. There is no water cup to fill and nothing to drain, which suits anyone who prefers a waterless method. The V917 moves 2,250 m³/h at 900 Pa in a slim body, and comes in carbon grey and white.

[![VATTI V917 cooker hood](https://cdn.vattimalaysia.com/2026/08/vatti-cooker-hood-v917-carbon-grey-front.webp)](/vatti-cooker-hood-v917-carbon-grey/)

## Other VATTI auto-clean methods

Two more hoods use their own systems. The [VATTI V929](/vatti-aetheris-series-cooker-hood-v929/) uses a fifth-generation turbo wash auto clean, a strong water wash that scours the fan and inner chamber, with 3,125 m³/h airflow and a 46.5 dB low noise level. The [VATTI V919](/vatti-magic-series-cooker-hood-v919/) uses a high-pressure steam wash auto clean, where pressurised steam loosens and washes grease off the internal parts, with 3,050 m³/h airflow. Both do the same job as the systems above with a different cleaning medium.

[![VATTI V929 cooker hood](https://cdn.vattimalaysia.com/2026/08/vatti-aetheris-series-cooker-hood-v929-front.webp)](/vatti-aetheris-series-cooker-hood-v929/)
[![VATTI V919 cooker hood](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-cooker-hood-v919-front.webp)](/vatti-magic-series-cooker-hood-v919/)

## VATTI auto-clean hoods at a glance

| Model | Method | How it cleans | Airflow and pressure | Best for |
| --- | --- | --- | --- | --- |
| V938 | Steam and hot water | Steam dissolves grease, hot water flushes it away | 3,650 m³/h, 1,600 Pa | The most complete interior clean |
| V960 | Pulse-wave wash | One-tap wash, high-pressure rinse, then turbo dry | 3,690 m³/h, 1,700 Pa | Hands-off convenience |
| V917 | Heat auto clean | Heating stages plus high-speed fan spins | 2,250 m³/h, 900 Pa | Waterless cleaning |
| V929 | Fifth-generation turbo wash | Turbo water wash of the fan and inner chamber | 3,125 m³/h, 1,300 Pa | Strong all-round clean |
| V919 | High-pressure steam wash | Pressurised steam loosens and washes off grease | 3,050 m³/h, 1,300 Pa | Steam-based simplicity |

All five keep the hard-to-reach parts clean automatically, and all five list oil filtration up to 92%. The difference is the cleaning medium, steam, water or heat, plus the hood''s size, suction and style. Check the spec sheet of the exact model you are considering, and see the full range on our [kitchen hood page](/kitchen-hood-in-malaysia/).

## Auto clean in ovens and microwaves

Ovens use auto clean too, in a different way. A pyrolytic oven heats its empty cavity very high to burn grease to ash. A steam clean uses moisture to soften baked-on grime so it wipes off. The [VATTI VA05](/built-in-combi-oven-va05/) and [VA06](/vatti-magic-series-combi-oven-va06/) combi ovens both list two auto clean functions, steam clean and heat dry, so the cavity is cleaned and then dried rather than left damp. The [VATTI M626 built-in microwave](/built-in-microwave-m626/) lists an auto clean function in its 25 litre stainless steel cavity.

[![VATTI VA05 combi oven](https://cdn.vattimalaysia.com/2026/08/built-in-combi-oven-va05-front.webp)](/built-in-combi-oven-va05/)
[![VATTI VA06 combi oven](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-combi-oven-va06-front.webp)](/vatti-magic-series-combi-oven-va06/)
[![VATTI M626 built-in microwave](https://cdn.vattimalaysia.com/2026/08/built-in-microwave-m626-front.webp)](/built-in-microwave-m626/)

The cleaning icons on an oven dial are explained in our guide to [oven symbols and meanings](/tips-tricks/oven-symbols-and-meanings/).

## Does auto clean replace all cleaning?

No. Auto clean handles the inside of the hood, the part that is genuinely hard to reach, but a little routine care still helps. Wipe the outside surfaces and rinse the grease filter now and then. Our guide on [how to clean a kitchen hood filter](/tips-tricks/how-to-clean-kitchen-hood-filter/) covers the filter, and our [range hood maintenance](/tips-tricks/range-hood-maintenance/) tips cover the rest.

## Auto clean FAQs

**What does auto clean mean on a cooker hood?**
It is a cycle that cleans the hood''s fan and inner chamber by itself, at the press of a button. Depending on the model it uses steam, hot or pressurised water, or high heat to dissolve grease and throw it off the fan.

**How often should I run auto clean?**
Follow the manual for your model. Households that fry or wok-cook daily benefit from running it more often, because grease builds up on the fan faster.

**Does auto clean mean I never clean the filter?**
No. Auto clean deals with the fan and inner chamber. The grease filter and the outside of the hood still need a rinse and a wipe from time to time.

**Which VATTI hood has the most thorough auto clean?**
The V938, whose steam and hot water dual clean washes the whole inner chamber rather than only the fan. The V960 suits anyone who wants a one-tap wash that also dries itself.

**Is heat auto clean better than steam?**
Neither is better outright. Heat auto clean, on the V917, needs no water and nothing to drain; steam and water systems, on the V938, V960, V929 and V919, wash grease away rather than baking it off.

[Ask us which auto-clean hood suits your kitchen](https://wa.me/60123366082)'
WHERE path = 'tips-tricks/what-is-auto-clean' AND lang = 'en-MY';

-- Product shots: one article_image row per product panel image, after each
-- article's existing figures (position 0 on the five oven articles, 0 to 3 on
-- what-is-auto-clean).
INSERT INTO article_image (article_id, image_id, position) VALUES (90, 9059, 1), (90, 9062, 2), (90, 292, 3);
INSERT INTO article_image (article_id, image_id, position) VALUES (91, 9062, 1), (91, 9059, 2), (91, 292, 3);
INSERT INTO article_image (article_id, image_id, position) VALUES (89, 9062, 1), (89, 9059, 2), (89, 292, 3);
INSERT INTO article_image (article_id, image_id, position) VALUES (92, 9059, 1), (92, 9062, 2), (92, 292, 3);
INSERT INTO article_image (article_id, image_id, position) VALUES (95, 9059, 1), (95, 9062, 2), (95, 292, 3);
INSERT INTO article_image (article_id, image_id, position) VALUES (106, 9028, 4), (106, 9030, 5), (106, 9035, 6), (106, 9018, 7), (106, 9016, 8), (106, 9059, 9), (106, 9062, 10), (106, 9058, 11);
