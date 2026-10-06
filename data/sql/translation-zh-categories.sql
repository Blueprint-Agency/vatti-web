-- The Chinese (zh-MY) edition of the five product category pages: the page
-- words (product_category_i18n), the "how to choose", "why VATTI" and FAQ
-- blocks (category_guide / category_reason / category_faq, lang 'zh-MY'), the
-- product cards on the grid (product_i18n) and the bullets the signature band
-- prints for each category's lead model (product_spec_i18n).
--
-- Translated row for row from category-content.sql and the current English
-- values in the built DB (later files override some of category-content.sql,
-- e.g. the signature intros and the dishwasher's lead model, which is the DWID3
-- since retired-products-2026-08.sql). Same category, same position, same
-- figure and icon on every row. Ids are resolved by slug; a slug that stops
-- resolving fails the build on NOT NULL here.
--
-- The name is load order, as with translation-ms-categories.sql: db-build.mjs
-- runs files outside its ORDER list alphabetically, and four published
-- products are inserted late (the DWID3 pair in product-images-2026-08.sql,
-- the V959 and VH-IC9-LA in new-products-2026-08.sql). An 'i18n-...' name
-- sorts before those and fails on a NULL product_id; 't' runs after them.
--
-- Simplified Chinese as written in Malaysia, not mainland. Term choices:
-- * Category names are fixed by src/i18n/zh.ts: 抽油烟机, 煤气炉, 蒸烤箱,
--   洗碗机, 净水器. Each page leads with its keyword_map term (keyword-map.sql)
--   in h1, seo_title and meta_description, and carries the secondary term
--   (油烟机, 燃气灶, 蒸烤一体机, 嵌入式) where it reads naturally.
-- * 煤气炉 for the hob, never 炉头 as the category name (炉头 is the Taobao
--   word). 炉头 is still used for a single burner, which is what it means.
-- * Ducted / ductless is 外排式 / 内循环; static pressure 静压; airflow 风量.
-- * Place setting is 套餐具; condo 公寓; high-rise 高楼; wok cooking 猛火炒锅,
--   wok hei 镬气; litres in prose 公升, but L where the English prints L.
-- * Brand: "VATTI 华帝" on first mention in a field, 华帝 or VATTI after.
-- * Series names and model codes stay in Latin letters exactly as the English
--   name has them ('Athena 系列', 'Flexi', 'One Tap', 'O7559' vs '07559').
--
-- Dropped or reworded on purpose (house rules for the translated editions: no
-- prices, no running-cost / energy / water-saving claims, no installation
-- arrangement):
-- * Hood FAQ 3 "Who should install a kitchen hood?" becomes "what to check when
--   it is installed": duct run, height and wiring, without saying who does it.
-- * Hood reason 4 loses "draws less power"; hood guide 4 loses "budget for
--   filter replacement" (filters still need changing, which stays).
-- * Hob reason 2 title loses "less wasted gas"; the 73% figure stays, as 热效率.
-- * Hob FAQ 6 loses "your installer will confirm it"; hob FAQ 10 keeps the
--   safety fact (a gas hob is fitted by a professional) and loses "the dealer
--   will arrange it", the dealer link kept as a place to ask.
-- * Dishwasher guide 6 loses "pre-rinsing is where the water goes".
-- * Purifier guide 6 ("Filters are the running cost") is retitled and loses
--   the budget and dealer-changes-the-first-filter clauses; guide 4 loses
--   "expensive"; FAQ 3 loses "use a professional installer"; FAQ 8 drops
--   "running cost"; FAQ 9 swaps filter cost for filter interval.
-- * The purifier's signature intro loses its last sentence (filter prices,
--   RM189 / RM499).
-- * The English hob seo_title and meta mention induction; the Chinese ones do
--   not, matching what category-content.sql says the page actually sells.

-- ── the five category pages ───────────────────────────────────────────────
INSERT INTO product_category_i18n
  (category_id, lang, slug, name, h1, seo_title, meta_description, intro_md, signature_image_alt) VALUES
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'zh-MY',
   'kitchen-hood-in-malaysia', '抽油烟机',
   '马来西亚抽油烟机：专为猛火炒锅而设，让家中告别油烟',
   '抽油烟机马来西亚 | VATTI 华帝油烟机',
   '马来西亚的 VATTI 华帝抽油烟机，每一款都以实测静压、噪音与风量公开比较。按您的猛火炒锅习惯和风管长度，挑选合适的油烟机。电机享 10 年保修。',
   '专为猛火炒锅与重油烹饪而设计，VATTI 华帝抽油烟机排烟强劲、隔油过滤出色、运行安静，适合马来西亚的住家、公寓与开放式厨房。',
   'VATTI 华帝 V929 抽油烟机吸走煤气炉上平底锅煎牛排冒起的蒸汽。'),

  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 'zh-MY',
   'cooker-hob-in-malaysia', '煤气炉',
   '马来西亚煤气炉：火力强劲、控火精准，为亚洲料理而生',
   '煤气炉马来西亚 | VATTI 华帝嵌入式燃气灶',
   'VATTI 华帝煤气炉在马来西亚：嵌入式燃气灶与电陶炉，专为亚洲猛火烹饪打造。比较主火功率、开孔尺寸与安全功能，找到适合您厨房的一款。',
   '为猛火炒锅和日常家常菜而设计，VATTI 华帝嵌入式煤气炉与电陶炉火力强劲、控火精准、安全保护完善，与厨房浑然一体。',
   'VATTI 华帝 C861G 煤气炉嵌在大理石台面上，拉丝灰玻璃面板与亮起的触控条，旁边是烤面包机、热水壶和砧板。'),

  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 'zh-MY',
   'combi-and-steam-oven-in-malaysia', '蒸烤箱',
   '马来西亚蒸烤箱：强劲、健康又智能的蒸烤烹饪',
   '蒸烤箱马来西亚 | VATTI 华帝嵌入式蒸烤一体机',
   'VATTI 华帝蒸烤箱在马来西亚：70L 嵌入式蒸烤一体机，一个腔体就能蒸、烤、空气炸，另有蒸饭与煮粥模式和三档蒸汽，专为常蒸常烤的家庭厨房而设。',
   '为蒸得和烤得一样多的家庭厨房而设计的嵌入式烤箱。三款全尺寸烤箱都能空气炸，其中两款是蒸烤箱，具备三档蒸汽和蒸饭、煮粥模式；另有一款 25L 嵌入式微波炉。',
   '一台 VATTI 华帝嵌入式蒸烤箱以平视高度嵌在深色胡桃木橱柜中，显示屏亮着，旁边是大理石墙面。'),

  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 'zh-MY',
   'dishwasher-in-malaysia', '洗碗机',
   '马来西亚洗碗机：卫生洁净，洗碗毫不费力',
   '洗碗机马来西亚 | VATTI 华帝嵌入式与独立式洗碗机',
   'VATTI 华帝洗碗机在马来西亚，提供 17 套和 20 套餐具容量：75°C 高温洗涤去除炒锅油污，UVC 紫外线杀菌，洗好的碗盘可保鲜存放长达七天。',
   '两款为大家庭而设的洗碗机，容量分别为 17 套和 20 套餐具。两款都以 75°C 洗涤去除烹饪油污，以 UVC 杀菌，并在潮湿的厨房里让洗好的碗盘保持干爽长达七天。',
   '一台 VATTI 华帝 DWBB7 洗碗机嵌在灰色橱柜中，门板放下，碗篮亮着灯，后方是大理石墙面。'),

  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 'zh-MY',
   'one-tap-purifier-in-malaysia', '净水器',
   '单龙头净水器与即热饮水机',
   '净水器马来西亚 | VATTI 华帝 One Tap 冷热净水器',
   '马来西亚 VATTI 华帝净水器：RO 反渗透膜加多级过滤，一个龙头就有冷水、常温、45°C 和 100°C 四种水温，主机装在水槽下方，台面不占位。',
   '按一下，就有安全干净的饮用水。VATTI 华帝单龙头净水系统结合 RO 反渗透膜过滤、多级净化与精准控温，日常使用方便省心。',
   '一台 VATTI 华帝 WDHG01 净水器和它的 V818WD 加热器放在大理石台面上，旁边水槽装着不锈钢 One Tap 龙头。');

