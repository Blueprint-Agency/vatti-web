/**
 * The retail partners who carry VATTI, as shown in the "Our Partners" carousel
 * on the live site's homepage.
 *
 * The source is seven Elementor slides (2023/05/Untitled-design-2.jpg and its
 * six siblings, all still on R2). Each one is a 2400x576 Canva export with four
 * or five logos laid out on white — the carousel was paging through *strips*,
 * not through logos, so nothing in the media library holds a partner mark on its
 * own. These were cut back out by segmenting each strip on its all-white
 * columns, then trimmed and flattened onto white.
 *
 * Order is the order of the strips, which is the order the carousel ran in.
 * It carries no ranking, and alphabetising a wall of logos helps nobody — you
 * cannot scan it by first letter.
 *
 * Intrinsic sizes are the file sizes; next/image needs them and these are not
 * static imports. Every mark is dark artwork on an opaque white plate, which is
 * why the wall renders on white in both themes — see the note at its section.
 *
 * Two are degraded in the source and cannot be recovered from it:
 *   benova  clipped left and right in the strip, so its tagline read
 *           "y & Premium Applianc". Cropped to the wordmark.
 *   tahol   a white outline mark on white. Only the red wordmark survives,
 *           and it is already invisible on the live site.
 * Ask the owner for original artwork for those two.
 */
export type Partner = { name: string; src: string; width: number; height: number };

export const PARTNERS: Partner[] = [
  { name: "Kitchentech", src: "/partners/kitchentech.webp", width: 450, height: 65 },
  { name: "Darson Xtra", src: "/partners/darson-xtra.webp", width: 450, height: 78 },
  { name: "DeBathlabz", src: "/partners/de-bathlabz.webp", width: 450, height: 96 },
  { name: "Urbanez", src: "/partners/urbanez.webp", width: 450, height: 80 },
  { name: "Benova", src: "/partners/benova.webp", width: 450, height: 143 },
  { name: "E.S.H Electrical", src: "/partners/esh-electrical.webp", width: 221, height: 216 },
  { name: "Eurotan", src: "/partners/eurotan.webp", width: 450, height: 143 },
  { name: "Felicita Home's Deco", src: "/partners/felicita.webp", width: 368, height: 123 },
  { name: "De HomeBiz", src: "/partners/de-homebiz.webp", width: 447, height: 168 },
  { name: "Kregen", src: "/partners/kregen.webp", width: 382, height: 216 },
  { name: "Living Portal", src: "/partners/living-portal.webp", width: 414, height: 107 },
  { name: "eMart", src: "/partners/emart.webp", width: 306, height: 194 },
  { name: "Standard Kitchen", src: "/partners/standard-kitchen.webp", width: 450, height: 116 },
  { name: "Kuche + Bath Outlet", src: "/partners/kuche-bath-outlet.webp", width: 216, height: 216 },
  { name: "JW Sanitary Home", src: "/partners/jw-sanitary.webp", width: 215, height: 216 },
  { name: "Nikko Kitchen", src: "/partners/nikko-kitchen.webp", width: 223, height: 216 },
  { name: "WPC Ideas Enterprise", src: "/partners/wpc-ideas.webp", width: 216, height: 216 },
  { name: "SK Lifestyles", src: "/partners/sk-lifestyles.webp", width: 216, height: 216 },
  { name: "SK Hardware", src: "/partners/sk-hardware.webp", width: 217, height: 216 },
  { name: "Tahol", src: "/partners/tahol.webp", width: 203, height: 216 },
  { name: "KAC Kitchen & Bath", src: "/partners/kac-kitchen-bath.webp", width: 354, height: 216 },
  { name: "Kah Hoe Enterprise", src: "/partners/kah-hoe.webp", width: 358, height: 216 },
  { name: "JF Home Appliances", src: "/partners/jf-home-appliances.webp", width: 172, height: 216 },
  { name: "Heng Foong Sanitaryware", src: "/partners/heng-foong.webp", width: 450, height: 68 },
  { name: "Home Care", src: "/partners/home-care.webp", width: 450, height: 204 },
  { name: "Novo Bath", src: "/partners/novo-bath.webp", width: 450, height: 127 },
  { name: "Sin Jin Da Hardware", src: "/partners/sin-jin-da.webp", width: 450, height: 74 },
  { name: "Mum Kitch", src: "/partners/mum-kitch.webp", width: 237, height: 216 },
  { name: "Adamas", src: "/partners/adamas.webp", width: 329, height: 216 },
];

/**
 * The two rails of the slider. Row one runs left, row two runs right.
 *
 * Dealt alternately rather than cut in half. The strips were laid out in
 * batches, and the batches group by shape — strip five is four square tiles in
 * a row — so halving the list put every wordmark in the top rail and a line of
 * coloured boxes in the bottom one. Dealing them mixes wide and square through
 * both rails, which is what stops the second row reading as a different object
 * from the first.
 *
 * The odd count leaves the rails at 15 and 14, so they cover slightly different
 * distances on the one shared duration and never settle into lockstep.
 */
export const PARTNER_ROWS: Partner[][] = [
  PARTNERS.filter((_, i) => i % 2 === 0),
  PARTNERS.filter((_, i) => i % 2 === 1),
];
