import type { Dict } from "./en";

/**
 * Bahasa Melayu (Malaysia). Malaysian vocabulary, not Indonesian: dapur gas,
 * not kompor; penyedut, not penghisap; kuali, not wajan.
 *
 * Category labels follow the keyword map (data/sql/keyword-map.sql): "Dapur
 * Gas" for the hob category because `dapur gas` is the measured Malay term
 * (5,400/month, Ubersuggest MY, 2026-10-03), and "Hood Dapur" because that is
 * what searchers type (720/month), not "Penyedut Asap".
 */
export const ms: Dict = {
  doc: {
    skipToContent: "Langkau ke kandungan",
    titleDefault: "VATTI Malaysia | Hood Dapur, Dapur Gas & Ketuhar Terbina Dalam",
    titleTemplate: "%s | VATTI Malaysia",
    description:
      "Peralatan dapur terbina dalam yang direka untuk masakan Asia dengan api besar. Dijual melalui 75 pengedar sah di seluruh Malaysia.",
    ogImageAlt: "Hood dapur VATTI dengan panel kawalan yang menyala, di sebuah dapur",
  },

  nav: {
    home: "Utama",
    products: "Produk",
    blog: "Blog",
    catalog: "Katalog",
    menu: "Menu",
    storeLocations: "Lokasi Kedai",
    aboutVatti: "Tentang VATTI",
    ewarranty: "eWaranti",
    contactUs: "Hubungi Kami",
    logoAlt: "VATTI Malaysia",
    language: "Bahasa",
    categories: {
      "kitchen-hood-in-malaysia": "Hood Dapur",
      "cooker-hob-in-malaysia": "Dapur Gas",
      "combi-and-steam-oven-in-malaysia": "Ketuhar Kombi",
      "dishwasher-in-malaysia": "Mesin Basuh Pinggan",
      "one-tap-purifier-in-malaysia": "Penapis Air One Tap",
    },
  },

  footer: {
    products: "Produk",
    company: "Syarikat",
    guides: "Panduan",
    aboutUs: "Tentang kami",
    contactUs: "Hubungi kami",
    storeLocations: "Lokasi kedai",
    ewarranty: "eWaranti",
    instructionManual: "Manual Arahan",
    categories: {
      "kitchen-hood-in-malaysia": "Hood Dapur",
      "cooker-hob-in-malaysia": "Dapur Gas",
      "combi-and-steam-oven-in-malaysia": "Ketuhar Kombi & Wap",
      "dishwasher-in-malaysia": "Mesin Basuh Pinggan",
      "one-tap-purifier-in-malaysia": "Penapis Air One Tap",
    },
    hours: "Dibuka setiap hari, 10 pagi hingga 8 malam",
    tagline: (year: number) =>
      `© ${year} VATTI Malaysia. Hood dapur, dapur gas, ketuhar terbina dalam, mesin basuh pinggan dan penapis air.`,
  },

  cta: {
    help: "Dapatkan bantuan sekarang",
  },

  article: {
    minRead: "minit bacaan",
    jumpToRecipe: "Terus ke resipi",
    more: (section: string) => `Lagi ${section}`,
    seeAll: "Lihat semua",
    related: "Berkaitan",
    readTheGuide: "Baca panduan",
    explore: (name: string) => `Terokai ${name} VATTI`,
    recipe: {
      prep: "Sedia",
      cook: "Masak",
      total: "Jumlah",
      serves: "Hidangan",
      energy: "Tenaga",
      min: "min",
      ingredients: "Bahan-bahan",
      method: "Cara",
      note: "Nota",
    },
  },

  archive: {
    count: (n: number) => `${n} artikel`,
    pageOf: (page: number, pages: number) => ` · halaman ${page} daripada ${pages}`,
    listLabel: (name: string) => `Artikel ${name}`,
    pagination: "Halaman",
    prev: "Sebelum",
    next: "Seterusnya",
    prevPage: "Halaman sebelumnya",
    nextPage: "Halaman seterusnya",
    page: (n: number) => `Halaman ${n}`,
    min: "min",
    title: (name: string) => name,
    titlePaged: (name: string, page: number) => `${name} | Halaman ${page}`,
    description: (total: number, name: string) =>
      `${total} artikel ${name.toLowerCase()} VATTI Malaysia tentang memilih, menggunakan dan menjaga peralatan dapur terbina dalam.`,
    descriptionPaged: (page: number, pages: number, name: string) =>
      `Halaman ${page} daripada ${pages}: artikel ${name.toLowerCase()} VATTI Malaysia tentang peralatan dapur terbina dalam.`,
  },

  notFound: {
    title: "Halaman tidak dijumpai",
    code: "Ralat 404",
    heading: "Halaman ini telah dipindahkan atau tidak pernah wujud",
    body: "Alamat yang anda ikuti tidak sepadan dengan mana-mana halaman di laman ini. Tiada apa-apa yang rosak di pihak anda. Teruskan dari salah satu halaman di bawah, atau hantar mesej kepada kami dan kami akan tunjukkan halaman yang betul.",
    goTo: "Pergi ke",
    popular: "Halaman popular",
    backHome: "Kembali ke laman utama",
    links: {
      "kitchen-hood-in-malaysia": "Hood Dapur",
      "cooker-hob-in-malaysia": "Dapur Gas",
      "combi-and-steam-oven-in-malaysia": "Ketuhar Kombi & Wap",
      "dishwasher-in-malaysia": "Mesin Basuh Pinggan",
      "one-tap-purifier-in-malaysia": "Penapis Air One Tap",
      "store-locations": "Lokasi Kedai",
      "instruction-manual": "Manual Arahan",
      "vatti-ewarranty": "Pendaftaran eWaranti",
    },
  },
};
