-- Ten articles refreshed for search, 2026-09-14.
--
-- Search Console (90 days to 2026-09-14) showed seven of these on page 2 with
-- real impressions and three on page 1 with a click-through rate under 1%.
-- Each body is rewritten to answer the queries the page already shows for,
-- with the title and description matched to them. Facts about VATTI products
-- come from product_spec, product_faq and the category copy; nothing is
-- claimed here that those tables do not carry.
--
-- Also fixed on the way: two links to products retired in 2026-08, a Quick
-- Answer heading pasted from the wrong article (twice), a preheat table with
-- its lower bounds missing, and two plain-text "see our guide" mentions that
-- were never links.
--
-- Why a correction file and not an edit in articles.sql: that file is
-- generated, and a regeneration would drop these. Same pattern as
-- seo-metadata-2026-09.sql. The name sorts after redirects.sql, which opens
-- with DELETE FROM redirect and would otherwise wipe the three rows below.
--
-- Four articles on induction versus ceramic hobs were competing with each
-- other for one query set (11,031 and 7,136 impressions on the two strongest,
-- positions 15.6 and 9.5). They are merged into the one with the most
-- impressions and the broadest title; the other three stay as rows, unpublished,
-- and 301 to it so every legacy URL still resolves.

UPDATE article SET
  title = 'Oven Symbols and Meanings: Every Icon Explained',
  h1 = 'Oven Symbols and Meanings: Every Icon Explained',
  meta_description = 'Every oven symbol explained: conventional (two lines), fan, grill, bottom heat, fan grill, defrost and steam. What each does and which dishes to use it for.',
  word_count = 1687,
  reading_minutes = 8,
  modified_at = '2026-09-14T12:00:00+08:00',
  body_md = 'Every oven symbol tells the oven where to make heat and whether to move it. Get the symbol right and the temperature usually looks after itself. Get it wrong and a cake crusts over before it has risen, a pizza base stays pale, or a roast chars on top while the middle is still raw.

This guide explains every common oven symbol, what it looks like on the dial, what the oven does when you pick it, and which dishes it suits. The icons are standardised across almost every brand sold in Malaysia, so once you know them you can use any oven.

