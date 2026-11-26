-- Easy chicken lasagna, Malay edition (2026-11-26). Paired with the English recipe
-- (article 51, rewritten in refresh-recipes-2026-11.sql) by translation_key
-- 'chicken-lasagna', which this file sets on the English row as well.
--
-- Why: the November appliance recipes drew 64 of their 84 clicks from the
-- Malay and Chinese editions (GSC 5 to 23 Nov). Keyword (Ubersuggest MY,
-- 2026-11-26): `resepi lasagna ayam` 70 (SD 21). Halal as written.
--
-- Same recipe, figures, method and VATTI claims as the English; nothing added.
-- Product pages keep their English URLs; categories, the steam oven guide and
-- the other translated recipes link to their Malay editions. The English
-- featured image is shared, so the Malay alt goes in featured_image_alt.
-- Calories NULL as in the English. No prices, running costs, installation
-- copy, rival brands or em dashes.

UPDATE article SET translation_key = 'chicken-lasagna' WHERE id = 51 AND lang = 'en-MY';

INSERT INTO article (id, slug, path, section, title, h1, meta_description, body_md, word_count, reading_minutes, author, featured_image_id, published_at, modified_at, schema_disabled, is_published, lang, translation_key, featured_image_alt)
VALUES (140, 'resepi-lasagna-ayam', 'resipi/resepi-lasagna-ayam', 'recipe',
'Resepi Lasagna Ayam Mudah, Sos Merah dan Sos Putih',
'Resepi Lasagna Ayam Mudah dengan Sos Tomato dan Sos Putih',
'Resepi lasagna ayam yang mudah: sos tomato ayam, sos putih berkrim dan keju mozzarella, dibakar 190°C. Tetapan ketuhar, susunan lapisan dan tip.',
'Lasagna ayam disusun berlapis: kepingan pasta, sos tomato ayam, sos putih berkrim dan keju mozzarella, kemudian dibakar pada 190°C sehingga bahagian atasnya menggelegak dan perang. Resepi ini menggunakan ayam cincang atau ayam carik, sos putih dan bukan keju ricotta, serta kepingan lasagna tanpa rebus, jadi ia boleh masuk ketuhar dalam kira-kira 30 minit. Cukup untuk 6 hingga 8 orang.

### Ringkasan

- **Ketuhar:** 190°C, api atas dan bawah.
- **Masa:** 25 minit bertutup kerajang aluminium, kemudian 15 hingga 20 minit tanpa tutup.
- **Perangkan:** 3 hingga 5 minit dengan api atas atau gril di akhir.
- **Rehatkan:** 15 minit sebelum dipotong, atau lapisannya akan tergelincir.
- **Bekas:** lebih kurang 23 x 33 cm, untuk 6 hingga 8 orang.

## Sos ayam

Tumis bawang besar dan bawang putih dengan sedikit minyak, masukkan ayam cincang atau ayam yang sudah dicarik, kemudian reneh dengan tomato hancur, pes tomato dan herba kering selama 15 minit sehingga pekat. Sos yang pekat penting: sos yang cair menghasilkan lasagna yang berderai di pinggan. Perasakan dengan cukup kerana pasta dan sos putih menyerap banyak garam.

## Sos putih

Sos putih (béchamel) membuat lasagna berkrim, dan ia lebih murah serta lebih mudah didapati di Malaysia berbanding keju ricotta. Cairkan mentega, kacau masuk tepung selama seminit, kemudian pukul masuk susu suam sedikit demi sedikit dan reneh sehingga ia menyalut sudu. Perasakan dengan garam, lada sulah dan secubit buah pala.

## Cara menyusun lasagna ayam

1. Lapisan nipis sos ayam di dasar bekas supaya pasta tidak melekat.
2. Kepingan lasagna dalam satu lapisan, dipatahkan supaya muat.
3. Sos ayam, kemudian sos putih, kemudian segenggam mozzarella.
4. Ulang dua kali lagi, akhiri dengan kepingan pasta, sos putih, baki mozzarella dan Parmesan.

Kepingan tanpa rebus perlukan sos untuk masak, jadi pastikan setiap kepingan ditutup sepenuhnya.

## Membakar dalam ketuhar

Tutup bekas dengan kerajang aluminium dan bakar pada 190°C api atas dan bawah selama 25 minit, supaya pasta lembut dalam wap di bawah kerajang. Buka kerajang dan bakar 15 hingga 20 minit lagi sehingga tepinya menggelegak dan atasnya keemasan. Untuk atas yang lebih perang, habiskan dengan 3 hingga 5 minit api atas atau gril.

Ketuhar yang boleh menetapkan elemen atas dan bawah secara berasingan memudahkan langkah akhir ini: ketuhar kombi [VATTI VA05](/built-in-combi-oven-va05/) dan [VA06](/vatti-magic-series-combi-oven-va06/) menyenaraikan kawalan suhu berganda, jadi bahagian atas boleh memerangkan keju sementara bahagian bawah kekal stabil. [VATTI 07559](/vatti-built-in-air-fryer-oven-07559/) mempunyai ruang 75 liter yang muat bekas lasagna besar dengan selesa.

[![VATTI VA05 combi oven](https://cdn.vattimalaysia.com/2026/08/built-in-combi-oven-va05-front.webp)](/built-in-combi-oven-va05/)
[![VATTI VA06 combi oven](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-combi-oven-va06-front.webp)](/vatti-magic-series-combi-oven-va06/)
[![VATTI 07559 built-in air fryer oven](https://cdn.vattimalaysia.com/2024/08/Built-in-air-fryer-oven-07559-product-photo.webp)](/vatti-built-in-air-fryer-oven-07559/)

## Hidangkan dengan

- **Roti bawang putih**, untuk mengelap sos di pinggan.
- **Salad hijau atau salad Caesar**, untuk mengimbangi rasa lemak.
- **Sayur panggang** seperti labu, zukini atau lada benggala, dibakar bersama dalam ketuhar.

## Soalan lazim tentang lasagna ayam

**Pada suhu berapa lasagna ayam dibakar?**
190°C api atas dan bawah: 25 minit bertutup kerajang, kemudian 15 hingga 20 minit tanpa tutup sehingga keemasan dan menggelegak.

**Bolehkah buat lasagna ayam tanpa keju ricotta?**
Boleh. Resepi ini menggunakan sos putih (béchamel), yang lebih berkrim dan lebih mudah didapati di Malaysia.

**Perlukah kepingan lasagna direbus dahulu?**
Tidak jika menggunakan kepingan tanpa rebus. Tutup sepenuhnya dengan sos dan bakar bertutup kerajang dahulu supaya ia lembut. Kepingan biasa perlu direbus sehingga baru lembut.

**Kenapa lasagna saya berair?**
Sos daging terlalu cair, atau ia dipotong terus selepas keluar dari ketuhar. Reneh sos sehingga pekat dan rehatkan lasagna 15 minit sebelum dipotong.

**Bolehkah lasagna ayam dibuat lebih awal atau dibekukan?**
Boleh. Susun, tutup dan simpan dalam peti sejuk sehingga sehari, kemudian bakar 10 minit lebih lama. Ia juga boleh dibekukan sehingga tiga bulan; nyahbeku dalam peti sejuk semalaman dan bakar bertutup pada 180°C sehingga panas di tengah.

## Resepi lain untuk ketuhar VATTI

- [Cream puff kastard](/ms/resipi/resepi-cream-puff-kastard/)
- [Ikan stim limau dan ikan stim halia](/ms/resipi/resepi-ikan-stim-limau/)
- [Cendawan enoki pedas kukus](/ms/resipi/resepi-cendawan-enoki-pedas/)

## Kesimpulan

Lasagna ayam yang sedap perlukan sos yang pekat, sos putih yang betul dan rehat sebelum dipotong. Bakar bertutup, kemudian tanpa tutup, dan perangkan bahagian atas di akhir. Lihat [ketuhar kombi VATTI](/ms/ketuhar-kombi/) untuk ketuhar dengan api atas dan bawah berasingan.

[Lihat ketuhar VATTI](/ms/ketuhar-kombi/)', 653, 4, 'Vatti Malaysia', 514, '2026-11-26T22:00:00+08:00', '2026-11-26T22:00:00+08:00', 0, 1, 'ms-MY', 'chicken-lasagna',
'Sepotong lasagna ayam bakar di atas dulang putih, dengan ayam carik dalam sos tomato di antara lapisan pasta di bawah keju dan sos putih yang perang menggelegak.');
INSERT INTO article_category (article_id, category_id, is_primary) VALUES (140, (SELECT id FROM blog_category WHERE slug = 'recipe'), 1);

INSERT INTO recipe (id, article_id, position, name, description, prep_minutes, cook_minutes, total_minutes, yield_qty, yield_label, cuisine, meal_category, calories, notes, hero_image_id, appliance_md, keywords) VALUES
  (30, 140, 1, 'Lasagna Ayam Mudah', 'Lapisan pasta, sos tomato ayam, sos putih berkrim dan mozzarella, dibakar sehingga keemasan dan menggelegak.', 30, 45, 75, '6-8', '6 hingga 8 hidangan', 'Itali', 'Hidangan Utama', NULL, 'Rehatkan lasagna 15 minit sebelum dipotong. Untuk dibuat awal, susun dan simpan dalam peti sejuk sehingga sehari, kemudian bakar 10 minit lebih lama.', 514, 'Ketuhar kombi [VA05](/built-in-combi-oven-va05/) atau [VA06](/vatti-magic-series-combi-oven-va06/), atau ketuhar terbina dalam [07559](/vatti-built-in-air-fryer-oven-07559/), api atas dan bawah', 'resepi lasagna ayam, lasagna ayam mudah, lasagna sos putih, lasagna bakar, resepi lasagna');

INSERT INTO recipe_ingredient (recipe_id, position, text) VALUES
  (30, 1, 'Sos ayam: 2 sudu besar minyak masak'),
  (30, 2, 'Sos ayam: 1 biji bawang besar, dicincang halus'),
  (30, 3, 'Sos ayam: 4 ulas bawang putih, dicincang'),
  (30, 4, 'Sos ayam: 500 g ayam cincang, atau 3 cawan ayam masak yang dicarik'),
  (30, 5, 'Sos ayam: 1 tin (400 g) tomato hancur'),
  (30, 6, 'Sos ayam: 2 sudu besar pes tomato'),
  (30, 7, 'Sos ayam: 1 sudu kecil oregano kering dan 1 sudu kecil selasih kering'),
  (30, 8, 'Sos ayam: garam, lada hitam dan 1 sudu kecil gula, secukup rasa'),
  (30, 9, 'Sos putih: 50 g mentega'),
  (30, 10, 'Sos putih: 50 g tepung gandum'),
  (30, 11, 'Sos putih: 600 ml susu, dipanaskan'),
  (30, 12, 'Sos putih: secubit buah pala, garam dan lada sulah'),
  (30, 13, '12 keping lasagna tanpa rebus'),
  (30, 14, '200 g keju mozzarella parut'),
  (30, 15, '40 g keju Parmesan parut');

INSERT INTO recipe_step (recipe_id, position, text) VALUES
  (30, 1, 'Panaskan minyak dan tumis bawang besar dan bawang putih hingga layu. Masukkan ayam dan masak sehingga tidak lagi merah jambu.'),
  (30, 2, 'Masukkan tomato hancur, pes tomato dan herba, dan reneh 15 minit sehingga pekat. Perasakan.'),
  (30, 3, 'Untuk sos putih, cairkan mentega, kacau masuk tepung selama 1 minit, kemudian pukul masuk susu suam sedikit demi sedikit. Reneh sehingga menyalut sudu, dan perasakan dengan buah pala, garam dan lada.'),
  (30, 4, 'Panaskan ketuhar pada 190°C, api atas dan bawah.'),
  (30, 5, 'Ratakan sedikit sos ayam dalam bekas 23 x 33 cm dan tutup dengan selapis kepingan lasagna.'),
  (30, 6, 'Tambah sos ayam, sos putih dan segenggam mozzarella. Ulang dua kali, akhiri dengan kepingan pasta, sos putih, baki mozzarella dan Parmesan.'),
  (30, 7, 'Tutup dengan kerajang dan bakar 25 minit, kemudian buka dan bakar 15 hingga 20 minit sehingga keemasan dan menggelegak.'),
  (30, 8, 'Perangkan dengan 3 hingga 5 minit api atas atau gril, kemudian rehatkan 15 minit sebelum dipotong.');
