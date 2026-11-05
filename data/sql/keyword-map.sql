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

-- N4, kitchen exhaust fan or cooker hood (content schedule, October; replaced
-- Vatti vs Fotile on 2026-10-19). English target recorded in the article
-- header, see piece-n4-kitchen-exhaust-fan.sql.
INSERT INTO keyword_map (page, lang, keyword, secondary, volume, basis, source, pulled_on, note) VALUES
  ('article:kitchen-exhaust-fan-vs-cooker-hood', 'ms-MY', 'exhaust fan dapur', 'hood dapur', 110, 'volume',
   'Ubersuggest MY ms', '2026-10-19',
   'SD 20. The formal kipas ekzos dapur returns nothing: Malay searchers type the English loanword, as with cooker hood. The body says kipas ekzos once.'),
  ('article:kitchen-exhaust-fan-vs-cooker-hood', 'zh-MY', '厨房抽风机', '排风扇', NULL, 'competitor',
   'Firecrawl KL', '2026-10-19',
   'Nothing measures. Malaysian marketplace listings for wall and window fans are titled 抽风机 (Shopee MY); 排风扇 is the mainland term.');

-- N5, best gas hob (content schedule, October). English target recorded in the
-- article header, see piece-n5-best-gas-hob.sql.
INSERT INTO keyword_map (page, lang, keyword, secondary, volume, basis, source, pulled_on, note) VALUES
  ('article:best-gas-hob-malaysia', 'ms-MY', 'dapur gas terbaik', 'jenama dapur gas terbaik', 590, 'volume',
   'Ubersuggest MY ms', '2026-10-19',
   'SD 18; the secondary measures 110, SD 10. The Malay category page holds dapur gas, so this page leads on the choice. dapur gas tanam (140) marks it as built-in.'),
  ('article:best-gas-hob-malaysia', 'zh-MY', '煤气炉推荐', '煤气炉哪个牌子好', NULL, 'competitor',
   'Search Console sc-domain; Firecrawl KL', '2026-10-19',
   'The Chinese category page ranks 4.7 for 煤气炉 (377 impressions, 21 Jul to 19 Oct), so this page takes the 推荐 framing N3 used beside 抽油烟机. 嵌入式煤气炉 in the title marks it as built-in.');

-- N6, wet kitchen and dry kitchen (content schedule, November; replaced Vatti
-- vs Rubine on 2026-10-19). English target recorded in the article header, see
-- piece-n6-wet-dry-kitchen.sql.
INSERT INTO keyword_map (page, lang, keyword, secondary, volume, basis, source, pulled_on, note) VALUES
  ('article:wet-kitchen-vs-dry-kitchen', 'ms-MY', 'dapur basah', 'dapur kering', 390, 'volume',
   'Ubersuggest MY ms', '2026-11-05',
   'SD 20; dapur kering 110, SD 18. Left out: barang dapur basah (590) means wet groceries, and the ubahsuai/contoh dapur basah belakang rumah terms (320 to 390) are renovation intent, which the client ruled out. SERP is cabinet makers, PropertyGuru BM and Pinterest; none says which appliance goes where.'),
  ('article:wet-kitchen-vs-dry-kitchen', 'zh-MY', '干湿厨房', '湿厨房 干厨房', NULL, 'competitor',
   'Firecrawl KL', '2026-11-05',
   'Nothing measures. Malaysian pages rank with 湿厨房 vs 干厨房 (iproperty.com.my/zh, clickbina.com/zh, sivenzo.com/zh) and 干湿厨房 (fattinterior.com/zh, flashcast.com.my/zh); the title carries both.');