-- ═══════════════════════════════════════════════════════════════════════════
-- KITCHEN HOOD
-- ═══════════════════════════════════════════════════════════════════════════
INSERT INTO category_guide (category_id, lang, position, heading, body_md, figure, figure_unit) VALUES
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'zh-MY', 1,
   '从每小时换气十次开始',
   '一般马来西亚厨房要做到每小时换气十次，大约需要 650 至 800 m³/h 的风量。本页每一款抽油烟机在无阻力状态下的额定风量都远高于此，所以单看风量，并不能告诉您该买哪一款。',
   '650-800', 'm³/h'),
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'zh-MY', 2,
   '静压才是分出高下的关键',
   '风量是在没有任何阻挡的情况下测得的。静压则是空气爬上竖管、转过两个弯之后还剩下的力道。风管短、直通外墙：静压较低的型号就够用。住高楼，或风管要穿过天花板走很长一段：请选静压最高的那一档。',
   '420-1,700', 'Pa'),
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'zh-MY', 3,
   '大楼允许，就选外排式',
   '外排式抽油烟机把油烟、蒸汽和油脂直接排到室外，不会再送回厨房。对猛火炒锅来说，这是更有效的做法；只要风管能通到外墙，就选它。',
   NULL, NULL),
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'zh-MY', 4,
   '不允许外排，就选内循环',
   '内循环抽油烟机把空气过滤后送回室内。在不准开外排孔的地方，这是实际可行的选择。滤网需要定期更换，而热气和湿气也会留在厨房里。',
   NULL, NULL),
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'zh-MY', 5,
   '公寓厨房选纤薄或隐藏式',
   '纤薄或隐藏式抽油烟机的抽力与烟囱式不相上下，却不会抢占整个空间。隐藏式机身平嵌在煤气炉上方的橱柜里，开放式中岛厨房的视线因此保持通透。',
   NULL, NULL),
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'zh-MY', 6,
   '按炉面宽度选尺寸，不是按墙面',
   '抽油烟机至少要和煤气炉一样宽，否则无论电机多强，油烟都会从两边逸出。宽度对齐煤气炉；如果尺寸刚好介于两款之间，就选大的那一款。',
   NULL, NULL);

INSERT INTO category_reason (category_id, lang, position, title, body_md, figure, figure_unit, icon) VALUES
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'zh-MY', 1,
   '风量之外，更看静压',
   '风量负责把油烟抽走，静压则让风管转弯、爬升、拉长之后依然抽得动。全系列静压最高达 1,700 Pa，住高楼也不必将就。',
   '1,700', 'Pa', 'airflow'),
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'zh-MY', 2,
   '层层拦截油脂',
   '较高端的型号油脂分离率高达 92%。PM2.5 型号在隔油之后再加一道空气净化，排出厨房的空气比单靠滤网更干净。',
   '92', '%', 'filtration'),
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'zh-MY', 3,
   '风量大，声音却小',
   '全系列实测噪音介于 46.5 dB 至 54 dB 之间。这来自气动风道设计与电机隔音，而不是靠缩小风机：这里最安静的抽油烟机，同时也是抽力最强的之一。',
   '46.5', 'dB', 'noise'),
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'zh-MY', 4,
   '无刷电机',
   'BLDC 无刷电机在较低转速下依然保持吸力，用久了也一样安静。在上方的产品列表按电机筛选，就能看到哪些型号配备。',
   NULL, NULL, 'motor'),
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'zh-MY', 5,
   '高温自动清洗',
   '高温蒸汽与涡轮清洗程序，在油脂凝固之前就把它从腔壁上冲掉。抽油烟机用到第三年吸力变弱，原因几乎都是油垢，很少是电机。',
   NULL, NULL, 'clean'),
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'zh-MY', 6,
   '满手是油也能操作',
   '挥一挥手就能操作，不必碰面板。部分型号还支持 WiFi 并可与煤气炉联动，抽力随火力调整，煮完后自动关机。',
   NULL, NULL, 'controls');

INSERT INTO category_faq (category_id, lang, position, question, answer_md) VALUES
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'zh-MY', 1,
   '哪一种抽油烟机比较好？',
   '要强力排烟，壁挂式和岛式是常见的选择。在马来西亚厨房里，更关键的问题是外排还是内循环：只要大楼允许，排到室外总比循环回室内好。我们的[外排与内循环指南](/buying-guide/which-is-better-ducted-or-ductless-range-hood/)说明两者各自适合的情况。'),
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'zh-MY', 2,
   '选购抽油烟机要注意什么？',
   '吸力、静压、噪音，以及至少与煤气炉同宽的机身。挥手感应和自动清洗排在这四点之后。我们的[抽油烟机选购指南](/buying-guide/types-of-range-hoods/)会按顺序逐一说明。'),
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'zh-MY', 3,
   '安装抽油烟机时要注意什么？',
   '风管走向、安装高度和电源布线，都会影响抽油烟机的实际表现。安装前先确认好这三点，抽油烟机才能发挥应有的吸力。'),
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'zh-MY', 4,
   '抽油烟机能去除异味吗？',
   '可以。隔油网拦下油脂，气流把气味一并带走。具备 PM2.5 净化与除味功能的型号效果更好，V938 和 V960 的除味率高达 97%。'),
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'zh-MY', 5,
   '抽油烟机的吸力多少才够？',
   '目标是让厨房空气每小时至少换气十次，一般厨房大约需要 650 至 800 m³/h。这里每一款都轻松超过这个数字，所以请用静压来比较。'),
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'zh-MY', 6,
   '什么是智能抽油烟机？',
   '具备挥手感应、定时关机，高端型号还有 WiFi 和与煤气炉自动联动的抽油烟机。火开大时，它会自动提高风速；关火后还会继续运转几分钟。'),
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'zh-MY', 7,
   '抽油烟机都很吵吗？',
   '不是。噪音取决于电机与风道设计，比较时要看实测的 dB 数值，而不是宣传字眼。45 至 55 dB 之间的抽油烟机，煮饭时照样可以正常交谈。'),
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'zh-MY', 8,
   '华帝哪一款抽油烟机最安静？',
   '[Aetheris V929](/vatti-aetheris-series-cooker-hood-v929/)，噪音 46.5 dB，同时以 3,125 m³/h 的风量跻身全系列抽力最强之列。其次是 [Stellar V960](/vatti-stellar-series-cooker-hood-v960/) 和 [Hidden V938](/vatti-hidden-series-range-hood-v938/)，都是 48 dB，抽力还要更强。'),
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'zh-MY', 9,
   '我需要多大的抽油烟机？',
   '至少与煤气炉同宽。抽油烟机比炉面窄，再强的抽力也挡不住油烟从两边逸出，所以拿不定主意时，就选大一号的机身。'),
  ((SELECT id FROM product_category WHERE slug = 'kitchen-hood-in-malaysia'), 'zh-MY', 10,
   '抽油烟机能用多久？',
   '保养得当，可用十至十五年。按时[清洗滤网](/tips-tricks/how-to-clean-kitchen-hood-filter/)，并定期启动自动清洗：让吸力变弱的是油垢积聚，而不是机件磨损。');

