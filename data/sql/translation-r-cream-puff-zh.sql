-- Cream puffs with custard, Chinese edition (2026-11-26). Paired with the English recipe
-- (article 3, rewritten in refresh-recipes-2026-11.sql) by translation_key
-- 'cream-puff-custard', which this file sets on the English row as well.
--
-- Why: the November appliance recipes drew 64 of their 84 clicks from the
-- Malay and Chinese editions (GSC 5 to 23 Nov). Keyword (Ubersuggest MY,
-- 2026-11-26): `泡芙做法` 90 (SD 35).
--
-- Same recipe, figures, method and VATTI claims as the English; nothing added.
-- Product pages keep their English URLs; categories, the steam oven guide and
-- the other translated recipes link to their Chinese editions. The English
-- featured image is shared, so the Chinese alt goes in featured_image_alt.
-- Calories NULL as in the English. No prices, running costs, installation
-- copy, rival brands or em dashes.

INSERT INTO article (id, slug, path, section, title, h1, meta_description, body_md, word_count, reading_minutes, author, featured_image_id, published_at, modified_at, schema_disabled, is_published, lang, translation_key, featured_image_alt)
VALUES (139, 'cream-puff-with-custard-filing-recipe', 'recipe/cream-puff-with-custard-filing-recipe', 'recipe',
'奶油泡芙做法：卡仕达馅泡芙，酥脆不塌',
'卡仕达奶油泡芙，在家也能做得酥脆不塌',
'卡仕达奶油泡芙做法，用克数计量。烤箱温度、卡仕达酱做法，以及泡芙为什么会塌、会软，一次讲清楚。',
'奶油泡芙是中间空心的泡芙壳（choux 面糊），里面挤满浓稠的香草卡仕达酱。面糊在炉上五分钟就能煮好，进烤箱后完全靠自身的水分和鸡蛋产生蒸汽膨胀起来，所以做法比材料更重要。这份食谱用克数计量，可做约20颗泡芙，附卡仕达馅做法，以及泡芙塌陷的原因。

### 一览

- **烤箱：**上下火200°C烤15分钟，再转180°C烤15至20分钟。
- **风扇：**关掉。开风扇容易让泡芙膨胀歪斜。
- **炉门：**前25分钟不要打开，否则泡芙会塌。
- **烤好的标准：**深金黄色，拿起来硬挺轻盈，裂口干爽。
- **份量：**约20颗，直径5厘米。

## 煮泡芙面糊

泡芙面糊要“煮”两次：一次在锅里，一次在烤箱里。把水、牛奶、牛油、糖和盐煮到大滚、牛油完全融化，然后一次倒入全部面粉，用力搅拌。继续用小火翻炒1至2分钟，直到面糊离锅成团、锅底出现一层薄膜。这一步把面糊炒干，它才能吸收足够的鸡蛋。

面糊放凉5分钟后，分次加入蛋液搅匀。当面糊有光泽、从刮刀上落下时呈厚厚的倒三角形就停手。鸡蛋不一定全部用完：面糊太稀，烤的时候会摊开而不是鼓起。

稳定的小火让这一步更好掌握；任何一台 [VATTI 燃气炉](/zh/cooker-hob-in-malaysia/)都能稳住火力。

## 烤泡芙

在铺了烘焙纸的烤盘上挤出直径4厘米的面糊，间隔5厘米，用沾水的手指压平尖角。先用上下火200°C烤15分钟，让面糊里的水分变成蒸汽把泡芙撑起来，再转180°C烤15至20分钟把外壳烤干。前25分钟千万不要开炉门。烤到深金黄色后关火，在每颗泡芙侧面戳一个小洞，炉门微开，留在烤箱里10分钟让它干透。

[VATTI VA05](/built-in-combi-oven-va05/) 和 [VA06](/vatti-magic-series-combi-oven-va06/) 蒸烤一体机都有上下管独立控温：如果泡芙还没膨胀完顶部就先上色，可以把上下火分开设定。[VATTI 07559](/vatti-built-in-air-fryer-oven-07559/) 有九种烘烤功能、75升容量，一次能放两盘泡芙。

[![VATTI VA05 combi oven](https://cdn.vattimalaysia.com/2026/08/built-in-combi-oven-va05-front.webp)](/built-in-combi-oven-va05/)
[![VATTI VA06 combi oven](https://cdn.vattimalaysia.com/2026/08/vatti-magic-series-combi-oven-va06-front.webp)](/vatti-magic-series-combi-oven-va06/)
[![VATTI 07559 built-in air fryer oven](https://cdn.vattimalaysia.com/2024/08/Built-in-air-fryer-oven-07559-product-photo.webp)](/vatti-built-in-air-fryer-oven-07559/)

## 卡仕达馅

泡芙的馅是卡仕达酱：牛奶加蛋黄和玉米淀粉，在炉上煮到浓稠。开始变稠后要不停搅拌，并让它冒泡滚足一分钟，玉米淀粉才会熟透、没有粉味。表面贴上保鲜膜防止结皮，冷藏至少2小时。

想要更轻盈的口感，可以把200毫升打发的鲜奶油拌进冷却的卡仕达酱里。马来西亚很多面包店就是这样做的，也更容易挤花。

## 填馅

泡芙壳要完全放凉才能填馅，而且越接近享用时间填越好。可以把泡芙横切开，用勺子或裱花袋填入卡仕达酱；也可以用小号裱花嘴从底部戳入，挤到泡芙变重为止。最后撒上糖粉，或在顶部挤一圈卡仕达酱。

## 泡芙常见问题

**泡芙为什么会塌？**
通常是太早开炉门、没烤够时间，或面糊太稀。前25分钟不要开门，烤到深金黄色，面糊呈厚倒三角形时就不要再加蛋。

**泡芙为什么会软？**
趁热填馅、太早填馅，或没有把壳烤干。每颗泡芙戳洞后在关火的烤箱里烘干，完全放凉，享用前几小时内再填馅。

**可以用吉士粉代替玉米淀粉吗？**
可以。用同等重量的吉士粉（custard powder）代替玉米淀粉，增稠效果一样，还会带来黄色和香草味。

**泡芙可以提前做吗？**
可以。没填馅的泡芙壳放密封盒可保存两天，冷冻可保存一个月。用180°C回烤5分钟恢复酥脆，放凉后再填馅。

**填好馅的泡芙能放多久？**
冷藏最多一天。不要在室温放过夜：卡仕达酱含鸡蛋和牛奶，必须冷藏。

## 更多 VATTI 厨电食谱

- [湿润巧克力蒸蛋糕](/zh/recipe/moist-chocolate-steamed-cake/)
- [蒜蓉辣椒蒸金针菇](/zh/recipe/spicy-enoki-mushrooms-recipe-step-by-step-guide/)
- [鸡肉千层面](/zh/recipe/simple-chicken-lasagna-recipe/)

## 总结

好泡芙靠三件事：面糊炒干、烤箱够热、炉门不开。泡芙壳做成功了，卡仕达馅就简单了。想要能分开控制上下火的烤箱，可以看看 [VATTI 蒸烤一体机](/zh/combi-and-steam-oven-in-malaysia/)。

[看看 VATTI 烤箱](/zh/combi-and-steam-oven-in-malaysia/)', 1138, 3, 'Vatti Malaysia', 414, '2026-11-26T22:00:00+08:00', '2026-11-26T22:00:00+08:00', 0, 1, 'zh-MY', 'cream-puff-custard',
'撒上糖粉的金黄泡芙，每颗顶上挤一圈黄色卡仕达酱并点缀金箔，放在烤盘上。');
INSERT INTO article_category (article_id, category_id, is_primary) VALUES (139, (SELECT id FROM blog_category WHERE slug = 'recipe'), 1);

INSERT INTO recipe (id, article_id, position, name, description, prep_minutes, cook_minutes, total_minutes, yield_qty, yield_label, cuisine, meal_category, calories, notes, hero_image_id, appliance_md, keywords) VALUES
  (29, 139, 1, '卡仕达奶油泡芙', '酥脆空心的泡芙壳，填入顺滑的香草卡仕达酱。', 40, 35, 75, '20', '20颗泡芙', '法式，马来西亚面包店', '甜点', NULL, '卡仕达酱填馅前至少冷藏2小时。想要更轻盈，可拌入200毫升打发鲜奶油。泡芙壳完全放凉后才填馅。', 414, '[VA05](/built-in-combi-oven-va05/) 或 [VA06](/vatti-magic-series-combi-oven-va06/) 蒸烤一体机，或 [07559](/vatti-built-in-air-fryer-oven-07559/) 嵌入式烤箱，上下火', '泡芙做法, 奶油泡芙, 卡仕达泡芙, 卡仕达酱, 泡芙面糊');

INSERT INTO recipe_ingredient (recipe_id, position, text) VALUES
  (29, 1, '泡芙面糊：清水125毫升'),
  (29, 2, '泡芙面糊：全脂牛奶125毫升'),
  (29, 3, '泡芙面糊：牛油100克，切小块'),
  (29, 4, '泡芙面糊：糖1茶匙'),
  (29, 5, '泡芙面糊：盐1/2茶匙'),
  (29, 6, '泡芙面糊：普通面粉150克，过筛'),
  (29, 7, '泡芙面糊：鸡蛋4至5颗（约220克），打散'),
  (29, 8, '卡仕达：全脂牛奶500毫升'),
  (29, 9, '卡仕达：蛋黄4颗'),
  (29, 10, '卡仕达：糖100克'),
  (29, 11, '卡仕达：玉米淀粉或吉士粉40克'),
  (29, 12, '卡仕达：牛油30克'),
  (29, 13, '卡仕达：香草精1茶匙'),
  (29, 14, '糖粉适量（可选）');

INSERT INTO recipe_step (recipe_id, position, text) VALUES
  (29, 1, '先做卡仕达：牛奶加热至冒热气。蛋黄、糖和玉米淀粉搅打至发白，再边搅边倒入热牛奶。'),
  (29, 2, '倒回锅中，中小火加热并不停搅拌至浓稠，滚足1分钟。离火后拌入牛油和香草精。'),
  (29, 3, '表面贴保鲜膜，冷藏至少2小时。'),
  (29, 4, '烤箱以上下火200°C预热，不开风扇，烤盘铺烘焙纸。'),
  (29, 5, '水、牛奶、牛油、糖和盐煮至大滚。一次倒入面粉，小火用力翻炒1至2分钟，至面糊成团、锅底起薄膜。'),
  (29, 6, '面糊放凉5分钟，分次加入蛋液，搅至有光泽、落下呈厚倒三角形。'),
  (29, 7, '在烤盘上挤出直径4厘米的面糊，间隔5厘米，用沾水手指压平尖角。'),
  (29, 8, '200°C烤15分钟，再转180°C烤15至20分钟，前25分钟不要开炉门。'),
  (29, 9, '关火，在每颗泡芙侧面戳洞，炉门微开留在烤箱内10分钟，取出放在网架上完全放凉。'),
  (29, 10, '从底部或切开后填入卡仕达酱，撒上糖粉即可享用。');