-- N9, what a steam oven is (content schedule, November). English target
-- recorded in the article header, see piece-n9-steam-oven.sql.
INSERT INTO keyword_map (page, lang, keyword, secondary, volume, basis, source, pulled_on, note) VALUES
  ('article:what-is-a-steam-oven', 'ms-MY', 'ketuhar stim', 'periuk kukus', NULL, 'competitor',
   'Ubersuggest MY ms; Search Console sc-domain', '2026-11-05',
   'Nothing measures: ketuhar stim and oven stim return no data. The Malay oven category page already carries Ketuhar Stim in its h1, so this page leads with the question Apa itu ketuhar stim. periuk kukus (590, SD 20) is the steamer pot buyers already own; it is a section, not the target, since VATTI does not sell one.'),
  ('article:what-is-a-steam-oven', 'zh-MY', '蒸烤箱有必要买吗', '蒸烤箱能做什么', NULL, 'competitor',
   'Firecrawl KL', '2026-11-05',
   'Nothing measures on Ubersuggest MY zh. The Chinese category page ranks 3 for 蒸烤箱 queries, so this page takes the buyer''s question, as the ranking Chinese guides title it (Zhihu, 蒸烤箱有必要买吗). Malaysian pages say 蒸烤箱 for a combi and 蒸箱 for steam only.');

-- N13, hot water dispenser (content schedule; moved into November on
-- 2026-11-05). English target recorded in the article header, see
-- piece-n13-hot-water-dispenser.sql.
INSERT INTO keyword_map (page, lang, keyword, secondary, volume, basis, source, pulled_on, note) VALUES
  ('article:hot-water-dispenser', 'ms-MY', 'water dispenser air panas', 'water dispenser with ro', 1000, 'volume',
   'Ubersuggest MY ms; Search Console sc-domain', '2026-11-05',
   'Measured as water dispenser hot, 1,000, SD 11; water dispenser with ro 210, SD 8. Malay searchers type the English term; dispenser air panas returns no data. The Search Console query berapa suhu air panas dispenser, on the Malay category page, is what the temperature section answers.'),
  ('article:hot-water-dispenser', 'zh-MY', '热水机', '饮水机', 210, 'volume',
   'Ubersuggest MY zh', '2026-11-05',
   'SD 61; 饮水机 1,000, SD 62. The Chinese category page targets 净水器 and carries 即热饮水机 (20) in its h1, so this page takes 热水机, which nothing of ours targets.');

-- N10, steamed fish (content schedule, November). English target recorded in
-- the article header, see piece-n10-steamed-fish.sql.
INSERT INTO keyword_map (page, lang, keyword, secondary, volume, basis, source, pulled_on, note) VALUES
  ('article:steamed-fish-recipe', 'ms-MY', 'resepi ikan stim limau', 'resepi ikan stim halia chinese style', 720, 'volume',
   'Ubersuggest MY ms', '2026-10-07',
   'SD 17; resepi ikan stim 390 (SD 15) and the halia chinese style term 390. The lime style carries the volume, so it is the first card and the featured image. Slug and title spell it resepi, as searched; the section folder is resipi.'),
  ('article:steamed-fish-recipe', 'zh-MY', '清蒸鱼', '蒸鱼', NULL, 'competitor',
   'Firecrawl KL', '2026-11-05',
   'Nothing measures on Ubersuggest MY zh (蒸鱼, 清蒸鱼, 港式蒸鱼). Malaysian Chinese recipes rank as 清蒸鱼 and 家常蒸鱼 (Lee Kum Kee Malaysia, SanTaste, Double Camel).');

-- N8, moist chocolate steamed cake (content schedule, November; swapped in
-- 2026-11-05). English target recorded in the article header, see
-- piece-n8-kek-kukus-coklat.sql.
INSERT INTO keyword_map (page, lang, keyword, secondary, volume, basis, source, pulled_on, note) VALUES
  ('article:moist-chocolate-steamed-cake', 'ms-MY', 'kek kukus coklat moist', 'resepi kek kukus', 8100, 'volume',
   'Ubersuggest MY ms', '2026-11-05',
   'SD 25. The schedule planned on resepi kek kukus (320, SD 22); the chocolate moist term is 25 times bigger. Also answered: kek kukus coklat 390, kek kukus milo 210, resepi kek kukus sukatan cawan 110. Slug and title spell it resepi, as searched.'),
  ('article:moist-chocolate-steamed-cake', 'zh-MY', '蒸巧克力蛋糕', '湿润巧克力蛋糕', NULL, 'competitor',
   'Firecrawl KL', '2026-11-05',
   'Nothing measures on Ubersuggest MY zh (蒸蛋糕, 马来糕). Malaysian bakers title it 蒸巧克力蛋糕 and 蒸润湿巧克力蛋糕 (Kathrine Kwa, TSL, Oriental Cuisine).');