-- ═══════════════════════════════════════════════════════════════════════════
-- COOKER HOB
-- ═══════════════════════════════════════════════════════════════════════════
INSERT INTO category_guide (category_id, lang, position, heading, body_md, figure, figure_unit) VALUES
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 'zh-MY', 1,
   '从火力开始看',
   '马来西亚的家常菜是猛火料理，炉火的额定功率决定炒锅能不能烧到够热。本页煤气炉的主火功率从 3.8 kW 到 6 kW。4.8 kW 以上，火力足以让整盘快炒保持镬气；低于这个数字，适合以煮汤、慢炖为主的家庭。',
   '3.8-6', 'kW'),
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 'zh-MY', 2,
   '量开孔，不是量炉子',
   '煤气炉是要装进一个已经存在的开孔，所以台面开孔比任何规格都更能决定哪些型号装得下。两款 Flexi 煤气炉适用宽 650 至 710 mm、深 350 至 400 mm 的开孔，因此能直接放进原本为其他品牌切好的台面。',
   '650-710', 'mm'),
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 'zh-MY', 3,
   '炒锅，还是要用煤气',
   '煤气一转旋钮就有反应，从大火到小火瞬间切换，停电时照样能用。只要会炒菜，煤气仍是正确的选择；这里十一款中有九款是煤气炉。',
   NULL, NULL),
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 'zh-MY', 4,
   '电陶炉，要的是平整台面',
   '电陶炉加热均匀、没有明火，整个表面平整，一抹就干净。每个炉区最高 2,200 W，配备触控操作和余热提示。适合烹饪节奏较慢的厨房，或没有煤气接口的地方。',
   NULL, NULL),
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 'zh-MY', 5,
   '不用您操心的安全保护',
   '这里每一款煤气炉都配有熄火保护装置，火一熄就切断煤气。多数型号的旋钮另设童锁，较新的型号还有防干烧和过热自动断气，以及炉上无锅时自动熄火的感应器。电陶炉则配备童锁、过热断电和余热提示。',
   NULL, NULL),
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 'zh-MY', 6,
   '玻璃面还是不锈钢面',
   '钢化玻璃易于擦拭，适合现代厨房；C836G 另加纳米涂层，油污更容易擦掉。不锈钢更耐热、耐碰撞，所以 Professional C720S 采用不锈钢打造。多数型号配有铸铁锅架，稳稳托住装满食材的炒锅。我们的[煤气炉选购指南](/buying-guide/glass-vs-stainless-gas-hob-which-gas-hob-are-best/)会完整分析两者的取舍。',
   NULL, NULL);

INSERT INTO category_reason (category_id, lang, position, title, body_md, figure, figure_unit, icon) VALUES
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 'zh-MY', 1,
   '以千瓦计的火力',
   '全系列最高火力是 C830G 主火的 6 kW，九款煤气炉中有七款达 4.8 kW 或以上。这样的火力能让炒锅迅速升温并保持高温，而这正是马来西亚厨房里煤气炉的本分。',
   '6', 'kW', 'power'),
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 'zh-MY', 2,
   '多环火焰，热力更集中',
   '内外两圈火焰把热力铺满整个锅底，而不是集中在中间一点。C836G 凭这一设计公布 73% 的热效率，也是全系列唯一公布这项数字的煤气炉。',
   '73', '%', 'heat'),
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 'zh-MY', 3,
   '安全是标配，不是升级',
   '每个煤气炉头都有熄火保护，火一熄就立即切断供气。防干烧、过热断气、无锅感应和带童锁的旋钮分布在全系列，两款电陶炉另有过热保护和余热提示。',
   NULL, NULL, 'safety'),
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 'zh-MY', 4,
   '为擦拭而设计的台面',
   '全系列大多采用钢化玻璃，C836G 加上纳米涂层，Professional C720S 则用高级不锈钢。C861G 更进一步，炉头可以翻起收好，台面上没有任何需要绕着擦的地方。',
   NULL, NULL, 'clean'),
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 'zh-MY', 5,
   '定时烹煮，让您腾出手来',
   'C822G、C830G 和 C835G 配备 99 分钟独立定时，AI 煤气炉有八档火力调节，C861G 则有爆炒、煎、烤、煮四种预设模式。',
   NULL, NULL, 'smart'),
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 'zh-MY', 6,
   '一点即着',
   'M822G 和 C836G 零秒点火；台面后方没有插座的厨房，可选电子或电池点火；两款电陶炉则是全触控面板。',
   NULL, NULL, 'controls');

INSERT INTO category_faq (category_id, lang, position, question, answer_md) VALUES
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 'zh-MY', 1,
   '煤气炉应该装在哪里？',
   '装在通风良好的位置，四周留出放锅和站人煮食的空间。避开风口，并在正上方装一台[抽油烟机](/kitchen-hood-in-malaysia/)，让油烟有地方去。'),
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 'zh-MY', 2,
   '我需要多大的煤气炉？',
   '60 厘米适合基本烹饪，70 厘米在尺寸与台面空间之间取得平衡，90 厘米适合大厨房。购买前先量好台面开孔：Flexi 型号适用宽 650 至 710 mm 的开孔，大多数现有开孔都装得下。'),
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 'zh-MY', 3,
   '煤气炉可以用多久？',
   '保养得当，可用十至十五年。炉头和点火器都是可维修的零件，所以整台煤气炉很少会一起坏掉。保持炉头盖清洁、出火孔畅通，它会比厨房本身还耐用。'),
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 'zh-MY', 4,
   '玻璃面和不锈钢面煤气炉，哪个比较好？',
   '玻璃面更美观，也更快擦干净。不锈钢更耐热、耐刮，是两者中更耐用的一种。我们的[煤气炉选购指南](/buying-guide/glass-vs-stainless-gas-hob-which-gas-hob-are-best/)有详细比较。'),
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 'zh-MY', 5,
   '选购煤气炉要注意什么？',
   '火力、开孔尺寸、炉头数量、操作方式和安全功能。按这个顺序来看：光是火力和尺寸，就能先排除大部分型号。如果还在煤气和电之间犹豫，我们的[电磁炉与电陶炉指南](/buying-guide/which-is-better-induction-or-ceramic-cooker/)会讲解电炉这一边。'),
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 'zh-MY', 6,
   '煤气炉离窗户要多远？',
   '一般至少 100 cm，这样通风才顺畅，风也不会把火吹熄。'),
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 'zh-MY', 7,
   '哪种煤气炉比较容易清洁？',
   '玻璃面，因为表面平整，溢出来的汤汁只停在上面。[C836G](/vatti-flexi-hob-c836g/) 加上纳米涂层，油污不易附着；[C861G](/vatti-magic-series-cooker-hob-c861g/) 的炉头可以翻起，一抹到底。'),
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 'zh-MY', 8,
   '为什么煤气炉煮的菜更好吃？',
   '因为火力反应即时。旋钮一转，火焰马上由大变小，煎封和炒锅都靠这一点。我们的[电磁炉与煤气炉比较](/buying-guide/induction-cooker-vs-gas-stove/)把两者并列分析，[红外线煤气炉指南](/buying-guide/is-an-infrared-gas-stove-worth-it/)则介绍那种烧得通红、把更多热力送进炒锅的炉头。'),
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 'zh-MY', 9,
   '怎样让煤气炉发挥得更好？',
   '锅要配炉：小锅放在 6 kW 的炉头上，大部分热力都会沿着锅边散走。清洁炉头盖、保持出火孔畅通，并用定时功能代替盯着时钟。'),
  ((SELECT id FROM product_category WHERE slug = 'cooker-hob-in-malaysia'), 'zh-MY', 10,
   '我可以自己安装煤气炉吗？',
   '煤气炉不行。煤气炉必须由专业人员安装，自行安装不安全，也可能导致保修失效。有任何疑问，可以先向[授权经销商](/store-locations/)咨询。');

