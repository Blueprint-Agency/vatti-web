-- Dealer detail corrections, 2026-09-28.
--
-- Why a correction file and not an edit in stores.sql: that file is generated
-- from the scrape by scripts/import-stores.mjs, and a regeneration would drop
-- the change. Same pattern as seo-metadata-2026-09.sql. The name sorts after
-- the generated files, which db-build.mjs runs first.
--
-- Phone numbers keep the site's own format, '0X-XXXX XXXX', which telHref()
-- in src/lib/queries/store.ts turns into the +60 tel: link.

-- Xam Max Kitchen, Damansara Damai: the client supplied a new landline,
-- replacing the mobile number the scrape carried.
UPDATE store SET phone = '03-7710 1677' WHERE slug = 'klang-valley-xam-max-kitchen';

-- KBO Megastore (Uptown), Damansara Utama: removed at the client's request,
-- 2026-09-28. The store table has no published flag, so the row goes, and its
-- photo goes with it: db:check rejects an image row nothing uses. Its URL was
-- in the legacy sitemap and must still resolve, so it 301s to the dealer
-- list. This file sorts after redirects.sql, whose opening DELETE would
-- otherwise wipe the row. The Jinjang branch and the eWarranty dealer entry
-- for the Uptown branch are untouched; the warranty list is the client's to
-- reconcile (CLAUDE.md § eWarranty).
DELETE FROM store WHERE slug = 'klang-valley-kbo-megastore-sdn-bhd-uptown';
DELETE FROM image WHERE url = 'https://cdn.vattimalaysia.com/2023/11/KUCHA-UPTOWN_KV.webp';
INSERT INTO redirect (from_path, to_path, code) VALUES
  ('/store/klang-valley-kbo-megastore-sdn-bhd-uptown/', '/store-locations/', 301);

-- KBO Megastore (Kuchai Lama) and (Jinjang): renamed by the client to their
-- Kuche Bath Outlet trading names, 2026-10-28, with new addresses and Google
-- Maps links. Jinjang is now listed as Kepong and shares the SS2 branch's
-- number. The slugs, and so the URLs, stay as WordPress had them; the 58200
-- and 52000 postcodes are kept from the scrape, since the client's text gave
-- none. The eWarranty entries keep the old names (CLAUDE.md § eWarranty).
UPDATE store SET
  name = 'KBO Kuche Bath Outlet (Kuchai Lama)',
  address = 'G-7 & G-8, Dataran Loka, 9, Jalan Kuchai Lama, 58200 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
  directions_url = 'https://maps.app.goo.gl/ezmNtKVkHCrHJdri9'
  WHERE slug = 'kbo-megastore-sdn-bhd-kuchai-lama';
UPDATE store SET
  name = 'KBO Kuche Bath Outlet (Kepong)',
  address = '29, Jalan Kepong, 52000 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur',
  phone = '011-3910 1314',
  directions_url = 'https://maps.app.goo.gl/WDtrUy5qX9pTp1KNA'
  WHERE slug = 'klang-valley-kbo-megastore-sdn-bhd-jinjang';

-- Mum Kitch (Bukit Jalil): removed at the client's request, 2026-10-29, the
-- same way as the Uptown branch above. The Bandar Sunway branch stays.
DELETE FROM store WHERE slug = 'klang-valley-mum-kitch-bukit-jalil';
DELETE FROM image WHERE url = 'https://cdn.vattimalaysia.com/2023/11/MUM-KITCH-BJ_KV.webp';
INSERT INTO redirect (from_path, to_path, code) VALUES
  ('/store/klang-valley-mum-kitch-bukit-jalil/', '/store-locations/', 301);
