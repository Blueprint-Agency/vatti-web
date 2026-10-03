-- The first two Malay articles, 2026-10-03. Content schedule Q4, items 4 and 5.
--
-- Why Malay: the workbook's one opening Fotile cannot follow into. Ubersuggest
-- (Malaysia, ms, 2026-10-03) measures `hood dapur` at 720/month and `hood dapur
-- tanpa tebuk dinding` at 110, and a Firecrawl search from Kuala Lumpur the same
-- day found no brand guide on page one for either: Facebook groups, YouTube and
-- TikTok clips, a Lemon8 post, one Malaysian retailer and Indonesian shops and
-- blogs (Mitra10, Tokopedia, Shopee Indonesia). Indonesian pages ranking for a
-- Malaysian query is what a thin field looks like.
--
-- These are new pieces in Malay, not translations of the English posts, so
-- there is no hreflang pairing to declare: hreflang joins equivalent pages, and
-- neither of these has one. Each links its nearest English cousin at the end.
--
-- Written in Malaysian Malay, not Indonesian: dapur gas, not kompor; penyedut,
-- not penghisap; kuali, not wajan. Model figures are product_facet and the
-- "Ducted or recycled" spec rows: 13 of the 15 hood models list both modes, and
-- the V991 and V996 do not, so the ductless guide names exactly those 13. By
-- the client's decision (2026-10-03): no price, no running cost, no installation
-- arrangement.
--
-- `lang` is the column added to `article` for these. ids follow 107 (the
-- infrared burner post); the importer never reissues ids. Featured images reuse
-- the English cousins' pictures (568, 399), already on R2. word_count and
-- reading_minutes are measured off body_md (200 words a minute, rounded up).
--
-- Named refresh-articles-ms so it sorts after refresh-articles-2026-09.sql:
-- the cross-links at the bottom edit English bodies that file rewrites, and
-- an edit made before it would be overwritten. (articles.sql is pinned first
-- in db-build.mjs ORDER, so the inserts are safe either way.)

