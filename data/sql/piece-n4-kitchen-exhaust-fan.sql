-- N4, kitchen exhaust fan or cooker hood, English edition (content schedule,
-- October). Replaces "Vatti vs Fotile" on 2026-10-19 at the owner's request.
-- The Malay and Chinese editions are translation-n4-kitchen-exhaust-fan-{ms,zh}.sql,
-- sharing translation_key 'kitchen-exhaust-fan-vs-cooker-hood'.
--
-- Target: `kitchen exhaust fan`, 1,900/month, SD 11 (Ubersuggest MY en,
-- 2026-10-19), the highest volume for its difficulty left in the hood cluster.
-- `kitchen exhaust fan malaysia` 70. No existing article covers it, and Search
-- Console (sc-domain, 21 Jul to 19 Oct) shows the site ranking for no
-- "exhaust fan" query, so it competes with nothing. The risk is the SERP
-- (Firecrawl KL, same day): fan sellers, a fan brand and marketplaces, with one
-- retailer's cooker hood page at 3. Google already mixes hoods into the answer;
-- no page on page one explains the difference. That is the piece.
--
-- No other brand is named. Every VATTI figure is product_facet (airflow, noise,
-- oil capture) or the "Ducted or recycled" spec row. Nothing is claimed about
-- exhaust fans in numbers, since no source here measures them. No price,
-- running cost or installation arrangement (client, 2026-10-03).
--
-- Featured image: the kitchen hood category's hero backdrop, already on R2 and
-- until now only a column on product_category. Given an image row (9107, after
-- N3's 9106).

INSERT INTO image (id, url, legacy_url, alt, width, height) VALUES
  (9107, 'https://cdn.vattimalaysia.com/2026/08/kitchen-hood-hero-backdrop.jpg', NULL,
   'A slim grey VATTI cooker hood under white wall cabinets, above a two-burner gas hob, in a kitchen with a sea view.', 1376, 768);

INSERT INTO article (id, slug, path, section, title, h1, meta_description, body_md, word_count, reading_minutes, author, featured_image_id, published_at, modified_at, schema_disabled, is_published, lang, translation_key)
VALUES (115, 'kitchen-exhaust-fan-vs-cooker-hood', 'buying-guide/kitchen-exhaust-fan-vs-cooker-hood', 'buying-guide',
'Kitchen Exhaust Fan or Cooker Hood: Which Does a Malaysian Kitchen Need?',
'Kitchen Exhaust Fan or Cooker Hood: Which Does a Malaysian Kitchen Need?',
'A kitchen exhaust fan clears the room; a cooker hood catches smoke and oil at the hob. What each one does, why wok cooking needs a hood, and when a fan still helps.',
'A kitchen exhaust fan and a cooker hood both move air out of the kitchen, so it is easy to think one can stand in for the other. They do different jobs. An exhaust fan in the wall or window changes the air in the whole room. A cooker hood sits over the hob and catches smoke, steam and oil before they leave the pan. For the way Malaysians cook, that difference decides whether the oil ends up in a filter or on your cabinets.

### Quick answer

If you cook with a wok, fry or make sambal, you need a **cooker hood**. An exhaust fan cannot catch oil at the pan, and most have no grease filter at all, so the oil mist settles on walls, ceilings and the fan blades. An exhaust fan is still useful for heat, humidity and lingering smells, and works well **beside** a hood. If your kitchen has no outside wall, a hood that runs without a duct is the answer: 13 VATTI hoods can.

[Ask us which hood fits your kitchen](https://wa.me/60123366082)

## What a kitchen exhaust fan does

A kitchen exhaust fan is a fan set into a wall, a window or the ceiling, pushing room air outside. It is good at what it was made for: replacing warm, humid, stale air with fresh air from elsewhere in the house. In a kitchen that stays hot long after the stove is off, or a wet kitchen behind the main one, that is worth having.

What it does not do is meet the smoke where it starts. The fan is usually some distance from the hob, so smoke and oil mist spread through the room on their way to it. By the time the air reaches the blades, much of the oil has already landed on the cabinets, the range and the ceiling. And because a typical exhaust fan has no grease filter, the oil that does reach it coats the blades and the wall outside.

## What a cooker hood does

A cooker hood works at the source. Its intake sits directly over the hob, so it draws smoke and steam up as they rise from the pan, before they spread. Inside, a grease filter holds back the oil: most VATTI hoods capture 92% of it, and the [V959](/vatti-cooker-hood-v959/) 95%. What leaves the hood is air, sent outside through a duct or, on a ductless setup, cleaned through a charcoal filter and returned to the kitchen.

It is also built for the volume of smoke a wok makes. The VATTI range moves between 1,860 and 3,690 m³/h, and every model clears an ordinary kitchen many times over. Our guide to the [best kitchen hood in Malaysia](/buying-guide/best-kitchen-hood-malaysia/) explains which figures matter for which kitchen.

## Exhaust fan vs cooker hood, side by side

| | Kitchen exhaust fan | Cooker hood |
| --- | --- | --- |
| Where it works | Anywhere in the room, often a wall or window | Directly over the hob |
| What it removes | Warm, humid and stale room air | Smoke, steam and oil mist at the pan |
| Oil | Usually no grease filter; oil coats the blades and walls | A grease filter captures it; 92% to 95% on VATTI hoods |
| Needs an outside wall | Yes | No; a ductless hood recirculates |
| Best for | Heat, humidity, lingering smells | Wok frying, deep-frying, sambal, daily cooking |

## Why wok cooking needs a hood

Malaysian cooking puts out more smoke and oil in a few minutes than most kitchens see in an evening elsewhere. High-heat stir-frying throws up a plume of oil mist that rises fast and wide. An exhaust fan across the room cannot pull that plume sideways quickly enough; the hood, sitting a short distance above the wok, is in its path.

The oil matters more than the smell. Smell fades when the window is open. Oil does not: it builds into the sticky film on cabinet doors, the yellowing on the ceiling and the grime in a fan that has run for a year. A hood with a grease filter keeps it in one place you can clean. Our guide to [how to clean a grease filter](/tips-tricks/how-to-clean-grease-filter/) covers that part.

## Should you use both?

Often, yes, and they work best in order. Switch the hood on before you start cooking, so it is already drawing when the first smoke rises, and let it run for a few minutes after. Use the exhaust fan to clear the heat and humidity that are left, or to air the kitchen after a long cook. The hood deals with the oil; the fan deals with the room.

If your kitchen already has an exhaust fan and the cabinets are still getting greasy, that is the sign the fan is doing the job it was built for and the smoke needs a hood.

## When there is no outside wall

Many condo kitchens are in the middle of the unit, with no wall to put a fan in. A wall exhaust fan is not an option there, but a cooker hood still is. Thirteen VATTI hoods list **ducted or recycled** on their spec sheet, so they can run with a charcoal filter and no duct. Without a duct, oil capture and noise matter most, which makes the V959 (95% oil capture) and the [V929](/vatti-aetheris-series-cooker-hood-v929/) (46.5 dB) the strongest choices. Our guide to [ducted or ductless range hoods](/buying-guide/which-is-better-ducted-or-ductless-range-hood/) explains what changes.

## Which VATTI hood to choose instead of relying on a fan

[![VATTI V959 cooker hood](https://cdn.vattimalaysia.com/2026/08/vatti-cooker-hood-v959-front.webp)](/vatti-cooker-hood-v959/)
[![VATTI V929 cooker hood](https://cdn.vattimalaysia.com/2026/08/vatti-aetheris-series-cooker-hood-v929-front.webp)](/vatti-aetheris-series-cooker-hood-v929/)
[![VATTI V995 cooker hood](https://cdn.vattimalaysia.com/2026/08/slim-series-type-range-hood-v995-front.webp)](/slim-series-type-range-hood-v995/)

- **For daily heavy frying:** the [V959](/vatti-cooker-hood-v959/), with the highest oil capture in the range, 95%, and 2,825 m³/h.
- **For an open kitchen:** the [V929](/vatti-aetheris-series-cooker-hood-v929/), the quietest at 46.5 dB, still moving 3,125 m³/h.
- **For a small kitchen:** the [V995](/slim-series-type-range-hood-v995/), a slim hood that fits under a wall cabinet, moves 2,050 m³/h and can run without a duct.

Every VATTI cooker hood carries a **10-year warranty on the motor** and 2 years on the hood. [Register it](/vatti-ewarranty/) and the auto-clean components are covered for 2+3 years.

## Kitchen exhaust fan FAQs

**Is a kitchen exhaust fan enough for Malaysian cooking?**
For boiling, steaming and light cooking, it helps. For wok frying, deep-frying or sambal, no: it cannot catch the oil at the pan, so the oil settles around the kitchen.

**Does a kitchen exhaust fan remove oil?**
Not well. Most have no grease filter, so oil that reaches the fan coats its blades and the wall outside, and much of it lands on surfaces before it gets there.

**Do I need an exhaust fan if I have a cooker hood?**
Not for the smoke and oil; the hood handles those. A fan is still useful for heat and humidity in a kitchen that stays warm, and the two work well together.

**What if my kitchen has no window or outside wall?**
Choose a cooker hood that can run without a duct. It cleans the air through a charcoal filter and returns it to the room. Thirteen VATTI hoods can run this way.

**Is a cooker hood noisy?**
It depends on the model. The VATTI range runs from 46.5 dB to 54 dB; our guide to [why a silent kitchen hood matters](/buying-guide/why-choose-silent-kitchen-hood-expert-answer/) explains what those numbers sound like.

## Final thoughts

A kitchen exhaust fan freshens the room; a cooker hood protects it. If you cook the Malaysian way, the hood is the one that keeps oil off your cabinets and smoke out of the living room, and an exhaust fan is a good partner for it rather than a substitute. Compare every model''s airflow, noise and oil capture on the [VATTI kitchen hood page](/kitchen-hood-in-malaysia/).

[Compare VATTI kitchen hoods](/kitchen-hood-in-malaysia/)
', 1240, 7, 'Vatti Malaysia', 9107, '2026-10-19T12:00:00+08:00', '2026-10-19T12:00:00+08:00', 0, 1, 'en-MY', 'kitchen-exhaust-fan-vs-cooker-hood');
INSERT INTO article_category (article_id, category_id, is_primary) VALUES (115, (SELECT id FROM blog_category WHERE slug = 'buying-guide'), 1);
