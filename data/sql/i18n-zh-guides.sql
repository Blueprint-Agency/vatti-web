-- Chinese editions of the two Malay hood guides, 2026-10-03.
--
-- Written in Simplified Chinese for Malaysian Chinese readers, to the Malay
-- outlines in refresh-articles-ms-2026-10.sql (ids 108 and 109), not translated
-- from the English articles. Each row is paired with its English and Malay
-- editions by translation_key, so hreflang and the language switcher link the
-- three: 110 with which-is-better-ducted-or-ductless-range-hood, 111 with
-- types-of-range-hoods. A Chinese article keeps its English slug and path; the
-- /zh/ prefix comes from `lang`.
--
-- Keywords are the zh-MY rows of keyword-map.sql: 免打孔抽油烟机 for the
-- ductless guide, 抽油烟机怎么选 for the pillar. Each leads its title, h1 and
-- meta description. House terms follow src/i18n/zh.ts: 抽油烟机, 煤气炉,
-- "VATTI 华帝" on first mention.
--
-- Same rules as the Malay file: every model figure is product_facet, the
-- ductless list is the 13 hood models whose spec reads "Ducted or recycled"
-- (V991 and V996 are ducted only), and by the client's decision there is no
-- price, no running cost and no installation arrangement.
--
-- Featured images are the English cousins' (568, 399); the Chinese alt lives
-- in featured_image_alt because the image row is shared. word_count counts CJK
-- characters plus Latin words in body_md; reading_minutes is CJK characters at
-- 400 a minute, rounded up.

