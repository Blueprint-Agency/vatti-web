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

  facets: {
    Airflow: "Aliran udara",
    Burners: "Penunu",
    Zones: "Zon",
    Capacity: "Kapasiti",
    "Place settings": "Tetapan tempat",
    Efficiency: "Kecekapan",
    "Oil capture": "Tapisan minyak",
    "Flow rate": "Kadar aliran",
    "Cooking functions": "Fungsi memasak",
    "Wash programs": "Program basuhan",
    Temperatures: "Suhu",
    Noise: "Bunyi",
    Power: "Kuasa",
    Pressure: "Tekanan",
    "Wash pressure": "Tekanan basuhan",
    "Hot water": "Air panas",
  },

  regions: {
    "klang-valley-malaysia": "Lembah Klang",
    "southern-region-malaysia": "Wilayah Selatan",
    "northern-region-malaysia": "Wilayah Utara",
    "east-coast-malaysia": "Pantai Timur",
    "sabah-sarawak": "Sabah & Sarawak",
  },

  filters: {
    series: "Siri",
    features: "Ciri",
    upTo: (x: string) => `Sehingga ${x}`,
    between: (a: string, b: string) => `${a} hingga ${b}`,
    over: (x: string) => `Melebihi ${x}`,
    facetGroup: (label: string, unit: string) => `${label} (${unit})`,
    tags: {
      bldc: "Motor BLDC",
      "hand-sensor": "Sensor tangan",
      "auto-clean": "Cuci automatik",
      pm25: "Penulenan PM2.5",
      wifi: "WiFi dan sambungan dapur",
      ductless: "Boleh tanpa saluran",
      waterproof: "Motor kalis air",
      nano: "Salutan nano",
    },
    cycles: {
      "Turbo wash": "Cucian turbo",
      "Steam wash": "Cucian wap",
      "Heater wash": "Cucian haba",
      "Cold wash": "Cucian sejuk",
    },
    oil: (pct: string) => ` (${pct}% minyak)`,
    superlative: {
      noise: "Paling senyap",
      burners: "Penunu terbanyak",
      functions: "Fungsi terbanyak",
    },
    peak: (label: string) => `${label} tertinggi`,
    collections: {
      "compact-performance-series": "Siri Prestasi Padat",
      "family-daily-cooking-series": "Siri Masakan Harian Keluarga",
      "heavy-duty-cooking-series": "Siri Masakan Tugas Berat",
      "high-efficiency-air-capture-series": "Siri Sedutan Udara Cekap Tinggi",
      "small-kitchen-series": "Siri Dapur Kecil",
      "electric-ceramic-series": "Siri Seramik Elektrik",
      "family-everyday-cooking": "Masakan Keluarga & Harian",
      "high-power-cooking": "Masakan Kuasa Tinggi",
      "smart-safety-series": "Siri Pintar & Selamat",
    },
  },

  category: {
    h1Fallback: (name: string) => `${name} di Malaysia`,
    metaDescriptionFallback: (name: string) =>
      `Bandingkan setiap ${name.toLowerCase()} VATTI yang dijual di Malaysia: spesifikasi yang diukur, model demi model, dan pengedar sah yang menjualnya.`,
    whatsappUs: "WhatsApp kami",
    seeAll: (n: number) => `Lihat kesemua ${n} model`,
    summaryLabel: (name: string) => `Ringkasan rangkaian ${name}`,
    models: "Model",
    inRange: "dalam rangkaian semasa",
    signatureOnly: (model: string, noun: string) => `${model} ialah ${noun} yang kami jual`,
    signatureSeries: (series: string) => `Rangkaian bermula dengan ${series}`,
    signatureModel: (model: string) => `Rangkaian bermula dengan ${model}`,
    seeModel: (model: string) => `Lihat ${model}`,
    everyModel: (noun: string) => `Setiap ${noun} yang kami jual`,
    gridIntroFiltered:
      "Tapis mengikut keperluan dapur anda. Angka pada setiap kad ialah angka yang diukur, diambil daripada helaian spesifikasi yang sama seperti di halaman produk.",
    gridIntro:
      "Angka pada setiap kad ialah angka yang diukur, diambil daripada helaian spesifikasi yang sama seperti di halaman produk.",
    reasons: (n: number, noun: string) => `${n} sebab untuk memilih ${noun} VATTI`,
    finderHeading: "Ceritakan tentang dapur anda",
    finderIntro:
      "Jawab apa yang anda tahu. Mesej anda ditulis sendiri semasa anda menjawab, dan kami akan mencadangkan model yang sesuai serta pengedar yang menjualnya.",
    compareFallback: "Model demi model",
    compareHeading: (name: string) => `Bandingkan Model ${name} VATTI`,
    compareNote:
      "Setiap angka di sini ialah angka yang diukur daripada helaian spesifikasi model itu sendiri. Sengkang bermaksud model itu tidak menerbitkan ukuran tersebut, bukan nilainya sifar.",
    allSideBySide: (n: number) => `Kesemua ${n} model, bersebelahan`,
    choosing: (noun: string) => `Memilih ${noun} di Malaysia`,
    trusted: (name: string) => `${name} dipercayai lebih 10,000 rakyat Malaysia`,
    guideBlurb:
      "Versi penuh: perbezaan antara jenis-jenisnya, angka mana yang benar-benar menentukan pilihan, dan yang mana sesuai dengan dapur anda sekarang.",
    min: "min",
    faqHeading: "Soalan yang kerap ditanya",
    faqIntro:
      "Jika soalan anda tiada di sini, hantarkan kepada kami. Kami menjawab di WhatsApp, biasanya pada hari yang sama.",
    notSure: (noun: string) => `Tidak pasti ${noun} mana yang sesuai?`,
    ctaBody:
      "Ceritakan tentang dapur anda: apa yang anda masak, susun atur ruangnya, dan apa yang perlu muat di mana. Kami akan cadangkan satu model dan pengedar terdekat yang menjualnya.",
    findDealer: "Cari pengedar",
    warranty: (line: string) => `Waranti VATTI: ${line}.`,
    alreadyBought: "Sudah membeli?",
    register: "Daftarkan untuk waranti",
    ctaMessage: (noun: string) => `Hai VATTI Malaysia. Saya sedang melihat rangkaian ${noun} anda.`,
    listName: (name: string) => `Model ${name} VATTI`,
  },

  warranty: {
    term: (value: string, on: string) => `${value} tahun untuk ${on}`,
    lifetime: (on: string) => `perlindungan seumur hayat untuk ${on}`,
    on: {
      appliance: "perkakas",
      motor: "motor",
      autoclean: "komponen cuci automatik selepas pendaftaran",
      glass: "kaca terbaja daripada retak",
    },
  },

  grid: {
    all: "Semua",
    count: (n: number) => `${n} model`,
    shown: (shown: number, total: number) => `${shown} daripada ${total} model`,
    clear: "Kosongkan penapis",
    none: (noun: string) => `Tiada ${noun} yang memiliki kesemua ciri itu sekali gus.`,
    noneHelp:
      "Buang salah satu penapis, atau beritahu kami keperluan dapur anda dan kami akan cadangkan model yang paling hampir.",
    askUs: "Tanya kami",
  },

  compare: {
    pick: "Pilih model yang sedang anda bandingkan.",
    howMany: "Berapa banyak model untuk dibandingkan",
    nModels: (n: number) => `${n} model`,
    column: (i: number) => `Model di lajur ${i}`,
    autoClean: "Cuci automatik",
    bestFor: "Sesuai untuk",
    notPublished: "tidak diterbitkan",
    bestShown: "terbaik antara model yang dipaparkan",
    view: (model: string) => `Lihat ${model}`,
    model: "Model",
    caption: (labels: string[]) =>
      `Setiap model, dengan ${labels.map((l) => l.toLowerCase()).join(", ")} yang diukur. Tajuk lajur menyusun jadual.`,
    sorted: (ascending: boolean) => `, disusun ${ascending ? "menaik" : "menurun"}`,
    sort: ", susun",
    bestInRange: " (terbaik dalam rangkaian)",
  },

  reviews: {
    excellent: "Cemerlang",
    rated: "Dinilai 5 daripada 5",
    basedOn: "Berdasarkan",
    reviewsWord: "ulasan",
    postedOn: (source: string) => `Disiarkan di ${source}`,
    outOf: (n: number) => `${n} daripada 5`,
    showLess: "Tunjuk kurang",
    readMore: "Baca lagi",
    prev: "Ulasan sebelumnya",
    next: "Ulasan seterusnya",
    today: "hari ini",
    days: (n: number) => `${n} hari lalu`,
    month: "sebulan lalu",
    months: (n: number) => `${n} bulan lalu`,
    year: "setahun lalu",
    years: (n: number) => `${n} tahun lalu`,
  },

  funnel: {
    questions: {
      project: {
        legend: "Apakah projek anda?",
        label: "Projek",
        short: "Projek",
        hint: "Penggantian perlu muat dalam ruang yang sedia ada. Rumah baharu boleh bermula daripada model.",
        options: ["Ubah suai", "Rumah baharu", "Ganti unit lama", "Masih meninjau"],
      },
      cooking: {
        legend: "Bagaimana anda memasak?",
        label: "Masakan",
        short: "Masakan",
        hint: "Asap kuali menuntut lebih daripada hood berbanding semangkuk sup.",
        options: ["Kuali api besar, hampir setiap hari", "Kebanyakannya masakan ringan", "Campuran kedua-duanya"],
      },
      kitchen: {
        legend: "Bagaimana keadaan dapur anda?",
        label: "Dapur",
        short: "Dapur",
        hint: "Saluran di kondo dan susun atur terbuka masing-masing mengecualikan beberapa model.",
        options: ["Kondo atau apartmen", "Rumah teres atau landed", "Konsep terbuka", "Dapur basah dan kering"],
      },
      hob: {
        legend: "Berapa luas ruang dapur gas?",
        label: "Ruang dapur gas",
        short: "Ruang dapur gas",
        hint: "Anggaran pun memadai. Hood sepatutnya sekurang-kurangnya selebar dapur gas di bawahnya.",
        options: ["Kurang 700mm", "700 hingga 800mm", "800 hingga 900mm", "Melebihi 900mm", "Belum diukur"],
      },
      timing: {
        legend: "Bila anda memerlukannya?",
        label: "Masa",
        short: "Masa",
        hint: "Supaya pengedar tahu sama ada perlu menyimpan stok untuk anda.",
        options: ["Bulan ini", "Dalam satu hingga tiga bulan", "Lebih lewat daripada itu", "Masih merancang"],
      },
      looking: {
        legend: "Apa yang anda cari?",
        label: "Mencari",
        short: "Mencari",
        hint: "Pilih apa sahaja dalam senarai. Satu pun memadai.",
        options: [],
      },
      area: {
        legend: "Di mana anda tinggal?",
        label: "Kawasan",
        short: "Kawasan",
        hint: "Kami akan tunjukkan pengedar yang paling dekat dengan anda.",
        options: [],
      },
    },
    helloCategory: (noun: string) => `Hai VATTI Malaysia. Saya sedang melihat rangkaian ${noun} anda.`,
    helloShopping: (items: string) => `Hai VATTI Malaysia. Saya sedang mencari: ${items}.`,
    helloGeneral: "Hai VATTI Malaysia. Saya perlukan bantuan memilih peralatan dapur.",
    thanks: (name: string) => `Terima kasih, ${name}`,
    nameStep: "Nama",
    step: (n: number, of: number) => `Langkah ${n} daripada ${of}`,
    chooseAny: " Pilih mana-mana.",
    yourName: "Nama anda",
    nameHint: "Pilihan. Ia cuma menjadikan balasan lebih mesra.",
    namePlaceholder: "Aisyah",
    back: "Kembali",
    ready: "Itu sahaja. Mesej anda sedia untuk dihantar.",
    next: "Seterusnya",
    skip: "Langkau",
    yourMessage: "Mesej anda",
    answered: (n: number, of: number) => `${n}/${of} dijawab`,
    open: "Buka WhatsApp",
    opensHint: "Membuka sembang dengan teks ini sedia. Anda masih perlu tekan hantar.",
  },

  // Home: keyword peralatan dapur (880/month, keyword_map). No installation
  // arrangement, per the client's 3 Oct decision, so "installed" is dropped from
  // the dealer lines and "a quote" becomes a recommendation (no prices).
  home: {
    metaTitle: "Peralatan Dapur Terbina Dalam di Malaysia | VATTI",
    metaDescription: (dealers: number) =>
      `VATTI Malaysia membekalkan peralatan dapur: hood dapur, dapur gas, ketuhar kombi dan mesin basuh pinggan melalui ${dealers} pengedar sah di seluruh negara. Sejak 1992.`,
    eyebrow: "Sejak 1992",
    h1: "VATTI Malaysia, peralatan dapur moden untuk rumah Malaysia",
    heroText: (models: number, dealers: number) =>
      `Hood dapur, dapur gas, ketuhar, mesin basuh pinggan dan penapis air. ${models} model, diservis melalui ${dealers} pengedar sah di seluruh negara.`,
    browse: "Lihat rangkaian",
    findDealer: "Cari pengedar",
    heroImageAlt: "Hood dapur VATTI menyedut wap dari kuali di atas dapur gas dalam dapur konsep terbuka.",
    heroProductAlt: (model: string) =>
      `Hood dapur VATTI ${model} di dapur bersepadu, dengan panel kawalannya menyala.`,
    builtHeading: "Dibina untuk cara rakyat Malaysia memasak",
    builtBody:
      "Api besar dan minyak yang banyak memberi tekanan kepada dapur. Hood, dapur gas dan ketuhar ini direka untuk keadaan itu sejak awal, bukan diubah suai kemudian.",
    builtSince: "Membina peralatan dapur premium sejak 1992.",
    modelsAcross: (n: number) => `model dalam ${n} kategori`,
    dealersAcross: (n: number) => `pengedar sah di ${n} wilayah`,
    soldLocally: "Dijual dan diservis secara tempatan, dari Lembah Klang hingga Sabah dan Sarawak.",
    findDealerArrow: "Cari pengedar →",
    rangeHeading: "Rangkaian peralatan dapur kami di Malaysia",
    modelCount: (n: number) => `${n} model`,
    aboutHeading: "Tentang VATTI: pengeluar peralatan dapur sejak 1992",
    aboutLink: "Tentang VATTI Malaysia →",
    about1:
      "VATTI membina peralatan dapur sejak 1992 dari pangkalannya di Zhongshan, Guangdong, dan tersenarai di Bursa Saham Shenzhen dengan kod 002035. Kumpulan ini memegang 838 paten sah setakat 2018, antara yang tertinggi dalam industrinya, dan produknya memenangi Red Dot Design Award, iF Design Award dan AWE Award.",
    about2: (models: number, categories: number, dealers: number) =>
      `Di Malaysia, VATTI (M) Sdn Bhd ialah pengedar nasional yang dilantik. Kami membekalkan ${models} model dalam ${categories} kategori melalui ${dealers} pengedar sah, dari Lembah Klang hingga Sabah dan Sarawak, dengan bilik pameran utama di Atria Shopping Gallery, Petaling Jaya.`,
    about3:
      "Setiap unit yang dijual melalui rangkaian itu diperakui ST dan SIRIM, dilindungi waranti VATTI Malaysia, dan diservis dengan alat ganti rasmi.",
    awards: [
      {
        name: "Red Dot Design Award",
        year: "2017",
        body: "Anugerah reka bentuk antarabangsa dari Jerman oleh Red Dot GmbH & Co. KG, dimenangi untuk reka bentuk produk.",
      },
      {
        name: "iF Design Award",
        year: "sejak 1954",
        body: "Antara tanda reka bentuk tertua di dunia, dan berulang kali dimenangi oleh reka bentuk produk VATTI.",
      },
      {
        name: "AWE Award",
        year: "China",
        body: "Dianugerahkan oleh Persatuan Perkakas Elektrik Isi Rumah China selepas ujian pasaran dan pengguna.",
      },
    ],
    bestsellersHeading: "Hood, dapur gas dan ketuhar VATTI terlaris",
    allCategories: "Semua kategori →",
    quoteHeading: "Dapatkan cadangan untuk dapur anda",
    quoteBody:
      "Tujuh soalan ringkas, semuanya pilihan. Kami akan cadangkan model yang sesuai dan pengedar yang menjualnya, biasanya pada hari yang sama.",
    careline: "Talian VATTI",
    hours: "Waktu Operasi",
    hoursValue: "10 pagi - 8 malam setiap hari",
    showroom: "Bilik Pameran VATTI",
    showroomAddress: "Atria Shopping Gallery, Damansara Jaya, Petaling Jaya",
    readingHeading: "Panduan membeli peralatan dapur",
    beforeBuy: "Sebelum membeli",
    allGuides: "Semua panduan membeli",
    onceInstalled: "Selepas dipasang",
    allRecipes: "Semua resipi",
    min: "min",
    dealersHeading: "Di mana membeli VATTI di Malaysia",
    dealersBody:
      "Setiap model dijual dan diservis melalui pengedar sah. Cari bilik pameran terdekat, lihat produknya berfungsi, dan beli daripada pihak yang boleh datang semula untuk servis.",
    partnersHeading: "Rakan Kongsi Kami",
    partnersBody:
      "Peruncit dapur, bilik mandi dan elektrik yang menjual VATTI dan terus menyokongnya selepas jualan.",
    faqHeading: "Soalan Lazim VATTI Malaysia",
    faqs: (models: number, dealers: number) => [
      {
        q: "Adakah VATTI jenama yang bagus?",
        a: `VATTI mengeluarkan peralatan dapur sejak 1992 dan tersenarai di Bursa Saham Shenzhen. Produknya memenangi anugerah Red Dot, iF Design dan AWE, dan kumpulan ini memegang 838 paten sah. Di Malaysia, rangkaiannya dijual melalui ${dealers} pengedar sah yang menyervis apa yang mereka jual.`,
      },
      {
        q: "VATTI berasal dari mana?",
        a: "VATTI beribu pejabat di Zhongshan, Guangdong, China, dan mengeluarkan peralatan dapur di sana sejak 1992. VATTI (M) Sdn Bhd ialah pengedar nasional yang dilantik untuk Malaysia.",
      },
      {
        q: "Apa yang dijual oleh VATTI Malaysia?",
        a: `Hood dapur, dapur gas, ketuhar kombi dan stim, mesin basuh pinggan serta penapis air One Tap. Kesemuanya ${models} model.`,
      },
      {
        q: "Apakah waranti peralatan VATTI?",
        a: "Dua tahun untuk setiap peralatan yang kami jual, termasuk hood, dapur gas, ketuhar, ketuhar gelombang mikro, mesin basuh pinggan dan dispenser air. Sepuluh tahun untuk motor hood dapur bagi semua model, tiga tahun tambahan untuk komponen cuci automatik hood selepas pendaftaran, dan waranti seumur hayat untuk permukaan kaca dapur gas. Daftar dalam tempoh 14 hari selepas pembelian.",
      },
      {
        q: "Di mana boleh membeli VATTI di Malaysia?",
        a: `Melalui ${dealers} pengedar sah di Lembah Klang, wilayah Utara, Selatan dan Pantai Timur serta Sabah dan Sarawak, dan di bilik pameran utama di Atria Shopping Gallery, Petaling Jaya. Membeli di luar rangkaian ini bermakna tiada waranti, tiada alat ganti rasmi dan tiada servis.`,
      },
    ],
  },

  showcase: {
    alt: (model: string, category: string) => `${category} VATTI ${model} di dapur bersepadu.`,
    prev: "Model sebelumnya",
    next: "Model seterusnya",
    promoted: "Model pilihan",
    view: (model: string) => `Lihat ${model} →`,
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
