-- Easy chicken lasagna, Chinese edition (2026-11-26). Paired with the English recipe
-- (article 51, rewritten in refresh-recipes-2026-11.sql) by translation_key
-- 'chicken-lasagna', which this file sets on the English row as well.
--
-- Why: the November appliance recipes drew 64 of their 84 clicks from the
-- Malay and Chinese editions (GSC 5 to 23 Nov). Keyword (Ubersuggest MY,
-- 2026-11-26): no measurable Chinese volume for 鸡肉千层面; published for the edition pair and the hreflang set.
--
-- Same recipe, figures, method and VATTI claims as the English; nothing added.
-- Product pages keep their English URLs; categories, the steam oven guide and
-- the other translated recipes link to their Chinese editions. The English
-- featured image is shared, so the Chinese alt goes in featured_image_alt.
-- Calories NULL as in the English. No prices, running costs, installation
-- copy, rival brands or em dashes.

INSERT INTO article (id, slug, path, section, title, h1, meta_description, body_md, word_count, reading_minutes, author, featured_image_id, published_at, modified_at, schema_disabled, is_published, lang, translation_key, featured_image_alt)
VALUES (141, 'simple-chicken-lasagna-recipe', 'recipe/simple-chicken-lasagna-recipe', 'recipe',
'鸡肉千层面做法：番茄鸡肉酱配白酱，简单焗烤',
'简易鸡肉千层面（番茄红酱与白酱）',
'简单的焗鸡肉千层面：番茄鸡肉酱、奶香白酱和马苏里拉芝士，190°C焗烤。烤箱设定、铺层顺序和提前准备的技巧。',
'鸡肉千层面是把面片、番茄鸡肉酱、奶香白酱和马苏里拉芝士一层层铺好，再用190°C焗到表面金黄冒泡。这份食谱用鸡绞肉或手撕鸡代替牛肉，用白酱代替 ricotta 芝士，并用免煮千层面片，大约30分钟就能送进烤箱，够6至8人吃。

### 一览

- **烤箱：**190°C，上下火。
- **时间：**盖锡纸烤25分钟，再揭开烤15至20分钟。
- **上色：**最后用上火或烧烤功能烤3至5分钟。
- **静置：**切之前静置15分钟，否则层次会滑散。
- **烤盘：**约23 x 33厘米，6至8人份。

## 鸡肉酱

用少许油把洋葱和蒜头炒香，加入鸡绞肉或撕好的熟鸡肉，再加番茄碎、番茄膏和干香草小火煮15分钟至浓稠。酱汁一定要够稠：太稀的酱会让千层面上桌就散开。调味要足，因为面片和白酱会吸走不少咸味。

## 白酱

白酱（béchamel）让千层面口感浓郁顺滑，在马来西亚也比 ricotta 芝士便宜、好买。牛油融化后加入面粉炒一分钟，再分次加入温牛奶搅匀，小火煮到能挂在勺背上。用盐、白胡椒和一小撮肉豆蔻调味。

## 千层面怎么铺

1. 烤盘底部先抹一层薄薄的鸡肉酱，防止面片粘底。
2. 铺一层千层面片，按需要掰断填满。
3. 依次铺鸡肉酱、白酱和一把马苏里拉芝士。
4. 重复两次，最上层是面片、白酱、剩下的马苏里拉芝士和帕马森芝士。

免煮面片要靠酱汁才能煮软，所以每一片都要完全被酱汁盖住。

## 进烤箱焗

烤盘盖上锡纸，用上下火190°C烤25分钟，让面片在锡纸下的蒸汽里软化。揭开锡纸再烤15至20分钟，直到边缘冒泡、表面金黄。想要表面更焦香，最后用上火或烧烤功能烤3至5分钟。

能分开设定上下火的烤箱，做这最后一步特别方便：[VATTI VA05](/built-in-combi-oven-va05/) 和 [VA06](/vatti-magic-series-combi-oven-va06/) 蒸烤一体机都有上下管独立控温，可以让上火把芝士焗香，下火保持稳定。[VATTI 07559](/vatti-built-in-air-fryer-oven-07559/) 有75升大容量，放大号千层面烤盘也绰绰有余。

[![VATTI VA05 combi oven](https://cdn.vattimalaysia.com/2026/08/built-in-combi-oven-va05-front.webp)](/built-in-combi-oven-va05/)
[![VATTI VA06 combi oven](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-combi-oven-va06-front.webp)](/vatti-magic-series-combi-oven-va06/)
[![VATTI 07559 built-in air fryer oven](https://cdn.vattimalaysia.com/2024/08/Built-in-air-fryer-oven-07559-product-photo.webp)](/vatti-built-in-air-fryer-oven-07559/)

## 搭配建议

- **蒜香面包**，把盘里的酱汁抹干净。
- **蔬菜沙拉或凯撒沙拉**，解腻。
- **烤蔬菜**，如南瓜、西葫芦或甜椒，可以和千层面一起进烤箱。

## 鸡肉千层面常见问题

**鸡肉千层面用多少度烤？**
上下火190°C：盖锡纸烤25分钟，再揭开烤15至20分钟，直到金黄冒泡。

**没有 ricotta 芝士也能做千层面吗？**
可以。这份食谱用白酱代替，口感更浓郁，在马来西亚也更容易买到材料。

**千层面片需要先煮吗？**
用免煮面片就不需要。面片要被酱汁完全覆盖，先盖锡纸烤让它软化。普通面片则要先煮到刚软。

**千层面为什么会出水？**
肉酱太稀，或一出炉就马上切。把酱汁煮到浓稠，烤好后静置15分钟再切。

**鸡肉千层面可以提前做或冷冻吗？**
可以。铺好后盖好冷藏，最多放一天，烘烤时间多加10分钟。也可以冷冻保存三个月；前一晚放冷藏室解冻，再盖锡纸用180°C烤到中心热透。

## 更多 VATTI 厨电食谱

- [卡仕达奶油泡芙](/zh/recipe/cream-puff-with-custard-filing-recipe/)
- [港式清蒸鱼与马来酸柑蒸鱼](/zh/recipe/steamed-fish-recipe/)
- [蒜蓉辣椒蒸金针菇](/zh/recipe/spicy-enoki-mushrooms-recipe-step-by-step-guide/)

## 总结

好吃的鸡肉千层面要有浓稠的肉酱、像样的白酱，切之前还要静置。先盖锡纸烤、再揭开烤，最后把表面焗香。想要上下火可分开控制的烤箱，可以看看 [VATTI 蒸烤一体机](/zh/combi-and-steam-oven-in-malaysia/)。

[看看 VATTI 烤箱](/zh/combi-and-steam-oven-in-malaysia/)', 997, 3, 'Vatti Malaysia', 514, '2026-11-26T22:00:00+08:00', '2026-11-26T22:00:00+08:00', 0, 1, 'zh-MY', 'chicken-lasagna',
'白色盘上的一块焗鸡肉千层面，面片之间夹着番茄鸡丝酱，顶部是焗得金黄冒泡的芝士和白酱。');
INSERT INTO article_category (article_id, category_id, is_primary) VALUES (141, (SELECT id FROM blog_category WHERE slug = 'recipe'), 1);

INSERT INTO recipe (id, article_id, position, name, description, prep_minutes, cook_minutes, total_minutes, yield_qty, yield_label, cuisine, meal_category, calories, notes, hero_image_id, appliance_md, keywords) VALUES
  (31, 141, 1, '简易鸡肉千层面', '面片、番茄鸡肉酱、奶香白酱和马苏里拉芝士层层叠起，焗到金黄冒泡。', 30, 45, 75, '6-8', '6至8人份', '意式', '主菜', NULL, '切之前静置15分钟。如要提前准备，铺好后冷藏最多一天，烘烤时间多加10分钟。', 514, '[VA05](/built-in-combi-oven-va05/) 或 [VA06](/vatti-magic-series-combi-oven-va06/) 蒸烤一体机，或 [07559](/vatti-built-in-air-fryer-oven-07559/) 嵌入式烤箱，上下火', '鸡肉千层面, 千层面做法, 焗千层面, 白酱千层面, lasagna');

INSERT INTO recipe_ingredient (recipe_id, position, text) VALUES
  (31, 1, '鸡肉酱：食油2汤匙'),
  (31, 2, '鸡肉酱：洋葱1颗，切碎'),
  (31, 3, '鸡肉酱：蒜头4瓣，剁碎'),
  (31, 4, '鸡肉酱：鸡绞肉500克，或熟鸡肉丝3杯'),
  (31, 5, '鸡肉酱：番茄碎罐头1罐（400克）'),
  (31, 6, '鸡肉酱：番茄膏2汤匙'),
  (31, 7, '鸡肉酱：干牛至1茶匙、干罗勒1茶匙'),
  (31, 8, '鸡肉酱：盐、黑胡椒和糖1茶匙，适量调味'),
  (31, 9, '白酱：牛油50克'),
  (31, 10, '白酱：普通面粉50克'),
  (31, 11, '白酱：牛奶600毫升，加温'),
  (31, 12, '白酱：肉豆蔻粉、盐和白胡椒少许'),
  (31, 13, '免煮千层面片12片'),
  (31, 14, '马苏里拉芝士碎200克'),
  (31, 15, '帕马森芝士碎40克');

INSERT INTO recipe_step (recipe_id, position, text) VALUES
  (31, 1, '热油，把洋葱和蒜头炒软，加入鸡肉炒至不再呈粉红色。'),
  (31, 2, '加入番茄碎、番茄膏和香草，小火煮15分钟至浓稠，调味。'),
  (31, 3, '做白酱：牛油融化后加入面粉炒1分钟，再分次加入温牛奶搅匀，小火煮至能挂勺，用肉豆蔻、盐和胡椒调味。'),
  (31, 4, '烤箱以上下火190°C预热。'),
  (31, 5, '在23 x 33厘米的烤盘底部抹少许鸡肉酱，铺一层千层面片。'),
  (31, 6, '依次铺鸡肉酱、白酱和一把马苏里拉芝士。重复两次，最上层为面片、白酱、剩余马苏里拉芝士和帕马森芝士。'),
  (31, 7, '盖锡纸烤25分钟，揭开再烤15至20分钟至金黄冒泡。'),
  (31, 8, '用上火或烧烤功能再烤3至5分钟上色，静置15分钟后切块。');
