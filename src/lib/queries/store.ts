import { all, get } from "@/lib/db";

export type Store = {
  slug: string;
  name: string;
  region: string;
  region_slug: string;
  address: string;
  phone: string | null;
  directions_url: string | null;
  url: string | null;
  alt: string | null;
  locality: string | null;
  state: string | null;
  postcode: string | null;
};

export type StoreRegion = {
  slug: string;
  name: string;
  stores: Store[];
};

/**
 * Directory display order. `region_slug` is CHECK-constrained to exactly these
 * five values (schema.sql), so this list is total — any row whose slug is not
 * here would be silently dropped, which is why groupByRegion asserts the count.
 * The heading text comes from the row's `region`, not from here; the DB is the
 * source of truth for the human-readable name.
 */
const REGION_ORDER = [
  "klang-valley-malaysia",
  "northern-region-malaysia",
  "southern-region-malaysia",
  "east-coast-malaysia",
  "sabah-sarawak",
];

const SELECT = `SELECT s.slug, s.name, s.region, s.region_slug, s.address, s.phone,
                       s.directions_url, i.url, i.alt,
                       s.locality, s.state, s.postcode
                  FROM store s
                  LEFT JOIN image i ON i.id = s.image_id`;

export function storeSlugs(): string[] {
  return all<{ slug: string }>(`SELECT slug FROM store ORDER BY sort_order`).map((r) => r.slug);
}

export function getStore(slug: string): Store | undefined {
  return get<Store>(`${SELECT} WHERE s.slug = ?`, slug);
}

/**
 * The whole directory in one query — 77 dealers and their images — grouped in
 * JS afterwards. A CASE-ranked ORDER BY would do the same work in SQL and read
 * worse; the grouping is five array pushes.
 */
export function storesByRegion(): StoreRegion[] {
  const rows = all<Store>(`${SELECT} ORDER BY s.sort_order`);

  const groups = REGION_ORDER.map((slug) => {
    const stores = rows.filter((r) => r.region_slug === slug);
    return { slug, name: stores[0]?.region ?? slug, stores };
  }).filter((g) => g.stores.length > 0);

  const grouped = groups.reduce((n, g) => n + g.stores.length, 0);
  if (grouped !== rows.length) {
    throw new Error(`store: ${rows.length - grouped} dealer(s) have a region_slug missing from REGION_ORDER`);
  }
  return groups;
}

/**
 * '016-2887177' -> '+60162887177'. Two dealers list a second number after a
 * slash; the link takes the first and the visible text keeps both.
 */
export function telHref(phone: string): string {
  const digits = phone.split("/")[0].replace(/\D/g, "");
  return `+60${digits.replace(/^0/, "")}`;
}

/** The town a locality sits in: 'Johor Jaya, Johor Bahru' -> 'Johor Bahru'. */
export function townOf(store: Pick<Store, "locality">): string | null {
  return store.locality ? store.locality.split(",").pop()!.trim() : null;
}

/**
 * Up to `limit` other dealers for the "nearby" list: same town first, then the
 * same state, then the rest of the region (Kuala Lumpur and Selangor share the
 * Klang Valley region, so a Cheras page also lists Petaling Jaya). No
 * distances: the table holds addresses, not coordinates, so the order is by
 * place name rather than by kilometres, with ties shuffled per page.
 */
export function storesNear(store: Store, limit = 6): Store[] {
  const town = townOf(store);
  const rank = (s: Store) =>
    (town && townOf(s) === town ? 0 : 2) + (s.state === store.state ? 0 : 1);
  return all<Store>(
    `${SELECT} WHERE s.region_slug = ? AND s.slug <> ?`,
    store.region_slug,
    store.slug
  )
    // Ties break on a hash of the pair, not on sort_order: sort_order hands the
    // same three dealers to every page in a region and leaves others with no
    // inbound link at all, which is how pages end up "discovered, not crawled".
    .sort((a, b) => rank(a) - rank(b) || pairHash(store.slug, a.slug) - pairHash(store.slug, b.slug))
    .slice(0, limit);
}

/** FNV-1a over the two slugs: a fixed but evenly spread order for each page. */
function pairHash(a: string, b: string): number {
  let x = 2166136261;
  for (const c of a + b) x = Math.imul(x ^ c.charCodeAt(0), 16777619);
  return x >>> 0;
}
