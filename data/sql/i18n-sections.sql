-- Blog sections in Malay and Chinese: the URL segment and the name.
--
-- Malay segments are localised (CLAUDE.md § Languages), so a Malay buying
-- guide lives at /ms/panduan-membeli/<leaf>/. Chinese keeps the English
-- segment and only translates the name. English needs no rows.
--
-- Names are the single source for every place a section is named: breadcrumb,
-- archive heading, header and footer menus, the "More ..." row. Do not copy them
-- into src/i18n.
INSERT INTO section_i18n (section, lang, slug, name) VALUES
  ('buying-guide',  'ms-MY', 'panduan-membeli', 'Panduan Membeli'),
  ('tips-tricks',   'ms-MY', 'tip-petua',       'Tip & Petua'),
  ('recipe',        'ms-MY', 'resipi',          'Resipi'),
  ('uncategorized', 'ms-MY', 'lain-lain',       'Lain-lain'),
  ('buying-guide',  'zh-MY', 'buying-guide',    '选购指南'),
  ('tips-tricks',   'zh-MY', 'tips-tricks',     '实用贴士'),
  ('recipe',        'zh-MY', 'recipe',          '食谱'),
  ('uncategorized', 'zh-MY', 'uncategorized',   '其他');