INSERT INTO article (id, slug, path, section, title, h1, meta_description, body_md, word_count, reading_minutes, author, featured_image_id, published_at, modified_at, schema_disabled, is_published, lang)
VALUES (108, 'hood-dapur-tanpa-tebuk-dinding', 'buying-guide/hood-dapur-tanpa-tebuk-dinding', 'buying-guide',
'Hood Dapur Tanpa Tebuk Dinding: Berbaloi atau Tidak?',
'Hood Dapur Tanpa Tebuk Dinding: Berbaloi atau Tidak?',
'Hood dapur tanpa tebuk dinding sesuai untuk kondo dan rumah sewa. Ketahui cara ia berfungsi, hadnya untuk masakan kuali, dan hood VATTI yang boleh dipasang begini.',
'Tidak semua dapur boleh ditebuk. Di kondominium, pihak pengurusan mungkin tidak membenarkan lubang baharu di dinding luar. Di rumah sewa, tuan rumah selalunya tidak setuju. Ada juga dapur yang memang tiada dinding luar langsung. Untuk dapur seperti ini, **hood dapur tanpa tebuk dinding** ialah jalan keluarnya. Panduan ini menerangkan cara ia berfungsi, apa yang ia boleh dan tidak boleh buat, dan bila ia pilihan yang betul.

### Jawapan ringkas

Hood tanpa tebuk dinding menyedut asap melalui penapis minyak dan penapis karbon, kemudian meniup udara itu semula ke dalam dapur. Ia menangkap minyak dan mengurangkan bau, tetapi haba dan wap kekal di dalam rumah. Untuk masakan ringan, ia jauh lebih baik daripada tiada hood. Untuk menumis dan menggoreng dengan kuali setiap hari, hood bersaluran ke luar tetap pilihan terbaik jika bangunan membenarkannya.

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
- Rumah sewa, dan tuan rumah tidak membenarkan saluran dipasang.
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

Kebanyakan hood VATTI dibina untuk kedua-dua cara. Spesifikasi 13 model menyatakan **bersaluran atau kitar semula** (ducted or recycled), jadi model yang sama boleh dipasang tanpa saluran hari ini dan disambung ke saluran kemudian jika anda berpindah atau mengubah suai dapur:

- [V917](/vatti-cooker-hood-v917-carbon-grey/), [V919](/vatti-magic-series-cooker-hood-v919/), [V929](/vatti-aetheris-series-cooker-hood-v929/), [V931](/artemis-series-t-type-range-hood-v931/), [V937](/triple-intake-series-t-type-cooker-hood-v937/)
- [V938](/vatti-hidden-series-range-hood-v938/), [V959](/vatti-cooker-hood-v959/), [V960](/vatti-stellar-series-cooker-hood-v960/), [V993](/athena-series-lifting-type-range-hood-v993/), [V995](/slim-series-type-range-hood-v995/)
- [V997](/vatti-range-hood-v997/), [V998](/vatti-smart-oxygen-range-hood-v998/), [V999](/athena-series-lifting-type-range-hood-v999/)

Dua model, V991 dan V996, hanya bersaluran.

Tanpa saluran, tekanan statik (Pa) kurang penting kerana tiada paip panjang untuk dilawan. Yang lebih penting ialah dua angka lain:

- **Tapisan minyak.** Lebih banyak minyak yang ditangkap di hood, lebih lama penapis karbon bertahan. [V959](/vatti-cooker-hood-v959/) menapis sehingga 95% minyak, yang tertinggi dalam rangkaian VATTI, dan kebanyakan model lain 92%.
- **Bunyi.** Hood kitar semula meniup udara semula ke dalam dapur, jadi bunyinya lebih dekat dengan anda. [V929](/vatti-aetheris-series-cooker-hood-v929/) ialah yang paling senyap, 46.5 dB.

## Soalan lazim

**Adakah hood tanpa tebuk dinding betul-betul berkesan?**
Ya, untuk minyak dan sebahagian bau. Ia tidak membuang haba dan kelembapan, dan ia kurang berkesan untuk masakan kuali api besar setiap hari.

**Berapa kerap penapis karbon perlu ditukar?**
Setiap tiga hingga enam bulan untuk masakan biasa. Lebih kerap jika anda kerap menggoreng.

**Bolehkah hood kitar semula ditukar kepada bersaluran kemudian?**
Untuk 13 model VATTI yang dinyatakan di atas, ya. Spesifikasinya menyatakan kedua-dua mod, jadi hood yang sama boleh disambung ke saluran apabila dapur membenarkannya.

**Adakah hood tanpa tebuk dinding sesuai untuk kondo?**
Ya, jika kondo itu tidak membenarkan saluran. Tetapi semak dulu: banyak unit kondo mempunyai laluan saluran yang sedia ada, dan hood bersaluran membuang lebih banyak asap, haba dan bau.

**Lebih baik hood kitar semula atau tiada hood langsung?**
Hood kitar semula, tanpa ragu. Ia menangkap minyak sebelum melekat di kabinet dan siling, dan mengurangkan asap yang anda hidu setiap kali memasak.

## Kesimpulan

Hood dapur tanpa tebuk dinding bukan pengganti penuh untuk hood bersaluran, tetapi ia penyelesaian yang praktikal untuk dapur yang tidak boleh ditebuk. Jaga penapis karbonnya, dan pilih hood yang menangkap minyak dengan baik dan tidak bising. Jika anda tidak pasti sama ada dapur anda boleh disalurkan, hantar gambar dapur anda kepada kami di WhatsApp.

Untuk panduan dalam Bahasa Inggeris, baca [ducted or ductless range hood](/buying-guide/which-is-better-ducted-or-ductless-range-hood/) dan [kitchen hood without vent](/tips-tricks/kitchen-hood-without-vent/). Panduan lengkap memilih hood ada di [hood dapur: panduan lengkap](/buying-guide/hood-dapur/).

[Lihat hood dapur VATTI](/kitchen-hood-in-malaysia/)
', 960, 5, 'Vatti Malaysia', 568, '2026-10-03T12:00:00+08:00', '2026-10-03T12:00:00+08:00', 0, 1, 'ms-MY');
INSERT INTO article_category (article_id, category_id, is_primary) VALUES (108, (SELECT id FROM blog_category WHERE slug = 'buying-guide'), 1);
-- Image 568 is shared with the English post, whose alt is English.
UPDATE article SET featured_image_alt =
  'Hood dapur nipis di bawah kabinet dinding, dengan penapis jaring logam dan lampu yang menyala.'
  WHERE id = 108;

INSERT INTO article (id, slug, path, section, title, h1, meta_description, body_md, word_count, reading_minutes, author, featured_image_id, published_at, modified_at, schema_disabled, is_published, lang)
VALUES (109, 'hood-dapur', 'buying-guide/hood-dapur', 'buying-guide',
'Hood Dapur: Panduan Lengkap Memilih Hood untuk Dapur Malaysia',
'Hood Dapur: Panduan Lengkap Memilih Hood untuk Dapur Malaysia',
'Cara memilih hood dapur untuk masakan Malaysia: jenis hood, aliran udara, tekanan statik, tahap bunyi, bersaluran atau tanpa tebuk dinding, dan cara menjaganya.',
'Masakan Malaysia keras untuk sebuah dapur. Menumis sambal, menggoreng ikan, memasak dengan kuali api besar: semuanya menghasilkan asap dan wap minyak yang, tanpa hood yang betul, akan melekat di kabinet, siling dan langsir dalam masa beberapa bulan. Panduan ini menerangkan cara memilih **hood dapur** yang betul-betul mampu menghadapi masakan kita, dengan angka yang patut anda baca pada setiap spesifikasi.

### Jawapan ringkas

Pilih hood berdasarkan tiga angka: **aliran udara** (m³/jam) untuk berapa banyak udara yang disedut, **tekanan statik** (Pa) untuk sejauh mana ia boleh menolak asap melalui saluran yang panjang, dan **bunyi** (dB) untuk keselesaan setiap hari. Untuk kondo tingkat tinggi dengan saluran yang panjang, tekanan statik ialah angka yang paling penting, dan ia angka yang jarang dicetak oleh jenama lain.

[Tanya kami di WhatsApp](https://wa.me/60123366082)

## Kenapa dapur Malaysia memerlukan hood yang lebih kuat

Masakan Barat banyak menggunakan ketuhar. Masakan Malaysia menumis dan menggoreng. Menumis dengan api besar menghasilkan lebih banyak asap dan wap minyak dalam lima minit berbanding ketuhar dalam sejam, dan asap itu naik dengan cepat. Hood yang direka untuk masakan Barat selalunya tidak cukup kuat untuk kuali, dan hasilnya ialah dapur yang berbau dan kabinet yang melekit.

## Jenis-jenis hood dapur

**Hood jenis T (cerobong).** Badan rata di atas dapur gas dengan cerobong menegak ke siling. Reka bentuk klasik yang mudah dibersihkan. Contohnya [V931](/artemis-series-t-type-range-hood-v931/) dan [V937](/triple-intake-series-t-type-cooker-hood-v937/).

**Hood angkat (lifting type).** Ruang sedutannya turun ke arah dapur gas, kira-kira 350 mm di atas periuk berbanding kira-kira 580 mm bagi hood jenis T, jadi asap disedut sebelum sempat merebak ke seluruh dapur. Contohnya siri Athena: [V991](/athena-series-lifting-type-range-hood-v991/), [V993](/athena-series-lifting-type-range-hood-v993/) dan [V999](/athena-series-lifting-type-range-hood-v999/).

**Hood nipis (slim).** Profil rendah untuk dapur kecil atau di bawah kabinet dinding. Contohnya [V995](/slim-series-type-range-hood-v995/) dan [V996](/vatti-slim-series-type-range-hood-v996/).

**Hood tersembunyi.** Badan hood diletakkan di dalam kabinet dinding, dan dari dapur anda hanya nampak panel hadapan. [V938](/vatti-hidden-series-range-hood-v938/) ialah contohnya: badannya sedalam 325 mm dan panelnya turun 105 mm untuk membuka ruang sedutan apabila ia berjalan.

## Tiga angka yang perlu dibaca

### Aliran udara (m³/jam)

Berapa banyak udara yang disedut dalam sejam. Hood VATTI berada antara **1,860 m³/jam** ([V931](/artemis-series-t-type-range-hood-v931/)) hingga **3,690 m³/jam** ([V960](/vatti-stellar-series-cooker-hood-v960/)). Untuk dapur terbuka atau masakan kuali yang kerap, pilih yang lebih tinggi.

### Tekanan statik (Pa)

Ini angka yang paling kerap diabaikan, dan yang paling penting di kondo. Aliran udara mengukur udara di hood itu sendiri. Tekanan statik mengukur sejauh mana hood masih boleh menolak udara apabila saluran panjang, berliku, atau berkongsi dengan unit lain. Di tingkat tinggi, hood yang kuat pada kertas tetapi rendah tekanan statiknya akan terasa lemah pada waktu makan malam, apabila semua jiran memasak serentak.

Rangkaian VATTI bermula dari **420 Pa** hingga **1,700 Pa**:

- **Saluran pendek dan terus**, seperti di kebanyakan rumah teres: [V931](/artemis-series-t-type-range-hood-v931/) (420 Pa), [V995](/slim-series-type-range-hood-v995/) (450 Pa) atau [V991](/athena-series-lifting-type-range-hood-v991/) (460 Pa) sudah memadai.
- **Kondo tingkat tinggi, saluran panjang atau berliku**: mulakan dari 1,000 Pa ke atas. [V997](/vatti-range-hood-v997/) 1,200 Pa, [V929](/vatti-aetheris-series-cooker-hood-v929/) 1,300 Pa, [V938](/vatti-hidden-series-range-hood-v938/) 1,600 Pa dan [V960](/vatti-stellar-series-cooker-hood-v960/) 1,700 Pa.

### Bunyi (dB)

Hood yang terlalu bising akan dimatikan terlalu awal, dan asap yang tinggal akan melekat. Rangkaian VATTI berada antara **46.5 dB** ([V929](/vatti-aetheris-series-cooker-hood-v929/), yang paling senyap) hingga 54 dB. Perbezaan 3 dB sudah boleh didengar dengan jelas.

## Bersaluran atau tanpa tebuk dinding

Hood bersaluran menolak asap ke luar rumah dan membuang asap, bau, haba serta kelembapan. Hood tanpa tebuk dinding (kitar semula) menapis udara dan mengembalikannya ke dapur. Ia menangkap minyak dan mengurangkan bau, tetapi haba dan wap kekal.

Pilih bersaluran jika bangunan membenarkannya. Jika tidak, 13 model VATTI boleh berfungsi dalam kedua-dua mod. Baca [hood dapur tanpa tebuk dinding](/buying-guide/hood-dapur-tanpa-tebuk-dinding/) untuk penjelasan penuh.

## Tapisan minyak dan pembersihan

Kebanyakan hood VATTI menapis **92%** minyak, dan [V959](/vatti-cooker-hood-v959/) sehingga **95%**. Lebih banyak minyak yang ditangkap di dalam hood, lebih sedikit yang melekat di kabinet dan siling anda.

Minyak yang ditangkap perlu dibersihkan, dan di sini hood VATTI berbeza:

- **Cuci automatik dengan haba**, seperti pada [V917](/vatti-cooker-hood-v917-carbon-grey/) dan [V996](/vatti-slim-series-type-range-hood-v996/): kitaran 17 minit dalam tujuh peringkat yang memanaskan ruang dalam hood sehingga minyak cair, lalu kipas membuangnya. Tiada air untuk diisi atau dibuang.
- **Cuci automatik dengan wap**, seperti pada [V997](/vatti-range-hood-v997/), dan pada [V938](/vatti-hidden-series-range-hood-v938/) yang menggunakan wap dan air panas bersama.

## Waranti

Setiap hood VATTI datang dengan waranti **10 tahun untuk motor**, 2 tahun untuk hood, dan 2+3 tahun untuk komponen cuci automatik selepas [pendaftaran eWaranti](/vatti-ewarranty/). Motor ialah bahagian yang bekerja setiap kali anda memasak.

## Soalan lazim

**Berapa m³/jam yang saya perlukan untuk masakan kuali?**
Untuk dapur biasa, hood dalam rangkaian VATTI semuanya melebihi 1,800 m³/jam, yang mencukupi untuk kebanyakan dapur. Untuk dapur terbuka atau masakan api besar setiap hari, pilih 2,500 m³/jam ke atas.

**Saya tinggal di kondo tingkat tinggi. Apa yang patut saya cari?**
Tekanan statik 1,000 Pa ke atas. Saluran di kondo selalunya panjang dan dikongsi, dan tekanan statiklah yang menentukan sama ada asap benar-benar keluar.

**Hood jenis apa yang paling mudah dibersihkan?**
Hood dengan cuci automatik. Cuci dengan haba tidak perlu air langsung; cuci dengan wap membersihkan kipas dan ruang dalam. Kedua-duanya jauh lebih mudah daripada membuka dan menyental penapis setiap minggu.

**Adakah hood VATTI sesuai dengan dapur gas jenama lain?**
Ya, hood menyedut asap dari mana-mana dapur gas. Ciri auto-sambung, iaitu hood bermula sendiri apabila dapur dinyalakan, hanya berfungsi dengan dapur VATTI yang menyokongnya.

**Di mana saya boleh membeli hood VATTI?**
Melalui pengedar sah VATTI di seluruh Malaysia. Cari yang terdekat di [senarai pengedar](/store-locations/), atau hantar gambar dapur anda kepada kami di WhatsApp dan kami akan cadangkan model yang sesuai.

## Kesimpulan

Hood dapur yang betul untuk rumah Malaysia bukan sekadar yang paling kuat di atas kertas. Baca aliran udara untuk saiz dapur, tekanan statik untuk saluran anda, dan bunyi untuk keselesaan setiap hari. Pilih bersaluran jika boleh, dan pilih hood yang mudah dibersihkan supaya ia terus berfungsi seperti hari pertama.

Untuk panduan dalam Bahasa Inggeris, baca [3 types of range hoods](/buying-guide/types-of-range-hoods/).

[Bandingkan hood dapur VATTI](/kitchen-hood-in-malaysia/)
', 943, 5, 'Vatti Malaysia', 399, '2026-10-03T12:00:00+08:00', '2026-10-03T12:00:00+08:00', 0, 1, 'ms-MY');
INSERT INTO article_category (article_id, category_id, is_primary) VALUES (109, (SELECT id FROM blog_category WHERE slug = 'buying-guide'), 1);
UPDATE article SET featured_image_alt =
  'Hood dapur VATTI berpanel kaca hitam dengan cerobong, di atas hob kaca dalam dapur berkabinet gelap.'
  WHERE id = 109;

-- ── pointers from the English cousins ──────────────────────────────────────
-- So the two pages are reachable from articles that already rank. One line in
-- English above each closing CTA, which stays the last line because a
-- standalone link renders as a button. replace() is a no-op if the CTA wording
-- ever changes; db-check would not notice, so look here if the pointer goes.
UPDATE article SET body_md = replace(body_md,
  '[Explore VATTI Kitchen Hood](/kitchen-hood-in-malaysia/)',
  'Also in Malay: [hood dapur tanpa tebuk dinding](/buying-guide/hood-dapur-tanpa-tebuk-dinding/).

[Explore VATTI Kitchen Hood](/kitchen-hood-in-malaysia/)')
WHERE path = 'tips-tricks/kitchen-hood-without-vent';

UPDATE article SET body_md = replace(body_md,
  '[Explore VATTI Kitchen Hood Malaysia](/kitchen-hood-in-malaysia/)',
  'Also in Malay: [hood dapur tanpa tebuk dinding](/buying-guide/hood-dapur-tanpa-tebuk-dinding/).

[Explore VATTI Kitchen Hood Malaysia](/kitchen-hood-in-malaysia/)')
WHERE path = 'buying-guide/which-is-better-ducted-or-ductless-range-hood';

UPDATE article SET body_md = replace(body_md,
  '[Discover more kitchen hood](/kitchen-hood-in-malaysia/)',
  'Also in Malay: [hood dapur, panduan lengkap](/buying-guide/hood-dapur/).

[Discover more kitchen hood](/kitchen-hood-in-malaysia/)')
WHERE path = 'buying-guide/types-of-range-hoods';
