-- Tier 1 refresh, follow-up (content schedule item 27, 2026-11-18): the Malay
-- (108) and Chinese (110) editions of buying-guide/which-is-better-ducted-or-
-- ductless-range-hood, refreshed in English by refresh-tier1-2026-11-hoods.sql.
--
-- The hoods refresh reported these editions as carrying running-cost and
-- "every VATTI hood is ducted" claims. They do not: both already state that 13
-- models list ducted or recycled operation and the V991 and V996 are ducted
-- only, and neither has cost copy. What they did carry was installation
-- wording, against the client's 3 Oct rule: "boleh dipasang begini" in the
-- Malay meta, "saluran dipasang" and "dipasang tanpa saluran" in the Malay
-- body, and 安装烟管 in the Chinese. Those are reworded as what the hood does,
-- not how it is fitted; "mengubah suai dapur" and 装修厨房 (renovation) go with
-- them.
--
-- Also brought to the new article layout: the quick answer, a paragraph, is now
-- five term rows, and the V959 (95% oil capture) and V929 (46.5 dB) the body
-- already names get a product panel. Figures are product_facet. Both rows are
-- scoped to their own lang; the English edition is untouched here.
-- The file sorts after refresh-articles-ms-2026-10.sql and i18n-zh-guides.sql,
-- which create the two rows, and after product-images-2026-08.sql.

UPDATE article SET
  meta_description = 'Hood dapur tanpa tebuk dinding sesuai untuk kondo dan rumah sewa. Ketahui cara ia berfungsi, hadnya untuk masakan kuali, dan hood VATTI yang boleh berfungsi begini.',
  body_md = 'Tidak semua dapur boleh ditebuk. Di kondominium, pihak pengurusan mungkin tidak membenarkan lubang baharu di dinding luar. Di rumah sewa, tuan rumah selalunya tidak setuju. Ada juga dapur yang memang tiada dinding luar langsung. Untuk dapur seperti ini, **hood dapur tanpa tebuk dinding** ialah jalan keluarnya. Panduan ini menerangkan cara ia berfungsi, apa yang ia boleh dan tidak boleh buat, dan bila ia pilihan yang betul.

### Jawapan ringkas

- **Cara ia berfungsi:** ia menyedut asap melalui penapis minyak dan penapis karbon, kemudian meniup udara itu semula ke dalam dapur.
- **Apa yang ia buang:** minyak ditangkap dan bau dikurangkan, tetapi haba dan wap kekal di dalam rumah.
- **Masakan ringan:** jauh lebih baik daripada memasak tanpa hood langsung.
- **Masakan kuali setiap hari:** hood bersaluran ke luar tetap pilihan terbaik jika bangunan membenarkannya.
- **Hood VATTI:** semua model boleh berfungsi bersaluran atau kitar semula, dengan penapis sarang lebah.