-- ═══════════════════════════════════════════════════════════════════════════
-- COMBI AND STEAM OVEN
-- ═══════════════════════════════════════════════════════════════════════════
INSERT INTO category_guide (category_id, lang, position, heading, body_md, figure, figure_unit) VALUES
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 'zh-MY', 1,
   '马来西亚厨房要的是会蒸的烤箱',
   '大多数烤箱是围绕烘焙设计的，而这里的家常菜大多是蒸出来的：米饭、鱼、包子、各式糕点，还有隔夜菜回蒸也不变干。VA05 和 VA06 都有低、中、高三档蒸汽，也都有蒸饭模式。VA06 另有多菜同蒸模式和三种炖煮模式：煮粥、炖肉、煲汤。',
   '3', '档蒸汽'),
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 'zh-MY', 2,
   '热风、蒸汽，或两者同时',
   '热风对流让食物外皮酥脆、均匀上色；蒸汽锁住水分，让食物保持嫩滑。蒸烤箱可以单独使用其中一种，也能两者并用：VA06 可以蒸烤、蒸焗，VA05 有两种组合功能。所以同一个腔体，星期天烤全鸡，星期一蒸鱼。',
   NULL, NULL),
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 'zh-MY', 3,
   '三款全尺寸烤箱与一款微波炉',
   '三款烤箱容量为 70 公升（VA05 和 VA06）和 75 公升（O7559），一家人的烤肉和配菜可以一次放进去。M626 是 25L 嵌入式微波炉，带烧烤功能，用来翻热和快速烹煮，而不是烘焙。全系列没有小型烤箱，所以请先量好橱柜开孔再挑选，而不是买了才量。',
   '70-75', 'L'),
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 'zh-MY', 4,
   '已经装进墙里的空气炸锅',
   '三款烤箱都能空气炸，利用烤箱原有的风扇和发热管，少油甚至无油就把食物烤得酥脆。O7559 附带专用空气炸烤架，VA05 有空气炸功能，VA06 则有两种空气炸模式。如果家里爱吃炸物又不想油炸，台面上就能少放一台电器。',
   NULL, NULL),
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 'zh-MY', 5,
   '只算您真正会用的功能',
   '这里的烤箱有 9 至 12 种烹饪功能。多不一定好：一个从来不选的第二烘焙模式，远不如一个能把米饭翻热而不变干的蒸汽设定。先想好一周会用到的三种功能，再按这三种来挑。VA05 和 VA06 另有 68 道自动菜单，留给不想动脑筋的日子。',
   '9-12', '种功能'),
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 'zh-MY', 6,
   '蒸烤箱需要您做什么',
   '蒸汽部分由水箱供水，VA06 的水箱是 1.3 公升，加水是使用的一部分；蒸汽系统也要按说明书的周期除垢，水质较硬的地方要更勤。作为回报，VA05 和 VA06 会自己清洁：蒸汽清洁程序先软化腔壁上的污垢，再以加热烘干程序让腔体保持干爽，不会湿漉漉。',
   NULL, NULL);

INSERT INTO category_reason (category_id, lang, position, title, body_md, figure, figure_unit, icon) VALUES
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 'zh-MY', 1,
   '热风与蒸汽，同在一个腔体',
   '热风让外皮酥脆，可控的蒸汽让内里湿润，需要时两者并用。在 VA05 和 VA06 上，这只是一台电器、橱柜里一个开孔、一个需要清洁的地方，却同时做了烤箱和蒸炉的工作。',
   NULL, NULL, 'heat'),
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 'zh-MY', 2,
   '蒸汽由您设定，不靠运气',
   'VA05 有三档蒸汽，VA06 有三档湿度，娇嫩的鱼和一盘包子可以用不同的蒸汽量。两款都有双温控，同时把烤箱上下层的温度分开调节。',
   '3', '档蒸汽', 'water'),
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 'zh-MY', 3,
   '还能煮饭、煮粥、做酸奶',
   '两款蒸烤箱都能蒸饭、发面、做酸奶、保温和解冻。VA06 另有煮粥、炖肉、煲汤模式。原本要电饭锅、慢炖锅和蒸炉分别完成的工作，一个腔体就搞定。',
   NULL, NULL, 'controls'),
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 'zh-MY', 4,
   '68 道菜单，用不用随您',
   'VA05 和 VA06 内置 68 道自动菜单，VA05 还有在烹煮途中自动切换的多段蒸汽程序。可以用菜单，也可以自己设定，两者都在同一个面板上。',
   '68', '道菜单', 'smart'),
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 'zh-MY', 5,
   '蒸汽清洁，再自行烘干',
   'VA05 和 VA06 有两种自动清洁功能：先以蒸汽软化腔壁上的污垢，再加热把腔体烘干，不会留下湿气。O7559 采用易擦拭的搪瓷内腔，M626 也有自己的自动清洁功能。',
   NULL, NULL, 'clean'),
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 'zh-MY', 6,
   '站在旁边也安心的炉门',
   '三款烤箱都采用三层玻璃炉门，外层保持低温，家里有小孩时开门也放心。O7559 的炉门无需工具即可拆下清洗。',
   '3', '层玻璃', 'safety');

INSERT INTO category_faq (category_id, lang, position, question, answer_md) VALUES
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 'zh-MY', 1,
   '什么时候会用到蒸烤箱？',
   '凡是会用烤箱的时候，再加上原本要用蒸炉的时候。它能烘、烤、焗、蒸，涵盖厨房一周里对烤箱的大部分需求，从烤全鸡到蒸鱼、蒸饭都行。'),
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 'zh-MY', 2,
   '嵌入式蒸烤箱可以用多久？',
   '保养得当，可用八至十年。按时为蒸汽系统除垢是大家最常忽略的一步，而它正是决定能用八年还是十年的关键。'),
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 'zh-MY', 3,
   '蒸烤箱就是蒸箱吗？',
   '它包含了蒸箱。蒸烤箱可以单独或同时使用干热对流与蒸汽，所以专用蒸箱能做的它都能做，还能烘焙。[VA05](/built-in-combi-oven-va05/) 和 [VA06](/vatti-magic-series-combi-oven-va06/) 都是蒸烤箱；华帝目前的产品系列没有纯蒸箱。'),
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 'zh-MY', 4,
   '蒸烤箱可以当空气炸锅用吗？',
   '一般不行，但这里有两款可以。[VA05](/built-in-combi-oven-va05/) 和 [VA06](/vatti-magic-series-combi-oven-va06/) 除了烘焙和蒸汽功能，都有空气炸模式，O7559 也附带专用空气炸烤架。'),
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 'zh-MY', 5,
   '嵌入式蒸烤箱的温度范围是多少？',
   '蒸烤箱一般大约从 85°C 到 275°C，低温可以发面，高温可以烤肉。具体数值请查看您所看型号的产品页面。'),
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 'zh-MY', 6,
   '蒸烤箱需要怎样保养？',
   '定期清洁、为蒸汽系统除垢，并检查炉门密封条。以马来西亚的水质，每三至六个月除垢一次最合适。'),
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 'zh-MY', 7,
   '蒸烤箱需要加水吗？',
   '蒸汽功能需要用水。这些型号自带水箱，不必接驳水管，VA06 的水箱是 1.3 公升，所以加水是使用蒸汽功能的一部分。'),
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 'zh-MY', 8,
   '热风烤箱和蒸烤箱有什么不同？',
   '热风烤箱只循环干热空气。蒸烤箱再加上蒸汽，这就是翻热的菜不会变干、烤肉外脆内嫩的原因。我们的[蒸烤箱指南](/buying-guide/what-is-a-combi-oven/)有完整介绍，[烤箱符号与含义](/tips-tricks/oven-symbols-and-meanings/)则解释每个模式图标的作用。'),
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 'zh-MY', 9,
   '蒸烤箱煮得比较快吗？',
   '通常是的。蒸汽传热比干空气更有效率，所以蒸烤程序往往比单用热风更快达到同样的效果。'),
  ((SELECT id FROM product_category WHERE slug = 'combi-and-steam-oven-in-malaysia'), 'zh-MY', 10,
   '蒸烤箱需要预热吗？',
   '需要。凡是成败取决于食物放进去那一刻温度的料理都要预热，也就是大部分烘焙和所有烤肉。自动菜单会把预热纳入程序。我们的[烤箱预热要多久](/tips-tricks/how-long-to-preheat-oven/)指南按温度列出所需时间。');

