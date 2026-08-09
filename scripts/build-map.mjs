// Generates src/lib/malaysia-map.ts — the dealer map on the homepage.
//
//   node scripts/build-map.mjs
//
// Source: Department of Statistics Malaysia, open data, state boundaries.
// https://github.com/dosm-malaysia/data-open  (datasets/geodata/administrative_1_state.geojson)
// Official Malaysian government geometry, which is the right provenance for a
// Malaysian brand's own map. The GeoJSON is 391 KB and is NOT committed; this
// script fetches it, projects it, throws away detail no one can see at 1000px
// wide, and writes a small TypeScript module. Re-run it only if the region
// grouping changes — the output is deterministic.
//
// The 16 states are merged into the 5 sales regions the `store` table uses, so
// the map and the dealer counts cannot drift apart.

import { writeFile } from "node:fs/promises";
import { join } from "node:path";

const SOURCE =
  "https://raw.githubusercontent.com/dosm-malaysia/data-open/main/datasets/geodata/administrative_1_state.geojson";

/** Keyed by store.region_slug. Names are the DOSM `state` property, verbatim. */
const REGIONS = [
  {
    slug: "klang-valley-malaysia",
    name: "Klang Valley",
    states: ["Selangor", "W.P. Kuala Lumpur", "W.P. Putrajaya"],
  },
  {
    slug: "northern-region-malaysia",
    name: "Northern Region",
    states: ["Perlis", "Kedah", "Pulau Pinang", "Perak"],
  },
  {
    slug: "southern-region-malaysia",
    name: "Southern Region",
    states: ["Negeri Sembilan", "Melaka", "Johor"],
  },
  {
    slug: "east-coast-malaysia",
    name: "East Coast",
    states: ["Kelantan", "Terengganu", "Pahang"],
  },
  { slug: "sabah-sarawak", name: "Sabah & Sarawak", states: ["Sabah", "Sarawak", "W.P. Labuan"] },
];

const WIDTH = 1000; // SVG user units; the viewBox height follows from the bounds
const TOLERANCE = 1.1; // Douglas-Peucker, in user units
const MIN_RING_AREA = 1.5; // drop islands smaller than this many square units

/** Perpendicular distance from p to the segment ab. */
function segDistance(p, a, b) {
  const dx = b[0] - a[0];
  const dy = b[1] - a[1];
  if (dx === 0 && dy === 0) return Math.hypot(p[0] - a[0], p[1] - a[1]);
  const t = Math.max(0, Math.min(1, ((p[0] - a[0]) * dx + (p[1] - a[1]) * dy) / (dx * dx + dy * dy)));
  return Math.hypot(p[0] - (a[0] + t * dx), p[1] - (a[1] + t * dy));
}

function simplify(points, tolerance) {
  if (points.length < 3) return points;
  let worst = 0;
  let index = 0;
  for (let i = 1; i < points.length - 1; i++) {
    const d = segDistance(points[i], points[0], points[points.length - 1]);
    if (d > worst) {
      worst = d;
      index = i;
    }
  }
  if (worst <= tolerance) return [points[0], points[points.length - 1]];
  return [
    ...simplify(points.slice(0, index + 1), tolerance).slice(0, -1),
    ...simplify(points.slice(index), tolerance),
  ];
}

/** Shoelace. Sign is ignored; only magnitude decides whether a ring survives. */
function ringArea(ring) {
  let sum = 0;
  for (let i = 0, j = ring.length - 1; i < ring.length; j = i++) {
    sum += (ring[j][0] + ring[i][0]) * (ring[j][1] - ring[i][1]);
  }
  return Math.abs(sum / 2);
}

/** Area-weighted centroid of a set of rings, for anchoring a marker. */
function centroid(rings) {
  let cx = 0;
  let cy = 0;
  let total = 0;
  for (const ring of rings) {
    const a = ringArea(ring);
    let sx = 0;
    let sy = 0;
    for (const [x, y] of ring) {
      sx += x;
      sy += y;
    }
    cx += (sx / ring.length) * a;
    cy += (sy / ring.length) * a;
    total += a;
  }
  return [cx / total, cy / total];
}

const round = (n) => Math.round(n * 10) / 10;

const geo = await (await fetch(SOURCE)).json();
const byState = new Map(geo.features.map((f) => [f.properties.state, f.geometry]));

for (const region of REGIONS) {
  for (const s of region.states) {
    if (!byState.has(s)) throw new Error(`DOSM data has no state named "${s}"`);
  }
}
const grouped = new Set(REGIONS.flatMap((r) => r.states));
for (const s of byState.keys()) {
  if (!grouped.has(s)) throw new Error(`state "${s}" is in the data but in no region`);
}

