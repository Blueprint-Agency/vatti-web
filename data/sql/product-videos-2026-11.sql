-- YouTube videos from the owner, 2026-11-18, for seven hood pages.
--
-- The owner's list also named V993 (Jcui1pueXCg), V999 (dxWTvQS-fhs) and V937
-- (vx5EsrkiiJM). All three are already on their pages, from products.sql and
-- product-content.sql, so they are not repeated here.
--
-- Title, upload date and length are each video's own, read off YouTube. The
-- summary is written from the video's description; a figure goes in only where
-- the product's spec bullets give the same number. width/height are set for the
-- two Shorts so the player takes their portrait shape instead of 16:9.
--
-- V917 has two colourway pages (variant_group V917) and the videos are about
-- the model, so both pages get both: the Malay edit first, then the Chinese.
--
-- V929 (x6SMFtdNnAY): oEmbed finds it on the Vatti Malaysia channel, but on
-- 2026-11-18 YouTube reported it unplayable to an anonymous viewer, so no date
-- or length could be read. If it still shows "Video unavailable" on the page,
-- its visibility on the channel is the thing to fix, not this row.

INSERT INTO product_video (product_id, position, video_id, title, summary, published_on, duration_seconds)
SELECT id, 0, 'rH2BVcEsZDE', 'Vatti V919 Cooker Hood',
  'The V919 over a stir-fry: the silver-edged glass front, 3,050 m³/h airflow at 1,300 Pa, the smart suction sensor that follows the amount of smoke, and the self-cleaning cycle.',
  '2024-11-12', 69
  FROM product WHERE slug = 'vatti-magic-series-cooker-hood-v919';

INSERT INTO product_video (product_id, position, video_id, title, summary, width, height)
SELECT id, 0, 'x6SMFtdNnAY', 'VATTI V929 cooker hood',
  'A short look at the V929, in Chinese.',
  360, 640
  FROM product WHERE slug = 'vatti-aetheris-series-cooker-hood-v929';

INSERT INTO product_video (product_id, position, video_id, title, summary, published_on, duration_seconds, width, height)
SELECT id, 0, 'm7Ojx4z7Ubw', 'VATTI Hidden Series Range Hood V938',
  'Why the V938 hides in the cabinet line instead of standing out from it, without giving up suction or the smart features. In Chinese.',
  '2026-11-06', 135, 360, 640
  FROM product WHERE slug = 'vatti-hidden-series-range-hood-v938';

INSERT INTO product_video (product_id, position, video_id, title, summary, published_on, duration_seconds)
SELECT id, 0, 'd1DKboxXpuo', 'VATTI V960 Stellar Series Cooker Hood',
  'The semi-hidden V960 set into the cabinets: strong direct suction, live PM2.5 readings and control from the app while you are out. In Chinese.',
  '2026-11-11', 111
  FROM product WHERE slug = 'vatti-stellar-series-cooker-hood-v960';

INSERT INTO product_video (product_id, position, video_id, title, summary, published_on, duration_seconds)
SELECT id, 0, 'aSTn-MAJLRA', 'VATTI Malaysia V917 Batik Cooker Hood',
  'The V917, its design drawn from Malaysian batik: 2,250 m³/h at 900 Pa, gesture control, a 48 dB BLDC motor, Heat Auto Clean and up to 92% oil filtration. In Malay.',
  '2026-11-11', 113
  FROM product WHERE variant_group = 'V917';

INSERT INTO product_video (product_id, position, video_id, title, summary, published_on, duration_seconds)
SELECT id, 1, '-7Ay56yS01E', 'Vatti V917 Cooker Hood (Batik White)',
  'The same V917 Batik story told in Chinese, on the white colourway.',
  '2026-11-11', 117
  FROM product WHERE variant_group = 'V917';
