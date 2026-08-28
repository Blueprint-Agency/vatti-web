-- V917's "Carbon Grey" product was actually photographed as "Carbon Black"
-- (data/sql/product-images-2026-08.sql used that folder as a stand-in, and
-- the owner has since confirmed Carbon Black is the real finish name). Only
-- the label changes here, not the slug — the URL is a legacy WordPress path
-- and CLAUDE.md's one rule holds regardless of what the button under it says.
UPDATE product SET
  colour_variant = 'Carbon Black',
  name = 'VATTI Cooker Hood V917 (Carbon Black)',
  seo_title = 'VATTI Cooker Hood V917 (Carbon Black)'
  WHERE slug = 'vatti-cooker-hood-v917-carbon-grey';
