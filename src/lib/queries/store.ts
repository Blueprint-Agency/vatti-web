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
                       s.directions_url, i.url, i.alt
                  FROM store s
                  LEFT JOIN image i ON i.id = s.image_id`;

export function storeSlugs(): string[] {
  return all<{ slug: string }>(`SELECT slug FROM store ORDER BY sort_order`).map((r) => r.slug);
}

export function getStore(slug: string): Store | undefined {
  return get<Store>(`${SELECT} WHERE s.slug = ?`, slug);
}

/**
 * The whole directory in one query — 76 dealers and their images — grouped in
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
