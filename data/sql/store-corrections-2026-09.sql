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