// Bounds across every state, so the projection is the same for all of them.
let minLon = Infinity;
let maxLon = -Infinity;
let minLat = Infinity;
let maxLat = -Infinity;
const eachRing = (geometry, fn) => {
  const polygons = geometry.type === "MultiPolygon" ? geometry.coordinates : [geometry.coordinates];
  for (const polygon of polygons) for (const ring of polygon) fn(ring);
};
for (const geometry of byState.values()) {
  eachRing(geometry, (ring) => {
    for (const [lon, lat] of ring) {
      if (lon < minLon) minLon = lon;
      if (lon > maxLon) maxLon = lon;
      if (lat < minLat) minLat = lat;
      if (lat > maxLat) maxLat = lat;
    }
  });
}

// Equirectangular. Malaysia sits within 1-7 degrees of the equator, where the
// cos(latitude) correction is under half a percent — far below the simplification
// tolerance, so a plain linear projection costs nothing and stays readable.
const scale = WIDTH / (maxLon - minLon);
const HEIGHT = Math.round((maxLat - minLat) * scale);
const project = ([lon, lat]) => [(lon - minLon) * scale, (maxLat - lat) * scale];

// Two panels, not one map. At true relative position the South China Sea eats
// the middle half of the frame and the peninsula is squeezed into the left 17%,
// which puts four of the five markers on top of each other. Splitting the
// peninsula from Borneo and setting them side by side is what Malaysian maps do
// anyway, and it roughly doubles the room the peninsula gets. Both panels stay
// at the same scale — only the empty sea between them is removed.
const PANELS = [
  { id: "peninsular", label: "Peninsular Malaysia", regions: REGIONS.filter((r) => r.slug !== "sabah-sarawak").map((r) => r.slug) },
  { id: "borneo", label: "Sabah & Sarawak", regions: ["sabah-sarawak"] },
];
const PANEL_PAD = 8;

const out = REGIONS.map((region) => {
  const rings = [];
  for (const state of region.states) {
    eachRing(byState.get(state), (ring) => {
      const projected = ring.map(project);
      if (ringArea(projected) < MIN_RING_AREA) return; // an islet, invisible at this size
      const thin = simplify(projected, TOLERANCE);
      if (thin.length >= 4) rings.push(thin);
    });
  }
  const d = rings
    .map((ring) => `M${ring.map(([x, y]) => `${round(x)} ${round(y)}`).join("L")}Z`)
    .join("");
  const [cx, cy] = centroid(rings);
  const xs = rings.flatMap((r) => r.map((p) => p[0]));
  const ys = rings.flatMap((r) => r.map((p) => p[1]));
  const bbox = [Math.min(...xs), Math.min(...ys), Math.max(...xs), Math.max(...ys)];
  return { ...region, d, marker: [round(cx), round(cy)], bbox };
});

const panels = PANELS.map((panel) => {
  const members = out.filter((r) => panel.regions.includes(r.slug));
  const x0 = Math.min(...members.map((m) => m.bbox[0])) - PANEL_PAD;
  const y0 = Math.min(...members.map((m) => m.bbox[1])) - PANEL_PAD;
  const x1 = Math.max(...members.map((m) => m.bbox[2])) + PANEL_PAD;
  const y1 = Math.max(...members.map((m) => m.bbox[3])) + PANEL_PAD;
  return {
    id: panel.id,
    label: panel.label,
    viewBox: [round(x0), round(y0), round(x1 - x0), round(y1 - y0)],
    regions: panel.regions,
  };
});

const file = `// GENERATED by scripts/build-map.mjs — do not edit by hand.
// Source: Department of Statistics Malaysia open data (state boundaries),
// projected, simplified and merged into the 5 regions the \`store\` table uses.

export type MapRegion = {
  /** Matches store.region_slug, and the anchor id on /store-locations/. */
  slug: string;
  name: string;
  /** SVG path. Several subpaths: the region's states, plus their islands. */
  d: string;
  /** Area-weighted centroid, where the region's marker is anchored. */
  marker: [number, number];
};

/**
 * Every path and marker is in one shared coordinate space; a panel is a crop of
 * it. Rendering the two panels side by side drops the empty sea between the
 * peninsula and Borneo without rescaling either one.
 */
export type MapPanel = {
  id: string;
  label: string;
  /** minX, minY, width, height — pass straight to an SVG viewBox. */
  viewBox: [number, number, number, number];
  /** Region slugs drawn in this panel. */
  regions: string[];
};

export const MAP_PANELS: MapPanel[] = ${JSON.stringify(panels, null, 2)};

export const MAP_REGIONS: MapRegion[] = ${JSON.stringify(
  out.map(({ slug, name, d, marker }) => ({ slug, name, d, marker })),
  null,
  2
)};
`;

const target = join(import.meta.dirname, "../src/lib/malaysia-map.ts");
await writeFile(target, file);
console.log(
  `wrote ${target}\nviewBox 0 0 ${WIDTH} ${HEIGHT}\n` +
    out.map((r) => `  ${r.slug.padEnd(26)} ${String(r.d.length).padStart(6)} chars`).join("\n") +
    `\n  ${"total".padEnd(26)} ${String(out.reduce((n, r) => n + r.d.length, 0)).padStart(6)} chars`
);
