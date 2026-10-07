# Content schedule: October to December 2026

Source: `vatti-malaysia-seo-opportunity-workbook_1.html`, compiled 21 August 2026 from Search
Console (90 days to 21 August, URL-prefix property `https://vattimalaysia.com/`) and Ubersuggest
(Malaysia, English and Malay), SERP-verified against FOTILE Malaysia as the one direct competitor.
The workbook is the evidence; this file is the plan lifted out of it with a status column so
progress lives beside the code. The three months are calendar months: Month 1 is October 2026,
Month 2 is November and Month 3 is December. Work shipped before 1 October counts as a head start.

Status was scored on 23 September 2026 against `data/sql` and the commits since 23 August.
Re-planned on 7 October 2026 for the cadence below. Update the column in the same commit as the
work, and name the SQL file that carries it.

## The cadence

**Five new pieces a month, each in English, Malay and Chinese: 15 new URLs a month.** Improvements
to pages that already exist are a separate list and do not count toward the five.

- A new piece is one topic, written three times to one outline, grouped by `translation_key` so
  the three editions form an hreflang set (`docs/i18n.md`). It is done when all three editions
  are published, not when the first one is.
- Each edition targets its own term, recorded in `data/sql/keyword-map.sql` **before** writing
  (CLAUDE.md § Languages). The Malay and Chinese terms below are where the evidence is today;
  "map first" means no term has been chosen yet. Ubersuggest measures almost nothing in Chinese for
  Malaysia, so most Chinese rows will be competitor-based.
- No prices, running costs or installation copy in any edition, comparisons included (client,
  3 October).
- Translating an existing English article into Malay and Chinese is Phase 4 of the i18n rollout,
  not a new piece: it adds two URLs, not three, and it does not count here.

