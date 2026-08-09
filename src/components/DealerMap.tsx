import Link from "next/link";

import { MAP_PANELS, MAP_REGIONS } from "@/lib/malaysia-map";
import type { Region } from "@/lib/queries/home";

/**
 * The dealer network, on the country it covers.
 *
 * Every region is a link to its own anchor on /store-locations/, so the map is
 * a way into the list rather than a picture of it. That is the whole reason it
 * earns its place: a buyer in Kuantan can point at where they live.
 *
 * Each region renders as its own full-panel SVG stacked on the others, which is
 * what lets one `group` style both the landmass and its marker. The wrapper is
 * pointer-events-none and only the coastline and the marker take pointer
 * events, so the hit area is the state itself, not its bounding box.
 */
export function DealerMap({ regions }: { regions: Region[] }) {
  const counts = new Map(regions.map((r) => [r.slug, r]));

  return (
    <div className="grid gap-6 sm:grid-cols-[0.9fr_1.47fr] sm:gap-8">
      {MAP_PANELS.map((panel) => {
        const [, , vbWidth, vbHeight] = panel.viewBox;
        const members = MAP_REGIONS.filter((r) => panel.regions.includes(r.slug));

        return (
          <div
            key={panel.id}
            className="relative"
            style={{ aspectRatio: `${vbWidth} / ${vbHeight}` }}
          >
            {members.map((region) => {
              const row = counts.get(region.slug);
              if (!row) return null;

              // Marker coordinates are in the shared space; the panel is a crop
              // of it, so they are offset by the crop origin before becoming
              // percentages of the panel.
              const left = ((region.marker[0] - panel.viewBox[0]) / vbWidth) * 100;
              const top = ((region.marker[1] - panel.viewBox[1]) / vbHeight) * 100;

              return (
                <Link
                  key={region.slug}
                  href={`/store-locations/#${region.slug}`}
                  className="group pointer-events-none absolute inset-0 outline-none"
                >
                  <svg
                    viewBox={panel.viewBox.join(" ")}
                    className="absolute inset-0 h-full w-full overflow-visible"
                    aria-hidden
                  >
                    <path
                      d={region.d}
                      className="pointer-events-auto fill-raised stroke-line-strong transition-colors duration-300 group-hover:fill-teal-core group-focus-visible:fill-teal-core"
                      strokeWidth={1.5}
                      strokeLinejoin="round"
                    />
                  </svg>

                  <span
                    style={{ left: `${left}%`, top: `${top}%` }}
                    // z-10 because each region is its own absolutely positioned
                    // layer: without it a later region's landmass paints over
                    // an earlier region's marker, and Pahang clips the Northern
                    // Region label.
                    className="pointer-events-auto absolute z-10 flex -translate-x-1/2 -translate-y-1/2 flex-col items-center gap-1 whitespace-nowrap"
                  >
                    <span className="readout rounded-sm bg-teal px-2.5 py-1 text-sm font-semibold text-void shadow-[0_6px_20px_oklch(0.16_0.012_200/0.6)] transition-transform duration-300 group-hover:scale-110 group-focus-visible:scale-110 group-focus-visible:ring-2 group-focus-visible:ring-ink group-focus-visible:ring-offset-2 group-focus-visible:ring-offset-void">
                      {row.count}
                    </span>
                    {/* The label sits on the landmass, so it carries its own
                        ground. Without it the name disappears into the
                        coastline at anything under about 14px. */}
                    <span className="rounded-sm bg-void/85 px-1.5 py-0.5 text-xs text-ink">
                      {row.region}
                    </span>
                  </span>
                </Link>
              );
            })}
          </div>
        );
      })}
    </div>
  );
}