-- ═══════════════════════════════════════════════════════════════════════════
-- DISHWASHER
-- ═══════════════════════════════════════════════════════════════════════════
INSERT INTO category_guide (category_id, lang, position, heading, body_md, figure, figure_unit) VALUES
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 'zh-MY', 1,
   '按一餐的份量选，不是按厨房大小',
   '一套餐具大约是一个人一餐所用的碗盘。两款 VATTI 华帝洗碗机都是大容量机型：DWBB7 可放 17 套，DWID3 可放 20 套外加一个蔬果篮。华帝把 DWID3 满载算作 130 件，其中包括十八个饭碗、九个面碗和 36 双筷子。这适合四人或以上的家庭，或常请客吃饭的人家，一天洗一次。一两个人的话，小型洗碗机更合适，而华帝没有生产小型机。',
   '17-20', '套餐具'),
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 'zh-MY', 2,
   '高温才能洗掉炒锅油',
   '两款都以 75°C 洗涤。这么热的水能把油从碗盘上带走，而不是推来推去；这个温度手也受不了，所以手洗无论刷多久都比不上。之后 DWBB7 以 110°C 热风烘干，DWID3 以 105°C 烘干，碗盘拿出来没有抹布痕迹。',
   '75', '°C'),
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 'zh-MY', 3,
   '潮湿厨房里，两次洗涤之间保持干爽',
   '洗碗机关着门又湿漉漉，就是异味的来源，而马来西亚的厨房处处给它机会。洗完后，两款都会持续通风长达 168 小时。DWID3 每三小时换一次气，同时开启 UVC 灯，所以洗好的碗盘关着门放在里面，也能保鲜长达七天。',
   '7', '天'),
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 'zh-MY', 4,
   '不只洗碗盘，也洗锅',
   '亚洲料理弄脏的锅不比碗盘少，所以先看下层碗篮，再看程序列表。DWID3 下层的支架可以折平，一次放进最多四个锅；手柄一拉，碗篮下降，可容纳高达 30 cm 的锅。DWBB7 则有重油程序和大件物品程序。',
   NULL, NULL),
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 'zh-MY', 5,
   '嵌入式还是独立式',
   '嵌入式洗碗机装进橱柜，外观最整齐，所以新建或装修厨房时就该规划进去。DWID3 是全嵌入式，宽 60 cm，适用 600 x 780 x 580 mm 的橱柜开孔，请先量好开孔再选择，而不是买了才量。独立式洗碗机则只要有水源、排水口和插座，放哪里都可以。',
   NULL, NULL),
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 'zh-MY', 6,
   '装满再洗，刮掉残渣不必冲洗',
   '洗碗机要满载才最能发挥价值。把碗盘里的残渣刮进垃圾桶，不必先在水龙头下冲洗。遇到等不到满载的日子，两款都能只用上层或下层碗篮进行半载洗涤。DWID3 还会自动投放洗涤剂，储液盒加满一次约可用两星期。',
   NULL, NULL);

INSERT INTO category_reason (category_id, lang, position, title, body_md, figure, figure_unit, icon) VALUES
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 'zh-MY', 1,
   '二十套餐具的容量',
   'DWID3 在 150 L 的内胆里可放 20 套餐具外加一个蔬果篮，DWBB7 可放 17 套。大家庭一天的碗盘，或一顿请客饭，一次洗完。',
   '20', '套餐具', 'clean'),
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 'zh-MY', 2,
   '75°C 洗涤，最高 110°C 烘干',
   '够热，能把烹饪油从碗盘上洗掉；也够热，能烘干而不留抹布痕迹。两款都有独立烘干，手洗过的碗盘或一批奶瓶也能直接烘干，不必再洗一次。',
   '75', '°C', 'heat'),
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 'zh-MY', 3,
   '杀菌之后，持续保持',
   '高温洗涤、热风烘干，再加上 UVC 紫外线灯，华帝标示 DWID3 的杀菌率高达 99.9%。之后最长 168 小时通风，洗好的碗盘干爽地等您取用，而不是闷在湿气里。',
   '168', '小时', 'safety'),
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 'zh-MY', 4,
   '无刷电机与 55,000 Pa',
   '两款都采用 BLDC 无刷电机，在较低转速下维持喷淋压力。DWID3 用它驱动最高 55,000 Pa 的变压水泵，通过两支伸缩喷臂洗到内胆的四个角落，而不只是中间的一圈。',
   '55,000', 'Pa', 'motor'),
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 'zh-MY', 5,
   '蔬果、玩具和奶瓶都有专属程序',
   '除了日常程序，两款都有蔬果、儿童玩具和奶瓶专用程序，以及清洁机身本身的自洁程序。DWBB7 共有八个程序；DWID3 有六个主程序，App 里另有四个。',
   NULL, NULL, 'water'),
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 'zh-MY', 6,
   'DWID3 会照顾自己',
   '按脏污程度自动投放洗涤剂，储液盒可用两星期；排水完毕自动密封；两个水泵让底部不留积水；23 英寸触控面板，同样的操作也能在 VATTI App 上完成。',
   NULL, NULL, 'smart');

INSERT INTO category_faq (category_id, lang, position, question, answer_md) VALUES
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 'zh-MY', 1,
   '在马来西亚家庭，洗碗机值得买吗？',
   '对于四人或以上、几乎天天用油煮食的家庭，值得。它以 75°C 洗涤，这是手洗做不到的，所以油腻的碗盘洗得更干净，同时完成消毒，也把每餐饭后站在水槽前的时间还给您。一两个人又常在外吃饭的话，就比较难说值得。详细分析请看[洗碗机值得买吗](/buying-guide/is-a-dishwasher-worth-it/)。'),
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 'zh-MY', 2,
   '我需要多少套餐具的容量？',
   '大约每人每餐一套，再留些空间放锅。两款华帝洗碗机都为大家庭而设：DWBB7 是 17 套，DWID3 是 20 套，华帝把满载算作 130 件。对多数大家庭来说，一天洗一次就够。'),
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 'zh-MY', 3,
   '洗碗机能洗干净炒锅的油腻碗盘吗？',
   '能，而且比手洗更干净。75°C 的水、洗碗机专用洗涤剂加上强力程序，分解烹饪油的效果远胜温水和海绵。先把残渣刮掉，不需要冲洗。'),
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 'zh-MY', 4,
   '洗碗机可以洗锅吗？',
   '大部分可以。不锈钢锅放在下层碗篮；DWID3 的支架可以折平放进最多四个锅，碗篮还能下降，容纳 30 cm 高的锅。铸铁锅、木柄锅，以及厂商注明要手洗的锅，都不要放进去：请看[哪些东西不能放进洗碗机](/tips-tricks/what-is-not-dishwasher-safe/)。'),
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 'zh-MY', 5,
   '马来西亚厨房适合嵌入式还是独立式？',
   '厨房正在新建或装修，就选嵌入式：它融入橱柜，在同样的空间里提供最大的容量。厨房已经装好、腾不出一个柜位，就选独立式，只要有水源、排水口和插座就行。'),
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 'zh-MY', 6,
   '洗碗机能杀菌吗？',
   '主要靠高温：75°C 洗涤，再以 105°C（DWID3）或 110°C（DWBB7）烘干。两款在洗涤后都会开启 UVC 紫外线灯，破坏细菌的 DNA，使其无法繁殖；华帝标示 DWID3 的杀菌率高达 99.9%。这是物理杀菌，碗盘上不会残留化学物质。'),
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 'zh-MY', 7,
   '洗好的碗盘留在机里会有异味吗？',
   '这两款不会。洗完后两款都会持续通风长达 168 小时，DWID3 还会定时开启 UVC 灯，所以留在里面的碗盘可以保持干爽清新长达七天。至于等晚上才洗的脏碗盘，那是另一回事：请看[脏碗盘隔夜放在洗碗机里](/tips-tricks/dishes-in-the-dishwasher-overnight/)。'),
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 'zh-MY', 8,
   '每天用洗碗机可以吗？',
   '可以，这两款本来就是为每天使用而设计的。保持滤网清洁，每一两个月运行一次自洁程序，天天用也不会缩短寿命。DWID3 排水时会自动冲洗滤网，App 也会提醒您该做自洁了。'),
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 'zh-MY', 9,
   '洗碗机可以洗蔬果吗？',
   '这两款可以，都有蔬果程序。DWID3 的蔬果程序以软水洗 26 分钟，并附有专用篮子，华帝测得可去除 95% 的农药残留。葡萄和莓果会以轻柔的翻滚方式清洗，而不是强力冲刷。'),
  ((SELECT id FROM product_category WHERE slug = 'dishwasher-in-malaysia'), 'zh-MY', 10,
   '洗碗机一般可以用多久？',
   '十至十五年，视使用频率和滤网保养而定。我们的[洗碗机选购指南](/buying-guide/is-a-dishwasher-necessary/)介绍购买前该注意的事项。');

