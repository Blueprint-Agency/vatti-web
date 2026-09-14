# Competitor gap analysis: `/kitchen-hood-in-malaysia/`

Pulled 2026-09-14. Method: `competitor-gap-analysis` skill. Every figure below names its tool,
location and date so a later session can tell a measurement from a guess.

## Why this page

GSC, `https://vattimalaysia.com/`, 2026-06-16 to 2026-09-14 (90 days):

| Page | Clicks | Impressions | Avg position |
|---|---|---|---|
| /kitchen-hood-in-malaysia/ | 2,168 | 25,979 | 6.3 |
| / (home) | 2,122 | 19,934 | 5.6 |
| /buying-guide/is-an-infrared-gas-stove-worth-it/ | 603 | 32,501 | 5.1 |

It is the biggest page on the site. The average position hides the real picture:

| Query on the hood page | Clicks | Impressions | Position |
|---|---|---|---|
| vatti v997 | 316 | 914 | 1.1 |
| vatti hood | 282 | 915 | 1.3 |
| vatti v938 | 147 | 447 | 1.4 |
| kitchen hood malaysia | 1 | 145 | 14.5 |
| cooker hood malaysia | 1 | 37 | 14.3 |
| range hood malaysia | 1 | 23 | 13.3 |

Every query in the page's top 28 is a brand or model query. The page has essentially no
non-brand traffic. It ranks on page 2 for the generic head terms.

## Demand (Ubersuggest, Malaysia locId 2458, English, pulled 2026-09-14)

| Keyword | Monthly volume | SEO difficulty | Intent | Series flat at floor? |
|---|---|---|---|---|
| kitchen hood | 6,600 | 9 | Transactional | No (5,400 to 8,100) |
| cooker hood | 3,600 | 10 | Transactional | No |
| range hood malaysia | 590 | 44 | (none returned) | No (390 to 880) |
| kitchen hood malaysia | 480 | 10 | Commercial | No (320 to 720) |
| cooker hood malaysia | 480 | 9 | Transactional | No |
| best kitchen hood malaysia | 170 | 10 | Commercial | No (90 to 210) |

Ubersuggest's difficulty score is generic and is contradicted by the SERP below, which is held by
national brands and retailers. Treat the 9 to 10 as unreliable, not as easy.

## SERP composition (Firecrawl search, location "Kuala Lumpur, Malaysia", query `kitchen hood malaysia`, 2026-09-14)

| # | Page | Type |
|---|---|---|
| 1 | electrolux.com.my /appliances/cooker-hoods/ | Brand category page with shop |
| 2 | harveynorman.com.my cooker hoods | Multi-brand retailer, prices, video buying guide |
| 3 | rinnai.com.my cooker hood | Brand category page |
| 4 | midea.com/my hood and hob | Brand category page |
| 5 | senheng.com.my cooker hoods | Multi-brand retailer |
| 6 | maximbath.com.my "10 Best Kitchen Cooker Hoods in Malaysia 2026" | Showroom listicle |
| 7 | fujioh.com/my best hood and hob sets | Brand editorial landing page |
| 8 | YouTube, Fotile hood/hob/oven video | Video |
| 9 | rubine.com.my hood | Brand category page |
| 10 | takamalaysia.com kitchen hoods | Brand category page |

Reading: six of ten are brand category pages, so the page type we have is the right type. Two are
retailers and one is a showroom listicle, and those three are the only ones that show prices or
compare brands. VATTI is absent from the top 10. Nothing in the top 10 quotes static pressure or a
measured noise figure, and only one (Rinnai, via filters) puts airflow per model on the category
page.

## 8a. Deep dive

