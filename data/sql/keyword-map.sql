-- The keyword map: which term each translated page targets, and why.
-- See the table comment in schema.sql and CLAUDE.md § Languages.
--
-- Volumes: Ubersuggest, Malaysia (locId 2458), language ms or zh, pulled
-- 2026-10-03. Competitor terms: Firecrawl searches from Kuala Lumpur the same
-- day, reading what ranking Malaysian sellers, dealers and brands write.
--
-- Two findings shape every row:
-- * Malay searchers often type the English loanword. `cooker hood` measures
--   2,900/month in the Malay data against 720 for `hood dapur`, and
--   `dishwasher` 5,400 against 140 for `mesin basuh pinggan`. The Malay page
--   leads with the Malay term (it is the Malay edition, and the Malay term's
--   SERP is the thin one) and carries the loanword in its title.
-- * Ubersuggest measures almost nothing in Chinese for Malaysia: 抽油烟机 390
--   and 净水器 320 are the only figures; 油烟机, 燃气灶, 煤气炉, 炉头, 洗碗机,
--   蒸烤箱, 蒸烤一体机, 嵌入式烤箱 and 厨房电器 all return nothing. So most
--   Chinese rows are competitor-based, which is what the brief says to do.
INSERT INTO keyword_map (page, lang, keyword, secondary, volume, basis, source, pulled_on, note) VALUES
  ('home', 'ms-MY', 'peralatan dapur', 'peralatan dapur terbina dalam', 880, 'volume',
   'Ubersuggest MY ms', '2026-10-03',
   '"kedai peralatan dapur near me" also 880: the dealer directory is the answer to that one.'),
  ('home', 'zh-MY', '厨房电器', '华帝', NULL, 'competitor',
   'Firecrawl KL', '2026-10-03',
   'No Chinese volume measured. Malaysian Chinese sellers (ltlglobal.com.my/cn, chenghuatgroup.com.my/cn) file the range under 厨房电器 / 厨房炊具.'),

  ('category:kitchen-hood-in-malaysia', 'ms-MY', 'hood dapur', 'cooker hood', 720, 'volume',
   'Ubersuggest MY ms', '2026-10-03',
   'cooker hood 2,900/mo and penyedut asap dapur 170/mo in the same data. Title carries both hood dapur and cooker hood. The Malay pillar article targets "jenis hood dapur" instead, so the two do not compete.'),
  ('category:kitchen-hood-in-malaysia', 'zh-MY', '抽油烟机', '油烟机', 390, 'volume',
   'Ubersuggest MY zh', '2026-10-03',
   '油烟机 returns no figure. Page one for 抽油烟机 马来西亚 is Lazada, Shopee, a SENZ video and Chinese supplier directories; no brand page.'),

  ('category:cooker-hob-in-malaysia', 'ms-MY', 'dapur gas', 'dapur gas tanam', 5400, 'volume',
   'Ubersuggest MY ms', '2026-10-03',
   'dapur gas covers portable stoves too (dapur gas portable 880). The built-in term, dapur gas tanam, measures 140 and hob dapur 110; the page leads with dapur gas and says built-in.'),
  ('category:cooker-hob-in-malaysia', 'zh-MY', '煤气炉', '燃气灶', NULL, 'competitor',
   'Firecrawl KL', '2026-10-03',
   'Malaysian sources write 煤气炉 / 煤气灶 / 燃气灶 with 嵌入式 (Fujioh MY on Facebook, ltlglobal.com.my, liveinmalaysia88). 炉头 appears mainly on Taobao. Not 炉头.'),

  ('category:combi-and-steam-oven-in-malaysia', 'ms-MY', 'ketuhar kombi', 'ketuhar stim', NULL, 'competitor',
   'Ubersuggest MY ms; Firecrawl KL', '2026-10-03',
   'ketuhar measures 1,300/mo but the series is mostly restaurant names (Ketuhar Kulim, Khaf by Ketuhar). ketuhar stim, oven stim, ketuhar terbina dalam return nothing. Malaysian brand pages write "combi oven" in English; the Malay page uses ketuhar kombi and carries combi oven.'),
  ('category:combi-and-steam-oven-in-malaysia', 'zh-MY', '蒸烤箱', '蒸烤一体机', NULL, 'competitor',
   'Firecrawl KL', '2026-10-03',
   'ROBAM Malaysia (robamliving.com) and Taobao Malaysia sell 嵌入式蒸烤箱; 蒸烤一体机 is the mainland manufacturer term.'),

  ('category:dishwasher-in-malaysia', 'ms-MY', 'mesin basuh pinggan', 'dishwasher', 140, 'volume',
   'Ubersuggest MY ms', '2026-10-03',
   'dishwasher 5,400/mo in the Malay data is the generic English term, a retailer SERP (see docs/competitor-gap-dishwasher.md). Title carries both.'),
  ('category:dishwasher-in-malaysia', 'zh-MY', '洗碗机', NULL, NULL, 'competitor',
   'Firecrawl KL', '2026-10-03',
   'Malaysian Chinese posts (liveinmalaysia88, leesharing.com) and Facebook groups all write 洗碗机.'),

  ('category:one-tap-purifier-in-malaysia', 'ms-MY', 'penapis air', 'dispenser air panas', NULL, 'competitor',
   'Ubersuggest MY ms', '2026-10-03',
   'penapis air returns 0 with every brand variant also 0, which reads as a data gap rather than no demand. The term every Malaysian brand uses.'),
  ('category:one-tap-purifier-in-malaysia', 'zh-MY', '净水器', NULL, 320, 'volume',
   'Ubersuggest MY zh', '2026-10-03',
   'coway 净水器 140/mo: the category is searched by brand.'),

  ('article:types-of-range-hoods', 'ms-MY', 'jenis hood dapur', 'cara memilih hood dapur', NULL, 'competitor',
   'Ubersuggest MY ms', '2026-10-03',
   'The Malay pillar (/ms/panduan-membeli/hood-dapur/). Leads on types and how to choose so it does not compete with the Malay category page for hood dapur.'),
  ('article:types-of-range-hoods', 'zh-MY', '抽油烟机怎么选', '抽油烟机种类', NULL, 'competitor',
   'Firecrawl KL', '2026-10-03',
   'SENZ Malaysia''s ranking video is titled 买油烟机必知贴士 / 要如何选择适合自己的油烟机: how-to-choose is the Chinese framing.'),

  ('article:which-is-better-ducted-or-ductless-range-hood', 'ms-MY', 'hood dapur tanpa tebuk dinding', 'cooker hood ductless', 110, 'volume',
   'Ubersuggest MY ms', '2026-10-03',
   'cooker hood ductless 210/mo in the Malay data.'),
  ('article:which-is-better-ducted-or-ductless-range-hood', 'zh-MY', '免打孔抽油烟机', '无烟管抽油烟机', NULL, 'competitor',
   'Firecrawl KL', '2026-10-03',
   'The Chinese name for a hood fitted without drilling the wall; ductless is 无烟管 / 内循环.');

