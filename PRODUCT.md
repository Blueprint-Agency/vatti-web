# Product

## Register

brand

## Users

**Primary — the renovator.** Malaysian homeowners specifying a kitchen: new build, condo
fit-out, or a renovation. They are mid-purchase on a RM3,000–9,000 built-in appliance they cannot
return, and they are comparing Vatti against Bosch, Rubine, Elba and Signature on a phone (64% of
organic traffic is mobile), often in the evening, often with a contractor's quote open in another
tab. They cannot buy online — they buy from one of 75 dealers — so the site's job is to make them
walk into that dealer already decided.

They are shopping on **fear of the wrong choice**, not on price. Will it clear wok smoke from a
condo kitchen? Will it fit the cabinet cutout? Will anyone service it in five years?

**Secondary — the existing owner.** Over half the site's traffic lands on `/tips-tricks/` and
`/buying-guide/` articles: cleaning a grease filter, decoding oven symbols, why an igniter won't
spark. They already own the product. They need a manual, a warranty registration, or an answer. They
are not a distraction from the commercial goal — they are the top of the next purchase and the
source of the site's search authority.

**Tertiary — the dealer.** Uses `/vatti-pay/` to settle invoices through an external portal. A
handoff, not an experience to design.

## Product Purpose

Vatti Malaysia is the national distributor for VATTI, a Chinese listed kitchen-appliance brand
founded in 1992. The site sells nothing directly. It exists to convert research into a dealer visit
or an enquiry, and to keep existing owners supported well enough that they recommend the brand.

Success is: an enquiry submitted, a dealer located, a warranty registered, a catalogue downloaded —
and, upstream of all of it, holding the organic rankings that deliver 10,792 clicks per 90 days.

The commercial insight the current site wastes: **Vatti's advantage is measurable.** Airflow,
pressure and noise figures exist on 16 of 16 range hoods. A 10-year motor warranty. Competitors bury
these; Vatti's own site buries them too, inside JPEGs. Making the numbers legible *is* the strategy.

## Brand Personality

**Engineered, direct, Malaysian.**

Voice is a spec sheet that knows what it is for. State the number, then say what it means for a wok.
No superlatives that cannot be measured — "powerful suction" is competitor language; "23 m³/min,
enough to clear a wok flare in a 2.4m condo kitchen" is Vatti's.

Directness is the tone: short sentences, no marketing throat-clearing, no "discover the difference".
Malaysian is the frame, not decoration — high-heat wok cooking, humid kitchens, condo layouts, local
service. The brand should feel like a competent engineer explaining their own product, not a
copywriter describing it.

Emotionally the target is **earned confidence**: the visitor should leave feeling they now know how
to judge a range hood, and that Vatti holds up under the judging.

## Anti-references

- **Cheap electronics retailer** (Harvey Norman, Lazada storefronts). Red sale badges, urgency
  banners, cluttered grids, everything shouting. Wrong for a dealer-network premium built-in.
- **Sterile German-appliance minimal** (Bosch, Miele). Stainless-and-white restraint is premium but
  cold, and it silently concedes the argument to European brands. Vatti's pitch is high-heat Asian
  cooking; the design must not look like it was made for a quiet European kitchen.
- **The current site.** Elementor stock template: stacked full-width feature JPEGs with text baked
  into the pixels, generic icon boxes, forms dumped mid-page, 465 KB of HTML. The rebuild must not
  read as a refresh of this.
- **Editorial-magazine aesthetic.** Display serif, italic drop caps, ruled broadsheet columns, small
  tracked mono labels. Currently the most saturated AI brand lane. Wrong register for an appliance
  catalogue regardless.
- **Generic SaaS/shadcn.** Glassmorphism, icon-heading-text feature grids, gradient text,
  three-column pricing-shaped comparison tables. The default output of component catalogues.

## Design Principles

1. **The number is the argument.** Airflow, pressure, noise, capacity and warranty years are the
   brand's proof. They get typographic weight, not a spec tab at the bottom. If a claim cannot be
   measured, cut it.
2. **Nothing important lives inside an image.** The current site's fatal flaw. All product substance
   ships as real text — selectable, searchable, translatable, readable by a screen reader.
3. **Design for the decision, not the transaction.** There is no cart. Every surface ends in
   enquire, WhatsApp, or find-a-dealer. Borrow e-commerce *browsing* patterns — filtering, sorting,
   comparison, persistent product identity — and drop e-commerce's buy-now grammar entirely.
4. **Support is marketing.** The 107 articles are not a blog bolted on the side; they carry the
   search authority and reach owners between purchases. They deserve the same craft as the product
   pages.
5. **Earn the ranking, then earn the click.** URLs never break. Beyond that, the largest measurable
   win is the CTR deficit — pages ranking at position 2.7 converting 0.14% of 45,750 impressions.
   Titles, descriptions and structured data are design surface.

## Accessibility & Inclusion

**WCAG 2.2 AA, held as a floor, not a target.**

- Body text ≥4.5:1, large text ≥3:1, placeholders held to the same 4.5:1. Verified numerically, not
  eyeballed — the Instrument direction runs light-on-dark, where perceived contrast lies.
- Full keyboard access with visible focus states. No hover-only affordances: 64% of sessions are
  touch, where hover does not exist.
- Every animation ships a `prefers-reduced-motion` alternative.
- Colour is never the sole carrier of meaning — relevant for spec comparison and stock/availability
  states.
- Buyers span a wide age range on a home-renovation purchase; generous base type and tap targets
  over dense compact defaults.
- Content is English-only today, but copy is written to survive translation — no meaning encoded in
  wordplay or in images.