[Tanya kami di WhatsApp](https://wa.me/60123366082)

## Bagaimana hood tanpa tebuk dinding berfungsi

Hood biasa ialah hood **bersaluran**: ia menyedut asap dan menolaknya melalui paip ke luar rumah, melalui dinding atau siling. Hood tanpa tebuk dinding pula dipanggil hood **kitar semula** (recirculating atau ductless). Udara melalui dua peringkat:

1. **Penapis minyak.** Menangkap titisan minyak dari asap masakan. Penapis ini boleh dicuci.
2. **Penapis karbon.** Karbon aktif (arang) menyerap sebahagian bau. Penapis ini tidak boleh dicuci dan perlu diganti.

Selepas itu, udara yang sudah ditapis dihembus keluar melalui bukaan di bahagian atas atau hadapan hood, kembali ke dalam dapur. Tiada paip, dan tiada lubang di dinding.

## Bersaluran atau kitar semula: perbezaannya

| | Bersaluran | Tanpa tebuk dinding (kitar semula) |
| --- | --- | --- |
| Ke mana udara pergi | Ke luar rumah | Kembali ke dalam dapur |
| Asap dan minyak | Dibuang | Minyak ditangkap, asap halus sebahagiannya kembali |
| Bau | Dibuang | Dikurangkan, tidak hilang sepenuhnya |
| Haba dan kelembapan | Dibuang | Kekal di dalam dapur |
| Masakan kuali api besar | Mampu | Kurang mampu |
| Penjagaan | Cuci penapis minyak | Cuci penapis minyak, tukar penapis karbon |
| Sesuai untuk | Rumah teres, kondo yang ada laluan saluran | Dapur tanpa laluan ke luar |

Perbezaan yang paling terasa di Malaysia ialah haba dan kelembapan. Dalam iklim kita, dapur yang panas dan lembap selepas memasak tidak selesa, dan hood kitar semula tidak dapat membuang kedua-duanya.

## Bila hood tanpa tebuk dinding pilihan yang betul

- Dapur tiada dinding luar dan tiada laluan siling ke luar.
- Pengurusan kondominium tidak membenarkan lubang baharu.
- Rumah sewa, dan tuan rumah tidak membenarkan saluran ke luar.
- Masakan di rumah kebanyakannya ringan: merebus, memanaskan semula, menggoreng sekali-sekala.

Dalam keadaan ini, hood kitar semula jauh lebih baik daripada memasak tanpa hood langsung. Asap masakan, terutamanya dari dapur gas, mengandungi zarah halus yang tidak sepatutnya kekal di udara rumah.

## Masakan kuali: had sebenarnya

Menumis dengan api besar menghasilkan lebih banyak asap dan wap minyak dalam lima minit berbanding ketuhar dalam sejam. Hood kitar semula boleh menangkap minyak, tetapi asap dan haba yang banyak itu tetap kembali ke dapur, dan penapis karbon cepat tepu jika digunakan untuk menggoreng setiap hari.

Jika keluarga anda memasak dengan kuali hampir setiap hari, cuba dulu cari laluan untuk saluran. Banyak unit kondo sebenarnya ada dapur di dinding luar atau laluan ke siling yang boleh digunakan. Tanya pihak pengurusan sebelum menganggap ia tidak dibenarkan.

## Penjagaan penapis karbon

Penapis karbon ialah bahagian yang membuat hood kitar semula berfungsi, dan ia juga bahagian yang paling kerap diabaikan.

- **Tukar setiap tiga hingga enam bulan** untuk masakan biasa di Malaysia. Lebih kerap jika anda kerap menggoreng.
- **Jangan cuba mencucinya.** Karbon yang basah tidak lagi menyerap bau.
- **Cuci penapis minyak secara berkala.** Penapis minyak yang tersumbat membuat penapis karbon tepu lebih cepat.

Hood yang berjalan dengan penapis karbon yang sudah tepu hanyalah kipas yang meniup udara berminyak ke sekeliling dapur.

## Hood VATTI yang boleh berfungsi tanpa tebuk dinding

Semua hood VATTI boleh berfungsi dengan kedua-dua cara. Untuk mod kitar semula, hood menggunakan penapis kitar semula sarang lebah (honeycomb) pada bukaan udaranya sebagai ganti saluran: penapis bulat kira-kira 200 mm lebar dan 215 mm tinggi yang membersihkan udara sebelum kembali ke dapur. Ia direka untuk kondominium yang tidak membenarkan lubang di dinding dapur. Hood yang sama boleh bersaluran kemudian apabila dapur membenarkannya.

![Penapis kitar semula sarang lebah VATTI, silinder jaring hitam bulat, di sebelah lukisannya: 200 mm lebar di atas, 170 mm di dasar, 215 mm tinggi.](https://cdn.vattimalaysia.com/2026/11/hood-honeycomb-filter-photo-and-size.webp)

Hood VATTI semasa:

- [V917](/vatti-cooker-hood-v917-carbon-grey/), [V919](/vatti-magic-series-cooker-hood-v919/), [V929](/vatti-aetheris-series-cooker-hood-v929/), [V931](/artemis-series-t-type-range-hood-v931/), [V937](/triple-intake-series-t-type-cooker-hood-v937/)
- [V938](/vatti-hidden-series-range-hood-v938/), [V959](/vatti-cooker-hood-v959/), [V960](/vatti-stellar-series-cooker-hood-v960/), [V993](/athena-series-lifting-type-range-hood-v993/), [V995](/slim-series-type-range-hood-v995/)
- [V997](/vatti-range-hood-v997/), [V998](/vatti-smart-oxygen-range-hood-v998/), [V999](/athena-series-lifting-type-range-hood-v999/)

Tanpa saluran, tekanan statik (Pa) kurang penting kerana tiada paip panjang untuk dilawan. Yang lebih penting ialah dua angka lain:

- **Tapisan minyak.** Lebih banyak minyak yang ditangkap di hood, lebih lama penapis karbon bertahan. [V959](/vatti-cooker-hood-v959/) menapis sehingga 95% minyak, yang tertinggi dalam rangkaian VATTI, dan kebanyakan model lain 92%.
- **Bunyi.** Hood kitar semula meniup udara semula ke dalam dapur, jadi bunyinya lebih dekat dengan anda. [V929](/vatti-aetheris-series-cooker-hood-v929/) ialah yang paling senyap, 46.5 dB.

[![Hood dapur VATTI V959](https://cdn.vattimalaysia.com/2026/08/vatti-cooker-hood-v959-front.webp)](/vatti-cooker-hood-v959/)
[![Hood dapur VATTI V929](https://cdn.vattimalaysia.com/2026/08/vatti-aetheris-series-cooker-hood-v929-front.webp)](/vatti-aetheris-series-cooker-hood-v929/)

## Soalan lazim

**Adakah hood tanpa tebuk dinding betul-betul berkesan?**
Ya, untuk minyak dan sebahagian bau. Ia tidak membuang haba dan kelembapan, dan ia kurang berkesan untuk masakan kuali api besar setiap hari.

**Berapa kerap penapis karbon perlu ditukar?**
Setiap tiga hingga enam bulan untuk masakan biasa. Lebih kerap jika anda kerap menggoreng.

**Bolehkah hood kitar semula ditukar kepada bersaluran kemudian?**
Untuk semua hood VATTI, ya. Spesifikasinya menyatakan kedua-dua mod, jadi hood yang sama boleh disambung ke saluran apabila dapur membenarkannya.

**Adakah hood tanpa tebuk dinding sesuai untuk kondo?**
Ya, jika kondo itu tidak membenarkan saluran. Tetapi semak dulu: banyak unit kondo mempunyai laluan saluran yang sedia ada, dan hood bersaluran membuang lebih banyak asap, haba dan bau.

**Lebih baik hood kitar semula atau tiada hood langsung?**
Hood kitar semula, tanpa ragu. Ia menangkap minyak sebelum melekat di kabinet dan siling, dan mengurangkan asap yang anda hidu setiap kali memasak.

## Kesimpulan

Hood dapur tanpa tebuk dinding bukan pengganti penuh untuk hood bersaluran, tetapi ia penyelesaian yang praktikal untuk dapur yang tidak boleh ditebuk. Jaga penapis karbonnya, dan pilih hood yang menangkap minyak dengan baik dan tidak bising. Jika anda tidak pasti sama ada dapur anda boleh disalurkan, hantar gambar dapur anda kepada kami di WhatsApp.

Untuk panduan dalam Bahasa Inggeris, baca [ducted or ductless range hood](/buying-guide/which-is-better-ducted-or-ductless-range-hood/) dan [kitchen hood without vent](/tips-tricks/kitchen-hood-without-vent/). Panduan lengkap memilih hood ada di [hood dapur: panduan lengkap](/ms/panduan-membeli/hood-dapur/).

[Lihat hood dapur VATTI](/ms/hood-dapur/)
',
  word_count = 980,
  reading_minutes = 5,
  modified_at = '2026-11-18T12:00:00+08:00'
WHERE path = 'panduan-membeli/hood-dapur-tanpa-tebuk-dinding' AND lang = 'ms-MY';

UPDATE article SET
  body_md = '不是每个厨房都能打孔。住公寓的话，管理层未必允许在外墙开新洞；租屋的屋主通常也不同意；还有些厨房根本没有外墙。这类厨房的出路，就是**免打孔抽油烟机**。这篇指南说明它如何运作、能做到什么、做不到什么，以及什么情况下它才是正确的选择。

### 简短回答

- **运作方式：**把油烟吸进来，经过油网和活性炭滤网过滤后，再把空气吹回厨房。
- **能排走什么：**能拦截油脂、减少气味，但热气和水汽仍留在屋内。
- **简单煮食：**比完全不装油烟机好得多。
- **天天猛火爆炒：**只要大楼允许，接烟管排到屋外的抽油烟机仍是最好的选择。
- **VATTI 华帝型号：**每一款都可以外排或内循环，内循环时使用蜂窝状滤网。

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
- 租屋，屋主不允许接烟管排到屋外。
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

每一款 VATTI 华帝抽油烟机两种方式都适用。用内循环方式时，抽油烟机的出风口会以蜂窝状内循环滤网代替排烟管：这是一个直径约 200 mm、高约 215 mm 的圆形滤网，空气经过它净化后才回到厨房。它专为不允许在厨房墙上开孔的公寓而设计。日后厨房条件允许时，同一台机也能改为外排。

![VATTI 华帝蜂窝状内循环滤网，黑色圆柱形网罩，旁边是尺寸图：顶部直径 200 mm，底部 170 mm，高 215 mm。](https://cdn.vattimalaysia.com/2026/11/hood-honeycomb-filter-photo-and-size.webp)

目前的 VATTI 华帝抽油烟机：

- [V917](/vatti-cooker-hood-v917-carbon-grey/)、[V919](/vatti-magic-series-cooker-hood-v919/)、[V929](/vatti-aetheris-series-cooker-hood-v929/)、[V931](/artemis-series-t-type-range-hood-v931/)、[V937](/triple-intake-series-t-type-cooker-hood-v937/)
- [V938](/vatti-hidden-series-range-hood-v938/)、[V959](/vatti-cooker-hood-v959/)、[V960](/vatti-stellar-series-cooker-hood-v960/)、[V993](/athena-series-lifting-type-range-hood-v993/)、[V995](/slim-series-type-range-hood-v995/)
- [V997](/vatti-range-hood-v997/)、[V998](/vatti-smart-oxygen-range-hood-v998/)、[V999](/athena-series-lifting-type-range-hood-v999/)

没有烟管时，静压（Pa）就没那么重要，因为没有长烟管要克服。这时更值得看的是另外两个数字：

- **油脂分离率。** 在机内拦下的油越多，活性炭滤网就用得越久。[V959](/vatti-cooker-hood-v959/) 可分离高达 95% 的油脂，是 VATTI 系列中最高的，其他型号多数为 92%。
- **噪音。** 内循环油烟机把空气吹回厨房，声音离你更近。[V929](/vatti-aetheris-series-cooker-hood-v929/) 最安静，只有 46.5 dB。

[![VATTI 华帝 V959 抽油烟机](https://cdn.vattimalaysia.com/2026/08/vatti-cooker-hood-v959-front.webp)](/vatti-cooker-hood-v959/)
[![VATTI 华帝 V929 抽油烟机](https://cdn.vattimalaysia.com/2026/08/vatti-aetheris-series-cooker-hood-v929-front.webp)](/vatti-aetheris-series-cooker-hood-v929/)

## 常见问题

**免打孔抽油烟机真的有效吗？**
对油脂和部分气味有效。它排不走热气和湿气，而且对天天猛火爆炒的厨房效果较差。

**活性炭滤网多久换一次？**
一般煮食每三至六个月换一次。常煎炸的话要更勤换。

**内循环油烟机以后可以改成外排吗？**
每一款 VATTI 抽油烟机都可以。它们的规格注明两种模式都适用，等厨房条件允许时，同一台机就能接上烟管。

**免打孔抽油烟机适合公寓吗？**
如果公寓不允许接烟管，就适合。不过请先确认：很多公寓单位本来就有烟管通道，而外排式能排走更多油烟、热气和气味。

**装内循环油烟机，还是干脆不装？**
当然是装内循环油烟机。它能在油脂黏上橱柜和天花板之前把它拦下，也能减少每次煮食时吸进的油烟。

## 总结

免打孔抽油烟机无法完全取代外排式，但对于不能打孔的厨房，它是很实际的解决方法。保养好活性炭滤网，选一台油脂分离率高又不吵的抽油烟机就对了。如果不确定自己的厨房能不能接烟管，欢迎把厨房照片通过 WhatsApp 发给我们。

本文的英文版是 [ducted or ductless range hood](/buying-guide/which-is-better-ducted-or-ductless-range-hood/)，另可参考英文文章 [kitchen hood without vent](/tips-tricks/kitchen-hood-without-vent/)。挑选抽油烟机的完整指南，请看[抽油烟机怎么选](/zh/buying-guide/types-of-range-hoods/)。

[查看 VATTI 抽油烟机](/kitchen-hood-in-malaysia/)
',
  word_count = 1588,
  reading_minutes = 5,
  modified_at = '2026-11-18T12:00:00+08:00'
WHERE path = 'buying-guide/which-is-better-ducted-or-ductless-range-hood' AND lang = 'zh-MY';

INSERT INTO article_image (article_id, image_id, position) VALUES
  (108, 9074, 1), (108, 9018, 2),
  (110, 9074, 1), (110, 9018, 2);

-- The honeycomb recirculation filter (client, 2026-11-18): image 9117 is created in
-- refresh-tier1-2026-11-hoods.sql, which sorts after this file, so the rows go there.
