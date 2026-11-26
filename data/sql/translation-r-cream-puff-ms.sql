-- Cream puffs with custard, Malay edition (2026-11-26). Paired with the English recipe
-- (article 3, rewritten in refresh-recipes-2026-11.sql) by translation_key
-- 'cream-puff-custard', which this file sets on the English row as well.
--
-- Why: the November appliance recipes drew 64 of their 84 clicks from the
-- Malay and Chinese editions (GSC 5 to 23 Nov). Keyword (Ubersuggest MY,
-- 2026-11-26): `resepi cream puff` 880 (SD 25, up to 1,600 in April). Malaysian Malay; the slug and title use "resepi", the folder is the site's "resipi".
--
-- Same recipe, figures, method and VATTI claims as the English; nothing added.
-- Product pages keep their English URLs; categories, the steam oven guide and
-- the other translated recipes link to their Malay editions. The English
-- featured image is shared, so the Malay alt goes in featured_image_alt.
-- Calories NULL as in the English. No prices, running costs, installation
-- copy, rival brands or em dashes.

UPDATE article SET translation_key = 'cream-puff-custard' WHERE id = 3 AND lang = 'en-MY';

INSERT INTO article (id, slug, path, section, title, h1, meta_description, body_md, word_count, reading_minutes, author, featured_image_id, published_at, modified_at, schema_disabled, is_published, lang, translation_key, featured_image_alt)
VALUES (138, 'resepi-cream-puff-kastard', 'resipi/resepi-cream-puff-kastard', 'recipe',
'Resepi Cream Puff Kastard yang Mudah dan Tak Kempis',
'Resepi Cream Puff Inti Kastard, Mudah dan Rangup',
'Resepi cream puff dengan inti kastard vanila, dalam sukatan gram. Suhu ketuhar, cara buat kastard, dan kenapa cream puff jadi kempis atau lembik.',
'Cream puff ialah kulit pastri choux yang berongga di dalam dan diisi kastard vanila yang pekat. Doh dimasak di atas dapur dalam lima minit dan mengembang dalam ketuhar hanya dengan wap daripada telur dan airnya sendiri, jadi cara membuatnya lebih penting daripada bahannya. Resepi ini menghasilkan kira-kira 20 biji, dalam sukatan gram, bersama inti kastard dan sebab cream puff jadi kempis.

### Ringkasan

- **Ketuhar:** 200°C api atas dan bawah selama 15 minit, kemudian 180°C selama 15 hingga 20 minit.
- **Kipas:** tutup. Kipas boleh membuat puff naik senget.
- **Pintu:** jangan buka dalam 25 minit pertama, atau puff akan kempis.
- **Siap apabila:** perang keemasan, keras dan ringan apabila diangkat, dengan rekahan yang kering.
- **Hasil:** kira-kira 20 biji, 5 cm lebar.

## Membuat doh choux

Doh choux dimasak dua kali: sekali dalam periuk dan sekali dalam ketuhar. Didihkan air, susu, mentega, gula dan garam sehingga mentega cair sepenuhnya, kemudian masukkan semua tepung sekali gus dan kacau kuat. Terus kacau atas api perlahan selama 1 hingga 2 minit, sehingga doh tertanggal dari periuk menjadi satu bebola dan lapisan nipis terbentuk di dasar periuk. Langkah mengeringkan doh inilah yang membolehkannya menerima telur.

Biarkan doh sejuk 5 minit, kemudian pukul masuk telur sedikit demi sedikit. Berhenti apabila doh berkilat dan jatuh dari sudu membentuk huruf V yang tebal. Mungkin anda tidak perlu semua telur: doh yang terlalu cair akan merebak dan tidak naik.

Api perlahan yang stabil memudahkan langkah ini; mana-mana [dapur gas VATTI](/ms/dapur-gas/) boleh mengekalkannya.

## Membakar cream puff

Paipkan bulatan 4 cm di atas dulang beralas, 5 cm jarak antara satu sama lain, dan licinkan puncaknya dengan jari yang dibasahkan. Bakar pada 200°C api atas dan bawah selama 15 minit supaya air dalam doh menjadi wap dan mengembangkan puff, kemudian turunkan ke 180°C selama 15 hingga 20 minit untuk mengeringkan kulitnya. Jangan buka pintu dalam 25 minit pertama. Apabila perang keemasan, matikan ketuhar, cucuk lubang kecil di tepi setiap puff dan biarkan dalam ketuhar dengan pintu sedikit terbuka selama 10 minit supaya kering.

Ketuhar kombi [VATTI VA05](/built-in-combi-oven-va05/) dan [VA06](/vatti-magic-series-combi-oven-va06/) menyenaraikan kawalan suhu berasingan untuk elemen atas dan bawah: berguna jika bahagian atas cepat perang sebelum puff habis naik. [VATTI 07559](/vatti-built-in-air-fryer-oven-07559/) mempunyai sembilan fungsi membakar dalam ruang 75 liter, cukup untuk dua dulang puff sekali gus.

[![VATTI VA05 combi oven](https://cdn.vattimalaysia.com/2026/08/built-in-combi-oven-va05-front.webp)](/built-in-combi-oven-va05/)
[![VATTI VA06 combi oven](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-combi-oven-va06-front.webp)](/vatti-magic-series-combi-oven-va06/)
[![VATTI 07559 built-in air fryer oven](https://cdn.vattimalaysia.com/2024/08/Built-in-air-fryer-oven-07559-product-photo.webp)](/vatti-built-in-air-fryer-oven-07559/)

## Inti kastard

Inti cream puff ialah krim pastri: susu yang dipekatkan dengan kuning telur dan tepung jagung, dimasak di atas dapur sehingga cukup pekat. Kacau tanpa henti sebaik ia mula pekat, dan biarkan ia menggelegak selama satu minit penuh supaya tepung jagung masak dan tidak berbau tepung. Tekap plastik pembalut di permukaannya supaya tidak berkulit, dan sejukkan sekurang-kurangnya 2 jam.

Untuk inti yang lebih ringan, gaulkan 200 ml krim putar ke dalam kastard yang sudah sejuk. Inilah yang digunakan kebanyakan kedai roti di Malaysia, dan ia lebih mudah dipaip.

## Mengisi cream puff

Isi puff hanya selepas ia sejuk sepenuhnya, dan sedekat mungkin dengan waktu hidangan. Sama ada belah dua dan sudukan atau paipkan kastard, atau cucuk muncung paip kecil di bawah puff dan isi sehingga terasa berat. Tabur gula aising, atau paipkan pusaran kastard di atasnya.

## Soalan lazim tentang cream puff

**Kenapa cream puff saya kempis?**
Biasanya kerana pintu ketuhar dibuka terlalu awal, puff kurang masak, atau doh terlalu cair. Jangan buka pintu dalam 25 minit pertama, bakar sehingga perang keemasan, dan berhenti menambah telur apabila doh jatuh membentuk V yang tebal.

**Kenapa cream puff saya lembik?**
Ia diisi semasa masih panas, diisi terlalu awal, atau tidak dikeringkan. Cucuk setiap puff dan keringkan dalam ketuhar yang dimatikan, biarkan sejuk sepenuhnya, dan isi dalam beberapa jam sebelum dihidang.

**Bolehkah guna serbuk kastard dan bukan tepung jagung?**
Boleh. Gantikan tepung jagung dengan serbuk kastard dalam berat yang sama. Ia memekat dengan cara yang sama dan memberi warna kuning serta rasa vanila.

**Bolehkah cream puff dibuat lebih awal?**
Boleh. Kulit yang belum diisi tahan dua hari dalam bekas kedap udara, atau sebulan dalam peti beku. Rangupkan semula pada 180°C selama 5 minit, biarkan sejuk, kemudian isi.

**Berapa lama cream puff yang sudah diisi tahan?**
Sehingga sehari dalam peti sejuk. Jangan biarkan di luar semalaman: kastard dibuat dengan telur dan susu dan mesti sentiasa sejuk.

## Resepi lain untuk ketuhar VATTI

- [Kek kukus coklat moist](/ms/resipi/resepi-kek-kukus-coklat-moist/)
- [Cendawan enoki pedas kukus](/ms/resipi/resepi-cendawan-enoki-pedas/)
- [Lasagna ayam mudah](/ms/resipi/resepi-lasagna-ayam/)

## Kesimpulan

Cream puff yang baik bergantung pada doh yang kering, ketuhar yang panas dan pintu yang tertutup. Bila kulitnya menjadi, kastard ialah bahagian yang mudah. Lihat [ketuhar kombi VATTI](/ms/ketuhar-kombi/) untuk ketuhar dengan kawalan api atas dan bawah.

[Lihat ketuhar VATTI](/ms/ketuhar-kombi/)', 748, 4, 'Vatti Malaysia', 414, '2026-11-26T22:00:00+08:00', '2026-11-26T22:00:00+08:00', 0, 1, 'ms-MY', 'cream-puff-custard',
'Cream puff choux keemasan ditabur gula aising, setiap satu dihias pusaran kastard kuning dan kepingan daun emas di atas dulang pembakar.');
INSERT INTO article_category (article_id, category_id, is_primary) VALUES (138, (SELECT id FROM blog_category WHERE slug = 'recipe'), 1);

INSERT INTO recipe (id, article_id, position, name, description, prep_minutes, cook_minutes, total_minutes, yield_qty, yield_label, cuisine, meal_category, calories, notes, hero_image_id, appliance_md, keywords) VALUES
  (28, 138, 1, 'Cream Puff Inti Kastard', 'Kulit pastri choux yang rangup dan berongga, diisi krim pastri kastard vanila yang lembut.', 40, 35, 75, '20', '20 biji cream puff', 'Perancis, kedai roti Malaysia', 'Pencuci Mulut', NULL, 'Sejukkan kastard sekurang-kurangnya 2 jam sebelum mengisi. Untuk inti lebih ringan, gaulkan 200 ml krim putar ke dalam kastard sejuk. Isi puff hanya apabila ia sejuk sepenuhnya.', 414, 'Ketuhar kombi [VA05](/built-in-combi-oven-va05/) atau [VA06](/vatti-magic-series-combi-oven-va06/), atau ketuhar terbina dalam [07559](/vatti-built-in-air-fryer-oven-07559/), api atas dan bawah', 'resepi cream puff, cream puff kastard, inti kastard cream puff, pastri choux, cream puff mudah');

INSERT INTO recipe_ingredient (recipe_id, position, text) VALUES
  (28, 1, 'Doh choux: 125 ml air'),
  (28, 2, 'Doh choux: 125 ml susu segar penuh krim'),
  (28, 3, 'Doh choux: 100 g mentega, dipotong dadu'),
  (28, 4, 'Doh choux: 1 sudu kecil gula'),
  (28, 5, 'Doh choux: 1/2 sudu kecil garam'),
  (28, 6, 'Doh choux: 150 g tepung gandum, diayak'),
  (28, 7, 'Doh choux: 4 hingga 5 biji telur (kira-kira 220 g), dipukul'),
  (28, 8, 'Kastard: 500 ml susu segar penuh krim'),
  (28, 9, 'Kastard: 4 biji kuning telur'),
  (28, 10, 'Kastard: 100 g gula'),
  (28, 11, 'Kastard: 40 g tepung jagung atau serbuk kastard'),
  (28, 12, 'Kastard: 30 g mentega'),
  (28, 13, 'Kastard: 1 sudu kecil esen vanila'),
  (28, 14, 'Gula aising untuk ditabur (pilihan)');

INSERT INTO recipe_step (recipe_id, position, text) VALUES
  (28, 1, 'Buat kastard dahulu: panaskan susu sehingga berwap. Pukul kuning telur, gula dan tepung jagung sehingga pucat, kemudian pukul masuk susu panas.'),
  (28, 2, 'Masukkan semula ke dalam periuk dan masak atas api sederhana perlahan sambil dikacau tanpa henti sehingga pekat; biarkan menggelegak 1 minit. Tutup api, kacau masuk mentega dan vanila.'),
  (28, 3, 'Tekap plastik pembalut di permukaan dan sejukkan sekurang-kurangnya 2 jam.'),
  (28, 4, 'Panaskan ketuhar pada 200°C api atas dan bawah tanpa kipas, dan alas dulang pembakar.'),
  (28, 5, 'Didihkan air, susu, mentega, gula dan garam. Masukkan tepung sekali gus dan kacau kuat atas api perlahan 1 hingga 2 minit, sehingga doh menjadi bebola dan lapisan nipis terbentuk di periuk.'),
  (28, 6, 'Sejukkan doh 5 minit, kemudian pukul masuk telur sedikit demi sedikit sehingga berkilat dan doh jatuh dari sudu membentuk V yang tebal.'),
  (28, 7, 'Paipkan bulatan 4 cm, 5 cm jarak, di atas dulang dan licinkan puncaknya dengan jari basah.'),
  (28, 8, 'Bakar 15 minit pada 200°C, kemudian 15 hingga 20 minit pada 180°C, tanpa membuka pintu dalam 25 minit pertama.'),
  (28, 9, 'Matikan ketuhar, cucuk tepi setiap puff dan biarkan dalam ketuhar dengan pintu sedikit terbuka selama 10 minit. Sejukkan sepenuhnya di atas rak.'),
  (28, 10, 'Isi setiap puff dengan kastard melalui bawah atau selepas dibelah dua, tabur gula aising dan hidangkan.');