INSERT INTO article (id, slug, path, section, title, h1, meta_description, body_md, word_count, reading_minutes, author, featured_image_id, published_at, modified_at, schema_disabled, is_published, lang, translation_key, featured_image_alt)
VALUES (110, 'which-is-better-ducted-or-ductless-range-hood', 'buying-guide/which-is-better-ducted-or-ductless-range-hood', 'buying-guide',
'免打孔抽油烟机值得买吗？内循环油烟机全面解析',
'免打孔抽油烟机值得买吗？内循环油烟机全面解析',
'免打孔抽油烟机适合不能打墙的公寓和租屋。了解内循环油烟机如何运作、猛火爆炒时的限制、活性炭滤网怎么保养，以及哪些 VATTI 华帝抽油烟机可以这样使用。',
'不是每个厨房都能打孔。住公寓的话，管理层未必允许在外墙开新洞；租屋的屋主通常也不同意；还有些厨房根本没有外墙。这类厨房的出路，就是**免打孔抽油烟机**。这篇指南说明它如何运作、能做到什么、做不到什么，以及什么情况下它才是正确的选择。

### 简短回答

免打孔抽油烟机把油烟吸进来，经过油网和活性炭滤网过滤后，再把空气吹回厨房。它能拦截油脂、减少气味，但热气和水汽仍留在屋内。如果平时只是简单煮食，它比完全不装油烟机好得多；但如果天天用炒锅猛火爆炒，只要大楼允许，接排烟管的抽油烟机仍是最好的选择。

[请在 WhatsApp 联系我们](https://wa.me/60123366082)

## 免打孔抽油烟机如何运作

一般的抽油烟机是**外排式**：把油烟吸进来，再经由烟管穿过墙壁或天花板排到屋外。免打孔抽油烟机则是**内循环式**（recirculating 或 ductless）。空气会经过两层过滤：

1. **油网。** 拦截煮食油烟中的油滴，可以清洗。
2. **活性炭滤网。** 活性炭吸附部分气味。这层滤网不能清洗，需要定期更换。

过滤后的空气从机身顶部或前方的出风口吹出，回到厨房。不用烟管，也不必在墙上打孔。

## 外排式与内循环式的分别

| | 外排式 | 免打孔（内循环） |
| --- | --- | --- |
| 空气去向 | 排到屋外 | 回到厨房 |
| 油烟 | 排走 | 油脂被拦截，细微油烟部分回到厨房 |
| 气味 | 排走 | 减少，但不会完全消失 |
| 热气与湿气 | 排走 | 留在厨房 |
| 猛火爆炒 | 应付得来 | 较吃力 |
| 保养 | 清洗油网 | 清洗油网，更换活性炭滤网 |
| 适合 | 排屋、有烟管通道的公寓 | 没有通往屋外通道的厨房 |

在马来西亚，最明显的分别是热气和湿气。我们的天气本来就湿热，煮完饭后厨房又闷又潮很不舒服，而内循环油烟机两样都排不走。

## 什么情况下适合用免打孔抽油烟机

- 厨房没有外墙，天花板也没有通往屋外的通道。
- 公寓管理层不允许开新孔。
- 租屋，屋主不让安装烟管。
- 家里煮食多半清淡：水煮、加热剩菜、偶尔煎炸。

在这些情况下，内循环油烟机比完全不装油烟机好得多。煮食油烟，尤其是煤气炉产生的油烟，含有细微颗粒，不应该一直留在家里的空气中。

## 猛火爆炒：真正的限制

用炒锅猛火爆炒五分钟，产生的油烟和油气比烤箱烤一小时还多。内循环油烟机能拦截油脂，但大量的油烟和热气仍会回到厨房；如果天天煎炒，活性炭滤网也会很快饱和。

如果家里几乎每天都用炒锅煮食，请先设法找出接烟管的路线。其实不少公寓单位的厨房就靠着外墙，或有通往天花板的通道可以利用。先问问管理层，别一开始就认定不允许。

## 活性炭滤网的保养

活性炭滤网是内循环油烟机能发挥作用的关键，也是最常被忽略的部分。

- **每三至六个月更换一次**，这是马来西亚一般家庭煮食的频率。常煎炸的话要更勤换。
- **不要尝试清洗。** 活性炭一旦弄湿，就不再吸附气味。
- **定期清洗油网。** 油网堵塞会让活性炭滤网更快饱和。

活性炭滤网已经饱和还继续用，抽油烟机就只是一台把油腻空气吹满厨房的风扇。

## 可以免打孔使用的 VATTI 华帝抽油烟机

大部分 VATTI 华帝抽油烟机两种方式都适用。有 13 款型号的规格注明**外排或内循环**（ducted or recycled），所以同一台机今天可以免打孔使用，日后搬家或装修厨房时再接上烟管：

- [V917](/vatti-cooker-hood-v917-carbon-grey/)、[V919](/vatti-magic-series-cooker-hood-v919/)、[V929](/vatti-aetheris-series-cooker-hood-v929/)、[V931](/artemis-series-t-type-range-hood-v931/)、[V937](/triple-intake-series-t-type-cooker-hood-v937/)
- [V938](/vatti-hidden-series-range-hood-v938/)、[V959](/vatti-cooker-hood-v959/)、[V960](/vatti-stellar-series-cooker-hood-v960/)、[V993](/athena-series-lifting-type-range-hood-v993/)、[V995](/slim-series-type-range-hood-v995/)
- [V997](/vatti-range-hood-v997/)、[V998](/vatti-smart-oxygen-range-hood-v998/)、[V999](/athena-series-lifting-type-range-hood-v999/)

另外两款，V991 和 V996，只能外排。

没有烟管时，静压（Pa）就没那么重要，因为没有长烟管要克服。这时更值得看的是另外两个数字：

- **油脂分离率。** 在机内拦下的油越多，活性炭滤网就用得越久。[V959](/vatti-cooker-hood-v959/) 可分离高达 95% 的油脂，是 VATTI 系列中最高的，其他型号多数为 92%。
- **噪音。** 内循环油烟机把空气吹回厨房，声音离你更近。[V929](/vatti-aetheris-series-cooker-hood-v929/) 最安静，只有 46.5 dB。

## 常见问题

**免打孔抽油烟机真的有效吗？**
对油脂和部分气味有效。它排不走热气和湿气，而且对天天猛火爆炒的厨房效果较差。

**活性炭滤网多久换一次？**
一般煮食每三至六个月换一次。常煎炸的话要更勤换。

**内循环油烟机以后可以改成外排吗？**
上面列出的 13 款 VATTI 型号可以。它们的规格注明两种模式都适用，等厨房条件允许时，同一台机就能接上烟管。

**免打孔抽油烟机适合公寓吗？**
如果公寓不允许接烟管，就适合。不过请先确认：很多公寓单位本来就有烟管通道，而外排式能排走更多油烟、热气和气味。

**装内循环油烟机，还是干脆不装？**
当然是装内循环油烟机。它能在油脂黏上橱柜和天花板之前把它拦下，也能减少每次煮食时吸进的油烟。

## 总结

免打孔抽油烟机无法完全取代外排式，但对于不能打孔的厨房，它是很实际的解决方法。保养好活性炭滤网，选一台油脂分离率高又不吵的抽油烟机就对了。如果不确定自己的厨房能不能接烟管，欢迎把厨房照片通过 WhatsApp 发给我们。

本文的英文版是 [ducted or ductless range hood](/buying-guide/which-is-better-ducted-or-ductless-range-hood/)，另可参考英文文章 [kitchen hood without vent](/tips-tricks/kitchen-hood-without-vent/)。挑选抽油烟机的完整指南，请看[抽油烟机怎么选](/zh/buying-guide/types-of-range-hoods/)。

[查看 VATTI 抽油烟机](/kitchen-hood-in-malaysia/)
', 1612, 4, 'Vatti Malaysia', 568, '2026-10-03T12:00:00+08:00', '2026-10-03T12:00:00+08:00', 0, 1, 'zh-MY', 'which-is-better-ducted-or-ductless-range-hood',
'挂在吊柜下方的纤薄抽油烟机，配金属网油网，照明灯亮着。');
INSERT INTO article_category (article_id, category_id, is_primary) VALUES (110, (SELECT id FROM blog_category WHERE slug = 'buying-guide'), 1);

INSERT INTO article (id, slug, path, section, title, h1, meta_description, body_md, word_count, reading_minutes, author, featured_image_id, published_at, modified_at, schema_disabled, is_published, lang, translation_key, featured_image_alt)
VALUES (111, 'types-of-range-hoods', 'buying-guide/types-of-range-hoods', 'buying-guide',
'抽油烟机怎么选？马来西亚厨房选购完整指南',
'抽油烟机怎么选？马来西亚厨房选购完整指南',
'抽油烟机怎么选才应付得了马来西亚的猛火爆炒？一文看懂油烟机种类、风量、静压、噪音，外排式还是免打孔，以及清洁保养与保修，选对一台用得久的抽油烟机。',
'马来西亚的煮法对厨房来说很吃力。炒参巴、煎鱼、用炒锅猛火爆炒，都会产生大量油烟和油气；没有合适的抽油烟机，几个月内橱柜、天花板和窗帘就会黏满油垢。这篇指南告诉你**抽油烟机怎么选**，才真正应付得了我们的煮法，以及每份规格表上该看哪些数字。

### 简短回答

选抽油烟机看三个数字：**风量**（m³/h），代表吸走多少空气；**静压**（Pa），代表能把油烟推过多长的烟管；**噪音**（dB），关系到每天用得舒不舒服。高楼公寓的烟管长，静压是最重要的数字，而其他品牌很少把它印出来。

[请在 WhatsApp 联系我们](https://wa.me/60123366082)

## 为什么马来西亚厨房需要更强的抽油烟机

西式煮食多用烤箱，马来西亚煮食则以爆炒和煎炸为主。用炒锅猛火爆炒五分钟，产生的油烟和油气比烤箱烤一小时还多，而且油烟上升得很快。为西式煮食设计的油烟机往往应付不了炒锅，结果就是厨房有味、橱柜黏手。

## 抽油烟机的种类

**T 型（烟囱式）抽油烟机。** 平板机身装在煤气炉上方，烟囱直通天花板。经典造型，容易清洁。例如 [V931](/artemis-series-t-type-range-hood-v931/) 和 [V937](/triple-intake-series-t-type-cooker-hood-v937/)。

**升降式抽油烟机。** 吸烟腔会降向煤气炉，离锅具约 350 mm，T 型机约为 580 mm，所以油烟还没扩散到整个厨房就被吸走。例如 Athena 系列：[V991](/athena-series-lifting-type-range-hood-v991/)、[V993](/athena-series-lifting-type-range-hood-v993/) 和 [V999](/athena-series-lifting-type-range-hood-v999/)。

**纤薄型抽油烟机。** 机身低矮，适合小厨房或装在吊柜下方。例如 [V995](/slim-series-type-range-hood-v995/) 和 [V996](/vatti-slim-series-type-range-hood-v996/)。

**隐藏式抽油烟机。** 机身藏在吊柜里，从厨房只看得到前面板。[V938](/vatti-hidden-series-range-hood-v938/) 就是一例：机身深 325 mm，运转时面板下降 105 mm，打开吸烟口。

## 要看的三个数字

### 风量（m³/h）

每小时吸走多少空气。VATTI 华帝抽油烟机的风量由 **1,860 m³/h**（[V931](/artemis-series-t-type-range-hood-v931/)）到 **3,690 m³/h**（[V960](/vatti-stellar-series-cooker-hood-v960/)）。开放式厨房或常用炒锅爆炒的家庭，选数字高一点的。

### 静压（Pa）

这是最常被忽略的数字，却是住公寓最要紧的一个。风量测的是油烟机本身的进风量；静压测的则是烟管又长、又弯、或与其他单位共用时，油烟机还能推动多少空气。住高楼的话，纸面风量很大但静压低的油烟机，到了晚餐时间、邻居都在煮饭时，就会显得无力。

VATTI 系列的静压由 **420 Pa** 到 **1,700 Pa**：

- **烟管短而直**，像大多数排屋：[V931](/artemis-series-t-type-range-hood-v931/)（420 Pa）、[V995](/slim-series-type-range-hood-v995/)（450 Pa）或 [V991](/athena-series-lifting-type-range-hood-v991/)（460 Pa）就够用。
- **高楼公寓、烟管长或弯**：从 1,000 Pa 以上开始选。[V997](/vatti-range-hood-v997/) 1,200 Pa、[V929](/vatti-aetheris-series-cooker-hood-v929/) 1,300 Pa、[V938](/vatti-hidden-series-range-hood-v938/) 1,600 Pa、[V960](/vatti-stellar-series-cooker-hood-v960/) 1,700 Pa。

### 噪音（dB）

太吵的油烟机往往太早被关掉，剩下的油烟就会黏在厨房里。VATTI 系列的噪音介于 **46.5 dB**（[V929](/vatti-aetheris-series-cooker-hood-v929/)，最安静）到 54 dB 之间。相差 3 dB 已经听得出明显分别。

## 外排式还是免打孔

外排式抽油烟机把油烟排到屋外，油烟、气味、热气和湿气一并带走。免打孔（内循环）抽油烟机则把空气过滤后送回厨房：能拦截油脂、减少气味，但热气和水汽会留下。

大楼允许的话，选外排式。不允许的话，VATTI 有 13 款型号两种模式都能用。详细说明请看[免打孔抽油烟机](/zh/buying-guide/which-is-better-ducted-or-ductless-range-hood/)。

## 油脂分离与清洁

大多数 VATTI 华帝抽油烟机的油脂分离率为 **92%**，[V959](/vatti-cooker-hood-v959/) 高达 **95%**，V931、V937 和 Athena 系列（V991、V993、V999）则为 85%。机内拦下的油越多，黏在橱柜和天花板上的就越少。

拦下的油总要清理，而 VATTI 抽油烟机在这方面有所不同：

- **热熔自动清洗**，例如 [V917](/vatti-cooker-hood-v917-carbon-grey/) 和 [V996](/vatti-slim-series-type-range-hood-v996/)：17 分钟、七个阶段的清洗程序，把机内加热到油脂融化，再由风机把油排出。不用加水，也不用倒水。
- **蒸汽自动清洗**，例如 [V997](/vatti-range-hood-v997/)；[V938](/vatti-hidden-series-range-hood-v938/) 则同时使用蒸汽和热水。

## 保修

每台 VATTI 抽油烟机的**电机保修 10 年**，整机保修 2 年；完成[电子保修登记](/vatti-ewarranty/)后，自动清洗部件享有 2+3 年保修。电机是每次煮食都在工作的部件。

## 常见问题

**用炒锅爆炒需要多大风量？**
一般厨房的话，VATTI 系列的抽油烟机风量全都超过 1,800 m³/h，足够应付大多数厨房。开放式厨房或天天猛火煮食，建议选 2,500 m³/h 以上。

**我住高楼公寓，应该注意什么？**
静压 1,000 Pa 以上。公寓的烟管通常又长又共用，油烟能不能真正排出去，靠的就是静压。

**哪种抽油烟机最容易清洁？**
有自动清洗功能的。热熔清洗完全不用水；蒸汽清洗能清洁风机和机内腔体。两者都比每周拆下油网刷洗轻松得多。

**VATTI 抽油烟机可以配其他品牌的煤气炉吗？**
可以，抽油烟机能吸走任何煤气炉的油烟。至于烟灶联动，也就是点火时油烟机自动启动的功能，只适用于支持此功能的 VATTI 煤气炉。

**在哪里可以买到 VATTI 抽油烟机？**
通过全马各地的 VATTI 授权经销商购买。可在[经销商名单](/store-locations/)找到离你最近的一家，或把厨房照片通过 WhatsApp 发给我们，我们会推荐合适的型号。

## 总结

适合马来西亚家庭的抽油烟机，不只是纸面上最强的那一台。看风量配合厨房大小，看静压配合你的烟管，看噪音决定每天用得舒不舒服。能外排就选外排，再挑一台容易清洁的，让它一直像第一天那样好用。

本文的英文版是 [3 types of range hoods](/buying-guide/types-of-range-hoods/)。

[查看 VATTI 抽油烟机](/kitchen-hood-in-malaysia/)
', 1510, 4, 'Vatti Malaysia', 399, '2026-10-03T12:00:00+08:00', '2026-10-03T12:00:00+08:00', 0, 1, 'zh-MY', 'types-of-range-hoods',
'配黑色玻璃面板和烟囱的 VATTI 抽油烟机，装在深色橱柜厨房的玻璃炉面上方。');
INSERT INTO article_category (article_id, category_id, is_primary) VALUES (111, (SELECT id FROM blog_category WHERE slug = 'buying-guide'), 1);
