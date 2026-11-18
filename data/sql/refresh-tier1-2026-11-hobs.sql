-- Tier 1 refresh, hob and stove-top articles (content schedule, 2026-11-05).
--
-- Six English articles that already sit on page one (or close) but convert few
-- impressions into clicks. Each keeps its URL, topic, target terms and its
-- substantive sections; the changes are a search-led title, a "Quick answer"
-- panel of term bullets under the intro (the shape featured snippets and AI
-- Overviews lift), a tightened FAQ, VATTI product panels where a model is
-- genuinely relevant, and removal of copy that breaks standing rules: price and
-- running-cost arguments (2026-10-03) and unverifiable VATTI claims. Every VATTI
-- figure below is product_facet, product_spec or product_dimension (product
-- section). Baselines are Search Console, 5 Aug to 3 Nov 2026:
-- clicks / impressions / CTR / average position.
--
-- 1. buying-guide/is-an-infrared-gas-stove-worth-it (id 25)
--    121 / 7,965 / 1.52% / 5.5. Title now leads with the head term `infrared
--    gas stove` (2,341 impressions, position 8.5) and promises the pros, cons
--    and verdict that `disadvantages` and `pros and cons` searchers want. Price
--    bullet, cost table row and the "a cylinder or two" saving dropped; the
--    unsourced 10 to 20 percent efficiency figure dropped; gas section kept as
--    a heat-transfer explanation. M822G panel (3.8 kW plate, 4.5 kW burner).
-- 2. buying-guide/ceramic-cooker-vs-infrared-cooker-what-is-the-difference (id 24)
--    48 / 2,755 / 1.74% / 5.5. Title promises the difference explained.
--    Running-cost section and price table row removed; quick answer rebuilt as
--    term bullets. Panels: ER3601T, ER5902T, VH-IC9-LA.
-- 3. buying-guide/is-infrared-gas-stove-good (id 23)
--    26 / 2,167 / 1.20% / 4.8. Keeps `infrared burner vs gas burner` at the
--    front and adds the wok answer. Cost section, cost row and the "tight
--    budget" verdict removed; gas-use section reworded without percentages.
--    The M822G "partitioned so one can steam" claim is not in its specs and is
--    gone. M822G panel.
-- 4. buying-guide/which-is-better-induction-or-ceramic-cooker (id 20)
--    25 / 3,719 / 0.67% / 22.1. Title moves to `induction vs ceramic hob`
--    (`ceramic hob vs induction` 16.3, `ceramic cooker vs induction cooker`
--    10.7). Cost section, price row, electricity-bill and purchase-price lines
--    removed. VH-IC9-LA figures corrected to 2,000 W / 2,300 W boost and
--    1,000 to 2,200 W. Panels: VH-IC9-LA, ER3601T, ER5902T.
-- 5. tips-tricks/how-to-remove-rust-from-electric-stove-step-by-step-guide (id 34)
--    30 / 2,563 / 1.17% / 6.6. The 2024 original had broken nested steps,
--    filler and no safety step. Rebuilt around where the rust is (coil, drip
--    pan, enamel top, glass top), with the same five methods as numbered
--    steps, a prevention list and FAQs for `rust on stove` and `stove plates`.
--    Panels: ER3601T, ER5902T (sealed ceramic glass, no drip pans).
-- 6. tips-tricks/how-to-remove-scratches-on-stove-top (id 36)
--    26 / 1,662 / 1.56% / 7.1. Title leads with the task; the repair-kit
--    section is expanded for `black glass stove top scratch repair (kit)`.
--    The vague "nano coating on the flagship models" line is replaced by the
--    C836G, whose spec states nano coating tempered glass. Panels: C836G,
--    ER3601T.
--
-- English only; every UPDATE is scoped to en-MY per CLAUDE.md.

-- 1 ------------------------------------------------------------------------
UPDATE article SET
  title = 'Infrared Gas Stove: Pros, Cons and Is It Worth It?',
  h1 = 'Is an Infrared Gas Stove Worth It? Pros, Cons and Who Should Buy One',
  meta_description = 'Yes, if you cook with a wok most days: it heats fast, stays lit in a breeze and puts more heat in the pan. The disadvantages, safety and who it suits.',
  word_count = 1620,
  reading_minutes = 9,
  modified_at = '2026-11-05T22:00:00+08:00',
  body_md = 'An infrared gas stove burns its gas through a plate drilled with thousands of tiny holes instead of through a ring of open flames. The plate heats until it glows red, and it is the glowing plate, not a visible flame, that cooks the pan. In Malaysia this type has spread fast because it suits the way we cook: a wok over a plate that radiates evenly, and a burner that does not gutter in a breeze from the window. This guide covers how it works, the pros and cons, safety, and who should buy one.

### Quick answer

- **Worth it:** Yes, for a kitchen that cooks every day and uses the wok, because the plate gets hot fast, heats the whole pan base and stays lit in wind.
- **Main disadvantages:** The plate must be kept clear of boil-overs, it holds heat for a minute or two after switching off, and it cannot drop to as gentle a simmer as an open flame.
- **Safety:** As safe as any gas hob with a flame failure safety device, provided you treat the plate as hot until it has stopped glowing.
- **Electricity:** Only for ignition; the gas does the cooking, so it works in a power cut.
- **Best setup:** A hob with one infrared plate for the wok and one open-flame burner for soups and slow simmering.