-- ═══════════════════════════════════════════════════════════════════════════
-- ONE TAP WATER PURIFIER
-- ═══════════════════════════════════════════════════════════════════════════
INSERT INTO category_guide (category_id, lang, position, heading, body_md, figure, figure_unit) VALUES
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 'zh-MY', 1,
   '一个龙头，四种水温',
   '冷水直接喝，还有常温、45°C，以及泡茶、冲咖啡、泡面用的 100°C。45°C 不是随口说的“温水”：它正是冲泡婴儿奶粉的温度，也是家中有婴儿的家庭买它的原因。',
   '45-100', '°C'),
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 'zh-MY', 2,
   '水量够大，可以装满一锅',
   '龙头出水量每分钟 1.5 公升，装满一公升的水壶大约四十秒。厨房能拿它来煮饭煮汤，还是只能倒一杯水，差别就在这里。',
   '1.5', 'L/min'),
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 'zh-MY', 3,
   'RO 反渗透能去除什么',
   'RO 把水压过一层极细的薄膜，拦下重金属、氯和溶解性固体。它也会一并去除部分天然矿物质，这是这种过滤方式的正常现象，并不会让水变得不安全。',
   NULL, NULL),
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 'zh-MY', 4,
   '薄膜前面的几道过滤',
   'VPC 系统在 RO 膜之前设有沉淀和活性炭过滤。它们先去除颗粒和氯味，同时也保护后面的 RO 膜不会过早堵塞。',
   NULL, NULL),
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 'zh-MY', 5,
   '主机藏在水槽下',
   '过滤主机和水箱装在下方的橱柜里，台面上只看得到纤细的 SUS 304 不锈钢龙头。所以它适合公寓厨房，那里往往放不下落地式饮水机和一桶桶的水。',
   NULL, NULL),
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 'zh-MY', 6,
   '滤芯要按时更换',
   '机器会追踪滤芯寿命，到期时主动提醒您，不必靠记性。这一点很重要，因为过了寿命的滤芯，等于一台悄悄停止净水的净水器。',
   NULL, NULL);

INSERT INTO category_reason (category_id, lang, position, title, body_md, figure, figure_unit, icon) VALUES
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 'zh-MY', 1,
   '先多级过滤，再 RO',
   '沉淀和活性炭滤芯先去除颗粒和氯，后面的 RO 反渗透膜再处理剩下的重金属、细菌和溶解性固体。',
   NULL, NULL, 'filtration'),
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 'zh-MY', 2,
   '随时有沸水',
   '龙头直接出 100°C 热水，不用烧水壶，也不用等。这个设定悄悄让台面少了一台电器。',
   '100', '°C', 'heat'),
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 'zh-MY', 3,
   '四种水温，一个龙头',
   '冷水、常温、45°C 和 100°C，在龙头上选择。一个龙头就取代了饮水机、热水壶和冰箱门上的水壶。',
   '4', '种模式', 'water'),
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 'zh-MY', 4,
   '接触水的地方都是不锈钢',
   '龙头和水箱都采用 SUS 304 不锈钢，而不是塑料。在一个把水保持在 100°C 的系统里，这正是让水喝起来没有任何怪味的原因。',
   NULL, NULL, 'safety'),
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 'zh-MY', 5,
   '滤芯到期会提醒您',
   '显示屏上有滤芯更换提醒。水到底有没有被净化，就不再取决于有没有人记得上次是什么时候换的。',
   NULL, NULL, 'smart'),
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 'zh-MY', 6,
   '台面上什么都不放',
   '整套系统都装在水槽下方。公寓厨房里最稀缺的就是台面，它把饮水机原本要占的角落还给您。',
   NULL, NULL, 'clean');

INSERT INTO category_faq (category_id, lang, position, question, answer_md) VALUES
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 'zh-MY', 1,
   '单龙头净水器比饮水机好吗？',
   '对大多数家庭来说，是的。它在水槽边的一个龙头上完成过滤和四种水温出水，不用换水桶，不占地面空间，也不用等水加热或冷却。'),
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 'zh-MY', 2,
   'RO 反渗透会去除矿物质吗？',
   '会去除一部分。RO 过滤非常彻底，会把天然矿物质连同重金属、氯和溶解性固体一起去除。这是这种方式的正常现象，水依然完全可以安全饮用。我们的[什么是 RO 反渗透水](/tips-tricks/what-is-reverse-osmosis-water/)指南详细说明其中的取舍。'),
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 'zh-MY', 3,
   '可以装在水槽下面吗？',
   '它本来就是为水槽下方而设计的。过滤主机和水箱放在下方的橱柜里，台面上只露出龙头。'),
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 'zh-MY', 4,
   '把自来水煮沸可以净化吗？',
   '只能做到一部分。煮沸能杀死大部分细菌，但对化学物质、重金属和沉淀物毫无作用，反而会把它们浓缩，而不是去除。我们的[净水器原理指南](/buying-guide/how-water-filters-work/)说明两者的差别。'),
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 'zh-MY', 5,
   '马来西亚的自来水可以直接喝吗？',
   '自来水离开水厂时已处理到安全标准。但从水厂到您家水龙头之间情况不一：老旧水管、当地污染和季节变化，都会影响最后流出来的水。'),
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 'zh-MY', 6,
   '我真的需要过滤自来水吗？',
   '如果水有味道或异味、大楼比较老旧，或家里有婴儿，答案是需要。否则，就看您愿意花多少心思在这件事上。'),
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 'zh-MY', 7,
   '自来水不安全有哪些迹象？',
   '味道或气味不对、浑浊或变色、看得见沉淀物，以及喝了之后肠胃不适。出现其中任何一种，就该停止直接饮用，并找出原因。'),
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 'zh-MY', 8,
   '净水器有什么缺点？',
   '滤芯需要定期更换，而且一定要按时换。RO 系统在膜过滤的过程中也会排出一部分水。这两点都是获得纯净水的代价，最好在购买前就了解，而不是买了才知道。'),
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 'zh-MY', 9,
   '选购净水器要考虑什么？',
   '进水的水质、过滤方式、家里实际用来饮用和煮食的水量，以及滤芯多久需要更换一次。'),
  ((SELECT id FROM product_category WHERE slug = 'one-tap-purifier-in-malaysia'), 'zh-MY', 10,
   'RO 水为什么喝起来淡而无味？',
   '因为它非常纯净、矿物质含量低，而水的味道大多来自矿物质。这只是习惯的问题，不是缺陷。');

