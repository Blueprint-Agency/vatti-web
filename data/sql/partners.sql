-- The retail partners who carry VATTI, as shown in the "Our Partners" wall on
-- the homepage. Was src/lib/partners.ts until 2026-09; see `partner` in
-- schema.sql for why it is data.
--
-- The source is seven Elementor slides (2023/05/Untitled-design-2.jpg and its
-- six siblings, all still on R2). Each one is a 2400x576 Canva export with four
-- or five logos laid out on white — the carousel was paging through *strips*,
-- not through logos, so nothing in the media library holds a partner mark on its
-- own. These were cut back out by segmenting each strip on its all-white
-- columns, then trimmed and flattened onto white.
--
-- Order is the order of the strips, which is the order the carousel ran in.
--
-- Two are degraded in the source and cannot be recovered from it:
--   Benova  clipped left and right in the strip, so its tagline read
--           "y & Premium Applianc". Cropped to the wordmark.
--   Tahol   a white outline mark on white. Only the red wordmark survives,
--           and it is already invisible on the live site.
-- Ask the owner for original artwork for those two.
--
-- To appoint a partner: stage the mark under old-media/2026/09/partners/,
-- `pnpm media:upload`, then add a row here with the file's own pixel size. To
-- drop one, delete its row. Nothing in src/ changes either way.

INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (1, 'Kitchentech', 'https://cdn.vattimalaysia.com/2026/09/partners/kitchentech.webp', 450, 65, 1);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (2, 'Darson Xtra', 'https://cdn.vattimalaysia.com/2026/09/partners/darson-xtra.webp', 450, 78, 2);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (3, 'DeBathlabz', 'https://cdn.vattimalaysia.com/2026/09/partners/de-bathlabz.webp', 450, 96, 3);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (4, 'Urbanez', 'https://cdn.vattimalaysia.com/2026/09/partners/urbanez.webp', 450, 80, 4);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (5, 'Benova', 'https://cdn.vattimalaysia.com/2026/09/partners/benova.webp', 450, 143, 5);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (6, 'E.S.H Electrical', 'https://cdn.vattimalaysia.com/2026/09/partners/esh-electrical.webp', 221, 216, 6);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (7, 'Eurotan', 'https://cdn.vattimalaysia.com/2026/09/partners/eurotan.webp', 450, 143, 7);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (8, 'Felicita Home''s Deco', 'https://cdn.vattimalaysia.com/2026/09/partners/felicita.webp', 368, 123, 8);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (9, 'De HomeBiz', 'https://cdn.vattimalaysia.com/2026/09/partners/de-homebiz.webp', 447, 168, 9);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (10, 'Kregen', 'https://cdn.vattimalaysia.com/2026/09/partners/kregen.webp', 382, 216, 10);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (11, 'Living Portal', 'https://cdn.vattimalaysia.com/2026/09/partners/living-portal.webp', 414, 107, 11);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (12, 'eMart', 'https://cdn.vattimalaysia.com/2026/09/partners/emart.webp', 306, 194, 12);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (13, 'Standard Kitchen', 'https://cdn.vattimalaysia.com/2026/09/partners/standard-kitchen.webp', 450, 116, 13);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (14, 'Kuche + Bath Outlet', 'https://cdn.vattimalaysia.com/2026/09/partners/kuche-bath-outlet.webp', 216, 216, 14);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (15, 'JW Sanitary Home', 'https://cdn.vattimalaysia.com/2026/09/partners/jw-sanitary.webp', 215, 216, 15);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (16, 'Nikko Kitchen', 'https://cdn.vattimalaysia.com/2026/09/partners/nikko-kitchen.webp', 223, 216, 16);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (17, 'WPC Ideas Enterprise', 'https://cdn.vattimalaysia.com/2026/09/partners/wpc-ideas.webp', 216, 216, 17);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (18, 'SK Lifestyles', 'https://cdn.vattimalaysia.com/2026/09/partners/sk-lifestyles.webp', 216, 216, 18);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (19, 'SK Hardware', 'https://cdn.vattimalaysia.com/2026/09/partners/sk-hardware.webp', 217, 216, 19);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (20, 'Tahol', 'https://cdn.vattimalaysia.com/2026/09/partners/tahol.webp', 203, 216, 20);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (21, 'KAC Kitchen & Bath', 'https://cdn.vattimalaysia.com/2026/09/partners/kac-kitchen-bath.webp', 354, 216, 21);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (22, 'Kah Hoe Enterprise', 'https://cdn.vattimalaysia.com/2026/09/partners/kah-hoe.webp', 358, 216, 22);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (23, 'JF Home Appliances', 'https://cdn.vattimalaysia.com/2026/09/partners/jf-home-appliances.webp', 172, 216, 23);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (24, 'Heng Foong Sanitaryware', 'https://cdn.vattimalaysia.com/2026/09/partners/heng-foong.webp', 450, 68, 24);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (25, 'Home Care', 'https://cdn.vattimalaysia.com/2026/09/partners/home-care.webp', 450, 204, 25);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (26, 'Novo Bath', 'https://cdn.vattimalaysia.com/2026/09/partners/novo-bath.webp', 450, 127, 26);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (27, 'Sin Jin Da Hardware', 'https://cdn.vattimalaysia.com/2026/09/partners/sin-jin-da.webp', 450, 74, 27);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (28, 'Mum Kitch', 'https://cdn.vattimalaysia.com/2026/09/partners/mum-kitch.webp', 237, 216, 28);
INSERT INTO partner (id, name, image_url, image_w, image_h, sort_order) VALUES (29, 'Adamas', 'https://cdn.vattimalaysia.com/2026/09/partners/adamas.webp', 329, 216, 29);
