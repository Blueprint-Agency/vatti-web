# Content schedule: October to December 2026

Source: `vatti-malaysia-seo-opportunity-workbook_1.html`, compiled 21 August 2026 from Search
Console (90 days to 21 August, URL-prefix property `https://vattimalaysia.com/`) and Ubersuggest
(Malaysia, English and Malay), SERP-verified against FOTILE Malaysia as the one direct competitor.
The workbook is the evidence; this file is the plan lifted out of it with a status column so
progress lives beside the code. The three months are calendar months: Month 1 is October 2026,
Month 2 is November and Month 3 is December. Work shipped before 1 October counts as a head start.

Status was scored on 23 September 2026 against `data/sql` and the commits since 23 August.
Update the column in the same commit as the work, and name the SQL file that carries it.

## The argument in one paragraph

Vatti ranks for 2.4x more keywords than Fotile and has 5.6x more pages, and still gets half the
traffic: 3,704 Malaysian organic visits a month against 7,123. Fotile's whole figure comes from six
pages, mostly its category pages. Closing the gap by publishing at Vatti's current 21.9 visits per
page would take 156 new pages. Lifting yield on pages that already rank takes 23 pieces, 13 of them
reworks. So the quarter is weighted toward rewrites, and the fastest wins are the three category
pages where Fotile is directly beatable: dishwasher (Fotile #5, Vatti #8.9), combi oven (#2 against
#8) and kitchen hood (#8 against #18). The one opening Fotile cannot follow into is Malay-language
search, whose SERP incumbents run DA 5 to 18.

## Month 1, October: take the three head-to-head pages off Fotile

7 pieces, 2 new and 5 reworks.

| # | Piece | Primary keyword | Type | Status | Evidence |
|---|---|---|---|---|---|
| 1 | Dishwasher pillar, rewrite for the generic head term | dishwasher malaysia | Rework | Done 3 Oct | Brief: `docs/competitor-gap-dishwasher.md`. Guides, reasons, FAQ, meta description and hero intro rewritten for the two-model range in `category-content.sql`, led by capacity (17 and 20 place settings). Unsupported running-cost claims removed. Fotile's category page is not in the top 23 (Ubersuggest, 19 Sep), so this was not a head-to-head |
| 2 | Combi and steam oven pillar, rewrite and merge steam terms | combi oven malaysia | Rework | Done 3 Oct | Brief: `docs/competitor-gap-combi-oven.md`. The copy named five retired models as on sale (VA01, Z4501, VA03, O755P and the A+ claim); guides, reasons, FAQs 1, 3 and 7, meta and intro rewritten for the four on sale, led by steam set for local cooking, in `category-content.sql`. Page at 17 for the head term (Ubersuggest, 9 Sep) |
| 3 | Kitchen hood pillar, rewrite and absorb the 18 hood posts | kitchen hood malaysia | Rework | Partly done | Brief: `docs/competitor-gap-kitchen-hood.md`. Done 3 Oct: decision 1, warranty line in the closing band (`warrantyLine` in `src/lib/warranty-terms.ts`, on every category it applies to); decision 3, article links repointed (`714c930`); decision 4, meta description led by measured pressure and noise (`category-content.sql`). Closed by the client on 3 Oct: no installation mention (decision 2) and no price bands (decision 5), so neither is built. Open: "absorb the hood posts" conflicts with the brief's finding that the article cluster is the site's generic asset; 25 hood-slugged articles still published |
| 4 | Hood dapur tanpa tebuk dinding, Malay ductless guide | hood dapur tanpa tebuk dinding | New | Done 3 Oct | `/ms/panduan-membeli/hood-dapur-tanpa-tebuk-dinding/` in `refresh-articles-ms-2026-10.sql` (moved under /ms/ the same day; the first path 301s). Names the 13 hood models whose spec reads "ducted or recycled". Page one for the term was social posts and Indonesian shops, no brand guide (Firecrawl, KL, 3 Oct) |
| 5 | Hood dapur, panduan lengkap, Malay hood pillar | hood dapur | New | Done 3 Oct | `/ms/panduan-membeli/hood-dapur/`, same file. Types, airflow, static pressure and noise from `product_facet`, the 10-year motor warranty. 720/month (Ubersuggest, ms, 3 Oct) |
| 6 | Price and cost sections on all five category pillars | kitchen hood malaysia price | Rework | Dropped 3 Oct | The client will not publish price bands. No price figure goes on any page; do not re-propose |
| 7 | Geo-signal fix: hreflang, Malaysia targeting, internal-link routing | technical | Rework | Partly done | www prefix no longer splits the index (`28e5d52`); canonicals on every page; article links pointed past the 301s (`714c930`); Malay pages carry `lang="ms-MY"` and `inLanguage` from a new `article.lang` column (3 Oct). Still no hreflang, correctly: items 4 and 5 are new pieces, not translations, and hreflang only pairs equivalent pages |

## Month 2, November: outrank category pages with real buyer content

8 pieces, 6 new and 2 reworks.

| # | Piece | Primary keyword | Type | Status | Evidence |
|---|---|---|---|---|---|
| 8 | Best kitchen hood in Malaysia, 2026 buyer's guide | best kitchen hood malaysia | New | Not started | |
| 9 | Vatti vs Rubine cooker hood and gas hob | rubine cooker hood malaysia | New | Not started | no article mentions Rubine |
| 10 | Vatti vs Fotile, Chinese premium kitchen appliances compared | fotile vs vatti | New | Not started | no article mentions Fotile |
| 11 | Best dishwasher in Malaysia | bosch dishwasher malaysia | New | Not started | |
| 12 | Best induction hob in Malaysia | best induction hob malaysia | New | Not started | |
| 13 | Hood dapur terbaik 2026, Malay best-of | hood dapur terbaik | New | Not started | |
| 14 | Cooker hob pillar, rewrite to pass Fotile's #16 | gas hob malaysia | Rework | Not started | `category-content.sql` unchanged for this page |
| 15 | Induction vs ceramic hob, merge four posts into one | induction cooker vs ceramic cooker | Rework | Done 14 Sep | `refresh-articles-2026-09.sql`: merged into `which-is-better-induction-or-ceramic-cooker`, the other three unpublished and 301'd |

## Month 3, December: lift yield across the existing estate

8 pieces, 2 new and 6 reworks.

| # | Piece | Primary keyword | Type | Status | Evidence |
|---|---|---|---|---|---|
| 16 | Built-in oven pillar, a real money page | built in oven malaysia | New | Not started | `product_category` has five rows and none is a built-in oven |
| 17 | Complete guide to oven symbols, merge five posts | oven symbols | Rework | Partly done | `oven-symbols-and-meanings` and `oven-symbol-for-baking` rewritten 14 Sep; the pizza, cookies and grill posts still stand as separate pages |
| 18 | Route the infrared gas stove cluster to the hob pillar | infrared gas stove | Rework | Done 15 Sep | `refresh-infrared-2026-09.sql`: three articles rewritten, one added, all routed to the M822G |
| 19 | Kitchen hood size and suction power guide, with a Malay variant | kitchen hood ductless | New | Not started | `what-hood-size-do-i-need` and `how-to-measure-suction-power` exist as two older posts; neither is the piece, and there is no Malay variant |
| 20 | Rework "What is not dishwasher safe" for commercial routing | dishwasher safe symbol | Rework | Not started | not among the ten refreshed on 14 Sep |
| 21 | Rework "How long to preheat oven" for intent and links | how long to preheat oven | Rework | Done 14 Sep | `refresh-articles-2026-09.sql` |
| 22 | Backlink push: 30 Malaysian directory, dealer and PR placements | authority | Other | Not started | off-repo work; record placements here when they land |
| 23 | Recipe archive: prune, noindex or consolidate the 25 posts | housekeeping | Other | Not started | 16 rows in `recipe` plus 23 recipe-titled articles, all published and indexable |

## Done outside the plan

Work since the workbook was compiled that it did not ask for but which serves the same end:

- Ten articles rewritten for the queries they already showed for, 14 September, including the
  ducted-or-ductless hood post that the workbook lists under "Defend".
- The kitchen hood competitor gap analysis, 14 September, which is the brief item 3 needs.
- Structured data for articles, recipes and category lists.
- A favicon, 18 September, so the brand mark shows beside every result.

## Scorecard

| | Pieces | Done | Partly | Not started | Dropped |
|---|---|---|---|---|---|
| Month 1, October | 7 | 4 | 2 | 0 | 1 |
| Month 2, November | 8 | 1 | 0 | 7 | 0 |
| Month 3, December | 8 | 2 | 1 | 5 | 0 |

Three pieces are already done before the schedule starts, all of them from Months 2 and 3.
October opens with the three pillar rewrites, which the workbook ranked as the fastest wins.