[Ask us which hob suits your kitchen](https://wa.me/60123366082)

![infrared gas stove](https://cdn.vattimalaysia.com/2026/08/m822g-microflame.webp)

## What an infrared gas stove is

Every gas burner mixes gas with air and burns it. An open-flame burner, the kind most kitchens have, releases the mixture through a ring of ports and burns it as a crown of blue flames that lick the base of the pan. Heat reaches the pan by the hot gases touching it, and a good share escapes up the sides.

An infrared burner sends the same mixture through a ceramic or metal plate carrying thousands of small ports. The gas burns just above the surface of the plate, so the plate itself heats until it glows red. At that temperature a solid surface radiates heat the way an electric grill element does, which is the "infrared" in the name. The pan is heated by that radiation as well as by the hot gases, so more of the heat arrives where it is wanted.

Our guide to [how an infrared gas burner works](/buying-guide/infrared-gas-burner/) goes into the plate, the air supply and the flame colour in detail.

## Infrared gas stove pros

- **More heat into the pan:** The radiant plate transfers heat more directly, so less of it is lost up the sides of the wok.
- **High heat, quickly:** The plate reaches full glow within seconds and a wok over it gets to searing temperature fast.
- **Even heat across the pan:** A ring of flames heats a ring on the pan. A plate heats the whole base, which matters for a flat pan and for a wok that is being tossed.
- **Wind does not put it out:** The flame sits in the ports of the plate rather than standing free in the air, so a breeze from an open window or a ceiling fan does not blow it sideways or out. This is the most noticed difference in a Malaysian kitchen.
- **Less soot on the pan:** With more complete combustion at the plate, pots stay cleaner underneath.
- **Quieter:** The roar of a large open burner on full is mostly absent.

## Infrared gas stove disadvantages

- **The plate needs keeping clear:** A boil-over that lands on a red-hot plate bakes into the ports. A blocked plate burns unevenly and shows yellow flame. It cleans easily if you do it once the plate is cool, and badly if you leave it.
- **Thermal shock:** A ceramic plate can crack if cold water hits it while it is glowing. Wipe spills once it has cooled, not while it is red.
- **It holds heat:** Turn an open flame off and the heat is gone. Turn an infrared plate off and it goes on radiating for a minute or two, which takes some getting used to for a sauce that must stop cooking now.
- **Slower to turn down:** Open flames drop to a simmer instantly. A plate cools more slowly, so very low simmering is easier on an open-flame burner.
- **Replacement parts:** A cracked plate, or a clogged one that will not clean, is a part to order rather than a burner cap to rinse. Buy from a brand with a service network.

## Infrared vs a normal gas stove

| | Infrared burner | Open-flame burner |
| --- | --- | --- |
| How it heats | Red-hot perforated plate, radiant heat | Ring of blue flames, hot gas |
| Share of heat reaching the pan | More | Less, some escapes up the sides |
| Time to searing heat | Seconds | Longer |
| Heat across the pan base | Even | Ring-shaped |
| Behaviour in a breeze | Stays lit | Flutters, can go out |
| Response when turned down | Slower, plate holds heat | Instant |
| Spills | Bake into the plate | Sit on the burner cap, rinse off |
| Cleaning | Brush the plate, keep the ports clear | Lift and wash the cap and ring |

For a burner-by-burner comparison of what each is like to cook on, see [infrared burner vs gas burner](/buying-guide/is-infrared-gas-stove-good/).

## Is an infrared gas stove safe?

As safe as any gas hob, with two habits to learn. There is no open crown of flame, so sleeves and tea towels are less likely to catch, and the flame is not easily blown out by a draught. On the other hand the plate stays hot after the gas is off, so treat it as you would an electric element and keep hands and cloths away until it has darkened.

Buy a hob with a flame failure safety device, which closes the gas valve if the burner goes out, and a child lock if there are children at home.

## Does an infrared gas stove use electricity?

No. The gas does the heating. The only electricity is for ignition, which on most hobs is a battery in a box under the top or, on some, a plug. An infrared gas stove works in a power cut.

## Does an infrared gas stove use less gas?

It puts more of the heat from the same gas into the pan, for the reason above. How much difference you notice depends on what you cook. Stir-frying at full heat, where an open burner throws a lot of heat up the sides of the wok, shows the biggest gap. Long simmering at low heat shows the least, because both burner types are already near their minimum.

## Who should buy one

- **You cook with a wok most days:** The high, even, wind-proof heat is what the burner was designed for.
- **Your kitchen is open or breezy:** A yard kitchen, a window over the hob, or a fan nearby all favour a plate that is not blown out.
- **You want a quieter hob:** The plate is much quieter than a large open burner on full.

Stay with open flame, or take a hob that has both, if most of your cooking is slow simmering or you often boil over.

The hob that settles this for most Malaysian kitchens is the two-sided one: one infrared plate for the wok and one open burner for the pot of soup. The VATTI [Olympic Hob M822G](/vatti-oylimpic-hob-m822g/) is built that way: a 3.8 kW plate burner on the left that reaches up to 1,000°C, and a 4.5 kW brass burner on the right, on black tempered glass with a cast iron stand, a safety device and a child lock control knob.

[![VATTI M822G gas hob](https://cdn.vattimalaysia.com/2026/08/vatti-oylimpic-hob-m822g-front.webp)](/vatti-oylimpic-hob-m822g/)

## Infrared gas stove FAQs

**What is the disadvantage of an infrared gas stove?**
The plate. It must be kept clear of spills, it can crack if cold water hits it while hot, and it holds heat for a minute or two after switching off. It also simmers less gently than an open flame.

**Is an infrared gas stove more efficient?**
Yes, in the sense that more of the gas''s heat reaches the pan. The glowing plate heats the pan by radiation as well as hot gas, so less heat escapes up the sides, especially at high heat.

**Is an infrared gas stove better than a normal gas stove?**
For high-heat wok cooking and for breezy kitchens, yes. For gentle simmering and easy cleaning after spills, the open burner is better. Many hobs give you one of each.

**Which pans work on an infrared burner?**
Any pan that works on gas: a wok, cast iron, stainless steel, aluminium and clay pots. Flat-based pans make the most of the radiant heat, and a round wok on a stand works as it always has.

**Why is the flame on my infrared burner yellow?**
Usually blocked ports. Let the plate cool, brush it clean and dry it, and it burns blue and even again. The [infrared burner guide](/buying-guide/infrared-gas-burner/) gives the method.

## Final thoughts

An infrared gas stove is worth it if you cook the way most Malaysian kitchens do: hard, hot and often. It gets the wok hot fast, heats the whole base and does not go out when the window is open. Keep the plate clean and give it a minute to cool, and it will outlast the pans on it. The [VATTI cooker hob range](/cooker-hob-in-malaysia/) lists the burners of every model side by side.

[Explore VATTI cooker hob](/cooker-hob-in-malaysia/)'
WHERE path = 'buying-guide/is-an-infrared-gas-stove-worth-it' AND lang = 'en-MY';

-- 2 ------------------------------------------------------------------------
UPDATE article SET
  title = 'Ceramic Cooker vs Infrared Cooker: The Difference Explained',
  h1 = 'Ceramic Cooker vs Infrared Cooker: What Is the Difference?',
  meta_description = 'Both heat a pan through glass with an electric element. An infrared cooker uses a hotter element that heats faster; a ceramic cooker uses a radiant coil.',
  word_count = 1200,
  reading_minutes = 7,
  modified_at = '2026-11-05T22:00:00+08:00',
  body_md = '"Infrared cooker" means two different things in Malaysia, and the confusion sends a lot of people to the wrong page. One is the electric infrared cooker: a glass-topped hob or portable cooktop with a heating element under the glass that glows red. The other is the infrared gas stove, a gas burner that glows red through a perforated plate. This guide is about the electric kind, compared with its closest relative, the ceramic cooker. If you came for the gas kind, read our guide to [infrared gas stoves](/buying-guide/is-an-infrared-gas-stove-worth-it/).

### Quick answer

- **What they share:** Both heat a pan through a glass-ceramic top with an electric element underneath, and both take any flat-based pan.
- **Ceramic cooker:** Uses a radiant coil under the glass that heats steadily and is found mostly on built-in hobs.
- **Infrared cooker:** Uses a halogen lamp or a hotter radiant element that glows almost instantly, so it heats and responds a little faster.
- **Which to choose:** Infrared for the quicker response, ceramic for a simple built-in hob; the bigger decision is either of them against induction.

[Ask us which electric hob suits your kitchen](https://wa.me/60123366082)

![ceramic cooker vs infrared cooker](https://cdn.vattimalaysia.com/2024/08/Top-front-View-On.webp)

## How a ceramic cooker works

Under the glass sits a coiled resistance element, a ribbon of metal that glows red when current runs through it. The element heats the glass above it, and the glass heats the pan. The zone marked on the glass shows where the element is. Heating is steady and the glass stays hot for a while after switching off, which is why ceramic hobs carry a residual heat indicator.

The VATTI [ER3601T](/ceramic-cooker-hob-er3601t/) is a three-zone ceramic hob of this kind, with single zones of 1,200 W and 1,800 W and a dual zone that steps from 1,000 W to 2,200 W for a larger pan. The five-zone [ER5902T](/ceramic-cooker-hob-er5902t/) adds a second dual zone of 700 W / 1,700 W, on a 900 mm wide top.

[![VATTI ER3601T ceramic hob](https://cdn.vattimalaysia.com/2024/08/Top-front-View-On.webp)](/ceramic-cooker-hob-er3601t/)
[![VATTI ER5902T ceramic hob](https://cdn.vattimalaysia.com/2024/08/Ceramic-cooker-Hob-ER5902T.webp)](/ceramic-cooker-hob-er5902t/)

## How an electric infrared cooker works

The element is designed to run hotter and radiate more. In a halogen cooker it is a quartz-halogen lamp that reaches full glow almost instantly; in others it is a high-temperature radiant element. Because more of the heat arrives as radiation through the glass rather than conduction, the pan warms faster and the cooker responds more quickly to the control. Portable single-zone "infrared cookers" sold in Malaysia are usually this type, and they are popular because, unlike induction, they take any pot.

## Ceramic vs infrared at a glance

| | Ceramic cooker | Electric infrared cooker |
| --- | --- | --- |
| Heat source | Radiant coil under glass | Halogen lamp or high-temperature element under glass |
| Time to heat | Moderate | Fast, glows almost instantly |
| Response to the control | Slow, with lag | Quicker, still some lag |
| Cookware | Any flat-based pan | Any flat-based pan |
| Surface after cooking | Stays hot for a while | Stays hot for a while |
| Energy efficiency | Moderate | Slightly better |
| Where sold | Built-in hobs | Portable cooktops and some built-ins |

## Speed and control

The infrared cooker is quicker to heat and quicker to react, because its element runs hotter and radiates rather than conducts. Neither is instant: both heat glass, and glass takes time to warm and time to cool. Anyone used to gas will notice the lag on both; anyone used to a plain electric plate will find both a clear improvement.

## Cookware

This is where both beat induction. A ceramic or infrared cooker heats any flat-based pan: aluminium, copper, glass, clay, stainless of any kind. There is no magnet test. A round-bottomed wok does not sit well on either, so wok cooks should look at gas.

## Cleaning

Both are a flat sheet of glass and wipe clean. The catch on both is that sugar or sauce landing on hot glass bakes on within seconds, so spills are best wiped once the glass has cooled, with a cooktop cream rather than a scourer. See our guides to [white spots on a glass stove top](/tips-tricks/how-to-clean-white-spots-on-glass-stove-tops/) and [scratches on a glass stove top](/tips-tricks/how-to-remove-scratches-on-stove-top/).

## Safety

Both stay hot after switching off and both should show a residual heat warning until the glass cools. Look for a child lock and an overheat cut-off too; the VATTI ceramic hobs carry all three. Neither has an open flame or produces combustion gases, which is a point in their favour in a small or poorly ventilated kitchen.

## Energy efficiency

An infrared element loses a little less heat than a coil, so slightly more of its energy reaches the pan. Both lose more to the glass and the air than induction, which heats the pan directly. Our full comparison of [induction versus ceramic](/buying-guide/which-is-better-induction-or-ceramic-cooker/) covers that side.

## Which should you buy?

- **Ceramic:** If you want a built-in electric hob and want to keep your existing pans. The ER3601T and ER5902T are this.
- **Electric infrared:** If you want the faster response of the two and are looking at a portable cooktop, or a built-in that offers it.
- **Induction:** If speed, efficiency and a cooler surface matter more than cookware freedom.
- **Gas:** If the wok is the centre of your kitchen. See [infrared burner vs gas burner](/buying-guide/is-infrared-gas-stove-good/) for that decision.

If you cannot decide between the electric types, the VATTI [VH-IC9-LA](/vatti-cooker-hob-vh-ic9-la/) puts an induction zone of 2,000 W (2,300 W on boost) beside a ceramic zone of 1,000 to 2,200 W on one 750 mm glass top, so the ceramic side still takes any flat pan.

[![VATTI VH-IC9-LA induction and ceramic hob](https://cdn.vattimalaysia.com/2026/08/vatti-cooker-hob-vh-ic09al-front.webp)](/vatti-cooker-hob-vh-ic9-la/)

## Ceramic vs infrared cooker FAQs

**Is an infrared cooker the same as a ceramic cooker?**
Nearly. Both heat through glass-ceramic; the infrared version uses a hotter, faster element. Some sellers use the two names interchangeably.

**Is an infrared cooker the same as an induction cooker?**
No. Induction heats the pan with a magnetic field and needs a magnetic pan. An infrared cooker heats the glass with an element and takes any pan.

**Is an infrared cooker energy efficient?**
More than a plain electric plate and slightly more than a ceramic coil, but less than induction.

**Can I use a wok on a ceramic or infrared cooker?**
A flat-bottomed wok, yes. A round-bottomed wok will not make good contact with the glass, so it is better on gas.

**Which is safer, ceramic or infrared?**
They are alike. Both stay hot after use, both should show a residual heat warning, and neither has a flame.

## Final thoughts

Ceramic and electric infrared cookers are two versions of one idea, a glowing element under glass, and the infrared version is the quicker of the two. Choose either over induction only if cookware freedom matters more than speed and efficiency. The [VATTI cooker hob range](/cooker-hob-in-malaysia/) lists ceramic, induction and gas hobs side by side, with the zones and burners of each model.

[Explore VATTI cooker hob](/cooker-hob-in-malaysia/)'
WHERE path = 'buying-guide/ceramic-cooker-vs-infrared-cooker-what-is-the-difference' AND lang = 'en-MY';

-- 3 ------------------------------------------------------------------------
UPDATE article SET
  title = 'Infrared Burner vs Gas Burner: Which Is Better for a Wok?',
  h1 = 'Infrared Burner vs Gas Burner: Which Cooks Better?',
  meta_description = 'Infrared for the wok and high heat, open flame for simmering and soups. Both burners compared on heat, speed, wind, pans, cleaning and safety.',
  word_count = 1350,
  reading_minutes = 7,
  modified_at = '2026-11-05T22:00:00+08:00',
  body_md = 'Most hobs sold in Malaysia now come with a choice of burner under the pan support: a plate that glows red, or a ring of blue flames. They burn the same gas from the same cylinder, and they cook very differently. This guide sets the two side by side, one job at a time, so you know which burner to put the wok on, which to put the soup on, and which to look for when you buy. For the wider question of whether an infrared hob is worth buying at all, see [is an infrared gas stove worth it](/buying-guide/is-an-infrared-gas-stove-worth-it/).

### Quick answer

- **Wok and stir-fry:** The infrared burner, because its glowing plate heats the whole pan base fast and does not blow out when the wok moves.
- **Soups, stews and rice:** The open-flame gas burner, because it turns down to a gentle simmer instantly.
- **Breezy or open kitchen:** Infrared, since the flame sits in the plate and a draught does not put it out.
- **Easy cleaning after spills:** Open flame, because the cap and ring lift off and rinse.
- **Best of both:** A two-burner hob with one infrared plate and one open-flame burner.

[Ask us which hob suits your cooking](https://wa.me/60123366082)

![infrared burner vs gas burner](https://cdn.vattimalaysia.com/2026/08/m822g-plate.webp)

## How each burner makes heat

An **open-flame burner** pushes a gas and air mix out through a ring of ports in a brass or aluminium cap. It burns as a crown of blue flames that touch the base of the pan. The pan is heated by the hot gases flowing over it, and whatever misses the pan goes up its sides and into the kitchen.

An **infrared burner** pushes the same mix through a plate of several thousand tiny ports. The gas burns just above the plate, the plate heats to a red glow, and the pan is heated both by the hot gases and by the radiation from the glowing surface. Our guide to [how an infrared gas burner works](/buying-guide/infrared-gas-burner/) covers the plate and the air supply in detail.

That one difference decides everything below.

## Infrared burner vs gas burner at a glance

| | Infrared burner | Open-flame burner |
| --- | --- | --- |
| Heat reaching the pan | Radiant plus convective, more of it | Convective, less of it |
| Heat pattern | The whole base | A ring |
| Time to full heat | Seconds | Longer |
| Wind | Unaffected | Flutters or goes out |
| Turning down | Slow, the plate stays hot | Instant |
| Lowest simmer | Fair | Excellent |
| Boil-overs | Bake into the plate | Rinse off the cap |
| Noise on full | Quiet | A roar on a big burner |
| Soot under the pan | Little | Some |

## Heat and speed

The infrared plate wins. It reaches its glow in seconds and delivers more of the gas''s heat to the pan, so a wok gets to smoking point faster and stays there through a stir-fry. On the VATTI [Olympic Hob M822G](/vatti-oylimpic-hob-m822g/), the left-hand plate burner is rated 3.8 kW and reaches up to 1,000°C.

The open burner is not slow. The main burners on VATTI gas hobs run from 4.5 to 6.0 kW and a large ring boils a pot quickly, but more of its heat goes up the sides of the pan.

## Wok cooking

Infrared, without much argument. Wok hei needs sustained high heat across the base while the food is tossed, and the plate gives even heat rather than a hot ring with a cooler centre. It also does not blow out when the wok is lifted and the air moves. Cooks who have used both usually put the wok on the plate and leave it there. Our guide to the [right wok setup](/tips-tricks/wok-cooking-right-wok-setup/) covers the pan and the stand.

## Simmering and soups

Open flame. A ring of small flames can be turned down to a flicker and responds the moment the knob moves, which is what a pot of soup, a curry left to reduce, or rice in a clay pot wants. An infrared plate simmers well enough, but it holds heat after being turned down and its lowest setting is not as low.

## Pans

Both burners take any pan that works on gas: wok, cast iron, stainless, aluminium, clay and enamel. The plate makes the most of a flat base, because the whole base receives radiant heat. A round-bottomed wok on a wok stand works on either. Glass and ceramic cookware are fine on both, with the usual care about sudden temperature changes.

## Cleaning

Open flame is easier after a spill: lift the cap and ring, wash, dry, replace. Our guide to [cleaning stove grates](/tips-tricks/how-to-clean-stove-grates-a-step-by-step-guide/) covers the supports.

The infrared plate needs a different habit. Nothing should be poured on it while it glows, because a ceramic plate can crack, and a boil-over left on it bakes into the ports. Once cool, a soft brush clears the surface and the ports, and a plate kept this way lasts years.

## Safety

Both hobs should have a flame failure safety device that closes the gas if the burner goes out. Beyond that, each has one thing to watch. The open burner has a standing crown of flame that can catch a sleeve or a cloth. The infrared plate has no such flame but stays hot for a minute or two after switching off, like an electric element. Neither uses mains electricity to cook; ignition is a battery or a plug.

## Gas use

The infrared burner puts more of the same gas''s heat into the pan, and the gap is widest at high heat, where an open flame loses the most up the sides of a wok. For long low simmering the two are close.

## So which is good for you?

- **Mostly stir-frying and searing:** Infrared.
- **Mostly soups, stews and rice:** Open flame.
- **Both, every day:** A hob with one of each. Put the wok on the plate and the pot on the flame.
- **Kitchen open to the air:** Infrared, because it will not blow out.
- **Frequent boil-overs:** Open flame, because it rinses clean.

The M822G is the VATTI hob that does not make you choose: the 3.8 kW infrared plate on the left and a 4.5 kW brass open burner on the right, on black tempered glass with a cast iron stand and battery ignition.

[![VATTI M822G gas hob](https://cdn.vattimalaysia.com/2026/08/vatti-oylimpic-hob-m822g-front.webp)](/vatti-oylimpic-hob-m822g/)

## Infrared burner FAQs

**Is an infrared burner better than a regular gas burner?**
For heat, speed and cooking in a breeze, yes. For fine control at a simmer and easy cleaning after spills, no. They suit different jobs, which is why many hobs carry one of each.

**Can I use a wok on an infrared burner?**
Yes, and it is the burner''s best use. Use a wok stand for a round-bottomed wok, as on any hob.

**Why does my infrared burner have a yellow flame?**
Ports blocked by a spill, or a wet plate. Let it cool, brush it clean, dry it, and the flame returns to blue.

**Does an infrared burner get hotter than a gas burner?**
At the plate surface, yes; the M822G plate reaches up to 1,000°C. At the pan, the practical difference is that more of the infrared burner''s heat arrives there instead of escaping up the sides.

**Does an infrared gas stove use electricity?**
Only for ignition, from a battery or a plug depending on the hob. The cooking heat comes from the gas, so it works in a power cut.

## Final thoughts

An infrared burner is good at the things a wok needs and an open burner is good at the things a pot needs. Buy for how you cook, or buy a hob that does not make you choose. The [VATTI cooker hob range](/cooker-hob-in-malaysia/) lists each model''s burners and power so you can compare them side by side.

[Explore VATTI cooker hob](/cooker-hob-in-malaysia/)'
WHERE path = 'buying-guide/is-infrared-gas-stove-good' AND lang = 'en-MY';

-- 4 ------------------------------------------------------------------------
UPDATE article SET
  title = 'Induction vs Ceramic Hob: Which Cooker Is Better?',
  h1 = 'Induction or Ceramic Cooker: Which Is Better?',
  meta_description = 'Induction is faster, more efficient and cooler to touch. A ceramic cooker heats any flat pan and is silent. Compared on speed, safety, pans and cleaning.',
  word_count = 1590,
  reading_minutes = 8,
  modified_at = '2026-11-05T22:00:00+08:00',
  body_md = 'Induction and ceramic hobs look almost identical: a flat sheet of black glass with touch controls. Underneath, they could not be more different. An induction hob heats the pan itself with a magnetic field. A ceramic hob heats a coil under the glass and lets the heat travel up into the pan. That one difference decides the speed, the safety, the noise and the cookware you can use. This guide compares the two for a Malaysian kitchen and ends with a plain recommendation.

### Quick answer

- **Better overall:** Induction, for most homes: it boils faster, wastes less energy, responds instantly and keeps the glass cooler.
- **When ceramic wins:** If you want to keep aluminium, copper, glass or clay pots, because a ceramic cooker heats any flat-based pan.
- **Safer:** Induction, because the glass only warms from the pan and most zones switch off when the pan is lifted.
- **Easier to clean:** Induction, because spills land on cooler glass and do not bake on.
- **Both in one:** A hob with one induction zone and one ceramic zone lets you use either kind of pan.

[Ask us which hob suits your kitchen](https://wa.me/60123366082)

![Induction cooker vs ceramic cooker](https://cdn.vattimalaysia.com/2025/12/Induction-Cooker-vs-Ceramic-Cooker-3.webp)

## How each one makes heat

An **induction hob** has a copper coil under the glass. Switch it on and the coil produces a magnetic field. Put a pan with a magnetic base on top and the field induces a current in the base of the pan, and that current heats the metal. The glass itself is not heated; it only picks up warmth from the pan sitting on it.

A **ceramic hob** has a radiant coil, a ribbon element that glows red under the glass. The coil heats the glass, and the glass heats the pan. It works like a traditional electric plate hidden under a smooth surface.

## Induction vs ceramic at a glance

| | Induction | Ceramic |
| --- | --- | --- |
| How it heats | Magnetic field heats the pan directly | Element heats the glass, glass heats the pan |
| Time to boil water | Faster | Slower, the glass heats first |
| Heat reaching the pan | Most of it, the pan itself is heated | Less, some is lost warming the glass |
| Response to a setting change | Instant | Slow, with lag both ways |
| Surface after cooking | Warm, cools in minutes | Hot for 15 to 30 minutes |
| Cookware | Magnetic base only | Any flat-bottomed pan |
| Noise | Faint hum or fan on high power | Silent |
| Safety | Pan detection, no red-hot surface | Residual heat indicator, glass stays hot |

## Speed and energy efficiency

Induction transfers most of its energy straight into the pan, so water boils in roughly half the time a ceramic hob takes and the kitchen stays cooler while it does it. A ceramic hob loses a share of its heat into the glass and the air around it.

## Temperature control and cooking feel

Turn an induction zone down and the pan stops heating at once, which makes it easy to catch a sauce before it splits or bring a rolling boil down to a simmer. Ceramic lags. The coil keeps glowing after you lower the setting, and it takes a minute to come back up when you raise it. Some cooks like that steady, forgiving heat for stews and porridge; anyone used to gas will find it slow.

## Cookware: what cannot be cooked on induction

Induction only works with a pan whose base a magnet will stick to. That rules out:

- **Glass:** Glass and Pyrex pots.
- **Ceramic:** Ceramic, stoneware and clay pots.
- **Aluminium:** Unless the pan has a bonded steel plate in the base.
- **Copper:** Copper pans of any kind.
- **Some stainless steel:** Older pans with a non-magnetic base.

Put a non-magnetic pan on an induction hob and nothing happens: the zone shows an error or simply stays cold. Nothing is damaged. Cast iron, enamelled cast iron, carbon steel and most modern stainless steel all work. A ceramic hob heats any of them, which is its strongest argument.

## Safety: is ceramic or induction safer?

Induction is the safer of the two. The glass only warms from contact with the pan, so a hand placed on the surface a minute after cooking will not be burned. Most zones switch off automatically when the pan is lifted away. Ceramic glass stays hot long after the element goes off, which is why ceramic hobs have a residual heat indicator that stays on until the surface cools. Both types usually offer a child lock and an auto-off timer, but check the model.

## Lifespan

A well-made ceramic hob has little in it beyond the element and the glass, so there is little to fail. Induction hobs carry more electronics. On both, the glass is the part most likely to be damaged, usually from a dropped pot rather than age.

## Noise

Ceramic hobs are silent. Induction hobs can hum or buzz at high power, especially with lightweight pans, and most run a cooling fan you may hear on a long boil. It is not loud, but it is there.

## Cleaning and spills

Both wipe clean because both are flat glass. The difference is what happens to a spill. On a ceramic hob, sugar or sauce that lands on the hot glass bakes on within seconds and needs a scraper. On induction the glass is cooler, so most spills wipe away with a cloth. Our guide to [removing white spots from glass stove tops](/tips-tricks/how-to-clean-white-spots-on-glass-stove-tops/) covers the baked-on kind.

## Two questions people always ask

**Why do chefs not use induction?**
Most restaurant kitchens run on gas because a flame can be judged by eye, a wok can be tossed over it, and it takes any pan. Induction is spreading in professional kitchens for its speed and for how much cooler it keeps the room, but tradition and the wok still favour gas. If that is your cooking too, read our guide to [induction versus gas in Malaysia](/buying-guide/induction-cooker-vs-gas-stove/).

**Why does my induction hob take so long to boil water?**
Almost always the pan. A thin, warped or slightly non-magnetic base couples poorly with the coil and the hob throttles back. A small pot on a large zone does the same. Use a flat, heavy, magnetic pan matched to the zone size and induction is the fastest hob there is. Our guide to [induction cooker problems](/buying-guide/induction-cooker-problems/) covers the other causes.

## Should I get ceramic or induction?

Choose **induction** if you want:

- **Speed:** Fast boiling and instant control.
- **Efficiency:** More of the energy going into the pan.
- **A cooler surface:** Glass that is safe to touch soon after cooking.
- **Easy cleaning:** Spills that wipe off rather than bake on.

Choose **ceramic** if you want:

- **Cookware freedom:** To keep your aluminium, copper, glass or clay pots.
- **Gentle heat:** Slow, steady, silent heat for soups and stews.
- **Silence:** No hum and no cooling fan.

VATTI makes both kinds. The [VH-IC9-LA](/vatti-cooker-hob-vh-ic9-la/) pairs an induction zone of 2,000 W (2,300 W on boost) with a ceramic zone of 1,000 to 2,200 W on one glass top, so you can use each side of this comparison in one hob, with a child lock, residual heat warning and overheat cut-off. The [ER3601T](/ceramic-cooker-hob-er3601t/) is ceramic throughout, with three zones, and the [ER5902T](/ceramic-cooker-hob-er5902t/) has five zones on a 900 mm top, two of them dual zones.

[![VATTI VH-IC9-LA induction and ceramic hob](https://cdn.vattimalaysia.com/2026/08/vatti-cooker-hob-vh-ic09al-front.webp)](/vatti-cooker-hob-vh-ic9-la/)
[![VATTI ER3601T ceramic hob](https://cdn.vattimalaysia.com/2024/08/Top-front-View-On.webp)](/ceramic-cooker-hob-er3601t/)
[![VATTI ER5902T ceramic hob](https://cdn.vattimalaysia.com/2024/08/Ceramic-cooker-Hob-ER5902T.webp)](/ceramic-cooker-hob-er5902t/)

If wok cooking is the heart of your kitchen, a gas hob still does that job best; the [VATTI gas hobs](/cooker-hob-in-malaysia/) are built around it. Our guides to [infrared gas stoves](/buying-guide/is-an-infrared-gas-stove-worth-it/) and to [ceramic versus infrared cookers](/buying-guide/ceramic-cooker-vs-infrared-cooker-what-is-the-difference/) cover that side of the decision.

## Induction vs ceramic FAQs

**Is a ceramic hob the same as a glass hob?**
Not quite. Both use glass-ceramic tops, but "ceramic hob" means the radiant kind with an element under the glass, and an induction hob uses the same glass with a coil instead. Our article on [ceramic versus glass cooktops](/buying-guide/is-a-ceramic-cooktop-same-as-a-glass-cooktop/) untangles the names.

**Can I use my old pans on induction?**
Hold a fridge magnet to the base. If it sticks firmly, the pan works. If it slides off, it will not heat on induction, though it will on a ceramic zone.

**Does an induction hob use a lot of electricity?**
Less than a ceramic hob for the same cooking, because more of the energy reaches the food. A high-power zone draws a lot while boiling, but for a shorter time.

**Which is easier to clean, induction or ceramic?**
Induction, because the cooler glass stops spills baking on. Both are far easier than a gas hob with pan supports.

**Is a ceramic cooker good?**
Yes, if you value cookware freedom and steady, silent heat. It is slower to heat and slower to respond than induction, and its glass stays hot for longer after cooking.

## Final thoughts

Induction is the better hob for speed, efficiency, safety and cleaning. Ceramic is the better hob for cookware freedom and quiet, steady heat. Decide which of those matters more in your kitchen and the choice is made. The [VATTI cooker hob range](/cooker-hob-in-malaysia/) has induction, ceramic and gas side by side, so you can compare the zones and burners model by model.

[Explore VATTI cooker hob](/cooker-hob-in-malaysia/)'
WHERE path = 'buying-guide/which-is-better-induction-or-ceramic-cooker' AND lang = 'en-MY';

-- 5 ------------------------------------------------------------------------
UPDATE article SET
  title = 'How to Remove Rust From an Electric Stove (5 Safe Methods)',
  h1 = 'How to Remove Rust From an Electric Stove: Step-by-Step Guide',
  meta_description = 'Switch off and let it cool, then lift rust with baking soda, vinegar, lemon and salt or fine steel wool. For coils, drip pans, enamel and glass tops.',
  word_count = 1390,
  reading_minutes = 7,
  modified_at = '2026-11-05T22:00:00+08:00',
  body_md = 'Rust on an electric stove usually shows up in the same few places: the coil burners, the metal drip pans under them, chipped enamel on the stove top, and the trim around the controls. It looks bad and, left alone, it spreads and pits the metal. Most of it comes off with things already in the kitchen. This guide shows you which method suits which part, step by step, and how to stop the rust coming back.

### Quick answer

- **First step:** Switch the stove off at the wall, let it cool completely, and remove coil burners and drip pans if your stove has them.
- **Light rust:** Rub on a paste of baking soda and water, leave it 30 minutes, scrub with a soft brush, rinse and dry.
- **Stubborn rust on metal parts:** Soak in white vinegar for an hour or two, then scrub gently with fine steel wool.
- **Glass or ceramic tops:** Never use steel wool or sandpaper; use baking soda paste and a soft cloth only.
- **Prevent it:** Dry the stove after every clean and wipe up spills quickly, because rust starts where water sits on bare metal.

[Ask us about a hob that is easier to keep clean](https://wa.me/60123366082)

![how to remove rust from electric stove](https://cdn.vattimalaysia.com/2024/03/how-to-remove-rust-from-electric-stove.webp)

## Why is my electric stove rusting?

- **Moisture:** A stove that is not dried after cleaning, or a pot that boils over and is left, keeps water on bare metal long enough for rust to start. Malaysian humidity speeds it up.
- **Scratches and chips:** Any chip in the enamel or scratch in the coating exposes the metal underneath to air and water.
- **Harsh cleaners:** Abrasive powders and scourers wear through protective coatings, which leaves the metal open to rust.
- **Salty or acidic spills:** Salt water, soy sauce and tomato left to dry on metal attack it faster than plain water.

## Before you start

1. Switch the stove off at the wall socket or isolator and let every part cool completely.
2. If your stove has coil burners, lift them out of their sockets, then lift out the drip pans. Never soak or wet a coil burner''s plug end or the socket it sits in.
3. Wear rubber gloves, and open a window if you are using a commercial rust remover.
4. Test any method on a small hidden spot first, especially on painted or enamelled surfaces.

## Where is the rust? Pick the right method

| Part | Best method | Avoid |
| --- | --- | --- |
| Drip pans and trim rings | Vinegar soak, then steel wool | Leaving them wet |
| Coil burners | Baking soda paste on a dry brush | Soaking, sandpaper |
| Enamel stove top | Baking soda paste, lemon and salt | Steel wool, sandpaper |
| Glass or ceramic top | Baking soda paste, soft cloth | Any abrasive pad |
| Bare steel parts, heavy rust | Fine sandpaper, then a thin film of oil | Using it on coated surfaces |

## Method 1: Baking soda paste

Baking soda is a mild abrasive that lifts surface rust without scratching most finishes. It is the safest place to start on any part.

1. Mix baking soda with a little water into a thick paste.
2. Spread it over the rusted area.
3. Leave it for 30 minutes to an hour.
4. Scrub with a soft brush or a non-scratch sponge.
5. Wipe clean with a damp cloth and dry thoroughly.

## Method 2: Lemon and salt scrub

The acid in lemon juice loosens rust, and salt gives it a gentle scrubbing grit.

1. Sprinkle salt over the rusted area.
2. Squeeze lemon juice over the salt until it forms a paste.
3. Leave it for 30 minutes to an hour.
4. Scrub with a sponge or soft brush, without pressing hard.
5. Rinse, then dry thoroughly. Do not leave lemon juice on metal longer than this.

## Method 3: Vinegar soak and steel wool

For drip pans, trim rings and other removable metal parts with stubborn rust. Not for glass, ceramic or enamel.

1. Place the removable parts in a basin and cover them with white vinegar. For a fixed part, lay a cloth soaked in vinegar over the rust.
2. Leave for one to two hours.
3. Scrub gently with fine steel wool, wearing gloves and keeping fibres away from your eyes.
4. Rinse with water, dry straight away, and let the parts air-dry fully before refitting them.

## Method 4: Commercial rust remover

When home methods do not shift the rust, a rust remover made for household metal will.

1. Read the label and check it is safe for the surface you are treating.
2. Apply it to the rusted area as directed, in a well-ventilated kitchen.
3. Leave it for the time on the label, no longer.
4. Scrub with a sponge or brush, rinse thoroughly and dry.

## Method 5: Fine sandpaper and oil

For heavy rust on bare steel parts only, such as an old drip pan or a steel bracket. Never on glass, enamel or painted surfaces.

1. Sand the rusted area lightly with fine-grit sandpaper until the rust is gone.
2. Wipe away the dust with a dry cloth.
3. Rub a very thin film of cooking oil over the bare metal to keep moisture off it, and wipe off any excess.

## How to stop rust coming back

- **Dry after cleaning:** Wipe the stove dry with a cloth every time, including under coil burners and in the drip pans.
- **Clear spills promptly:** Once the stove is cool enough to touch, wipe up boil-overs rather than leaving them wet for hours.
- **Use non-scratch tools:** Soft sponges and cloths keep the protective coating intact.
- **Touch up chips:** A chip in the enamel is where the next rust spot starts, so have it repaired early.
- **Keep the kitchen ventilated:** Steam from cooking settles on cool metal, and a running cooker hood clears it.

A sealed glass-ceramic hob avoids most of this, because there are no coil burners or drip pans to rust and nothing for water to sit in. The VATTI [ER3601T](/ceramic-cooker-hob-er3601t/) has three zones under one sheet of ceramic glass, and the [ER5902T](/ceramic-cooker-hob-er5902t/) has five on a 900 mm top, both with a full touch panel instead of metal knobs. For more on looking after an electric hob, read our [electric stove safety tips](/tips-tricks/electric-stove-safety-tips/).

[![VATTI ER3601T ceramic hob](https://cdn.vattimalaysia.com/2024/08/Top-front-View-On.webp)](/ceramic-cooker-hob-er3601t/)
[![VATTI ER5902T ceramic hob](https://cdn.vattimalaysia.com/2024/08/Ceramic-cooker-Hob-ER5902T.webp)](/ceramic-cooker-hob-er5902t/)

## Electric stove rust FAQs

**Is it safe to cook on a rusty electric stove?**
Light surface rust on the trim or drip pans is a cleaning job, not a hazard. Rust on a coil burner that has pitted, cracked or bulged the element is different: stop using that burner and replace the element.

**How do I get rid of rust on stove plates?**
For solid hot plates and drip pans, start with baking soda paste, then a vinegar soak and fine steel wool if it stays. Dry the plate fully afterwards and, on bare metal, wipe on a thin film of oil.

**Can I use vinegar on a glass stove top?**
Diluted vinegar is fine for cleaning glass, but rust marks on glass are usually stains from a rusty pan base. Use baking soda paste and a soft cloth, and never steel wool or sandpaper.

**Why do my drip pans rust so quickly?**
They catch every boil-over and often stay damp under the coil. Dry them after each clean and replace them when the coating has worn through, since a bare drip pan will keep rusting.

**Can oil stop rust on a stove?**
A thin film of cooking oil on bare steel parts slows rust, but keep any oil or spray off the heating elements and wipe off the excess. Drying the stove after every clean does more.

## Final thoughts

Most stove rust is surface rust and comes off with baking soda, vinegar or lemon and salt. Match the method to the part, keep abrasives off glass and enamel, and dry everything afterwards so it does not return. If you are replacing an old coil stove, the [VATTI cooker hob range](/cooker-hob-in-malaysia/) has sealed ceramic, induction and gas hobs side by side.

[Explore VATTI cooker hob](/cooker-hob-in-malaysia/)'
WHERE path = 'tips-tricks/how-to-remove-rust-from-electric-stove-step-by-step-guide' AND lang = 'en-MY';

-- 6 ------------------------------------------------------------------------
UPDATE article SET
  title = 'How to Remove Scratches on a Glass Stove Top: 5 Methods',
  h1 = 'How to Remove Scratches From a Glass Stove Top',
  meta_description = 'Polish light scratches out with baking soda or cerium oxide, fill deep ones with a scratch repair kit, and replace a cracked top. Step-by-step methods.',
  word_count = 1490,
  reading_minutes = 8,
  modified_at = '2026-11-05T22:00:00+08:00',
  body_md = 'Scratches on a glass stove top come from the same few things: a pot slid instead of lifted, a cast iron pan with a rough base, a grain of salt or sugar caught under a pan, or a scouring pad used on a stain. Light ones can be polished out at home in ten minutes. Deep ones cannot be removed, only made less visible. This guide shows you how to tell which you have, the methods that work in order of how safe they are, and how to stop the next scratch.

### Quick answer

- **Surface scuffs you cannot feel:** Rub a thick baking soda paste, or white non-gel toothpaste, over the mark with a soft cloth in small circles, then wipe clean.
- **Light scratches that catch a fingernail:** Polish with a glass cooktop polish or cerium oxide in short passes.
- **Deep scratches on black glass:** Use a glass cooktop scratch repair kit to fill and blend the line; it cannot be polished away.
- **Cracks or chips through the glass:** Stop using the hob and have the glass panel replaced.
- **Prevention:** Lift pans instead of sliding them and wipe grit off the glass before cooking.

[Ask us about glass-top hobs](https://wa.me/60123366082)

![how to remove scratches on stove top](https://cdn.vattimalaysia.com/2024/03/how-to-remove-scratches-on-stove-top.webp)

## First, which kind of scratch is it?

Run a fingernail across the mark.

- **You cannot feel it:** A surface scuff or haze. Baking soda or toothpaste will usually clear it.
- **Your nail catches slightly:** A light scratch. A cooktop polish or cerium oxide will reduce it and often remove it.
- **Your nail drops into it:** A deep scratch or gouge. No home method removes it. A repair kit can fill and blend it so it is less visible.
- **It is a crack, not a scratch:** Stop using the hob. A cracked glass top can fail under heat, and on an electric hob it can expose live parts. Have the glass replaced.

Also check that what you are seeing is a scratch. Grey or white marks that follow the shape of a pan are usually mineral residue or burnt-on sugar, which come off with a different approach. See [how to clean white spots on a glass stove top](/tips-tricks/how-to-clean-white-spots-on-glass-stove-tops/) and [how to remove cloudiness from a glass stovetop](/tips-tricks/how-to-remove-cloudiness-from-glass-stovetop/).

## Before you start

1. Let the hob cool completely.
2. Wash the surface with warm water and a drop of dish soap, and dry it. Any grit left on the glass becomes another scratch as you rub.
3. Work in daylight or under a strong light held at a low angle, which shows scratches clearly.

## Method 1: Baking soda paste (light scratches)

Baking soda is a very mild abrasive, mild enough that it does not scratch glass-ceramic on its own.

1. Mix two tablespoons of baking soda with enough water to make a thick paste.
2. Spread it over the scratch with a soft cloth.
3. Rub in small circles for one to two minutes with light pressure.
4. Wipe off with a damp cloth, dry, and check under the light. Repeat once or twice if it is fading.

## Method 2: Glass cooktop polish or cerium oxide (light to moderate scratches)

Cooktop cleaning creams sold for glass hobs contain a fine polishing agent. Cerium oxide, the compound used to polish glass and watch crystals, is stronger and is sold as a powder or paste at hardware stores.

1. Put a pea-sized amount on a microfibre cloth or a felt pad.
2. Work it over the scratch in circles for two to three minutes, keeping the pad moving so no one spot is rubbed longer than the rest.
3. Wipe clean with a damp cloth and dry.
4. Check the result. Cerium oxide removes a tiny layer of glass, so several short passes are better than one long one.

Wear gloves and keep the powder off the controls.

## Method 3: Toothpaste (surface scuffs only)

Ordinary white, non-gel toothpaste contains fine abrasives similar to baking soda. It works on scuffs and haze, not on scratches you can feel. Apply a little to a soft cloth, rub in circles for a minute, wipe and dry. It is the method to use when you have nothing else in the house.

## Method 4: Stainless steel stove tops

The methods above are for glass. On a stainless steel hob top, scratches are treated differently: use a metal polish or a non-scratch cleaning paste and always rub along the grain of the steel, never across it. Rubbing across the grain leaves a visible patch of new scratches. Finish with a dry microfibre cloth. Our [stainless steel cleaning tips](/tips-tricks/stainless-steel-cleaning-solutions-5-tips/) cover the everyday care.

## Method 5: Deep scratches, chips and repair kits

A deep scratch cannot be polished away, because polishing works by levelling the glass around the mark and a deep mark has too much depth to level. Two options remain.

**Use a black glass stove top scratch repair kit.** These kits fill the scratch with a clear resin, which is cured and then buffed flat. They work best on a single deep line away from the cooking zones.

1. Clean and dry the scratch, and remove any grease with a little rubbing alcohol.
2. Apply the resin along the scratch as the kit directs, slightly overfilling it.
3. Let it cure for the full time on the instructions before touching it.
4. Scrape or buff the excess flush with the glass, then polish.

The scratch becomes far less visible, but the filled line can still be seen at some angles, and resin over a hot cooking zone may not last.

**Replace the glass.** For a chip near the edge, a crack, or a scratch that bothers you every time you cook, a new glass panel from the brand''s service centre is the proper fix.

## What not to do

- **No scouring pads:** Steel wool, scouring pads and abrasive powder cleaners add scratches.
- **No razor scraper on a scratch:** Scrapers are for lifting burnt-on food, held almost flat, and they do nothing for scratches.
- **No polishing a hot surface:** The compound dries instantly and you will rub grit into the glass.
- **No polishing one spot too long:** Cerium oxide can leave a shallow dip that shows as a distortion in the reflection.

## How to prevent scratches

- **Lift, do not slide:** Lift pans on and off, even to move them an inch.
- **Check pan bases:** Cast iron, stoneware and any pan with a rough or burred base can scratch glass.
- **Wipe before cooking:** A single grain of salt under a pan is a scratch waiting to happen.
- **Clean spills once cool:** Use a soft cloth and a cooktop cream, so you are never tempted to scrub.
- **Keep pan bases clean:** Grit baked onto the bottom of a pot scratches as surely as grit on the glass.

The glass matters too. On gas hobs, the VATTI [Flexi Hob C836G](/vatti-flexi-hob-c836g/) has nano coating tempered glass around two 5.5 kW burners: a smooth top that needs only a soft cloth and a cooktop cream, never a scourer. On electric hobs, the [ER3601T](/ceramic-cooker-hob-er3601t/) is a three-zone ceramic hob on high quality ceramic glass with a full touch panel, so there are no knobs to clean around.

[![VATTI C836G gas hob](https://cdn.vattimalaysia.com/2026/08/vatti-flexi-hob-c836g-front.webp)](/vatti-flexi-hob-c836g/)
[![VATTI ER3601T ceramic hob](https://cdn.vattimalaysia.com/2024/08/Top-front-View-On.webp)](/ceramic-cooker-hob-er3601t/)

## Scratched glass stove top FAQs

**Can you remove scratches from a glass stove top completely?**
Light ones, yes, with baking soda or a cooktop polish. Anything deep enough to catch a fingernail can be reduced or filled but rarely erased.

**Do glass stove top scratch repair kits work?**
On a single deep scratch, yes: the resin fills the line and makes it much less visible. The repair can still show at some angles and may not last over a hot cooking zone.

**Is a scratched glass cooktop safe to use?**
A scratch, yes. A crack, or a chip that goes through the glass, no. Stop using it and have the panel checked.

**Does toothpaste really remove scratches?**
On surface haze and scuffs it does, because it is a mild abrasive. On a scratch you can feel, it will not.

**Why does my black glass hob show scratches so much?**
Black glass shows every mark under kitchen lighting because the scratch scatters light against a dark background. The scratches are no worse than on a lighter surface; they are simply easier to see. Our article on [ceramic versus glass cooktops](/buying-guide/is-a-ceramic-cooktop-same-as-a-glass-cooktop/) explains the materials.

## Final thoughts

Polish the light scratches out with baking soda or a cooktop compound, fill the deep ones with a repair kit, and replace a cracked panel. Then protect the surface by lifting pans and keeping grit off the glass. If you are choosing a new hob, the [VATTI cooker hob range](/cooker-hob-in-malaysia/) lists the glass and burners of every model.

[Explore VATTI cooker hob](/cooker-hob-in-malaysia/)'
WHERE path = 'tips-tricks/how-to-remove-scratches-on-stove-top' AND lang = 'en-MY';

-- Product shots: one article_image row per product panel above, positions
-- after each article's existing cover (position 0).
INSERT INTO article_image (article_id, image_id, position) VALUES
  ((SELECT id FROM article WHERE path = 'buying-guide/is-an-infrared-gas-stove-worth-it' AND lang = 'en-MY'), 9056, 1),
  ((SELECT id FROM article WHERE path = 'buying-guide/ceramic-cooker-vs-infrared-cooker-what-is-the-difference' AND lang = 'en-MY'), 273, 1),
  ((SELECT id FROM article WHERE path = 'buying-guide/ceramic-cooker-vs-infrared-cooker-what-is-the-difference' AND lang = 'en-MY'), 275, 2),
  ((SELECT id FROM article WHERE path = 'buying-guide/ceramic-cooker-vs-infrared-cooker-what-is-the-difference' AND lang = 'en-MY'), 9079, 3),
  ((SELECT id FROM article WHERE path = 'buying-guide/is-infrared-gas-stove-good' AND lang = 'en-MY'), 9056, 1),
  ((SELECT id FROM article WHERE path = 'buying-guide/which-is-better-induction-or-ceramic-cooker' AND lang = 'en-MY'), 9079, 1),
  ((SELECT id FROM article WHERE path = 'buying-guide/which-is-better-induction-or-ceramic-cooker' AND lang = 'en-MY'), 273, 2),
  ((SELECT id FROM article WHERE path = 'buying-guide/which-is-better-induction-or-ceramic-cooker' AND lang = 'en-MY'), 275, 3),
  ((SELECT id FROM article WHERE path = 'tips-tricks/how-to-remove-rust-from-electric-stove-step-by-step-guide' AND lang = 'en-MY'), 273, 1),
  ((SELECT id FROM article WHERE path = 'tips-tricks/how-to-remove-rust-from-electric-stove-step-by-step-guide' AND lang = 'en-MY'), 275, 2),
  ((SELECT id FROM article WHERE path = 'tips-tricks/how-to-remove-scratches-on-stove-top' AND lang = 'en-MY'), 9050, 1),
  ((SELECT id FROM article WHERE path = 'tips-tricks/how-to-remove-scratches-on-stove-top' AND lang = 'en-MY'), 273, 2);