The workbook's own plan had 10 new pieces across the quarter, mostly English. The schedule now
needs 15, so seven topics were added on 7 October from Ubersuggest (Malaysia, `en` and `ms`, pulled
that day). Two workbook rows dropped out of the new list: the Malay best-of (old #13) is the Malay
edition of the best kitchen hood guide, not a piece of its own, and the hood size guide (old #19)
moved to the improvements list. Topics an existing article already covers were left out (hood
cleaning, hood sizing), and so were price-led terms.

Three of those added slots (a water dispenser guide, a Rinnai, Bosch and Elba hob comparison and a
built-in air fryer oven guide, 70 to 140 searches a month each) were swapped the same day for
recipes tied to the range: steamed fish, steamed egg and air-fried salmon. The reason is in Search
Console (1 April 2025 to 8 August 2026, `research/gsc-pages.json`): the 26 recipe posts earned about
330 clicks between them, because smoothie bowls and tacos compete with global recipe sites and lead
to nothing VATTI sells, while appliance-led how-tos earn thousands (the infrared gas stove post
5,690, the glass stovetop cleaning posts about 2,500). A recipe earns its slot only when the dish is
the reason to own the appliance. Each one is written for the VATTI steam or air fry mode first, with
a stovetop or countertop fallback, and links up to its pillar. They replace the generic recipes that
item 23 prunes rather than joining them.

Before writing any recipe piece, check its live SERP: recipe results carry carousels from large
recipe sites, which can sit above organic results whatever the difficulty score says.

## The argument in one paragraph

Vatti ranks for 2.4x more keywords than Fotile and has 5.6x more pages, and still gets half the
traffic: 3,704 Malaysian organic visits a month against 7,123. Fotile's whole figure comes from six
pages, mostly its category pages. Closing the gap by publishing at Vatti's current 21.9 visits per
page would take 156 new pages. Lifting yield on pages that already rank takes 23 pieces, 13 of them
reworks. So the reworks stay, and the new pieces go where a page does not exist yet. The one opening
Fotile cannot follow into is Malay and Chinese search, whose SERP incumbents run DA 5 to 18 and
where no brand, Fotile included, has Chinese pages.

## New pieces: 15 URLs a month

### Month 1, October: the hood cluster and the two brand head-to-heads

| # | Piece | EN keyword | MS keyword | ZH keyword | Status | Evidence |
|---|---|---|---|---|---|---|
| N1 | Hood dapur tanpa tebuk dinding, ductless hood guide | ductless kitchen hood malaysia (existing article) | hood dapur tanpa tebuk dinding (210) | map first | Done 3 Oct | `/ms/panduan-membeli/hood-dapur-tanpa-tebuk-dinding/` in `refresh-articles-ms-2026-10.sql`; zh edition in `i18n-zh-guides.sql`. The English edition is the existing ducted-or-ductless article, not a new page (client decision 3 Oct, no cannibalisation), so this piece adds 2 URLs, not 3 |
| N2 | Hood dapur, panduan lengkap, hood pillar guide | existing English hood article | hood dapur (720) | 抽油烟机 (390) | Done 3 Oct | `/ms/panduan-membeli/hood-dapur/`, same files and same pairing as N1. 2 URLs |
| N3 | Best kitchen hood in Malaysia, 2026 buyer's guide | best kitchen hood malaysia (170, SD 10); best cooker hood malaysia (170) | cooker hood terbaik (110); hood dapur terbaik | 抽油烟机推荐 (competitor) | Done 7 Oct | `/buying-guide/best-kitchen-hood-malaysia/`, `/ms/panduan-membeli/hood-dapur-terbaik/`, `/zh/buying-guide/best-kitchen-hood-malaysia/` (`piece-n3-best-kitchen-hood.sql`, `translation-n3-*`). One VATTI pick per kitchen, from measured figures; no other brand named. GSC (sc-domain, 7 Jul to 5 Oct): the site ranked for no "best ... hood" query, so it competes with nothing. `hood dapur terbaik` returned no figure on 7 Oct; the schedule's 90 was an earlier pull |
| N4 | Vatti vs Fotile, Chinese premium kitchen appliances compared | fotile vs vatti; fotile malaysia (1,900) | map first | 方太 vs 华帝, map first | Not started | No article mentions Fotile. Both are Chinese brands, so the Chinese edition reaches buyers who already know both names |
| N5 | Best gas hob in Malaysia | gas stove malaysia (480, SD 14) | dapur gas terbaik (590, SD 18); jenama dapur gas terbaik (110) | 煤气炉, map first | Not started | New 7 Oct. The Malay term carries the volume. `best gas hob malaysia` measures nothing in English; `gas stove malaysia` covers portable stoves too, so the piece says built-in early. Links up to the cooker hob pillar |

October lands at **13 new URLs**, not 15, because N1 and N2 pair with English articles that already
existed.

### Month 2, November: competitor and best-of buyers

| # | Piece | EN keyword | MS keyword | ZH keyword | Status | Evidence |
|---|---|---|---|---|---|---|
| N6 | Vatti vs Rubine cooker hood and gas hob | rubine gas stove malaysia (590, SD 10); rubine cooker hood malaysia (390, SD 13) | map first | map first | Not started | The highest-demand rival brand in the category. No article mentions Rubine |
| N7 | Best dishwasher in Malaysia | bosch dishwasher malaysia (210, SD 11); lg dishwasher malaysia (70) | mesin basuh pinggan, map first | 洗碗机, map first | Not started | Led by capacity like the dishwasher pillar (17 and 20 place settings). Must not compete with the pillar for `dishwasher malaysia` |
| N8 | Best induction hob in Malaysia | best induction hob malaysia (210, SD 11); best induction cooker malaysia (170, SD 16) | map first | map first | Not started | `induction cooker malaysia` measures 590. The existing induction-vs-gas and induction-vs-ceramic articles are comparisons, not a best-of |
| N9 | Steam oven in Malaysia: what it does for local cooking | steam oven malaysia (210, SD 10) | ketuhar stim, map first | 蒸烤箱 | Not started | New 7 Oct. No article on steam ovens exists. Guide format linking up to the combi oven pillar, which targets `combi oven malaysia`; check the pillar's ranking before and after to catch cannibalisation |
| N10 | Steamed fish, Cantonese and Malay styles, in a steam oven | steamed fish recipe (880, SD 38); steamed fish recipe cantonese (390); thai steamed fish recipe (210) | resepi ikan stim limau (720, SD 17); resepi ikan stim (390, SD 15); resepi ikan stim halia chinese style (390) | 蒸鱼, map first | Not started | New 7 Oct, replacing a water dispenser guide (140). Ships beside N9 and links to it and to the combi oven pillar. The Malay edition leads with the lime style, which carries the volume; the Chinese edition is everyday Malaysian Chinese home cooking, unmeasured by Ubersuggest |

### Month 3, December: built-in oven, water, and the steam and air fry kitchen

| # | Piece | EN keyword | MS keyword | ZH keyword | Status | Evidence |
|---|---|---|---|---|---|---|
| N11 | Built-in oven pillar, a real money page | built in oven (720); built in oven malaysia (170) | ketuhar terbina dalam, map first | 嵌入式烤箱, map first | Not started | A category page, not an article: `product_category` has five rows and none is a built-in oven. Fotile's /oven/ earns 204 visits a month. `wall-oven-sizes-how-to-choose-perfect-built-in-oven-size` and the oven-symbol posts become its spokes |
| N12 | Best water purifier in Malaysia | best water purifier malaysia (720, SD 20) | penapis air terbaik, map first | 净水器, map first | Not started | The workbook downgraded the purifier head term (Cuckoo, Coway, SK Magic, LG, Panasonic at DA 32 to 92). This is the buyer's-guide long tail, not the head term, and it is the riskiest piece on the list |
| N13 | Vatti vs LG and Coway water purifier | lg water purifier malaysia (390, SD 9) | map first | coway 净水器 (140) | Not started | New 7 Oct from workbook rows. The purifier category is searched by brand |
| N14 | Chinese steamed egg, smooth every time, in a steam oven | chinese steamed egg recipe (1,000, SD 24); steamed egg recipe (1,000, SD 45) | map first | 蒸蛋, map first | Not started | New 7 Oct, replacing a Rinnai, Bosch and Elba hob comparison (80 combined). The best volume for its difficulty in the steam cluster. A precise-temperature steam setting is the whole trick to a smooth egg, which is the product argument. Links to N9 and the combi oven pillar |
| N15 | Air fryer salmon, in a built-in air fryer oven | salmon air fryer recipes (480, SD 7) | map first; resepi ayam air fryer (260) and resepi air fryer (260) show Malay air fryer demand, but not for salmon | map first | Not started | New 7 Oct, replacing a built-in air fryer oven guide (70). SD 7 is the lowest difficulty on the whole schedule. Links to `vatti-built-in-air-fryer-oven-07559` and N11. `air fryer recipes` (49,500, SD 52) is recipe-site territory and is not the target |

In reserve if a slot falls through: resepi kek kukus, steamed cake (320, SD 22; the milo, chocolate
and three-ingredient variants measure 140 to 170 each), a Malay-led steam oven recipe on the same
pattern.

## Improvements to existing pages

Not counted in the 15. Months are kept from the original plan.

| # | Piece | Primary keyword | Month | Status | Evidence |
|---|---|---|---|---|---|
| 1 | Dishwasher pillar, rewrite for the generic head term | dishwasher malaysia | Oct | Done 3 Oct | Brief: `docs/competitor-gap-dishwasher.md`. Guides, reasons, FAQ, meta description and hero intro rewritten for the two-model range in `category-content.sql`, led by capacity (17 and 20 place settings). Unsupported running-cost claims removed. Fotile's category page is not in the top 23 (Ubersuggest, 19 Sep), so this was not a head-to-head |
| 2 | Combi and steam oven pillar, rewrite and merge steam terms | combi oven malaysia | Oct | Done 3 Oct | Brief: `docs/competitor-gap-combi-oven.md`. The copy named five retired models as on sale (VA01, Z4501, VA03, O755P and the A+ claim); guides, reasons, FAQs 1, 3 and 7, meta and intro rewritten for the four on sale, led by steam set for local cooking, in `category-content.sql`. Page at 17 for the head term (Ubersuggest, 9 Sep) |
| 3 | Kitchen hood pillar, rewrite and absorb the 18 hood posts | kitchen hood malaysia | Oct | Partly done | Brief: `docs/competitor-gap-kitchen-hood.md`. Done 3 Oct: decision 1, warranty line in the closing band (`warrantyLine` in `src/lib/warranty-terms.ts`, on every category it applies to); decision 3, article links repointed (`714c930`); decision 4, meta description led by measured pressure and noise (`category-content.sql`). Closed by the client on 3 Oct: no installation mention (decision 2) and no price bands (decision 5), so neither is built. Open: "absorb the hood posts" conflicts with the brief's finding that the article cluster is the site's generic asset; 25 hood-slugged articles still published |
| 6 | Price and cost sections on all five category pillars | kitchen hood malaysia price | Oct | Dropped 3 Oct | The client will not publish price bands. No price figure goes on any page; do not re-propose |
| 7 | Geo-signal fix: hreflang, Malaysia targeting, internal-link routing | technical | Oct | Done 3 Oct | www prefix no longer splits the index (`28e5d52`); canonicals on every page; article links pointed past the 301s (`714c930`); `<html lang>` per edition and reciprocal hreflang built from the editions that exist (`src/lib/alternates.ts`), gated by `pnpm i18n:check` |
| 14 | Cooker hob pillar, rewrite to pass Fotile's #16 | gas hob malaysia | Nov | Not started | `category-content.sql` unchanged for this page. Do it before or with N5 and N14, which link up to it |
| 15 | Induction vs ceramic hob, merge four posts into one | induction cooker vs ceramic cooker | Nov | Done 14 Sep | `refresh-articles-2026-09.sql`: merged into `which-is-better-induction-or-ceramic-cooker`, the other three unpublished and 301'd |
| 17 | Complete guide to oven symbols, merge five posts | oven symbols | Dec | Partly done | `oven-symbols-and-meanings` and `oven-symbol-for-baking` rewritten 14 Sep; the pizza, cookies and grill posts still stand as separate pages |
| 18 | Route the infrared gas stove cluster to the hob pillar | infrared gas stove | Dec | Done 15 Sep | `refresh-infrared-2026-09.sql`: three articles rewritten, one added, all routed to the M822G |
| 19 | Kitchen hood size and suction power, merge two posts into one | kitchen hood size | Dec | Not started | Was a new piece; moved here on 7 Oct because `what-hood-size-do-i-need` and `how-to-measure-suction-power` already cover it and a third page would compete with both. Merge, then translate in Phase 4 |
| 20 | Rework "What is not dishwasher safe" for commercial routing | dishwasher safe symbol | Dec | Not started | not among the ten refreshed on 14 Sep |
| 21 | Rework "How long to preheat oven" for intent and links | how long to preheat oven | Dec | Done 14 Sep | `refresh-articles-2026-09.sql` |
| 22 | Backlink push: 30 Malaysian directory, dealer and PR placements | authority | Dec | Not started | off-repo work; record placements here when they land |
| 23 | Recipe archive: prune, noindex or consolidate the 25 posts | housekeeping | Dec | Not started | 16 rows in `recipe` plus 23 recipe-titled articles, all published and indexable |

Old #4 and #5 are N1 and N2. Old #8 to #13 are N3, N4, N6, N7, N8 and N3's Malay edition. Old #16
is N11.

## Done outside the plan

Work since the workbook was compiled that it did not ask for but which serves the same end:

- Ten articles rewritten for the queries they already showed for, 14 September, including the
  ducted-or-ductless hood post that the workbook lists under "Defend".
- The kitchen hood competitor gap analysis, 14 September, which is the brief item 3 needs.
- Structured data for articles, recipes and category lists.
- A favicon, 18 September, so the brand mark shows beside every result.
- Malay and Chinese editions of the home page and the five category pages, 3 and 4 October
  (`docs/i18n.md` Phase 2). These are translations of existing pages, so they count toward neither
  list.

## Scorecard

New pieces, counted in URLs. Target 15 a month.

| | Pieces | URLs planned | URLs live | Done | Partly | Not started |
|---|---|---|---|---|---|---|
| Month 1, October | 5 | 13 | 7 | 3 | 0 | 2 |
| Month 2, November | 5 | 15 | 0 | 0 | 0 | 5 |
| Month 3, December | 5 | 15 | 0 | 0 | 0 | 5 |
| Quarter | 15 | 43 | 7 | 3 | 0 | 12 |

Improvements: 14 rows, 6 done, 2 partly done, 5 not started, 1 dropped.

October has 6 new URLs left (N4 and N5 in three languages).