-- ═══════════════════════════════════════════════════════════════════════════
-- PRODUCT CARDS
-- ═══════════════════════════════════════════════════════════════════════════
-- One row per published product (36). Series names and model codes stay as the
-- English name spells them; the appliance noun is the category name. Colours:
-- V917 Carbon Black 碳黑色, Batik White Batik 白色 (Batik is the Malaysian
-- textile, left in Latin); DWID3 AG Grey AG 灰色. intro_md only on the five
-- signature models; NULL falls back to English on the rest (schema.sql).
INSERT INTO product_i18n (product_id, lang, name, best_for, intro_md) VALUES
  -- kitchen hood
  ((SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v993'), 'zh-MY',
   'Athena 系列升降式抽油烟机 V993', '日常家庭烹饪', NULL),
  ((SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v999'), 'zh-MY',
   'Athena 系列升降式抽油烟机 V999', '日常烹饪，挥手感应', NULL),
  ((SELECT id FROM product WHERE slug = 'athena-series-lifting-type-range-hood-v991'), 'zh-MY',
   'Athena 系列升降式抽油烟机 V991', '短风管，轻度烹饪', NULL),
  ((SELECT id FROM product WHERE slug = 'artemis-series-t-type-range-hood-v931'), 'zh-MY',
   'Artemis 系列抽油烟机 V931', '小厨房，短风管', NULL),
  ((SELECT id FROM product WHERE slug = 'triple-intake-series-t-type-cooker-hood-v937'), 'zh-MY',
   'Triple Intake 系列 T 型抽油烟机 V937', '宽炉面也能均匀吸烟', NULL),
  ((SELECT id FROM product WHERE slug = 'slim-series-type-range-hood-v995'), 'zh-MY',
   'Slim 系列抽油烟机 V995', '公寓与小厨房', NULL),
  ((SELECT id FROM product WHERE slug = 'vatti-slim-series-type-range-hood-v996'), 'zh-MY',
   'Slim 系列抽油烟机 V996', '空间紧凑，轻度烹饪', NULL),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919'), 'zh-MY',
   'Magic 系列抽油烟机 V919', '天天猛火烹饪', NULL),
  ((SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929'), 'zh-MY',
   'Aetheris 系列抽油烟机 V929', '猛火炒锅，开放式厨房',
   '全系列中吸力最强的型号之一，在厨房里却是最安静的：3,125 m³/h 风量，1,300 Pa 静压，噪音只有 46.5 dB，是全系列抽油烟机中最低的。以玻璃代替金属滤网，油顺着流进油杯，而不是凝固在金属上。PM2.5 感应器判断何时完成，挥一挥手就能启动。机身宽 896mm，安装于煤气炉上方 300mm。'),
  ((SELECT id FROM product WHERE slug = 'vatti-range-hood-v997'), 'zh-MY',
   '抽油烟机 V997', '重油烹饪，自动调节吸力', NULL),
  ((SELECT id FROM product WHERE slug = 'vatti-smart-oxygen-range-hood-v998'), 'zh-MY',
   'VATTI 华帝 Smart Oxygen 抽油烟机 V998', '智能操控，现代厨房', NULL),
  ((SELECT id FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938'), 'zh-MY',
   'VATTI 华帝 Hidden 系列抽油烟机 V938', '平嵌橱柜，无烟囱机身', NULL),
  ((SELECT id FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960'), 'zh-MY',
   'VATTI 华帝 Stellar 系列抽油烟机 V960', '长风管与高楼单位', NULL),
  ((SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v917-carbon-grey'), 'zh-MY',
   'VATTI 华帝抽油烟机 V917（碳黑色）', '吸力均衡，机身纤薄', NULL),
  ((SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v917-white'), 'zh-MY',
   'VATTI 华帝抽油烟机 V917（Batik 白色）', '吸力均衡，白色机身', NULL),
  ((SELECT id FROM product WHERE slug = 'vatti-cooker-hood-v959'), 'zh-MY',
   'VATTI 华帝抽油烟机 V959', NULL, NULL),

  -- cooker hob
  ((SELECT id FROM product WHERE slug = 'professional-series-c720s'), 'zh-MY',
   'Professional 系列煤气炉 C720S', '猛火炒锅，不锈钢台面', NULL),
  ((SELECT id FROM product WHERE slug = 'professional-series-c821g'), 'zh-MY',
   'Professional 系列煤气炉 C821G', '日常烹饪，钢化玻璃', NULL),
  ((SELECT id FROM product WHERE slug = 'vatti-ai-hob-c835g'), 'zh-MY',
   'VATTI 华帝 AI 煤气炉 C835G', '定时烹煮，八档火力', NULL),
  ((SELECT id FROM product WHERE slug = 'vatti-oylimpic-hob-m822g'), 'zh-MY',
   'VATTI 华帝 Olympic 煤气炉 M822G', '黄铜炉头，铸铁锅架', NULL),
  ((SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c822g'), 'zh-MY',
   'VATTI 华帝 Flexi 煤气炉 C822G', '开孔灵活，火力强劲', NULL),
  ((SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c823g'), 'zh-MY',
   'VATTI 华帝 Flexi 煤气炉 C823G', '开孔灵活，日常火力', NULL),
  ((SELECT id FROM product WHERE slug = 'vatti-flexi-hob-c836g'), 'zh-MY',
   'VATTI 华帝 Flexi 煤气炉 C836G', '全系列热效率最高的炉头', NULL),
  ((SELECT id FROM product WHERE slug = 'vatti-3-burner-gas-hob-c830g'), 'zh-MY',
   'VATTI 华帝三头煤气炉 C830G', '三个炉头，家庭烹饪', NULL),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g'), 'zh-MY',
   'Magic 系列煤气炉 C861G', '四种烹饪模式，翻转炉头',
   '炉头可以折起来的煤气炉。专利 90 度翻转炉头在不煮食时竖起，台面一抹就平整干净，下方的抽屉也照样能当抽屉用。4.8 kW 火力、65% 热效率，七档触感调节，配备锅具感应器，左炉头另有三重保护。'),
  ((SELECT id FROM product WHERE slug = 'ceramic-cooker-hob-er3601t'), 'zh-MY',
   'VATTI 华帝电陶炉 ER3601T', '三个电陶炉区，无明火', NULL),
  ((SELECT id FROM product WHERE slug = 'ceramic-cooker-hob-er5902t'), 'zh-MY',
   'VATTI 华帝电陶炉 ER5902T', '五个电陶炉区，大量烹煮', NULL),
  ((SELECT id FROM product WHERE slug = 'vatti-cooker-hob-vh-ic9-la'), 'zh-MY',
   'VATTI 华帝电磁电陶炉 VH-IC9-LA', NULL, NULL),

  -- combi and steam oven
  ((SELECT id FROM product WHERE slug = 'vatti-built-in-air-fryer-oven-07559'), 'zh-MY',
   'VATTI 华帝嵌入式空气炸烤箱 07559', '全尺寸烤箱空气炸', NULL),
  ((SELECT id FROM product WHERE slug = 'built-in-combi-oven-va05'), 'zh-MY',
   '嵌入式蒸烤箱 VA05', '烘焙、蒸汽与空气炸', NULL),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06'), 'zh-MY',
   'Magic 系列蒸烤箱 VA06', '一个 70L 腔体全包办',
   '一个 70 公升腔体，相当于五台电器：蒸、炖、烤、空气炸、蒸烤，全由彩色触控屏操作，内置 68 道食谱。两个隐藏式蒸发器带来真正的蒸汽，有三档湿度可选，所以烤肉不会变干，烤面包也能充分膨发。机身正面宽 595mm，适用 560mm 开孔。'),
  ((SELECT id FROM product WHERE slug = 'built-in-microwave-m626'), 'zh-MY',
   'VATTI 华帝嵌入式微波炉 M626', '翻热，带烧烤功能', NULL),

  -- dishwasher
  ((SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwbb7'), 'zh-MY',
   'VATTI 华帝洗碗机 DWBB7', '大家庭，油腻锅具', NULL),
  ((SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwid3-ag-grey'), 'zh-MY',
   'VATTI 华帝洗碗机 DWID3（AG 灰色）', '大容量，蔬果与玩具',
   '一台 60 cm 全嵌入式洗碗机，容量 20 套餐具外加一个蔬果篮，由 55,000 Pa 变压水泵驱动两支伸缩喷臂，洗到内胆的整个方形范围，而不只是中间的一个圆。它以 75°C 洗涤、105°C 烘干，以 UVC 杀菌，洗好的碗盘可保鲜七天。洗涤剂从可用两星期的储液盒自动投放，并设有蔬果、玩具和奶瓶程序。机身宽 598 mm，适用 600 x 780 x 580 mm 的橱柜开孔。有 AG 灰色和白色可选。'),
  ((SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwid3-white'), 'zh-MY',
   'VATTI 华帝洗碗机 DWID3（白色）', '大容量，蔬果与玩具', NULL),

  -- one tap purifier
  ((SELECT id FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd'), 'zh-MY',
   'VATTI 华帝 One Tap 净水器 WDHG01 + V818WD', '公寓，以及家有婴儿的家庭',
   '水槽下两个主机，台面上一个龙头：WDHG01 经四级过滤直达 0.0001 微米的 RO 膜，V818WD 即时加热，热水三秒即出，六秒装满一杯。龙头上有四种水温，从泡茶用的 100°C 到常温。');

-- ═══════════════════════════════════════════════════════════════════════════
-- SIGNATURE BAND BULLETS
-- ═══════════════════════════════════════════════════════════════════════════
-- The product_spec rows the signature band prints for each lead model: spec_key
-- IS NULL and not the source of a facet (those render as readouts instead).
-- Keyed on the English row's position, so the two stay paired.

-- V929
INSERT INTO product_spec_i18n (product_id, position, lang, raw_text) VALUES
  ((SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929'),  2, 'zh-MY', 'BLDC 防水无刷电机'),
  ((SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929'),  3, 'zh-MY', '动态 PM2.5 净化'),
  ((SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929'),  4, 'zh-MY', '挥手感应'),
  ((SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929'),  7, 'zh-MY', '第五代涡轮自动清洗'),
  ((SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929'),  8, 'zh-MY', '防锈纳米涂层'),
  ((SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929'),  9, 'zh-MY', '外排或内循环'),
  ((SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929'), 10, 'zh-MY', '智能联动（适用于指定煤气炉型号）'),
  ((SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929'), 11, 'zh-MY', '氛围灯'),
  ((SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929'), 12, 'zh-MY', '全触控面板'),
  ((SELECT id FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929'), 13, 'zh-MY', '除味率高达 97%');

-- C861G
INSERT INTO product_spec_i18n (product_id, position, lang, raw_text) VALUES
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g'),  0, 'zh-MY', '翻转式炉头设计'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g'),  3, 'zh-MY', '防干烧自动断气'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g'),  4, 'zh-MY', '过热自动断气'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g'),  5, 'zh-MY', '熄火保护装置'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g'),  6, 'zh-MY', '无锅智能感应'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g'),  7, 'zh-MY', '童锁旋钮'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g'),  8, 'zh-MY', '强劲猛火'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g'),  9, 'zh-MY', '易清洁设计'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g'), 10, 'zh-MY', '4 种烹饪模式（爆炒、煎、烤、煮）'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g'), 11, 'zh-MY', '全触控面板'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g'), 12, 'zh-MY', '钢化玻璃'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-cooker-hob-c861g'), 13, 'zh-MY', '电子点火');

-- VA06
INSERT INTO product_spec_i18n (product_id, position, lang, raw_text) VALUES
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06'),  2, 'zh-MY', '3 种蒸汽模式'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06'),  3, 'zh-MY', '多菜同蒸模式'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06'),  4, 'zh-MY', '2 种空气炸模式'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06'),  5, 'zh-MY', '3 种炖煮模式（粥、肉、汤）'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06'),  6, 'zh-MY', '不滴水'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06'),  7, 'zh-MY', '1.3L 水箱'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06'),  8, 'zh-MY', '双温控'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06'),  9, 'zh-MY', '蒸烤与蒸焗（组合功能）'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06'), 10, 'zh-MY', '三层钢化玻璃'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06'), 11, 'zh-MY', '智能自动清洁'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06'), 12, 'zh-MY', '空气炸、发酵'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06'), 13, 'zh-MY', '保温、解冻'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06'), 14, 'zh-MY', '蒸饭、制作酸奶'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06'), 15, 'zh-MY', '68 道自动菜单'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06'), 16, 'zh-MY', '额定功率 3000W'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06'), 17, 'zh-MY', '额定电压 220-240V（50-60Hz）'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06'), 18, 'zh-MY', '3 档湿度调节'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06'), 19, 'zh-MY', '2 种自动清洁功能：蒸汽清洁与加热烘干'),
  ((SELECT id FROM product WHERE slug = 'vatti-magic-series-combi-oven-va06'), 20, 'zh-MY', 'AI App System 版本支持 App 控制');

-- DWID3 (AG Grey)
INSERT INTO product_spec_i18n (product_id, position, lang, raw_text) VALUES
  ((SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwid3-ag-grey'),  3, 'zh-MY', '智能洗、蔬果洗、独立烘干、强力洗、标准洗、ECO 洗'),
  ((SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwid3-ag-grey'),  4, 'zh-MY', '4 个 App 程序：玻璃护理 60°C、强力洗 70°C、玩具护理 50°C、自洁 65°C'),
  ((SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwid3-ag-grey'),  5, 'zh-MY', '6 项附加功能：UV 杀菌、智能投放、加强洗、上层半载、下层半载、24 小时预约'),
  ((SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwid3-ag-grey'),  6, 'zh-MY', 'BLDC 无刷电机'),
  ((SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwid3-ag-grey'),  7, 'zh-MY', '150 L 内胆，三层碗篮，附抽拉式餐具盘'),
  ((SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwid3-ag-grey'),  8, 'zh-MY', '双伸缩喷臂，方形全覆盖洗涤'),
  ((SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwid3-ag-grey'),  9, 'zh-MY', '75°C 高温洗涤'),
  ((SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwid3-ag-grey'), 10, 'zh-MY', '105°C 独立热风烘干'),
  ((SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwid3-ag-grey'), 11, 'zh-MY', 'UVC 杀菌，高达 99.9%'),
  ((SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwid3-ag-grey'), 12, 'zh-MY', '168 小时通风，7 天保鲜存放'),
  ((SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwid3-ag-grey'), 13, 'zh-MY', '智能洗涤剂投放，250 ml 储液盒，加满一次约可用两星期'),
  ((SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwid3-ag-grey'), 14, 'zh-MY', '专利 3 向空气循环'),
  ((SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwid3-ag-grey'), 15, 'zh-MY', '专利双水泵，零残留积水'),
  ((SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwid3-ag-grey'), 16, 'zh-MY', '排水自动密封'),
  ((SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwid3-ag-grey'), 17, 'zh-MY', '自清洁三层滤网'),
  ((SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwid3-ag-grey'), 18, 'zh-MY', '23 英寸全触控彩色显示屏，倾斜 20°'),
  ((SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwid3-ag-grey'), 19, 'zh-MY', 'Wi-Fi App 控制'),
  ((SELECT id FROM product WHERE slug = 'vatti-dishwasher-dwid3-ag-grey'), 20, 'zh-MY', '额定功率 1,750 W，220 至 240 V');

-- WDHG01 + V818WD
INSERT INTO product_spec_i18n (product_id, position, lang, raw_text) VALUES
  ((SELECT id FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd'), 0, 'zh-MY', 'One Tap 净水器与热水饮水机'),
  ((SELECT id FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd'), 2, 'zh-MY', 'VPC 过滤净化系统'),
  ((SELECT id FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd'), 3, 'zh-MY', 'RO 反渗透膜滤芯'),
  ((SELECT id FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd'), 4, 'zh-MY', '龙头与水箱采用 SUS 304 不锈钢'),
  ((SELECT id FROM product WHERE slug = 'vatti-one-tap-water-purifier-wdhg01-with-v818wd'), 7, 'zh-MY', '滤芯更换提醒');
