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