-- N3, best kitchen hood guide (content schedule, October). Pulled 2026-10-07.
-- The English edition is new, so it has a row here too: keyword_map was
-- Malay and Chinese only, and an English row is what the schedule's new-piece
-- rule asks for. (lang allows ms-MY and zh-MY; English is recorded in the
-- article header comment instead, see piece-n3-best-kitchen-hood.sql.)
INSERT INTO keyword_map (page, lang, keyword, secondary, volume, basis, source, pulled_on, note) VALUES
  ('article:best-kitchen-hood-malaysia', 'ms-MY', 'cooker hood terbaik', 'hood dapur terbaik', 110, 'volume',
   'Ubersuggest MY ms', '2026-10-07',
   'hood dapur terbaik returned no figure on 2026-10-07 (the schedule''s 90 was an earlier pull). Malay searchers use the loanword here; the title carries both.'),
  ('article:best-kitchen-hood-malaysia', 'zh-MY', '抽油烟机推荐', '油烟机哪个牌子好', NULL, 'competitor',
   'Firecrawl KL', '2026-10-07',
   'Nothing measures. Malaysian brand pages rank with recommendation framing (ROBAM Living MY blog 最佳抽油烟机品牌, SENZ MY 如何选择适合自己的油烟机); mainland results use 推荐 and 哪个牌子好.');
