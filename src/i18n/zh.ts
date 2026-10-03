import type { Dict } from "./en";

/**
 * 简体中文 (Malaysia). Malaysian Chinese usage, not mainland: 炉头 for a hob
 * rather than 燃气灶, 门市 for a shop. Ubersuggest measures almost no Chinese
 * volume for Malaysia (2026-10-03: 抽油烟机 390/month, 净水器 320, nothing for
 * 油烟机, 燃气灶, 煤气炉, 炉头, 洗碗机, 蒸烤箱), so terms follow what ranking
 * Malaysian sellers and dealers write. See data/sql/keyword-map.sql.
 *
 * Brand: "VATTI 华帝", VATTI's own Chinese name. Pending the client's
 * confirmation that the Malaysian distributor uses it.
 */
export const zh: Dict = {
  doc: {
    skipToContent: "跳至内容",
    titleDefault: "VATTI 华帝马来西亚 | 抽油烟机、炉头与嵌入式烤箱",
    titleTemplate: "%s | VATTI 华帝马来西亚",
    description: "专为亚洲猛火烹饪打造的嵌入式厨房电器，全马 75 家授权经销商有售。",
    ogImageAlt: "安装在厨房里、控制面板亮起的 VATTI 抽油烟机",
  },

  nav: {
    home: "首页",
    products: "产品",
    blog: "资讯",
    catalog: "产品目录",
    menu: "菜单",
    storeLocations: "门市地点",
    aboutVatti: "关于华帝",
    ewarranty: "电子保修",
    contactUs: "联系我们",
    logoAlt: "VATTI 华帝马来西亚",
    language: "语言",
    categories: {
      "kitchen-hood-in-malaysia": "抽油烟机",
      "cooker-hob-in-malaysia": "炉头",
      "combi-and-steam-oven-in-malaysia": "蒸烤一体机",
      "dishwasher-in-malaysia": "洗碗机",
      "one-tap-purifier-in-malaysia": "单龙头净水器",
    },
  },

  footer: {
    products: "产品",
    company: "公司",
    guides: "指南",
    aboutUs: "关于我们",
    contactUs: "联系我们",
    storeLocations: "门市地点",
    ewarranty: "电子保修",
    instructionManual: "使用说明书",
    categories: {
      "kitchen-hood-in-malaysia": "抽油烟机",
      "cooker-hob-in-malaysia": "炉头",
      "combi-and-steam-oven-in-malaysia": "蒸烤一体机",
      "dishwasher-in-malaysia": "洗碗机",
      "one-tap-purifier-in-malaysia": "单龙头净水器",
    },
    hours: "每日营业，上午 10 点至晚上 8 点",
    tagline: (year: number) =>
      `© ${year} VATTI 华帝马来西亚。抽油烟机、炉头、嵌入式烤箱、洗碗机与净水器。`,
  },

  cta: {
    help: "让我们为您推荐",
  },

  article: {
    minRead: "分钟阅读",
    jumpToRecipe: "跳至食谱",
    more: (section: string) => `更多${section}`,
    seeAll: "查看全部",
    related: "相关文章",
    readTheGuide: "阅读指南",
    explore: (name: string) => `了解 VATTI ${name}`,
    recipe: {
      prep: "准备",
      cook: "烹煮",
      total: "总时间",
      serves: "份量",
      energy: "热量",
      min: "分钟",
      ingredients: "食材",
      method: "做法",
      note: "备注",
    },
  },

  archive: {
    count: (n: number) => `${n} 篇文章`,
    pageOf: (page: number, pages: number) => ` · 第 ${page} 页，共 ${pages} 页`,
    listLabel: (name: string) => `${name}文章`,
    pagination: "分页",
    prev: "上一页",
    next: "下一页",
    prevPage: "上一页",
    nextPage: "下一页",
    page: (n: number) => `第 ${n} 页`,
    min: "分钟",
    title: (name: string) => name,
    titlePaged: (name: string, page: number) => `${name} | 第 ${page} 页`,
    description: (total: number, name: string) =>
      `${total} 篇 VATTI 华帝马来西亚${name}文章，教您如何选购、使用与保养嵌入式厨房电器。`,
    descriptionPaged: (page: number, pages: number, name: string) =>
      `第 ${page} 页，共 ${pages} 页：VATTI 华帝马来西亚关于嵌入式厨房电器的${name}文章。`,
  },

  notFound: {
    title: "找不到页面",
    code: "错误 404",
    heading: "此页面已移动或从未存在",
    body: "您访问的网址与本网站的任何页面都不相符，您那边并没有出错。请从下方的页面继续浏览，或给我们发信息，我们会告诉您正确的页面。",
    goTo: "前往",
    popular: "热门页面",
    backHome: "返回首页",
    links: {
      "kitchen-hood-in-malaysia": "抽油烟机",
      "cooker-hob-in-malaysia": "炉头",
      "combi-and-steam-oven-in-malaysia": "蒸烤一体机",
      "dishwasher-in-malaysia": "洗碗机",
      "one-tap-purifier-in-malaysia": "单龙头净水器",
      "store-locations": "门市地点",
      "instruction-manual": "使用说明书",
      "vatti-ewarranty": "电子保修登记",
    },
  },
};