| Source | Words | Structure | Strengths | Weaknesses |
|---|---|---|---|---|
| Electrolux (#1) | ~600 body + grid | H1 Kitchen hoods; filters (price, type, width, colour); 9 tiles with price, discount %, 0% instalment, delivery days, review count, add to cart, compare; below grid: buying-guide link, "Which type", "What to consider" (width, volume x10 formula, ducted vs recirculating), "How much does it cost" (RM 889 to 6,499), "Why choose" (100 years, stir-fry mention, 2-year warranty), 2 recommended models with "Best for", 4 FAQs, support links (troubleshooting, accessories, 5-year extended warranty, parts subscription) | Complete purchase path on one page; the only page that answers "how much"; free basic installation stated in the header; every tile has a review count | No airflow, noise or pressure figure anywhere on the page; wok cooking is one clause; the below-grid copy is a generic SEO block |
| Rinnai (#3) | ~90 | H1 only; ~8 tiles per page across 3 pages, prices RM 2,574 to 5,100; deep filter set (width, type, extraction mode, suction m3/h, speeds, filter, control, surface) | Airflow on every tile; the most complete filter set in the SERP | No guide, no FAQ, no noise, no CTA beyond "Learn more"; nothing about the kitchen the buyer has |
| Maxim Bath listicle (#6) | ~1,800 | H1 "10 Best..."; 10 H2s, one per model (SENZ, DE&E, Rubine) each with m3/h and 4 to 5 bullets; installation service; WhatsApp and phone | Airflow per model; names installation as a service; mentions stir-frying as the local habit | No prices, no how-to-choose, no noise, no warranty, no comparison; a showroom's stock list dressed as a guide |
| Fujioh (#7) | ~2,100 | H1 "3 Best... Sets"; "Why choose the right hood" (4 H3s); top 3 hoods; top 3 hobs; dealer CTA; 5 FAQs | Strongest Asian-cooking framing in the SERP; lifetime glass warranty stated; 92% oil capture | No prices, no m3/h, no dB, no comparison; a hood and hob bundle page rather than a category page |
| Harvey Norman (#2, from SERP snippet only) | not fetched | Retailer grid with was/now pricing and an embedded video buying guide | Prices and discounts; multi-brand choice | Not fetched for structure; cannot be matched on price breadth anyway |

Not fetched: Midea, Senheng, Rubine, Taka. Their SERP snippets describe the same brand-grid shape
as Rinnai. Midea's snippet is the only one quoting an airflow figure (400 to 1,800 m3/h).

## 8b. Gap table

Columns: Electrolux (E), Rinnai (R), Maxim listicle (M), Fujioh (F). Every row changes what gets built.

| Element | E | R | M | F | Us |
|---|---|---|---|---|---|
| Static pressure (Pa) as a selection criterion | ❌ | ❌ | ❌ | ❌ | ✅ |
| Measured noise (dB) per model | ❌ | ❌ | ❌ | ⚠️ | ✅ |
| Airflow (m3/h) per model on the category page | ❌ | ✅ | ✅ | ❌ | ✅ |
| Side-by-side comparison on the page | ✅ | ⚠️ | ❌ | ❌ | ✅ |
| Sizing rule and ducted vs ductless, on the page | ✅ | ⚠️ | ❌ | ⚠️ | ✅ |
| Wok and Malaysian-cooking framing throughout | ⚠️ | ❌ | ⚠️ | ✅ | ✅ |
| Customer reviews on the page | ✅ | ❌ | ❌ | ❌ | ✅ |
| Structured "tell us about your kitchen" enquiry | ❌ | ❌ | ❌ | ❌ | ✅ |
| Price per model | ✅ | ✅ | ❌ | ❌ | ❌ |
| "How much does a kitchen hood cost" answered | ✅ | ❌ | ❌ | ❌ | ❌ |
| Buy online / add to cart | ✅ | ❌ | ❌ | ⚠️ | ❌ |
| 0% instalment stated | ✅ | ❌ | ❌ | ❌ | ❌ |
| Installation arrangement stated on the page | ✅ | ❌ | ✅ | ❌ | ⚠️ |
| Warranty term stated on the page | ✅ | ❌ | ❌ | ✅ | ⚠️ |
| Internal links land on the canonical URL | ✅ | ✅ | n/a | n/a | ⚠️ |

Notes on the Us column:

- ⚠️ installation: FAQ 3 says a professional or the dealer installs. No page says who arranges it
  or what it costs.
- ⚠️ warranty: the page links "Register it for warranty". The 10-year motor term and the 2+3 year
  auto-clean term live in `src/lib/warranty-terms.ts` and print on product pages only. Electrolux
  states 2 years and is number one. We hold a five-times-longer motor term and do not say so on the
  page that ranks.
- ⚠️ internal links: 10 article links in `data/sql/articles.sql` point at `/kitchen-hood/`, which
  301s, against 18 that point at `/kitchen-hood-in-malaysia/`. Link equity to the ranking page is
  passing through a redirect from a third of the articles.
- ❌ price, buy online, instalment: no price data exists in `data/sql`, and every conversion path
  ends in WhatsApp by the owner's decision. These three cannot be matched without a client decision.

## Decisions

Gaps we own (all four competitors ❌): static pressure, measured dB per model, and the structured
kitchen questionnaire. The page already has them. The failing is that nothing outside the page says
so: the meta description reads "powerful suction for wok cooking, quiet operation", which is the
same sentence Electrolux and Fujioh could write.

Build:

1. State the warranty on the category page. One line in the closing CTA band: 10 years on the
   motor, 2 years on the hood, 2+3 on auto-clean with registration. Source: `PERIODS` in
   `src/lib/warranty-terms.ts`, already reconciled to the 2026 catalogue. Zero new claims.
2. State the installation arrangement in the same band, in the client's words (see Ask).
3. Repoint the 10 `article_link` rows from `/kitchen-hood/` to `/kitchen-hood-in-malaysia/` in
   `data/sql/articles.sql`. Redirect stays; the links stop depending on it.
4. Rewrite `meta_description` for the category to lead with the owned gap: measured pressure and
   noise for every model, matched to the kitchen and the duct run. Keep `seo_title` as is; it
   carries the brand rankings.
5. Add a "How much does a kitchen hood cost in Malaysia" FAQ once the client supplies bands
   (see Ask). Electrolux is the only page answering it and it is the question a generic searcher
   has. Without figures, do not write the FAQ; a non-answer is worse than none.

Skip:

- Listicle format ("10 best"). The SERP holds one and it is the weakest page in it.
- Buy online and add to cart. Owner decision; the questionnaire plus WhatsApp is the compensating
  move and no competitor has it.
- Per-model pricing if the client declines. Do not print dealer prices scraped from elsewhere.
- Copying Electrolux's five-section SEO block. Ours already covers each point with figures theirs
  lacks.

Ask the client:

- Can the site publish a price band per series (for example "RM 1,500 to 2,500"), even if not a
  price per model? This unlocks decision 5 and is the single largest content gap against the
  number-one page.
- Do authorised dealers offer instalment plans? If yes, one line naming that closes the 0% row.
- What is the installation arrangement for a hood bought from a dealer: included, quoted, or
  arranged by the dealer at the buyer's cost?

Dead results, so nobody re-proposes them:

- "best kitchen hood malaysia" measures 170/month and is served by a showroom listicle. Not worth
  a page.
- The generic head term "kitchen hood" (6,600/month) does not appear in this page's top 40
  queries at all. It will not be won by a brand category page; it is a retailer and Lazada term.

## Authority (Ubersuggest domain overview, Malaysia locId 2458, pulled 2026-09-14)

| Domain | Domain authority | Referring domains | Backlinks | Organic keywords (MY) | Rank for "kitchen hood malaysia" |
|---|---|---|---|---|---|
| electrolux.com.my | 31 | 1,964 | 8,781 | 6,916 | 1 |
| rinnai.com.my | 30 | 933 | 776,031 | 798 | 3 |
| rubine.com.my | 26 | 380 | 4,269 | 1,396 | 9 |
| vattimalaysia.com | 9 | 69 | 84 | 1,241 | 14 to 15 |
| takamalaysia.com | 2 | 18 | 20 | 69 | 10 |

Rinnai holds position 3 on the category term with roughly 90 words of copy. Taka holds position
10 with a domain authority of 2. Both say the same thing: the category term is decided by
authority first and by on-page second, and on-page alone can reach the bottom of page 1.

Where the hood page sits on the head terms (Ubersuggest, MY, same pull):

| Keyword | Volume | Us | Electrolux | Rinnai |
|---|---|---|---|---|
| range hood for kitchen | 6,600 | 21 | 3 | 8 |
| range hood kitchen | 6,600 | 25 | 3 | not in top 50 |
| exhaust hood kitchen | 6,600 | 26 | 3 | not in top 50 |
| kitchen hood | 6,600 | not in top 50 | 7 | 10 |
| cooker hood | 3,600 | not in top 50 | 4 | 5 |

What the site does rank for, generically, is articles: the ducted-or-ductless guide sits at 8 to
12 across a ~480/month cluster, the infrared gas stove guide at 2 to 9, induction-vs-ceramic at 4
to 9. Informational pages win at this authority level; the commercial category page does not.

## Decisions added after the authority pull

- The on-page list above is necessary but will not by itself move the category term. The
  referring-domain gap is 69 against 380 to 1,964.
- The one link source no competitor has in this form: 76 stores in `data/sql` and 79 warranty
  dealers, each with their own site or Google profile. A dealer page that links to
  `/kitchen-hood-in-malaysia/` as "authorised VATTI dealer" is a relevant, Malaysian, follow link.
  Ask the client to make it part of dealer onboarding.
- The article cluster is the site's actual generic asset. Every hood article should link to the
  canonical category page with a hood anchor, not to `/kitchen-hood/`.
