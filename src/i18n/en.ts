/**
 * Every word the site's own code puts on a page, in English. The Malay and
 * Chinese files are typed against this one (`Dict`), so a key added here and
 * not there fails `tsc` rather than shipping English inside a Malay page.
 *
 * English values are the strings the components printed before the languages
 * existed, verbatim: moving a string in here must never change an English page.
 *
 * Content (product copy, articles, FAQs) is not here. It lives in data/sql with
 * a `lang` column; this file is only the chrome around it.
 *
 * Grows by area as each area gets its translations (see the plan in
 * docs/i18n.md): a component is moved onto the dictionary in the same change
 * that translates the pages it appears on.
 */
export const en = {
  doc: {
    skipToContent: "Skip to content",
    titleDefault: "VATTI Malaysia | Kitchen Hoods, Hobs & Built-in Ovens",
    titleTemplate: "%s | VATTI Malaysia",
    description:
      "Built-in kitchen appliances engineered for high-heat Asian cooking. Available through 75 authorised dealers across Malaysia.",
    ogImageAlt: "VATTI cooker hood with a lit control panel, installed in a kitchen",
  },

  nav: {
    home: "Home",
    products: "Products",
    blog: "Blog",
    catalog: "Catalog",
    menu: "Menu",
    storeLocations: "Store Locations",
    aboutVatti: "About VATTI",
    ewarranty: "eWarranty",
    contactUs: "Contact Us",
    logoAlt: "VATTI Malaysia",
    language: "Language",
    /** Keyed on the English category slug, which is the category's identity. */
    categories: {
      "kitchen-hood-in-malaysia": "Kitchen Hood",
      "cooker-hob-in-malaysia": "Cooker Hob",
      "combi-and-steam-oven-in-malaysia": "Combi Oven",
      "dishwasher-in-malaysia": "Dishwasher",
      "one-tap-purifier-in-malaysia": "One Tap Water Purifier",
    } as Record<string, string>,
  },

  footer: {
    products: "Products",
    company: "Company",
    guides: "Guides",
    aboutUs: "About us",
    contactUs: "Contact us",
    storeLocations: "Store locations",
    ewarranty: "eWarranty",
    instructionManual: "Instruction Manual",
    categories: {
      "kitchen-hood-in-malaysia": "Kitchen Hood",
      "cooker-hob-in-malaysia": "Cooker Hob",
      "combi-and-steam-oven-in-malaysia": "Combi & Steam Oven",
      "dishwasher-in-malaysia": "Dishwasher",
      "one-tap-purifier-in-malaysia": "One Tap Water Purifier",
    } as Record<string, string>,
    hours: "Open daily, 10am - 8pm",
    tagline: (year: number) =>
      `© ${year} VATTI Malaysia. Kitchen hoods, hobs, built-in ovens, dishwashers and water purifiers.`,
  },

  cta: {
    help: "Let us help you now",
  },

  article: {
    minRead: "min read",
    jumpToRecipe: "Jump to recipe",
    more: (section: string) => `More ${section}`,
    seeAll: "See all",
    related: "Related",
    readTheGuide: "Read the guide",
    explore: (name: string) => `Explore VATTI ${name}`,
    recipe: {
      prep: "Prep",
      cook: "Cook",
      total: "Total",
      serves: "Serves",
      energy: "Energy",
      min: "min",
      ingredients: "Ingredients",
      method: "Method",
      note: "Note",
    },
  },

  archive: {
    count: (n: number) => `${n} ${n === 1 ? "article" : "articles"}`,
    pageOf: (page: number, pages: number) => ` · page ${page} of ${pages}`,
    listLabel: (name: string) => `${name} articles`,
    pagination: "Pagination",
    prev: "Prev",
    next: "Next",
    prevPage: "Previous page",
    nextPage: "Next page",
    page: (n: number) => `Page ${n}`,
    min: "min",
    title: (name: string) => name,
    titlePaged: (name: string, page: number) => `${name} | Page ${page}`,
    description: (total: number, name: string) =>
      `${total} VATTI Malaysia ${name.toLowerCase()} articles on choosing, using and caring for built-in kitchen appliances.`,
    descriptionPaged: (page: number, pages: number, name: string) =>
      `Page ${page} of ${pages}: VATTI Malaysia ${name.toLowerCase()} articles on built-in kitchen appliances.`,
  },

  notFound: {
    title: "Page not found",
    code: "Error 404",
    heading: "This page has moved or never existed",
    body: "The address you followed does not match anything on the site. Nothing is broken on your end. Pick up from one of the pages below, or message us and we will point you at the right one.",
    goTo: "Go to",
    popular: "Popular pages",
    backHome: "Back to home",
    links: {
      "kitchen-hood-in-malaysia": "Kitchen Hoods",
      "cooker-hob-in-malaysia": "Cooker Hobs",
      "combi-and-steam-oven-in-malaysia": "Combi & Steam Ovens",
      "dishwasher-in-malaysia": "Dishwashers",
      "one-tap-purifier-in-malaysia": "One Tap Water Purifiers",
      "store-locations": "Store Locations",
      "instruction-manual": "Instruction Manuals",
      "vatti-ewarranty": "eWarranty Registration",
    } as Record<string, string>,
  },
};

type Widen<T> = T extends (...args: infer A) => infer R
  ? (...args: A) => Widen<R>
  : T extends string
    ? string
    : T extends object
      ? { [K in keyof T]: Widen<T[K]> }
      : T;

/** The shape every edition must fill. */
export type Dict = Widen<typeof en>;
