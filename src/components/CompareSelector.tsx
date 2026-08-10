"use client";

import Image from "next/image";
import Link from "next/link";
import { useMemo, useState } from "react";

import type { CategoryProduct, Column } from "@/lib/queries/category";

/**
 * Two or three models side by side, each column chosen from a dropdown.
 *
 * Comparing is a two-or-three-way act: nobody weighs sixteen hoods at once,
 * they shortlist and then look hard at the shortlist. The full sixteen-row
 * table still ships underneath in a disclosure, so the whole range stays in
 * the HTML for anything reading the page rather than driving it.
 *
 * Built as columns, not as a spreadsheet. The first version of this was a
 * striped grid of small values, which is the shape of a data table and the
 * wrong shape for a decision — DESIGN.md puts the measured figures at hero
 * scale because they are the argument, and a comparison that sets them at body
 * size throws that away. So: a panel per model, the product at the top of it,
 * the figures at readout scale, one hairline per row and no cell borders at
 * all. The leader in each row is the only thing coloured.
 */
export function CompareSelector({
  products,
  columns,
  initial,
}: {
  products: CategoryProduct[];
  /** The measured rows, in the order the products list them. */
  columns: Column[];
  /** Slugs to open with. Trimmed to whatever exists. */
  initial: string[];
}) {
  const [count, setCount] = useState(Math.min(3, initial.length));
  const [picked, setPicked] = useState<string[]>(initial);

  const chosen = picked
    .slice(0, count)
    .map((slug) => products.find((p) => p.slug === slug))
    .filter((p): p is CategoryProduct => p !== undefined);

  /**
   * The best value in each measured row, but only among the models actually on
   * screen and only when it is not a tie. Marking a figure two of two columns
   * share says nothing, and marking every column says less.
   */
  const best = useMemo(() => {
    const out: Record<string, number> = {};
    for (const c of columns) {
      const values = chosen
        .map((p) => p.facets.find((f) => f.facet === c.facet)?.value)
        .filter((v): v is number => v !== undefined);
      if (values.length < 2) continue;
      const top = c.better === "low" ? Math.min(...values) : Math.max(...values);
      if (values.filter((v) => v === top).length === 1) out[c.facet] = top;
    }
    return out;
  }, [chosen, columns]);

  const rows: Row[] = [
    ...columns.map((c) => ({
      label: c.label,
      unit: c.unit,
      facet: c.facet,
      value: (p: CategoryProduct) => {
        const f = p.facets.find((x) => x.facet === c.facet);
        return f ? fmt(f.value) : null;
      },
    })),
    { label: "Auto-clean", value: (p: CategoryProduct) => p.auto_clean },
    { label: "Best for", value: (p: CategoryProduct) => p.best_for },
  ].filter((row) => chosen.some((p) => row.value(p)));

  return (
    <div>
      <div className="flex flex-wrap items-center justify-between gap-4 pb-8">
        <p className="text-sm text-ink-muted">Pick the models you are weighing against each other.</p>
        {/* Two or three. Four columns of specification is where a comparison
            stops being readable on a laptop, and on a phone even three scroll. */}
        <div
          role="group"
          aria-label="How many models to compare"
          className="flex rounded-sm border border-line p-1"
        >
          {[2, 3].map((n) => (
            <button
              key={n}
              type="button"
              aria-pressed={count === n}
              onClick={() => setCount(n)}
              className={`rounded-[2px] px-3 py-1.5 text-sm transition-colors ${
                count === n
                  ? "bg-raised font-semibold text-ink"
                  : "text-ink-muted hover:text-ink"
              }`}
            >
              {n} models
            </button>
          ))}
        </div>
      </div>

      {/* One grid so the rows cannot drift out of line, with the column panels
          painted cell by cell rather than by a wrapper — a wrapper per column
          would need its own row heights and they would disagree the moment one
          value wrapped to two lines. */}
      <div className="rail -mx-5 overflow-x-auto px-5 pb-3 sm:mx-0 sm:px-0">
        <div
          className="grid min-w-[38rem] gap-x-3"
          style={{ gridTemplateColumns: `minmax(7rem,0.6fr) repeat(${count}, minmax(0,1fr))` }}
        >
          {/* Head: the product, then the control that changes it. */}
          <div />
          {chosen.map((product, i) => (
            <div key={i} className="rounded-t-sm bg-surface p-3 sm:p-4">
              <div className="relative aspect-[4/3] overflow-hidden rounded-sm bg-white">
                {product.url && (
                  <Image
                    src={product.url}
                    alt={product.alt ?? product.name}
                    fill
                    sizes="(max-width: 640px) 40vw, 300px"
                    className="object-contain p-3"
                  />
                )}
              </div>

              <label className="sr-only" htmlFor={`compare-${i}`}>
                Model in column {i + 1}
              </label>
              <div className="relative mt-3">
                <select
                  id={`compare-${i}`}
                  value={picked[i] ?? ""}
                  onChange={(e) =>
                    setPicked((prev) => prev.map((s, n) => (n === i ? e.target.value : s)))
                  }
                  className="w-full cursor-pointer appearance-none rounded-sm border border-line-strong bg-void py-2.5 pl-3 pr-9 text-sm font-semibold text-ink transition-colors hover:border-teal"
                >
                  {products.map((p) => (
                    <option key={p.slug} value={p.slug}>
                      {optionLabel(p)}
                    </option>
                  ))}
                </select>
                {/* appearance-none takes the native arrow with it, so the
                    control needs one back or it stops looking operable. */}
                <span
                  aria-hidden="true"
                  className="pointer-events-none absolute right-3 top-1/2 -translate-y-1/2 text-xs text-ink-muted"
                >
                  ▾
                </span>
              </div>
            </div>
          ))}

          {rows.map((row, r) => (
            <div key={row.label} className="contents">
              {/* Sticky, so the row you are reading keeps its name when the
                  grid is scrolled sideways on a phone. */}
              <div className="sticky left-0 z-10 flex items-center bg-void py-4 pr-3">
                <span className="text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ink-muted">
                  {row.label}
                </span>
              </div>
              {chosen.map((product, i) => {
                const value = row.value(product);
                const measured = row.facet !== undefined;
                const leads =
                  measured &&
                  product.facets.find((f) => f.facet === row.facet)?.value === best[row.facet!];

                return (
                  <div
                    key={i}
                    className={`flex items-baseline gap-1.5 bg-surface px-3 py-4 sm:px-4 ${
                      r === rows.length - 1 ? "" : "border-b border-line"
                    }`}
                  >
                    {value === null ? (
                      <>
                        <span aria-hidden="true" className="text-ink-muted">
                          &ndash;
                        </span>
                        <span className="sr-only">not published</span>
                      </>
                    ) : measured ? (
                      <>
                        <span
                          className={`readout text-xl font-semibold leading-none sm:text-2xl ${
                            leads ? "text-teal" : "text-ink"
                          }`}
                        >
                          {value}
                        </span>
                        <span className="readout text-xs text-ink-muted">{row.unit}</span>
                        {leads && <span className="sr-only">best of the models shown</span>}
                      </>
                    ) : (
                      <span className="text-sm leading-snug text-ink">{value}</span>
                    )}
                  </div>
                );
              })}
            </div>
          ))}

          <div />
          {chosen.map((product, i) => (
            <div key={i} className="rounded-b-sm bg-surface p-3 sm:p-4">
              <Link
                href={`/${product.slug}/`}
                className="block rounded-sm bg-teal px-4 py-3 text-center text-sm font-semibold text-void transition-opacity hover:opacity-90"
              >
                View {product.model_code}
              </Link>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

/**
 * How a model reads in the dropdown. The series is the useful qualifier where
 * there is one; the colourway is what separates the two V917s, which carry no
 * series and would otherwise be the same option printed twice.
 */
function optionLabel(p: CategoryProduct): string {
  const qualifier = p.series ?? p.colour_variant;
  return qualifier ? `${p.model_code} - ${qualifier}` : p.model_code;
}

type Row = {
  label: string;
  unit?: string;
  /** Set on the measured rows. Absent on Auto-clean and Best for. */
  facet?: string;
  value: (p: CategoryProduct) => string | null;
};

function fmt(n: number): string {
  return Number.isInteger(n) ? n.toLocaleString("en-MY") : String(n);
}