![oven symbols and meanings](https://cdn.vattimalaysia.com/2026/02/oven-symbols-and-meanings.webp)

### Quick Answer: What do the oven symbols mean?

Two horizontal lines is conventional heat from the top and bottom elements, the setting for most cakes and roasts. A fan in a circle is convection, which blows hot air around the oven for even, multi-tray baking. A jagged line at the top is the grill. A single line at the bottom is bottom heat only, for crisp bases. Everything else is a variation on those four.

[Enquire With Us](https://wa.me/60123366082)

| Symbol | What it looks like | What the oven does | Use it for |
| --- | --- | --- | --- |
| Conventional | Two horizontal lines, top and bottom | Top and bottom elements, no fan | Cakes, pastries, bread, roasts |
| Fan / convection | Fan inside a circle | Rear element with the fan running | Cookies, multi-tray baking, even roasting |
| Fan with bottom heat | Fan with a line underneath | Fan plus the bottom element | Pizza, tarts, anything that needs a crisp base |
| Bottom heat | One line at the bottom | Bottom element only | Finishing bases, casseroles, gentle reheating |
| Top heat | One line at the top | Top element only | Browning a gratin, finishing a dish |
| Grill | Jagged or zigzag line at the top | Grill element at full power | Toast, melting cheese, searing thin cuts |
| Fan grill | Jagged line with a fan | Grill element with the fan running | Chicken pieces, thicker cuts, sausages |
| Fan only | Fan without any lines | Fan with no heat | Defrosting |
| Light | A bulb | Interior light only | Checking on food |
| Pyrolytic or steam clean | A sun-like burst, or droplets | Cleaning cycle | Oven maintenance |

## Conventional oven symbol: two horizontal lines

The conventional symbol, sometimes called top and bottom heat or static heat, shows one line at the top of the square and one at the bottom. Both elements run and nothing moves the air. Heat rises, so the top of the oven runs a little hotter than the bottom, which is why recipes written for this mode tell you to use the middle rack.

Use it for cakes, sponges, cheesecakes, bread and pastries, and for a single roast. It is the gentlest of the main modes and the one most recipes assume unless they say otherwise.

## Fan oven symbol: a fan in a circle

The fan symbol, also labelled convection, shows a three-blade fan inside a circle. A heating element around the fan at the back of the oven warms the air and the fan pushes it around the cavity. Every shelf gets the same temperature, so you can bake three trays of cookies at once and they will all colour evenly.

Fan mode cooks faster and browns more, so lower the temperature by about 20°C from a recipe written for a conventional oven. It is the right mode for cookies, biscuits, roast vegetables, and anything on more than one tray. It is the wrong mode for a delicate sponge, which will set on the outside before it has finished rising. Our guide to the [oven symbol for baking cookies](/tips-tricks/oven-symbol-for-baking-cookies/) goes into the fan mode in more detail.

## Fan with bottom heat: the pizza symbol

A fan with a single line underneath it runs the bottom element together with the fan. The base gets direct heat while the moving air cooks the top, which is exactly what a pizza, a quiche or a fruit tart needs to avoid a soggy bottom. Some ovens print a small pizza icon for the same thing. See [which oven symbol to use for pizza](/tips-tricks/which-oven-symbol-for-pizza/) for temperatures and rack positions.

## Bottom heat only: one line at the bottom

One line at the bottom of the square means only the lower element runs. It is a finishing mode more than a cooking mode. Use it for the last ten minutes of a pie whose base is still pale, for keeping a casserole warm, or for slow, gentle cooking where you do not want the top to colour any further.

## Top heat only: one line at the top

One line at the top runs only the upper element. It browns the surface of a dish that is already cooked through, such as a gratin, a lasagne or a shepherd''s pie. It is gentler than the grill and easier to control.

## Grill symbols: the jagged line

A jagged or zigzag line at the top is the grill. The element runs at full power and the food sits close to it, so this is for toast, melting cheese, and thin cuts that cook in minutes. Leave the door as the manual says: many ovens grill with the door closed, some older ones ajar.

Add a fan to that jagged line and you have fan grill, which turns the grill into a slower, more even roaster. It suits chicken thighs, sausages and thicker chops, which would burn under a plain grill before the middle cooked. Our [oven symbol for grill](/tips-tricks/oven-symbol-for-grill/) guide covers both.

## Specialty and steam symbols

Newer ovens add a handful of icons on top of the classic set:

- **Fan only, no lines:** the fan runs with no heat. This is the defrost setting. It moves room-temperature air over frozen food so it thaws evenly without starting to cook.

- **Bread and dough symbols:** a loaf, or a bowl with dough rising, sets a low, steady temperature for proving. On a combi oven this is usually done with steam.

- **Steam symbols:** droplets or a cloud of steam mean the steam generator is running, either on its own for vegetables, fish and rice, or together with dry heat for bread with a proper crust and roasts that stay moist. The [VATTI combi ovens](/combi-and-steam-oven-in-malaysia/) run eight dry baking modes and three steam modes, plus the combinations.

- **Keep warm:** a plate or a low thermometer holds food at serving temperature without cooking it further.

- **Meat probe:** a thermometer icon means the oven will stop when the probe inside the joint reaches the temperature you set.

## Cleaning and safety symbols

- **Pyrolytic cleaning:** a burst or sun-like symbol. The oven heats to around 500°C and reduces grease to ash you wipe out afterwards. The door locks for the duration.

- **Steam cleaning:** droplets in the cavity. A short low-temperature cycle loosens grime with moisture so it wipes off.

- **Child lock:** a padlock. The controls are frozen until you hold the button to release them.

- **Door lock:** a padlock on a door, shown during pyrolytic cleaning.

- **Light:** a bulb, which switches the interior lamp on so you can check on food without opening the door.

## How to choose the right symbol

Match the mode to the dish before you touch the temperature. The mode decides where the heat comes from; the temperature only decides how much of it there is.

- Cakes, sponges and pastries: conventional, middle rack.

- Cookies and anything on two or three trays: fan, temperature lowered by 20°C.

- Pizza, quiche and tarts: fan with bottom heat.

- A single roast: conventional or fan, then a few minutes under the grill if the skin needs colour.

- Gratins and finishing: top heat or the grill.

Then preheat properly. Our guide to [how long to preheat an oven](/tips-tricks/how-long-to-preheat-oven/) explains why 10 to 15 minutes matters and when it takes longer.

## Common mistakes with oven symbols

- **Fan mode for a sponge.** The moving air sets the surface before the batter has risen, and the cake cracks or domes. Use conventional heat.

- **Grill for a thick joint.** The grill sears the top and never reaches the middle. Roast first, grill for colour at the end.

- **Not lowering the temperature in fan mode.** A recipe written for conventional heat will overbrown at the same temperature with the fan on.

- **Opening the door early.** Every opening drops the temperature and stalls the rise. Wait until at least two thirds of the baking time has passed.

- **Ignoring the manual.** Brands add their own icons for auto programmes and special modes. The manual explains those; this guide covers the ones every oven shares.

## Oven symbol FAQs

**What is the conventional oven symbol?**
Two horizontal lines, one at the top of the square and one at the bottom. It runs both elements without the fan and is the mode most baking recipes assume.

**What does the fan symbol on an oven mean?**
Convection. A heating element around the fan warms the air and the fan circulates it, so every shelf cooks at the same temperature. Lower the recipe temperature by about 20°C.

**Which oven symbol is for baking a cake?**
Conventional, the two horizontal lines, on the middle rack. See our full guide to the [oven symbol for baking cakes](/tips-tricks/oven-symbol-for-baking/) and the [oven settings for baking cakes](/tips-tricks/baking-cake-oven-setting/).

**Are oven symbols the same on every brand?**
The core set is: conventional, fan, grill, bottom heat and fan grill look the same almost everywhere. Special programmes differ, so check the manual for those.

**What is the difference between the fan symbol and the fan with a line underneath?**
The plain fan is convection. The fan with a line underneath adds the bottom element, which crisps the base. Use the second one for pizza and tarts.

## Final thoughts

Learn the four core symbols, conventional, fan, grill and bottom heat, and you can cook confidently in any oven. Everything else is a combination of those. If you are choosing an oven, the [VATTI combi and steam ovens](/combi-and-steam-oven-in-malaysia/) add steam to the standard modes, which is what keeps bread crusty and roasts moist, and their auto menus pick the mode and the temperature for you.

[Explore combi oven and steam oven](/combi-and-steam-oven-in-malaysia/)
'
WHERE path = 'tips-tricks/oven-symbols-and-meanings';

UPDATE article SET
  title = 'Induction or Ceramic Cooker: Which Is Better?',
  h1 = 'Induction or Ceramic Cooker: Which Is Better?',
  meta_description = 'Induction vs ceramic hob compared on speed, running cost, safety, cookware, noise and lifespan, with a plain recommendation for Malaysian kitchens.',
  word_count = 1461,
  reading_minutes = 7,
  modified_at = '2026-09-14T12:00:00+08:00',
  body_md = 'Induction and ceramic hobs look almost identical: a flat sheet of black glass with touch controls. Underneath, they could not be more different. An induction hob heats the pan itself with a magnetic field. A ceramic hob heats a coil under the glass and lets the heat travel up into the pan. That one difference decides the speed, the running cost, the safety, the noise and the cookware you can use.

This guide compares the two on everything that matters in a Malaysian kitchen, answers the questions people ask most, and ends with a plain recommendation.

![Induction cooker vs ceramic cooker](https://cdn.vattimalaysia.com/2025/12/Induction-Cooker-vs-Ceramic-Cooker-3.webp)

### Quick Answer: Induction or ceramic, which is better?

Induction is the better cooker for most homes: it boils faster, wastes less energy, keeps the glass cooler and responds instantly. Ceramic wins on price and on cookware, because it heats any pan. Choose ceramic if your budget is tight or you are attached to non-magnetic pots. Choose induction for everything else.

[Enquire With Us](https://wa.me/60123366082)

## How each one makes heat

An **induction hob** has a copper coil under the glass. Switch it on and the coil produces a magnetic field. Put a pan with a magnetic base on top and the field induces a current in the base of the pan, and that current heats the metal. The glass itself is not heated; it only picks up warmth from the pan sitting on it.

A **ceramic hob** has a radiant coil, a ribbon element that glows red under the glass. The coil heats the glass, and the glass heats the pan. It works like a traditional electric plate hidden under a smooth surface.

## Induction vs ceramic at a glance

| | Induction | Ceramic |
| --- | --- | --- |
| How it heats | Magnetic field heats the pan directly | Element heats the glass, glass heats the pan |
| Time to boil 1 litre | About 3 to 4 minutes | About 6 to 8 minutes |
| Energy reaching the pan | Around 85 to 90% | Around 65 to 70% |
| Response to a setting change | Instant | Slow, with lag both ways |
| Surface after cooking | Warm, cools in minutes | Hot for 15 to 30 minutes |
| Cookware | Magnetic base only | Any flat-bottomed pan |
| Noise | Faint hum or fan on high power | Silent |
| Price | Higher | Lower |
| Safety | Pan detection, no red-hot surface | Residual heat indicator, glass stays hot |

## Speed and energy efficiency

Induction transfers most of its energy straight into the pan, so water boils in roughly half the time a ceramic hob takes and the kitchen stays cooler while it does it. A ceramic hob loses a share of its heat into the glass and the air around it. Over a year of daily cooking that gap shows on the electricity bill, though for a household that cooks lightly it is small.

## Temperature control and cooking feel

Turn an induction zone down and the pan stops heating at once, which makes it easy to catch a sauce before it splits or bring a rolling boil down to a simmer. Ceramic lags. The coil keeps glowing after you lower the setting, and it takes a minute to come back up when you raise it. Some cooks like that steady, forgiving heat for stews and porridge; anyone used to gas will find it slow.

## Cookware: what cannot be cooked on induction

Induction only works with a pan whose base a magnet will stick to. That rules out:

- Glass and Pyrex pots

- Ceramic and stoneware pots

- Aluminium pans, unless they have a bonded steel plate in the base

- Copper pans

- Some older stainless steel with a non-magnetic base

Put a non-magnetic pan on an induction hob and nothing happens: the zone shows an error or simply stays cold. No power is used and nothing is damaged. Cast iron, enamelled cast iron, carbon steel and most modern stainless steel all work. A ceramic hob heats any of them, which is its strongest argument.

## Safety: is ceramic or induction safer?

Induction is the safer of the two. The glass only warms from contact with the pan, so a hand placed on the surface a minute after cooking will not be burned. Most zones switch off automatically when the pan is lifted away. Ceramic glass stays hot long after the element goes off, which is why every ceramic hob has a residual heat indicator that glows until the surface cools. Both types usually offer a child lock and an auto-off timer, but check the model.

## Lifespan

A well-made ceramic hob lasts 10 to 20 years because there is little in it beyond the element and the glass. Induction hobs carry more electronics and typically last 10 to 15 years. Both are outlived by a good gas hob, and on both the glass is the part most likely to fail, usually from a dropped pot rather than age.

## Noise

Ceramic hobs are silent. Induction hobs can hum or buzz at high power, especially with lightweight pans, and most run a cooling fan you may hear on a long boil. It is not loud, but it is there.

## Cleaning and spills

Both wipe clean because both are flat glass. The difference is what happens to a spill. On a ceramic hob, sugar or sauce that lands on the hot glass bakes on within seconds and needs a scraper. On induction the glass is cooler, so most spills wipe away with a cloth. Our guide to [removing white spots from glass stove tops](/tips-tricks/how-to-clean-white-spots-on-glass-stove-tops/) covers the baked-on kind.

## Cost

Ceramic hobs are cheaper to buy, often by a wide margin for the same size and zone count. Induction costs more upfront and may need new pans. Against that, induction uses less electricity per meal. For a household that cooks every day the running cost narrows the gap over a few years; for one that cooks occasionally the ceramic hob stays cheaper overall.

## Two questions people always ask

**Why do chefs not use induction?**
Most restaurant kitchens run on gas because a flame can be judged by eye, a wok can be tossed over it, and it takes any pan. Induction is spreading in professional kitchens for its speed and for how much cooler it keeps the room, but tradition and the wok still favour gas. If that is your cooking too, read our guide to [induction versus gas in Malaysia](/buying-guide/induction-cooker-vs-gas-stove/).

**Why does my induction hob take so long to boil water?**
Almost always the pan. A thin, warped or slightly non-magnetic base couples poorly with the coil and the hob throttles back. A small pot on a large zone does the same. Use a flat, heavy, magnetic pan matched to the zone size and induction is the fastest hob there is.

## Should I get ceramic or induction?

Choose **induction** if you want:

- Fast boiling and instant control

- Lower electricity use

- A surface that is safe to touch soon after cooking

- Spills that wipe off rather than bake on

Choose **ceramic** if you want:

- The lower purchase price

- To keep your existing aluminium, copper or glass cookware

- Slow, steady, silent heat for soups and stews

- The look of a glowing element

And if wok cooking is the heart of your kitchen, consider neither. A gas hob with a high-output burner still does that job best, and the [VATTI cooker hobs](/cooker-hob-in-malaysia/) are built around it, with glass tops that clean like a ceramic hob. Our guides to [infrared gas burners](/buying-guide/is-an-infrared-gas-stove-worth-it/) and to [ceramic versus infrared cookers](/buying-guide/ceramic-cooker-vs-infrared-cooker-what-is-the-difference/) cover that side of the decision.

## Induction vs ceramic FAQs

**Is a ceramic hob the same as a glass hob?**
Not quite. Both use glass-ceramic tops, but "ceramic hob" means the radiant kind with an element under the glass, and an induction hob uses the same glass with a coil instead. Our article on [ceramic versus glass cooktops](/buying-guide/is-a-ceramic-cooktop-same-as-a-glass-cooktop/) untangles the names.

**Can I use my old pans on induction?**
Hold a fridge magnet to the base. If it sticks firmly, the pan works. If it slides off, it will not heat.

**Does an induction hob use a lot of electricity?**
Less than a ceramic hob for the same cooking, because more of the energy reaches the food. A high-power zone can draw 2 kW or more while boiling, but for a shorter time.

**Which is easier to clean?**
Induction, because the cooler glass stops spills baking on. Both are far easier than a gas hob with pan supports.

## Final thoughts

Induction is the better hob for speed, efficiency, safety and cleaning. Ceramic is the better hob for price and for cookware freedom. Decide which of those two lists matters more in your kitchen and the choice is made. If you cook with a wok every day, look at gas first: explore the [VATTI cooker hob range](/cooker-hob-in-malaysia/) and compare the burners model by model.

[Explore VATTI cooker hob](/cooker-hob-in-malaysia/)
'
WHERE path = 'buying-guide/which-is-better-induction-or-ceramic-cooker';

UPDATE article SET
  title = 'What Is RO Water? Reverse Osmosis Explained',
  h1 = 'What Is RO Water? Reverse Osmosis Explained',
  meta_description = 'Reverse osmosis water is tap water pushed through a 0.0001 micron membrane. What it removes, what it costs to run, and whether a Malaysian home needs it.',
  word_count = 1149,
  reading_minutes = 6,
  modified_at = '2026-09-14T12:00:00+08:00',
  body_md = 'Reverse osmosis water, or RO water, is tap water that has been pushed through a membrane so fine that almost nothing except water molecules gets through. It is the most thorough filtration you can install in a home, and it is what most bottled drinking water in Malaysia is made from. This guide explains how it works, what it removes, what it does not do, and how to decide whether your household needs it.

![What is reverse osmosis water](https://cdn.vattimalaysia.com/2025/08/What-Is-Reverse-Osmosis-Water.webp)

### Quick Answer: What is RO water?

RO water is water forced through a semi-permeable membrane with pores around 0.0001 micron across. Dissolved salts, heavy metals, bacteria, viruses and most chemicals are held back, and what comes out the other side is very close to pure water. Home RO systems add carbon stages before and after the membrane, which is what makes the water taste good as well as test clean.

[Enquire With Us](https://wa.me/60123366082)

## How reverse osmosis works

Osmosis is what happens when water passes through a membrane from the purer side to the saltier side, which is how plant roots drink. Reverse osmosis uses pressure to push it the other way: from the tap water side through the membrane, leaving the dissolved solids behind.

A home RO purifier does this in four stages:

- **Sediment filter.** A PP cotton cartridge catches rust, sand and grit from the pipes.

- **Pre-carbon filter.** Activated carbon absorbs chlorine and organic compounds, which protects the membrane and takes away the swimming-pool taste.

- **RO membrane.** The 0.0001 micron membrane rejects dissolved salts, heavy metals such as lead and arsenic, bacteria, viruses and microplastics.

- **Post-carbon filter.** A final carbon stage polishes the taste of the water as it leaves.

The rejected solids are flushed away to the drain with a small stream of waste water, which is how the membrane keeps itself clear.

## What RO removes

| Contaminant | Removed by RO? |
| --- | --- |
| Chlorine and its by-products | Yes, at the carbon stages |
| Lead, arsenic, mercury and other heavy metals | Yes |
| Dissolved salts and hardness | Yes |
| Bacteria and viruses | Yes |
| Sediment, rust and sand | Yes |
| Pesticides and most organic chemicals | Yes |
| Microplastics | Yes |
| Naturally occurring minerals such as calcium and magnesium | Yes, mostly |

That last row is the trade-off. RO does not know the difference between a harmful dissolved solid and a useful one, so minerals go too. The water is perfectly safe; most of the minerals in a diet come from food, not water. Some people find very pure water tastes flat, which is why post-carbon and mineral stages exist.

## What RO does not do well

- **Flow rate.** Water passes the membrane slowly. Cheaper systems store it in a tank so a glass fills at a normal speed. A high-capacity membrane, rated at 600 gallons a day, delivers about 1.5 litres a minute straight to the tap, which is roughly six seconds for a glass.

- **Waste water.** Every litre purified sends some water to drain. Modern membranes waste far less than older ones, but it is not zero.

- **Filter costs.** The carbon cartridges last about a year and the membrane about two. Budget for both; a system with old filters is worse than no system.

- **Boiling is not a substitute.** Boiling kills bacteria but does nothing about metals, chemicals or sediment, and it concentrates them as water evaporates.

## Do you need RO water in Malaysia?

Tap water in Malaysia is treated to a safe standard when it leaves the plant. What reaches your glass depends on the pipes, the building''s storage tank, and the age of the plumbing, which is why the same water can taste and test differently across one city.

RO is worth it if any of these apply:

- The water tastes or smells of chlorine, metal or earth.

- The building is older, or has a rooftop tank you cannot see cleaned.

- There is an infant, an elderly person or someone with a weak immune system in the house.

- You currently buy bottled water, which RO replaces at a fraction of the cost.

If none apply, a simpler carbon filter at the tap will improve taste and remove chlorine. Our guide to [water purifiers versus water filters](/tips-tricks/water-purifier-vs-water-filter/) explains where that line sits. For the health case in full, see the [benefits of a reverse osmosis water filter](/buying-guide/reverse-osmosis-water/).

## What RO costs to run

For the VATTI system below, the four-layer carbon filter is RM189 and lasts about 12 months, and the RO membrane is RM499 and lasts about 24 months. That works out at roughly RM440 a year, or about RM1.20 a day, for unlimited purified water at four temperatures. A family that buys bottled water spends more than that in a month. Our guide to [how often to replace a water filter](/tips-tricks/how-often-replace-water-filter/) explains the signs that a cartridge is due.

## The VATTI One Tap purifier is an RO system

The [VATTI One Tap water purifier](/vatti-one-tap-water-purifier-wdhg01-with-v818wd/) is a four-stage RO purifier that fits under the sink and feeds a single tap on the counter. The membrane is the 0.0001 micron kind described above, the post-carbon stage handles the taste, and the membrane is rated at 600 gallons a day so the tap runs at 1.5 litres a minute with no storage tank. A separate heater beside it delivers hot water in three seconds, and the tap gives four temperatures: 100°C for tea, 85°C for coffee, 45°C for a baby''s milk, and room temperature. You change the filters yourself by lifting the lid.

## RO water FAQs

**Is RO water safe to drink every day?**
Yes. It is the standard for bottled drinking water and for hospitals. The minerals it removes are ones you get from food.

**Does reverse osmosis remove minerals?**
Most of them, yes. That is inherent to the method. It does not make the water unhealthy, and a post-carbon stage brings the taste back.

**Is RO water the same as distilled water?**
No. Distilled water is boiled and condensed, which removes almost everything including dissolved gases. RO water keeps a trace of minerals and tastes more like ordinary water.

**How often does an RO membrane need changing?**
About every two years in normal home use, with the carbon filters changed yearly. A drop in flow or a return of the chlorine taste means one of them is due.

**Why does RO water taste flat?**
Because it is very pure and low in minerals, and minerals are most of what water tastes of. Most people stop noticing within a week, and a post-carbon stage softens the difference.

## Final thoughts

RO water is tap water with the dissolved solids, metals and microbes taken out. It is the right choice for a household that wants bottled-water purity from the kitchen tap, and the running cost is lower than bottles. The [VATTI One Tap purifier](/one-tap-purifier-in-malaysia/) delivers it hot, warm or cold from one fixture, with filters you change yourself.

[Explore the VATTI One Tap water purifier](/one-tap-purifier-in-malaysia/)
'
WHERE path = 'tips-tricks/what-is-reverse-osmosis-water';

UPDATE article SET
  title = 'Ducted or Ductless Range Hood: Which Is Better in Malaysia?',
  h1 = 'Ducted or Ductless Range Hood: Which Is Better in Malaysia?',
  meta_description = 'Ducted removes smoke, heat and odour; ductless filters and returns the air. Which is better for wok cooking, condos and running cost, with FAQs.',
  word_count = 1212,
  reading_minutes = 6,
  modified_at = '2026-09-14T12:00:00+08:00',
  body_md = 'A ducted range hood pushes smoke, steam and grease out of the house through a pipe. A ductless hood, also called a recirculating hood, pulls the air through filters and blows it back into the kitchen. Which one is better depends on one question: can a duct reach an outside wall or the ceiling void? If it can, ducted wins on every measure but installation cost. If it cannot, ductless is the option you have, and this guide explains how to get the most from it.

![which is better ducted or ductless range hood](https://cdn.vattimalaysia.com/2025/02/which-is-better-ducted-or-ductless-range-hood.webp)

### Quick Answer: Ducted or ductless, which is better?

Ducted, whenever the building allows it. A ducted hood removes heat, humidity and odour along with the smoke, which matters more in Malaysia than in a cool climate, and it handles wok cooking that a recirculating hood cannot. Choose ductless only where a duct run is impossible, and then buy the strongest one you can and change its carbon filter on schedule.

[Enquire With Us](https://wa.me/60123366082)

## How each type works

A **ducted hood** draws air through a grease filter or an oil-separating chamber, then drives it along a duct, usually 180 to 190 mm across, to a vent on an external wall or through the roof. The grease stays in the hood; everything else leaves the house.

A **ductless hood** draws air through the same grease stage, then through a charcoal filter that absorbs some of the odour, and returns the air to the room through vents at the top of the hood. The grease is caught, some of the smell is caught, and the heat and moisture stay in the kitchen.

## Ducted vs ductless at a glance

| | Ducted | Ductless |
| --- | --- | --- |
| Where the air goes | Outside | Back into the kitchen |
| Smoke and grease | Removed | Grease caught, fine smoke partly returned |
| Odour | Removed | Reduced, not removed |
| Heat and humidity | Removed | Stay in the room |
| Wok and high-heat cooking | Handles it | Struggles |
| Installation | Needs a duct run to a wall or roof | Hangs on the wall, plugs in |
| Ongoing cost | Filter cleaning | Charcoal filters every 3 to 6 months |
| Best for | Landed homes, condos with a duct path | Kitchens with no route outside |

## Performance: what a Malaysian kitchen asks of a hood

Stir-frying at high heat produces more smoke and oil mist in five minutes than an oven does in an hour. A typical kitchen needs its air turned over about ten times an hour, which is roughly 650 to 800 m³/h of extraction, and a wok pushes that requirement up.

A ducted hood can meet it, and the figure to compare is not only airflow but static pressure: the push a hood keeps once the air has to climb a riser and turn corners. The [VATTI kitchen hoods](/kitchen-hood-in-malaysia/) are ducted extractors running from 420 Pa up to 1,700 Pa, which is what a high-rise duct run needs. Our sizing guide on [what hood size you need](/tips-tricks/what-hood-size-do-i-need/) explains how to match width and airflow to the hob.

A ductless hood has no such number to win on. It can catch the grease and part of the smell, but the hot, wet air is still in the room, and charcoal saturates quickly under daily frying.

## Installation: the deciding factor

A ducted hood needs a path for a 7 inch duct to an external wall or into a ceiling void that leads outside. In a landed house that is almost always possible. In a condominium it depends on the unit: many have a kitchen on an external wall or a service yard that makes it straightforward, some have a duct provision built in, and some forbid new wall penetrations. Check with management before you buy. Our guide to [installing a chimney hood](/tips-tricks/how-to-install-chimney-hood/) covers the duct route, the height and the electrics.

A ductless hood needs a wall and a socket. That simplicity is its whole appeal.

## Cost and maintenance

Ducted costs more on the day, because of the duct run and the wall vent, and less afterwards. Its grease filter is washed rather than replaced, and hoods with an auto-clean cycle wash their own impeller with steam. See [how to clean a kitchen hood filter](/tips-tricks/how-to-clean-kitchen-hood-filter/).

Ductless costs less to fit and more to run. The charcoal filter cannot be washed and needs replacing every three to six months under Malaysian cooking, and a hood run on a spent charcoal filter is a fan that blows greasy air around the room.

## When ductless is the right call

- The kitchen has no external wall and no ceiling route, and management will not allow one.

- It is a rental and the landlord will not permit ducting.

- Cooking is light: reheating, boiling and the occasional pan-fry rather than daily wok work.

In those cases a ductless hood is far better than no hood, and our guide to a [kitchen hood without a vent](/tips-tricks/kitchen-hood-without-vent/) explains how to choose one and what to expect.

## So which is better?

Ducted, if the duct can be run. It is the only kind that actually removes the smoke, the smell, the heat and the humidity from a kitchen, and it is the only kind that keeps up with a wok. Ductless is the fallback for kitchens where a duct is impossible, and it is a real improvement over nothing, but it should not be chosen for convenience where ducting was possible.

## Ducted vs ductless FAQs

**Do ductless range hoods need filters?**
Yes, two. A grease filter that you wash, and a charcoal filter that you replace every three to six months. The charcoal filter is what does the deodorising, and it cannot be cleaned.

**What is a good airflow for a range hood?**
For a typical Malaysian kitchen, 650 to 800 m³/h gives about ten air changes an hour, and heavy wok cooking benefits from more. If a spec sheet quotes CFM, multiply by 1.7 to get m³/h: 600 CFM is about 1,020 m³/h.

**Where does the air go in a ductless range hood?**
Through the grease filter, through the charcoal filter, and back out into the kitchen through vents at the top or front of the hood.

**How high should a range hood be above the hob?**
Usually 650 to 750 mm for a chimney or T-shape hood, and closer for a slim or hidden hood. Follow the height printed in the model''s installation manual, because the airflow figures are measured at it.

**Can a ductless hood be converted to ducted later?**
Many hoods sold as ductless are convertible: remove the charcoal filter, fit the duct adaptor, and run the duct. Check the manual before buying if you expect to renovate.

**Is a ductless hood enough for wok cooking?**
No. It will catch some grease and some smell, but the smoke, heat and steam of high-heat frying stay in the room. If you cook that way, find a route for a duct.

## Final thoughts

The choice between ducted and ductless is really the choice between removing the problem and filtering part of it. Run a duct if the building allows, and pick a hood with the static pressure to push through that run. Every [VATTI kitchen hood](/kitchen-hood-in-malaysia/) is a ducted extractor, and the comparison table on that page lists airflow, pressure and noise for each model so you can match one to your duct.

[Explore VATTI Kitchen Hood Malaysia](/kitchen-hood-in-malaysia/)
'
WHERE path = 'buying-guide/which-is-better-ducted-or-ductless-range-hood';

UPDATE article SET
  title = 'How to Remove Scratches From a Glass Stove Top',
  h1 = 'How to Remove Scratches From a Glass Stove Top',
  meta_description = 'Polish light scratches out with baking soda or cerium oxide, blend deep ones with a kit, and know when the glass must be replaced. Step-by-step methods.',
  word_count = 1273,
  reading_minutes = 6,
  modified_at = '2026-09-14T12:00:00+08:00',
  body_md = 'Scratches on a glass stove top come from the same few things: a pot slid instead of lifted, a cast iron pan with a rough base, a grain of salt or sugar caught under a pan, or a scouring pad used on a stain. Light ones can be polished out at home in ten minutes. Deep ones cannot be removed, only made less visible. This guide shows you how to tell which you have, the methods that work in order of how safe they are, and how to stop the next scratch.

![how to remove scratches on stove top](https://cdn.vattimalaysia.com/2024/03/how-to-remove-scratches-on-stove-top.webp)

### Quick Answer: How do you remove scratches from a glass stove top?

For light surface scratches, rub a thick paste of baking soda and water over the mark with a soft cloth in small circles, then wipe clean. For scratches you can feel with a fingernail, use a glass cooktop polish or cerium oxide compound the same way. Deep gouges and chips cannot be polished out; they can only be blended, and a cracked top should not be used at all.

[Enquire With Us](https://wa.me/60123366082)

## First, which kind of scratch is it?

Run a fingernail across the mark.

- **You cannot feel it:** a surface scuff or haze. Baking soda or toothpaste will usually clear it.

- **Your nail catches slightly:** a light scratch. A cooktop polish or cerium oxide will reduce it and often remove it.

- **Your nail drops into it:** a deep scratch or gouge. No home method removes it. A repair kit can fill and blend it so it is less visible.

- **It is a crack, not a scratch:** stop using the hob. A cracked glass top can fail under heat, and on an electric hob it can expose live parts. Have the glass replaced.

Also check that what you are seeing is a scratch. Grey or white marks that follow the shape of a pan are usually mineral residue or burnt-on sugar, which polish off with a different approach. See [how to clean white spots on a glass stove top](/tips-tricks/how-to-clean-white-spots-on-glass-stove-tops/) and [how to remove cloudiness from a glass stovetop](/tips-tricks/how-to-remove-cloudiness-from-glass-stovetop/).

## Before you start

- Let the hob cool completely.

- Wash the surface with warm water and a drop of dish soap, and dry it. Any grit left on the glass becomes another scratch as you rub.

- Work in daylight or under a strong light held at a low angle, which shows scratches clearly.

## Method 1: Baking soda paste (light scratches)

Baking soda is a very mild abrasive, mild enough that it cannot scratch glass-ceramic on its own.

- Mix two tablespoons of baking soda with enough water to make a thick paste.

- Spread it over the scratch with a soft cloth.

- Rub in small circles for one to two minutes with light pressure.

- Wipe off with a damp cloth, dry, and check under the light. Repeat once or twice if it is fading.

## Method 2: Glass cooktop polish or cerium oxide (light to moderate scratches)

Cooktop cleaning creams sold for glass hobs contain a fine polishing agent. Cerium oxide, the compound used to polish glass and watch crystals, is stronger and is sold as a powder or paste at hardware stores.

- Put a pea-sized amount on a microfibre cloth or a felt pad.

- Work it over the scratch in circles for two to three minutes. Keep the pad moving so no one spot is rubbed longer than the rest.

- Wipe clean with a damp cloth and dry.

- Check the result. Cerium oxide removes a tiny layer of glass, so several short passes are better than one long one.

Wear gloves and keep the powder off the controls.

## Method 3: Toothpaste (surface scuffs only)

Ordinary white, non-gel toothpaste contains fine abrasives similar to baking soda. It works on scuffs and haze, not on scratches you can feel. Apply a little to a soft cloth, rub in circles for a minute, wipe and dry. It is the method to use when you have nothing else in the house.

## Method 4: Stainless steel stove tops

The methods above are for glass. On a stainless steel hob top, scratches are treated differently: use a metal polish or a non-scratch cleaning paste and always rub along the grain of the steel, never across it. Rubbing across the grain leaves a visible patch of new scratches. Finish with a dry microfibre cloth.

## Method 5: Deep scratches and chips

A deep scratch cannot be polished away, because polishing works by levelling the glass around the mark and a deep mark has too much depth to level. Two options remain:

- **A glass cooktop repair kit.** These fill the scratch with a clear compound, cure it, then buff the surface flat. The scratch becomes far less visible but the filled line can still be seen at some angles.

- **Replace the glass.** For a chip near the edge, a crack, or a scratch that bothers you every time you cook, a new glass panel fitted by the brand''s service centre is the proper fix.

## What not to do

- Do not use a scouring pad, steel wool or an abrasive powder cleaner. They add scratches.

- Do not use a razor scraper on a scratch. Scrapers are for lifting burnt-on food, held almost flat, and they do nothing for scratches.

- Do not polish a hot surface. The compound dries instantly and you will rub grit into the glass.

- Do not keep polishing one spot. Cerium oxide can leave a shallow dip that shows as a distortion in the reflection.

## How to prevent scratches

- Lift pans on and off. Never slide them, even an inch.

- Check pan bases. Cast iron, stoneware and any pan with a rough or burred base should stay off glass, or sit on a heat diffuser.

- Wipe the glass before cooking. A single grain of salt under a pan is a scratch waiting to happen.

- Clean spills once the hob has cooled, with a soft cloth and a cooktop cream, so you are never tempted to scrub.

- Keep pan bases clean. Grit baked onto the bottom of a pot scratches as surely as grit on the glass.

## Scratched stove top FAQs

**Can you remove scratches from a glass stove top completely?**
Light ones, yes. Anything deep enough to catch a fingernail can be reduced but rarely erased.

**Is a scratched glass cooktop safe to use?**
A scratch, yes. A crack or a chip that goes through the glass, no. Stop using it and have the panel checked.

**Does toothpaste really remove scratches?**
On surface haze and scuffs it does, because it is a mild abrasive. On a real scratch it will not.

**Are ceramic and glass cooktops the same when it comes to scratches?**
Both are glass-ceramic and both scratch and polish the same way. Our article on [ceramic versus glass cooktops](/buying-guide/is-a-ceramic-cooktop-same-as-a-glass-cooktop/) explains the naming.

**Why does my black glass hob show scratches so much?**
Black glass shows every mark under kitchen lighting because the scratch scatters light against a dark background. The scratches are no worse than on a lighter surface; they are simply easier to see.

## Final thoughts

Polish the light scratches out with baking soda or a cooktop compound, blend the deep ones with a kit, and replace a cracked panel. Then protect the surface by lifting pans and keeping grit off the glass. If you are choosing a new hob, the glass-topped [VATTI cooker hobs](/cooker-hob-in-malaysia/) use tempered glass with a nano coating on the flagship models, which resists both grease and the daily wear that turns into scratches.

[Explore VATTI cooker hob](/cooker-hob-in-malaysia/)
'
WHERE path = 'tips-tricks/how-to-remove-scratches-on-stove-top';

UPDATE article SET
  title = 'How to Clean a Kitchen Hood Filter: Mesh, Baffle and Carbon',
  h1 = 'How to Clean a Kitchen Hood Filter: Mesh, Baffle and Carbon',
  meta_description = 'Soak in hot water, dish soap and baking soda for 15 to 30 minutes, scrub, rinse and dry. How often to clean, whether the dishwasher is safe, and carbon filters.',
  word_count = 1230,
  reading_minutes = 6,
  modified_at = '2026-09-14T12:00:00+08:00',
  body_md = 'In a Malaysian kitchen the hood filter fills with grease faster than anywhere else in the house. Daily frying and stir-frying send oil mist straight into it, and once the mesh is clogged the hood loses suction, smells start to linger, and the grease itself becomes a fire risk. Cleaning the filter is a 30-minute job and it is the single most useful thing you can do for a cooker hood. This guide explains how, for every filter type, and how often.

![how to clean kitchen hood filter](https://cdn.vattimalaysia.com/2026/01/how-to-clean-kitchen-hood-filter.webp)

### Quick Answer: How do you clean a kitchen hood filter?

Switch the hood off, unclip the filter, and soak it in very hot water with a squirt of grease-cutting dish soap and two or three tablespoons of baking soda for 15 to 30 minutes. Scrub the loosened grease off with a soft brush, rinse under warm water, and let it dry completely before clipping it back in. Do this monthly for normal cooking and every two to four weeks for heavy wok cooking.

[Enquire With Us](https://wa.me/60123366082)

## Why a clean filter matters

- **Suction.** Grease in the mesh blocks the airflow, and a hood pulling through a clogged filter cannot clear the smoke it was rated for.

- **Fire safety.** Cooking grease is flammable. A filter caked with it sits directly above the flame.

- **Smell.** Old grease holds odour. A kitchen that smells of yesterday''s cooking usually has a filter that needs washing.

- **Motor life.** A blocked filter makes the motor work harder for less air, and that is what wears it out early. Grease, not age, is what takes the suction out of most hoods.

## Know your filter type first

**Aluminium mesh filters** are the most common in home hoods: layered mesh in a frame, light, and reusable. They are the type this guide is mostly about.

**Stainless steel baffle filters** are the angled-plate filters found on heavier and commercial-style hoods. They trap grease by making the air change direction. They clean the same way and take harder scrubbing.

**Charcoal or carbon filters** are fitted to ductless hoods behind the grease filter. They absorb odour and they cannot be washed. When a carbon filter is spent, the only fix is a new one, every three to six months.

**No filter at all.** Some hoods separate the oil without a mesh. The [VATTI Aetheris V929](/vatti-aetheris-series-cooker-hood-v929/), for example, lets oil run down a coated glass panel into a cup you empty, and washes its own impeller with a cleaning cycle. If your hood has an oil cup, empty and wash the cup; there is no mesh to soak.

## How often to clean a hood filter

| Cooking habit | Clean the filter |
| --- | --- |
| Light cooking, little frying | Every 2 to 3 months |
| Daily home cooking | Monthly |
| Heavy frying or wok cooking | Every 2 to 4 weeks |

A quick check: hold the filter up to the light. If you cannot see through the mesh, it is overdue.

## How to clean a kitchen hood filter, step by step

### Step 1: Switch off and remove the filter

Turn the hood off at the switch. Most mesh filters have a spring clip or a latch on the front edge: press it and the filter drops down. Have a tray underneath, because a full filter drips. Gloves help; the edges are sharp and the grease is unpleasant.

### Step 2: Soak in hot water, soap and baking soda

Fill the sink or a large basin with water as hot as the tap gives, around 60 to 70°C. Add a good squirt of grease-cutting dish soap and two to three tablespoons of baking soda, then submerge the filter fully. Leave it for 15 to 30 minutes. The heat softens the grease and the baking soda, which is alkaline, breaks it down.

If the filter does not fit the sink, lay it in the bath or a storage box, or do one half at a time.

### Step 3: Scrub

Use a soft brush, a non-scratch sponge or an old toothbrush for the corners. After the soak most of the grease lifts with light pressure. Avoid steel wool and stiff brushes: they bend the mesh and scratch the frame.

For a filter that has been neglected for months, drain the basin, sprinkle baking soda straight onto the mesh, scrub, then soak again.

### Step 4: Rinse and dry completely

Rinse under warm running water until it runs clear and no suds remain. Then dry the filter fully. Standing it on edge on a towel overnight is safest; a hairdryer on low speeds it up. A filter refitted damp will smell and, on aluminium, can start to corrode.

### Step 5: Refit and wipe the hood

Clip the filter back in the way it came out. While it is out, wipe the inside of the hood and the underside with a cloth and the same hot soapy water. Our guide to [range hood maintenance](/tips-tricks/range-hood-maintenance/) covers the rest of the hood.

## Can you put a hood filter in the dishwasher?

Often, but check the manual first. Stainless steel baffle filters are dishwasher-safe. Aluminium mesh filters usually are too, but alkaline dishwasher detergent can leave aluminium dull and grey, and a heavily greased filter can clog the dishwasher''s own filter. If you use the dishwasher, run the filter on its own on a hot programme and clean the dishwasher filter afterwards. Never put a charcoal filter in.

## Hoods that clean themselves

Many current hoods carry an auto-clean cycle. High-temperature steam or a turbo wash runs through the fan chamber and loosens the oil on the impeller before it hardens, which is the part a filter wash never reaches. It does not replace washing the filter, but it does keep the suction from fading between washes. Our guide to [what auto-clean is](/tips-tricks/what-is-auto-clean/) explains how the cycle works.

## Hood filter cleaning FAQs

**Can I use vinegar to clean a hood filter?**
Yes, as a second step for light grease. Do not add it to the baking soda soak; the two neutralise each other and you lose both.

**Does baking soda really remove grease?**
Yes. It is alkaline, and alkalis break cooking oil down into compounds that rinse away. It is also mild enough not to harm aluminium.

**Can you wash a carbon filter?**
No. Washing destroys the charcoal''s ability to absorb odour. Replace it every three to six months.

**Why does the hood still smell after cleaning the filter?**
Grease inside the fan chamber, a spent charcoal filter on a ductless hood, or grease in the duct itself. An auto-clean cycle handles the first; the second needs a new filter; the third needs a service visit.

**How long does it take?**
About 30 to 45 minutes: 15 to 30 soaking, and 10 to 15 scrubbing and rinsing.

**Should I replace an aluminium mesh filter?**
When the mesh is torn, bent so it no longer sits flat, or corroded. A filter that still fits and washes clean can last the life of the hood.

## Final thoughts

A clean filter is what keeps a hood pulling at the airflow it was sold with. Wash it monthly, more often if you fry every day, and let it dry before it goes back. If you are replacing the hood, the [VATTI kitchen hood range](/kitchen-hood-in-malaysia/) includes models with auto-clean cycles and one with no mesh filter at all, which are the two ways to make this job smaller.

[Explore VATTI Kitchen Hood](/kitchen-hood-in-malaysia/)
'
WHERE path = 'tips-tricks/how-to-clean-kitchen-hood-filter';

UPDATE article SET
  title = 'How Long to Preheat an Oven: 10 to 15 Minutes for Most Baking',
  h1 = 'How Long to Preheat an Oven: 10 to 15 Minutes for Most Baking',
  meta_description = 'Most ovens take 10 to 15 minutes to reach 180°C and up to 25 minutes for 230°C. Times by temperature, a Celsius to Fahrenheit table, and how to tell it is ready.',
  word_count = 1051,
  reading_minutes = 5,
  modified_at = '2026-09-14T12:00:00+08:00',
  body_md = 'Preheating means bringing the oven up to the recipe''s temperature before the food goes in. Most home ovens take 10 to 15 minutes to reach standard baking temperatures, and the indicator light or beep is not always the last word. This guide gives times by temperature, explains what makes an oven slower, and shows how to tell when it is really ready.

![how long to preheat oven](https://cdn.vattimalaysia.com/2026/03/how-long-to-preheat-oven.webp)

### Quick Answer: How long does an oven take to preheat?

About 10 to 15 minutes for 180°C, which covers most cakes and everyday baking. Allow 15 to 20 minutes for 200 to 220°C and up to 25 minutes for 230°C and above. A fan oven reaches temperature a few minutes faster; a large or older electric oven takes longer. If baking is the goal, give it five minutes beyond the beep.

[Enquire With Us](https://wa.me/60123366082)

## Preheat time by temperature

| Temperature | Typical time | What bakes at this temperature |
| --- | --- | --- |
| 120 to 150°C (250 to 300°F) | 8 to 10 minutes | Meringues, slow roasts, cheesecake |
| 160 to 180°C (325 to 350°F) | 10 to 15 minutes | Cakes, cookies, casseroles |
| 190 to 200°C (375 to 400°F) | 15 to 20 minutes | Bread, roast chicken, pastries |
| 220 to 250°C (425 to 480°F) | 20 to 25 minutes | Pizza, roast potatoes, searing |

These times assume the door stays shut and the oven is a normal domestic size. A tabletop oven is quicker; a 70 litre built-in is at the slower end.

## Celsius to Fahrenheit for oven settings

Recipes from overseas often give Fahrenheit. These are the settings that matter.

| Celsius | Fahrenheit | Gas mark |
| --- | --- | --- |
| 120°C | 250°F | 1/2 |
| 150°C | 300°F | 2 |
| 160°C | 325°F | 3 |
| 180°C | 350°F | 4 |
| 190°C | 375°F | 5 |
| 200°C | 400°F | 6 |
| 220°C | 425°F | 7 |
| 230°C | 450°F | 8 |
| 250°C | 480°F | 9 |

## Why preheating matters

- **Rise.** A cake or a loaf needs a burst of heat the moment it goes in, so the raising agent works before the structure sets. In a cold oven the batter spreads and the crumb turns dense.

- **Texture.** Pastry puffs and cookies spread correctly only when the fat melts fast. A slow start makes them greasy and flat.

- **Timing.** Recipe times assume the oven is at temperature. Start cold and every time in the recipe is wrong.

- **Browning.** A crust colours at high heat. Food that spends its first ten minutes warming up with the oven dries out before it browns.

Some dishes do not care: slow roasts, casseroles, and anything cooked for hours. Those can go into a cold oven and save the wait.

## What makes an oven slow to preheat

**Oven type.** Gas ovens heat quickly. Electric ovens are steadier but slower. Fan ovens reach temperature fastest because the moving air heats the whole cavity at once.

**Size and elements.** A larger oven has more air to heat. Ovens with hidden bottom elements, common on models with a smooth base for cleaning, preheat a little more slowly than those with an exposed element.

**What is inside.** Extra racks, a pizza stone or a roasting tray all absorb heat. Take out what you do not need, or accept that a stone needs 30 to 45 minutes.

**The door.** Every time it opens the oven loses heat and starts again. Use the light.

**Age.** A worn door seal or a tired element adds minutes. If a familiar oven has become slow, those two are the usual reasons.

## How to tell when the oven is really ready

The preheat light or beep tells you the sensor near the element has reached the setting, not that the air and the walls have. Give it five more minutes for baking, where the first minutes decide the rise. An oven thermometer hung from the middle rack settles the question for good and shows whether the dial is honest; many domestic ovens run 10 to 20°C off the number on the display.

## How to preheat, step by step

- Take out racks and trays you will not use, and put the rack you will use in position.

- Set the mode first, then the temperature. Conventional heat for cakes and pastries, fan for cookies and multi-tray baking. Our guide to [oven symbols and meanings](/tips-tricks/oven-symbols-and-meanings/) explains which is which.

- Press start on a digital oven; some do not begin heating until you do.

- Wait for the indicator, then a few minutes more for baking.

- Open the door only when the food is ready to go in, and close it promptly.

## Tips to speed it up without harm

- Remove unneeded racks.

- Use fan mode if the recipe allows, lowering the temperature by about 20°C.

- Use the rapid preheat function if the oven has one. It runs the grill element with the fan for the first minutes.

- Keep the door seal clean so it closes fully.

On a combi oven the auto-cooking menus handle the preheat inside the programme. The [VATTI combi ovens](/combi-and-steam-oven-in-malaysia/) run 68 of them, and the steam modes reach working temperature in a fraction of the time dry heat takes.

## Preheating FAQs

**How long to preheat an oven to 180°C?**
Ten to fifteen minutes in most ovens, a little less with the fan on.

**Can I put food in before the oven is preheated?**
For a casserole or a slow roast, yes. For cakes, bread, cookies and pastry, no; the rise and the texture depend on the first minutes at full heat.

**Does preheating waste energy?**
A little, but far less than the cost of a failed bake. Skip it only for dishes that do not need it.

**Why does my oven take 30 minutes to preheat?**
Usually a worn door seal, a weakening element, or a heavy pizza stone inside. If the oven is otherwise fine, a service visit will confirm which.

**Is preheating different for a fan oven?**
Only in that it is faster and the target temperature is lower. Set the fan oven 20°C below the recipe''s conventional temperature.

## Final thoughts

Ten to fifteen minutes is the honest answer for everyday baking, and a few minutes more never hurts. Take out the spare racks, keep the door closed, and use the mode the dish needs. If you want an oven that takes the guesswork out, the [VATTI combi and steam ovens](/combi-and-steam-oven-in-malaysia/) preheat inside their auto programmes and hold temperature precisely from the first minute.

[Explore VATTI Built-in Oven](/combi-and-steam-oven-in-malaysia/)
'
WHERE path = 'tips-tricks/how-long-to-preheat-oven';

UPDATE article SET
  title = 'Is It OK to Leave Dishes in the Dishwasher Overnight?',
  h1 = 'Is It OK to Leave Dishes in the Dishwasher Overnight?',
  meta_description = 'Dirty dishes: fine occasionally if scraped, run by morning. Clean dishes: fine for days if dried. What happens in a humid kitchen and how to stop the smell.',
  word_count = 1085,
  reading_minutes = 5,
  modified_at = '2026-09-14T12:00:00+08:00',
  body_md = 'There are two different questions hiding in this one. Can dirty dishes sit in the dishwasher overnight before you run it? And can clean dishes stay inside overnight, or for days, after the cycle ends? The answers are different, and in a warm, humid Malaysian kitchen the details matter more than they would in a cool climate.

![is it ok to leave dishes in the dishwasher overnight](https://cdn.vattimalaysia.com/2026/03/leave-dishes-in-the-dishwasher.webp)

### Quick Answer: Is it OK to leave dishes in the dishwasher overnight?

Dirty dishes: yes, occasionally, if you scrape the plates first and run the machine in the morning. Food will dry on and the tub may smell, but the wash removes both. Clean dishes: yes, as long as they were dried by the cycle. Leave the door ajar, or use a machine with a ventilated drying stage, and they stay fresh for days.

[Enquire With Us](https://wa.me/60123366082)

## Leaving dirty dishes overnight

When plates with food on them sit in a closed dishwasher for eight to ten hours, three things happen:

- **Food dries on.** Rice, egg and sauce harden, which makes the wash work harder and can leave residue on a light programme.

- **Bacteria grow.** A closed, damp tub at 30°C is close to ideal for them. They are killed by the wash, but the smell they leave can survive it.

- **Odour builds.** Standing food scraps in a warm box smell by morning, and the smell soaks into the filter.

None of that is dangerous. The dishwasher washes at temperatures that hands cannot stand, and a hot programme sanitises what the detergent leaves. It is a question of results and smell, not safety.

| Issue | Cause | Effect |
| --- | --- | --- |
| Odour | Food scraps standing in warm, damp air | Smelly tub and filter |
| Residue after washing | Food dried hard onto plates | Extra scrubbing, or a second run |
| Bacteria | Moist, warm, closed space | Smell; killed by the wash itself |

**If you must leave them:** scrape scraps into the bin, give heavily soiled plates a quick rinse, and set the delay start so the machine runs during the night rather than in the morning. Most machines offer a delay of up to 24 hours. Better still, run a half load; a modern dishwasher uses less water than washing the same plates by hand.

## Leaving clean dishes in the dishwasher overnight or for a week

Clean dishes are a different case. Once the cycle has washed and dried them, they are as clean as dishes get, and the only thing that can change that is moisture. Two situations:

**The cycle dried them properly.** Leave them. Open the door a few centimetres when the cycle ends so the last steam escapes, and the dishes stay dry and fresh for days. In a machine with a ventilation stage, which draws air through the tub after drying, they stay fresh for a week with the door closed. The [VATTI DWID3](/vatti-dishwasher-dwid3-white/) dries at 105°C and then ventilates the tub for up to 168 hours, which is exactly this case.

**The cycle ended with dishes still wet.** Steam condenses, water pools in the bases of cups, and in a closed tub that water is what breeds smell. Open the door fully and let them air dry, or unload them onto a rack. A machine that regularly finishes wet needs its rinse aid topped up or its drying setting raised.

## Why humidity changes the answer

In Malaysia the kitchen is warm and the air is already wet, so anything left damp stays damp. A dishwasher that in a cool climate could be left closed overnight with no ill effect will smell here by morning if there was food inside. The fixes are the same, they simply matter more: scrape before loading, run the machine at night, and open the door after the cycle.

## Best practices

- Scrape scraps into the bin before loading. Do not pre-rinse everything; modern detergent needs some soil to work on.

- Use the delay start to run overnight and unload in the morning.

- Open the door a crack when the cycle finishes.

- Top up rinse aid so dishes dry rather than sit wet.

- Clean the filter weekly and run a hot maintenance cycle monthly. Our step-by-step guide to [how to clean a dishwasher](/tips-tricks/how-to-clean-dishwashers/) covers both.

- Keep items that should not go in the machine out of it. See [what is not dishwasher safe](/tips-tricks/what-is-not-dishwasher-safe/).

## When to be more careful

Households with an infant, an elderly person or anyone with a weak immune system should not leave dirty dishes standing at all, because the smell that bacteria leave behind is also a sign of how many there were. Run the machine every evening and use the hottest programme. A dishwasher with a UVC stage, which sterilises after the wash and the dry, adds a third barrier that heat alone does not give.

## Dishes in the dishwasher FAQs

**Can I leave the dishwasher running overnight?**
Yes. Dishwashers are built for unattended operation and the delay start exists for exactly this. Some households prefer to run it while they are home; if so, run it right after dinner.

**Can I leave clean dishes in the dishwasher for a week?**
If the cycle dried them and the door was cracked open, or the machine ventilates the tub, yes. If they were left wet in a closed tub, rewash them.

**Should I open the dishwasher door after the cycle?**
Yes, a few centimetres, once it finishes. It lets steam out and stops condensation settling back on the dishes. A machine with an auto-open or ventilated drying stage does this for you.

**Is it safer to leave dishes in the sink or in the dishwasher?**
The dishwasher. It is enclosed, it is away from flies, and the wash that follows sanitises. A sink of standing water is worse on every count.

**Why does my dishwasher smell in the morning?**
Food scraps in the filter, a tub that was closed while damp, or a drain hose that lets water sit. Clean the filter, run a hot cycle with the machine empty, and leave the door ajar between loads.

## Final thoughts

Leaving dishes in the dishwasher overnight is fine when you do it on purpose: scrape, delay the start, and open the door when it finishes. If your machine finishes wet or smells by morning, that is a drying problem, not a reason to stop using it. The [VATTI dishwashers](/dishwasher-in-malaysia/) wash at 75°C, dry at 105°C, sterilise with UVC and ventilate the tub afterwards, which is how a load stays fresh for seven days without touching it.

[Explore VATTI Dishwasher](/dishwasher-in-malaysia/)
'
WHERE path = 'tips-tricks/dishes-in-the-dishwasher-overnight';

UPDATE article SET
  title = 'Oven Symbol for Baking Cakes: Which Icon to Use',
  h1 = 'Oven Symbol for Baking Cakes: Which Icon to Use',
  meta_description = 'The cake symbol is two horizontal lines, conventional heat, on the middle rack. What the fan, bottom heat, grill and cake icons do to a cake, and when to use each.',
  word_count = 913,
  reading_minutes = 5,
  modified_at = '2026-09-14T12:00:00+08:00',
  body_md = 'The oven symbol for baking a cake is the one with two horizontal lines, one at the top of the square and one at the bottom. It runs both heating elements with no fan, which gives a cake the steady, still heat it needs to rise evenly and set without cracking. This guide shows what that symbol and its alternatives look like, what each does to a cake, and when to choose one over another. For temperatures, times and rack positions, see our companion guide to the [best oven setting for baking cakes](/tips-tricks/baking-cake-oven-setting/).

![oven symbol for baking](https://cdn.vattimalaysia.com/2026/02/oven-symbol-for-baking.webp)

### Quick Answer: Which oven symbol do I use to bake a cake?

Two horizontal lines, called conventional, static or top and bottom heat. Put the cake on the middle rack. Use the fan symbol only for thin layers, cupcakes or several trays at once, and lower the temperature by 10 to 20°C when you do.

[Enquire With Us](https://wa.me/60123366082)

## The symbols you will see, and what they do to a cake

| Symbol | What it looks like | What it does to a cake |
| --- | --- | --- |
| Conventional | Two horizontal lines, top and bottom | Even, gentle heat; the standard for cakes |
| Fan / convection | Fan inside a circle | Faster and drier; good for cupcakes, risky for sponges |
| Bottom heat | One line at the bottom | Cooks the base; use for cheesecake or a pale bottom |
| Top heat | One line at the top | Colours the top only; a finishing setting |
| Grill | Jagged line at the top | Burns the top, leaves the middle raw; never for cakes |
| Cake or bake icon | A cake, or a cupcake | A preset; usually conventional heat at a fixed temperature |

## Conventional: the symbol for most cakes

The two-line symbol heats from both elements and lets the air sit still. Heat reaches the tin from below and above at the same rate, the batter rises evenly, and the crust forms only once the inside has set. This is what recipe writers assume when they say "bake at 180°C" without naming a mode.

Use it for sponges, butter cakes, pound cakes, brownies, loaf cakes and anything in a single tin on the middle rack.

## Fan: when it works and when it does not

The fan symbol circulates hot air, so every shelf bakes at the same temperature. That is ideal for two or three trays of cupcakes, thin sheet cakes and cookies. It is the wrong choice for a tall sponge: the moving air sets the surface before the centre has risen, and the cake domes, cracks or sinks. If a recipe gives a conventional temperature and you use the fan, lower it by 10 to 20°C.

## Bottom heat: cheesecakes and pale bases

The single bottom line heats from below only. It is the setting for a cheesecake that must not colour on top, and for the last few minutes of a cake whose base is still soft when the top is done.

## The cake preset

Some ovens carry a cake or cupcake icon. It is a shortcut that selects conventional heat at a preset temperature, sometimes with a lower fan speed. It works well for standard recipes; for anything unusual, choose the mode and temperature yourself.

## Symbols to avoid for cakes

- **Grill.** The element above runs at full power. The top burns while the middle stays raw.

- **Fan grill.** Same problem, a little slower.

- **Top heat alone.** Colours the surface without cooking through. Use it for a minute at the end if the top is pale, never for the whole bake.

- **Fan with bottom heat, the pizza symbol.** Built to crisp a base; on a cake it dries the bottom out.

## How to use the symbol correctly

- Choose the mode before the temperature.

- Preheat for 10 to 15 minutes, and a few minutes beyond the beep. Our guide to [how long to preheat an oven](/tips-tricks/how-long-to-preheat-oven/) explains why.

- Place the tin on the middle rack, centred.

- Keep the door shut for at least two thirds of the baking time.

- Adjust temperature if you switch to the fan.

For a complete map of every icon on the dial, see [oven symbols and meanings](/tips-tricks/oven-symbols-and-meanings/).

## Oven symbol for baking FAQs

**Can I use fan mode instead of conventional for a cake?**
For cupcakes, thin layers and multiple trays, yes, at 10 to 20°C lower. For a tall sponge or a rich butter cake, no.

**What if my oven has a cake symbol?**
Use it for ordinary recipes. It is conventional heat at a preset, so it will suit most cakes. Check the manual for the temperature it uses.

**Why does my cake burn on top but stay raw inside?**
Almost always the grill or top-heat symbol, or a tin placed too high. Switch to conventional and use the middle rack.

**Is the bake symbol the same as the conventional symbol?**
On most ovens, yes. "Bake" in the manual means top and bottom heat with no fan.

**Which symbol for a cheesecake?**
Bottom heat or conventional at a low temperature, around 150°C, on the lower-middle rack, often with a tray of water beneath.

## Final thoughts

Two lines, middle rack, door closed: that is the oven symbol for baking a cake. Everything else on the dial is a special case. If you want an oven that takes the mode and the temperature out of your hands, the [VATTI combi ovens](/combi-and-steam-oven-in-malaysia/) carry eight baking modes, steam for bread and proving, and 68 auto menus that set both for you.

[Explore VATTI Built-in Oven](/combi-and-steam-oven-in-malaysia/)
'
WHERE path = 'tips-tricks/oven-symbol-for-baking';

UPDATE article SET
  title = 'Best Oven Setting for Baking Cakes: Mode, Temperature and Rack',
  h1 = 'Best Oven Setting for Baking Cakes: Mode, Temperature and Rack',
  meta_description = 'Conventional mode at 160 to 180°C on the middle rack. Settings by cake type, top or bottom heat, fan adjustments, and what each baking fault means.',
  word_count = 932,
  reading_minutes = 5,
  modified_at = '2026-09-14T12:00:00+08:00',
  body_md = 'If your cake sinks, cracks or bakes unevenly, the problem is usually the oven setting rather than the recipe. Cakes need steady, moderate heat from above and below, a tin in the middle of the oven, and a door that stays shut. This guide gives the exact settings: which mode, what temperature, how long, and which rack, for every common kind of cake. If you are not sure which icon on your dial is which, read our guide to the [oven symbol for baking cakes](/tips-tricks/oven-symbol-for-baking/) first.

![baking cake oven setting](https://cdn.vattimalaysia.com/2026/02/baking-cake-oven-setting.webp)

### Quick Answer: What is the best oven setting for baking a cake?

Conventional mode, which is top and bottom heat with no fan, at 160 to 180°C, on the middle rack. Sponges at the lower end, butter cakes at the upper end, cheesecakes at 150°C on bottom heat. If you use the fan, take 10 to 20°C off the temperature.

[Enquire With Us](https://wa.me/60123366082)

## Settings by cake type

| Cake | Mode | Temperature | Time | Rack |
| --- | --- | --- | --- | --- |
| Sponge or chiffon | Conventional | 160 to 170°C | 25 to 35 min | Middle |
| Butter or pound cake | Conventional | 170 to 180°C | 45 to 60 min | Middle |
| Cupcakes and muffins | Conventional or fan | 170°C (fan 160°C) | 18 to 22 min | Middle |
| Brownies | Conventional | 170°C | 25 to 30 min | Middle |
| Cheesecake | Bottom heat or conventional | 150°C | 50 to 70 min | Lower middle |
| Fruit cake | Conventional | 150°C | 2 to 3 hours | Middle |
| Sheet cake, thin layers | Fan | 160°C | 15 to 20 min | Middle |

Times are for a standard 20 to 23 cm tin and are a range, not a promise. Test with a skewer in the centre: it should come out clean or with a few dry crumbs.

## Top or bottom heat for baking cakes?

Both. Conventional mode runs the top and bottom elements together, which is what gives a cake even heat from all sides. Bottom heat alone leaves the top pale and underdone; top heat alone browns the surface and leaves the centre raw. The only cake that suits bottom heat on its own is a cheesecake, which must not colour on top.

## Fan or conventional?

Conventional for anything tall or delicate. The still air lets the cake rise fully before the crust sets. Fan for cupcakes, thin layers and several trays at once, where even heat across the shelves matters more than a gentle rise. When you use the fan, lower the temperature by 10 to 20°C and check five minutes early.

## Rack position

The middle rack is the safe place for almost every cake. Heat rises, so the top of the oven runs hotter than the bottom: a tin on the top rack browns before it cooks through, and a tin on the bottom rack overcooks its base. Cheesecakes go one notch lower than the middle, and for two tins at once use the fan and place them side by side rather than one above the other.

## Preheating

Preheat for 10 to 15 minutes at the recipe temperature, and give it a few minutes beyond the beep. A cake that goes into an oven still warming up spreads before it rises and comes out dense. Our guide to [how long to preheat an oven](/tips-tricks/how-long-to-preheat-oven/) covers the timing by temperature.

## What each fault means

| What you see | What went wrong | Fix |
| --- | --- | --- |
| Cracked, domed top | Too hot, or fan on a sponge | Lower by 10 to 20°C, use conventional |
| Sunken middle | Underbaked, or door opened early | Bake longer, keep the door shut until two thirds through |
| Burnt top, raw centre | Grill or top heat, or tin too high | Conventional, middle rack |
| Dry, crumbly | Too long or too hot, or fan without lowering the temperature | Check earlier, reduce heat |
| Pale, soft base | Tin too high, or oven not preheated | Middle rack, full preheat |
| Uneven rise | Tin not centred, or oven runs hot on one side | Centre the tin, rotate once at two thirds |

## Warm-kitchen adjustments for Malaysia

A kitchen at 30°C softens butter and speeds fermentation, so batters are looser and rise faster than the recipe expects. Chill a butter cake batter for ten minutes before it goes in, and check sponges five minutes early. An oven thermometer is worth having: many ovens run 10 to 20°C off the dial, and in baking that gap is the difference between a level top and a cracked one.

## Oven setting FAQs

**What temperature should a cake be baked at?**
160 to 180°C for most cakes in a conventional oven. Lighter sponges at the lower end, dense butter cakes at the upper end, cheesecakes and fruit cakes at 150°C.

**How long does a cake take to bake?**
Twenty-five to thirty-five minutes for a sponge, forty-five to sixty for a butter cake in a 20 cm tin. Test with a skewer rather than the clock.

**Should I bake a cake with the fan on or off?**
Off for a single tall cake. On, at a lower temperature, for cupcakes and multiple trays.

**Which rack is best for baking a cake?**
The middle rack, with the tin centred.

**Can I open the oven to check the cake?**
Not before two thirds of the time has passed. The drop in temperature stalls the rise and the centre sinks.

## Final thoughts

Conventional mode, 160 to 180°C, middle rack, door shut: those four settings fix most cake failures. If your oven cannot hold a steady temperature, no setting will save the cake, which is the argument for a better oven. The [VATTI combi ovens](/combi-and-steam-oven-in-malaysia/) hold their set temperature precisely, run eight baking modes plus steam for bread, and carry 68 auto menus that choose the mode and the time for you.

[Explore VATTI Built-in Oven](/combi-and-steam-oven-in-malaysia/)
'
WHERE path = 'tips-tricks/baking-cake-oven-setting';

-- ── merge: induction versus ceramic ───────────────────────────────────────
UPDATE article SET is_published = 0 WHERE path IN ('buying-guide/induction-vs-ceramic-features', 'buying-guide/induction-vs-ceramic-safety', 'uncategorized/induction-vs-ceramic-guide');
INSERT INTO redirect (from_path, to_path, code) VALUES ('/buying-guide/induction-vs-ceramic-features/', '/buying-guide/which-is-better-induction-or-ceramic-cooker/', 301);
INSERT INTO redirect (from_path, to_path, code) VALUES ('/buying-guide/induction-vs-ceramic-safety/', '/buying-guide/which-is-better-induction-or-ceramic-cooker/', 301);
INSERT INTO redirect (from_path, to_path, code) VALUES ('/uncategorized/induction-vs-ceramic-guide/', '/buying-guide/which-is-better-induction-or-ceramic-cooker/', 301);

-- ── the other pasted heading ───────────────────────────────────────────────
-- how-to-clean-dishwashers opened with the cake article's Quick Answer heading
-- over a dishwasher answer. Same defect as how-long-to-preheat-oven, fixed
-- above in its rewrite.
UPDATE article SET body_md = replace(body_md,
  '### Quick Answer: Best Oven Setting for Baking Cakes',
  '### Quick Answer: How do you clean a dishwasher?')
WHERE path = 'tips-tricks/how-to-clean-dishwashers';
