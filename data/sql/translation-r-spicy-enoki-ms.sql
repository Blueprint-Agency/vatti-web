-- Spicy steamed enoki, Malay edition (2026-11-26). Paired with the English recipe
-- (article 6, rewritten in refresh-recipes-2026-11.sql) by translation_key
-- 'spicy-enoki-mushrooms', which this file sets on the English row as well.
--
-- Why: the November appliance recipes drew 64 of their 84 clicks from the
-- Malay and Chinese editions (GSC 5 to 23 Nov). Keyword (Ubersuggest MY,
-- 2026-11-26): `resepi enoki` 90 (SD 24). Malaysian Malay, halal as written.
--
-- Same recipe, figures, method and VATTI claims as the English; nothing added.
-- Product pages keep their English URLs; categories, the steam oven guide and
-- the other translated recipes link to their Malay editions. The English
-- featured image is shared, so the Malay alt goes in featured_image_alt.
-- Calories NULL as in the English. No prices, running costs, installation
-- copy, rival brands or em dashes.

UPDATE article SET translation_key = 'spicy-enoki-mushrooms' WHERE id = 6 AND lang = 'en-MY';

INSERT INTO article (id, slug, path, section, title, h1, meta_description, body_md, word_count, reading_minutes, author, featured_image_id, published_at, modified_at, schema_disabled, is_published, lang, translation_key, featured_image_alt)
VALUES (136, 'resepi-cendawan-enoki-pedas', 'resipi/resepi-cendawan-enoki-pedas', 'recipe',
'Resepi Cendawan Enoki Pedas Kukus dengan Bawang Putih',
'Resepi Cendawan Enoki Pedas Kukus, Bawang Putih dan Cili Padi',
'Cendawan enoki dikukus dengan bawang putih, cili padi dan sos tiram, kemudian disiram minyak panas. Siap dalam 20 minit, dalam ketuhar stim atau kuali.',
'Cendawan enoki pedas dikukus sehingga lembut, kemudian ditabur bawang putih, cili padi dan daun bawang, disiram sos kicap dan sos tiram serta sesudu minyak panas yang berdesis. Ia hidangan sampingan 20 minit yang sedap dimakan dengan nasi, mi atau steamboat, dan boleh dikukus di atas pinggan dalam ketuhar stim atau kuali.

### Ringkasan

- **Masa:** 10 minit penyediaan, 6 hingga 8 minit mengukus.
- **Tetapan stim:** tahap stim paling tinggi, atau kuali di atas air yang mendidih kuat.
- **Masak apabila:** batang enoki lembut tetapi masih sedikit rangup.
- **Kepedasan:** 3 biji cili padi sederhana pedas; 1 untuk kurang pedas, 6 untuk sangat pedas.
- **Hidangan:** 2 hingga 3 orang sebagai lauk sampingan.

## Menyediakan cendawan enoki

Cendawan enoki dijual dalam bungkusan vakum dengan akar yang bercantum di pangkalnya. Potong 2 hingga 3 cm di bahagian bawah, kemudian leraikan kepada ikatan kecil supaya wap dan sos sampai ke setiap helai. Bilas sekejap dengan air sejuk dan toskan. Enoki mesti sentiasa dibilas dan dimasak, jangan dimakan mentah.

Susun ikatan enoki rata di atas pinggan cetek tahan panas yang ada bibir. Sos dan air cendawan akan berkumpul di pinggan dan menjadi kuahnya.

![Bawang putih, cili padi dan daun bawang dicurah ke atas cendawan enoki mentah di atas pinggan putih.](https://cdn.vattimalaysia.com/2023/11/step4_spicy-enoki-mushroom.webp)

## Mengukus enoki dalam ketuhar stim

Dalam ketuhar stim, wap mengelilingi pinggan dengan sekata dan tiada titisan air jatuh ke atasnya, jadi enoki masak rata dalam satu lapisan tanpa menjadi berair. Gunakan tahap stim paling tinggi selama 6 hingga 8 minit. Enoki halus cepat terlebih masak: lebih 10 minit ia menjadi licin dan hilang rangupnya.

Kedua-dua ketuhar kombi VATTI boleh mengukus: [VA05](/built-in-combi-oven-va05/) ada mod stim rendah, sederhana dan tinggi, dan [VA06](/vatti-magic-series-combi-oven-va06/) ada tiga mod mengukus. Anda boleh mengukus ikan atau nasi pada rak lain pada masa yang sama. Panduan kami tentang [apa itu ketuhar stim](/ms/panduan-membeli/apa-itu-ketuhar-stim/) menerangkan cara ia berfungsi.

[![VATTI VA05 combi oven](https://cdn.vattimalaysia.com/2026/08/built-in-combi-oven-va05-front.webp)](/built-in-combi-oven-va05/)
[![VATTI VA06 combi oven](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-combi-oven-va06-front.webp)](/vatti-magic-series-combi-oven-va06/)

Tiada ketuhar stim? Letakkan pinggan di atas rak dalam kuali berisi air yang mendidih kuat, tutup dan kukus dengan api besar untuk masa yang sama.

## Sos dan minyak panas

Sos dicurah sebelum mengukus supaya enoki menyerapnya semasa masak; minyak panas disiram selepas itu untuk menaikkan aroma bawang putih dan cili mentah di atasnya.

![Sos kicap dan sos tiram disudukan ke atas cendawan enoki yang ditabur bawang putih dan cili sebelum dikukus.](https://cdn.vattimalaysia.com/2023/11/step9_spicy-enoki-mushroom.webp)

- **Sos tiram dan kicap cair** memberi rasa masin dan lemak.
- **Sedikit gula** melembutkan rasa kicap.
- **Minyak bijan** dimasukkan dalam sos, bukan dalam minyak panas, kerana ia hangus pada suhu tinggi.
- **Minyak cili** pilihan sahaja. Tanpanya, hidangan ini lebih berbau bawang putih daripada pedas.

## Hidangkan dengan

- **Nasi putih atau mi kosong**, untuk menyerap sos di pinggan.
- **Ikan kukus atau tauhu**, dikukus dalam ketuhar stim yang sama pada rak lain.
- **Steamboat**, sebagai lauk sampingan yang siap berperisa.
- **Sayur goreng** seperti kailan atau sawi.

## Soalan lazim tentang cendawan enoki

**Berapa lama mengukus cendawan enoki?**
6 hingga 8 minit pada stim tinggi, dalam ketuhar stim atau kuali bertutup di atas air mendidih. Ia siap apabila batangnya lembut tetapi masih sedikit rangup.

**Perlukah cendawan enoki dibasuh?**
Ya. Potong pangkal akarnya, leraikan helaiannya dan bilas sekejap di bawah air sejuk, kemudian toskan. Enoki mesti dimasak sebelum dimakan.

**Bolehkah enoki dimasak dalam ketuhar atau air fryer?**
Boleh, tetapi hasilnya berbeza. Haba kering merangupkan hujungnya dan mengeringkan helaiannya; wap mengekalkannya lembut dan menyerap sos. Untuk resepi ini, kukus.

**Berapa lama cendawan enoki tahan?**
Kira-kira seminggu dalam peti sejuk dalam bungkusan asalnya. Selepas dibuka, balut dengan tisu dapur dalam bekas dan gunakan dalam dua hingga tiga hari. Buang jika ia menjadi perang atau berlendir.

**Adakah cendawan enoki rendah karbohidrat?**
Ya. Enoki kebanyakannya air dan serat, rendah kalori dan karbohidrat.

## Resepi lain untuk ketuhar VATTI

- [Ikan stim limau dan ikan stim halia](/ms/resipi/resepi-ikan-stim-limau/)
- [Cream puff kastard](/ms/resipi/resepi-cream-puff-kastard/)
- [Lasagna ayam mudah](/ms/resipi/resepi-lasagna-ayam/)

## Kesimpulan

Enoki pedas ialah antara hidangan paling cepat dalam ketuhar stim: masukkan pinggan, lapan minit, sesudu minyak panas. Lihat [ketuhar kombi dan stim VATTI](/ms/ketuhar-kombi/) untuk apa lagi yang boleh dikukus.

[Bandingkan ketuhar kombi VATTI](/ms/ketuhar-kombi/)', 622, 4, 'Vatti Malaysia', 422, '2026-11-26T22:00:00+08:00', '2026-11-26T22:00:00+08:00', 0, 1, 'ms-MY', 'spicy-enoki-mushrooms',
'Cendawan enoki kukus di atas pinggan putih, ditabur daun bawang, bawang putih dan cili padi merah dalam sos kicap dan sos tiram.');
INSERT INTO article_category (article_id, category_id, is_primary) VALUES (136, (SELECT id FROM blog_category WHERE slug = 'recipe'), 1);

INSERT INTO recipe (id, article_id, position, name, description, prep_minutes, cook_minutes, total_minutes, yield_qty, yield_label, cuisine, meal_category, calories, notes, hero_image_id, appliance_md, keywords) VALUES
  (26, 136, 1, 'Cendawan Enoki Pedas Kukus', 'Cendawan enoki dikukus di bawah sos kicap dan sos tiram dengan bawang putih, cili padi dan daun bawang, kemudian disiram minyak panas.', 10, 8, 18, '3', '2 hingga 3 hidangan', 'Cina, Malaysia', 'Lauk Sampingan', NULL, 'Tiada ketuhar stim? Kukus pinggan di atas rak dalam kuali bertutup berisi air yang mendidih kuat untuk masa yang sama. Untuk kurang pedas, gunakan sebiji cili dan tinggalkan minyak cili.', 422, 'Ketuhar kombi [VA05](/built-in-combi-oven-va05/) atau [VA06](/vatti-magic-series-combi-oven-va06/), tahap stim tertinggi', 'resepi enoki, cendawan enoki pedas, enoki kukus, enoki bawang putih, resepi ketuhar stim');

INSERT INTO recipe_ingredient (recipe_id, position, text) VALUES
  (26, 1, '200 g cendawan enoki (1 bungkus), pangkal akar dipotong'),
  (26, 2, '4 ulas bawang putih, dicincang halus'),
  (26, 3, '3 biji cili padi, dicincang'),
  (26, 4, '2 batang daun bawang, dihiris'),
  (26, 5, '1 sudu besar sos tiram'),
  (26, 6, '1 sudu besar kicap cair'),
  (26, 7, '1 sudu kecil gula'),
  (26, 8, '1 sudu kecil minyak bijan'),
  (26, 9, '1 sudu besar air'),
  (26, 10, '2 sudu besar minyak masak'),
  (26, 11, '1 sudu besar minyak cili (pilihan)');

INSERT INTO recipe_step (recipe_id, position, text) VALUES
  (26, 1, 'Isi tangki air ketuhar stim dan panaskan pada tahap stim paling tinggi.'),
  (26, 2, 'Leraikan enoki kepada ikatan kecil, bilas sekejap dan toskan, kemudian susun rata di atas pinggan cetek tahan panas.'),
  (26, 3, 'Tabur separuh bawang putih dan separuh cili ke atas enoki.'),
  (26, 4, 'Campurkan sos tiram, kicap cair, gula, minyak bijan dan air, dan sudukan ke atas cendawan.'),
  (26, 5, 'Kukus 6 hingga 8 minit, sehingga batangnya lembut tetapi masih sedikit rangup.'),
  (26, 6, 'Keluarkan pinggan dan tabur baki bawang putih, cili dan daun bawang.'),
  (26, 7, 'Panaskan minyak masak sehingga berkilat dan siram ke atas bawang putih, cili dan daun bawang supaya berdesis.'),
  (26, 8, 'Titiskan minyak cili jika mahu, dan hidangkan segera dengan nasi.');
