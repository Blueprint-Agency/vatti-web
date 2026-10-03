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

  /** Facet labels as product_facet stores them (English), keyed on that same text. */
  facets: {
    Airflow: "Airflow",
    Burners: "Burners",
    Zones: "Zones",
    Capacity: "Capacity",
    "Place settings": "Place settings",
    Efficiency: "Efficiency",
    "Oil capture": "Oil capture",
    "Flow rate": "Flow rate",
    "Cooking functions": "Cooking functions",
    "Wash programs": "Wash programs",
    Temperatures: "Temperatures",
    Noise: "Noise",
    Power: "Power",
    Pressure: "Pressure",
    "Wash pressure": "Wash pressure",
    "Hot water": "Hot water",
  } as Record<string, string>,

  /** Store regions, keyed on store.region_slug. */
  regions: {
    "klang-valley-malaysia": "Klang Valley",
    "southern-region-malaysia": "Southern Region",
    "northern-region-malaysia": "Northern Region",
    "east-coast-malaysia": "East Coast",
    "sabah-sarawak": "Sabah & Sarawak",
  } as Record<string, string>,

  /** The chips above the model grid and the range summary. See queries/category.ts. */
  filters: {
    series: "Series",
    features: "Features",
    upTo: (x: string) => `Up to ${x}`,
    between: (a: string, b: string) => `${a} to ${b}`,
    over: (x: string) => `Over ${x}`,
    facetGroup: (label: string, unit: string) => `${label} (${unit})`,
    tags: {
      bldc: "BLDC motor",
      "hand-sensor": "Hand sensor",
      "auto-clean": "Auto-clean",
      pm25: "PM2.5 purification",
      wifi: "WiFi and hob link",
      ductless: "Ductless capable",
      waterproof: "Waterproof motor",
      nano: "Nano coating",
    } as Record<string, string>,
    cycles: {
      "Turbo wash": "Turbo wash",
      "Steam wash": "Steam wash",
      "Heater wash": "Heater wash",
      "Cold wash": "Cold wash",
    } as Record<string, string>,
    oil: (pct: string) => ` (${pct}% oil)`,
    superlative: {
      noise: "Quietest",
      burners: "Most burners",
      functions: "Most functions",
    } as Record<string, string>,
    peak: (label: string) => `Peak ${label.toLowerCase()}`,
    /** product_collection names, keyed on its slug. */
    collections: {
      "compact-performance-series": "Compact Performance Series",
      "family-daily-cooking-series": "Family Daily Cooking Series",
      "heavy-duty-cooking-series": "Heavy-Duty Cooking Series",
      "high-efficiency-air-capture-series": "High-Efficiency Air Capture Series",
      "small-kitchen-series": "Small Kitchen Series",
      "electric-ceramic-series": "Electric Ceramic Series",
      "family-everyday-cooking": "Family & Everyday Cooking",
      "high-power-cooking": "High Power Cooking",
      "smart-safety-series": "Smart & Safety Series",
    } as Record<string, string>,
  },

  /** The category template, CategoryView. `name` is 'Kitchen Hood'; `noun` is its lower case. */
  category: {
    h1Fallback: (name: string) => `${name} in Malaysia`,
    metaDescriptionFallback: (name: string) =>
      `Compare every VATTI ${name.toLowerCase()} sold in Malaysia: measured specifications, model by model, and the authorised dealers who stock them.`,
    whatsappUs: "WhatsApp us",
    seeAll: (n: number) => `See all ${n} models`,
    summaryLabel: (name: string) => `${name} range summary`,
    models: "Models",
    inRange: "in the current range",
    signatureOnly: (model: string, noun: string) => `The ${model} is the ${noun} we sell`,
    signatureSeries: (series: string) => `The ${series} is where the range starts`,
    signatureModel: (model: string) => `The ${model} is where the range starts`,
    seeModel: (model: string) => `See the ${model}`,
    everyModel: (noun: string) => `Every ${noun} we sell`,
    gridIntroFiltered:
      "Filter by what the kitchen has to do. The figures on each card are the measured ones, taken from the same spec sheet the product page prints.",
    gridIntro:
      "The figures on each card are the measured ones, taken from the same spec sheet the product page prints.",
    reasons: (n: number, noun: string) => `${n} reasons to buy a VATTI ${noun}`,
    finderHeading: "Tell us about your kitchen",
    finderIntro:
      "Answer what you can. The message writes itself as you go, and we will come back with the model that fits and the dealer who stocks it.",
    compareFallback: "Model by model",
    compareHeading: (name: string) => `Compare VATTI ${name} Models`,
    compareNote:
      "Every figure here is the measured one from the model’s own spec sheet. A dash means it does not publish that measurement, not that it scores zero.",
    allSideBySide: (n: number) => `All ${n} models, side by side`,
    choosing: (noun: string) => `Choosing a ${noun} in Malaysia`,
    trusted: (name: string) => `${name} trusted by 10,000+ Malaysians`,
    guideBlurb:
      "The long version: how the types differ, which of the numbers actually decide it, and which one suits the kitchen you already have.",
    min: "min",
    faqHeading: "Questions we get asked",
    faqIntro: "If yours is not here, send it. We answer on WhatsApp, usually the same day.",
    notSure: (noun: string) => `Not sure which ${noun} fits?`,
    ctaBody:
      "Send us the kitchen: what you cook, how the space is laid out, and what has to fit where. We will narrow it to one model and the nearest dealer who stocks it.",
    findDealer: "Find a dealer",
    warranty: (line: string) => `VATTI warranty: ${line}.`,
    alreadyBought: "Already bought one?",
    register: "Register it for warranty",
    ctaMessage: (noun: string) => `Hi VATTI Malaysia. I am looking at your ${noun} range.`,
    listName: (name: string) => `VATTI ${name} models`,
  },

  /** The warranty sentence on the category band. Assembled by warrantyLine(). */
  warranty: {
    term: (value: string, on: string) => `${value} years on ${on}`,
    lifetime: (on: string) => `lifetime cover on ${on}`,
    on: {
      appliance: "the appliance",
      motor: "the motor",
      autoclean: "the auto-clean components once registered",
      glass: "the tempered glass against cracking",
    } as Record<string, string>,
  },

  grid: {
    all: "All",
    count: (n: number) => `${n} ${n === 1 ? "model" : "models"}`,
    shown: (shown: number, total: number) => `${shown} of ${total} models`,
    clear: "Clear filters",
    none: (noun: string) => `No ${noun} carries all of those at once.`,
    noneHelp:
      "Drop one of the filters, or tell us what the kitchen has to do and we will say which model gets closest.",
    askUs: "Ask us instead",
  },

  compare: {
    pick: "Pick the models you are weighing against each other.",
    howMany: "How many models to compare",
    nModels: (n: number) => `${n} models`,
    column: (i: number) => `Model in column ${i}`,
    autoClean: "Auto-clean",
    bestFor: "Best for",
    notPublished: "not published",
    bestShown: "best of the models shown",
    view: (model: string) => `View ${model}`,
    model: "Model",
    caption: (labels: string[]) =>
      `Every model, with its measured ${labels.map((l) => l.toLowerCase()).join(", ")}. Column headers sort the table.`,
    sorted: (ascending: boolean) => `, sorted ${ascending ? "ascending" : "descending"}`,
    sort: ", sort",
    bestInRange: " (best in range)",
  },

  reviews: {
    excellent: "Excellent",
    rated: "Rated 5 out of 5",
    basedOn: "Based on",
    reviewsWord: "reviews",
    postedOn: (source: string) => `Posted on ${source}`,
    outOf: (n: number) => `${n} out of 5`,
    showLess: "Show less",
    readMore: "Read more",
    prev: "Previous reviews",
    next: "Next reviews",
    today: "today",
    days: (n: number) => `${n} days ago`,
    month: "a month ago",
    months: (n: number) => `${n} months ago`,
    year: "a year ago",
    years: (n: number) => `${n} years ago`,
  },

  /** The questionnaire. Option texts go into the WhatsApp message as written. */
  funnel: {
    questions: {
      project: {
        legend: "What is the project?",
        label: "Project",
        short: "Project",
        hint: "A replacement has to fit the hole that is already there. A new build can start from the model.",
        options: ["Renovating", "New build", "Replacing a unit", "Still researching"],
      },
      cooking: {
        legend: "How do you cook?",
        label: "Cooking",
        short: "Cooking",
        hint: "Wok smoke asks more of a hood than a pot of soup does.",
        options: ["Wok on high heat, most days", "Mostly light cooking", "A mix of both"],
      },
      kitchen: {
        legend: "What is the kitchen like?",
        label: "Kitchen",
        short: "Kitchen",
        hint: "Condo ducting and open-plan layouts each rule a few models out.",
        options: ["Condo or apartment", "Landed house", "Open plan", "Wet and dry"],
      },
      hob: {
        legend: "How much hob space is there?",
        label: "Hob space",
        short: "Hob space",
        hint: "Roughly is fine. A hood should be at least as wide as the hob under it.",
        options: ["Under 700mm", "700 to 800mm", "800 to 900mm", "Over 900mm", "Not measured yet"],
      },
      timing: {
        legend: "When do you need it?",
        label: "Timing",
        short: "Timing",
        hint: "So the dealer knows whether to hold stock for you.",
        options: ["This month", "In one to three months", "Later than that", "Just planning"],
      },
      looking: {
        legend: "What are you looking for?",
        label: "Looking at",
        short: "Looking for",
        hint: "Pick everything on the list. One is fine.",
        options: [] as string[],
      },
      area: {
        legend: "Where are you?",
        label: "Area",
        short: "Area",
        hint: "We point you at the dealer nearest you.",
        options: [] as string[],
      },
    },
    helloCategory: (noun: string) => `Hi VATTI Malaysia. I am looking at your ${noun} range.`,
    helloShopping: (items: string) => `Hi VATTI Malaysia. I am shopping for: ${items}.`,
    helloGeneral: "Hi VATTI Malaysia. I would like some help choosing kitchen appliances.",
    thanks: (name: string) => `Thanks, ${name}`,
    nameStep: "Name",
    step: (n: number, of: number) => `Step ${n} of ${of}`,
    chooseAny: " Choose any.",
    yourName: "Your name",
    nameHint: "Optional. It just makes the reply friendlier.",
    namePlaceholder: "Aisyah",
    back: "Back",
    ready: "That is everything. Your message is ready to send.",
    next: "Next",
    skip: "Skip",
    yourMessage: "Your message",
    answered: (n: number, of: number) => `${n}/${of} answered`,
    open: "Open WhatsApp",
    opensHint: "Opens a chat with this text ready. You still press send.",
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
