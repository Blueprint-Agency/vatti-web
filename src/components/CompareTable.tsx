"use client";

import Link from "next/link";
import { useMemo, useState } from "react";

import type { CategoryProduct, Column } from "@/lib/queries/category";

/**
 * Every model in the category against every measurement it carries.
 *
 * DESIGN.md calls the spec table the signature component of the product page.
 * This is the same instrument one level up: the numbers a buyer would
 * otherwise collect by opening sixteen tabs, in one place, sortable, with the
 * best value in each column marked.
 *
 * Sorting is the only interaction. It ships sorted in catalogue order, which
 * is the order the grid above uses, so the two sections agree until the reader
 * asks them not to.
 */
export function CompareTable({
  products,
  columns,
}: {
  products: CategoryProduct[];
  columns: Column[];
}) {
  const [sort, setSort] = useState<{ facet: string; dir: "asc" | "desc" } | null>(null);

  /**
   * The top value per column, but only where holding it means something.
   *
   * Oil capture is quoted at either 85% or 92% across the whole range, so
   * "best" there is nine of sixteen models and marking all nine lights up half
   * the table and says nothing. A column whose top value is shared by more
   * than a quarter of the rows is left unmarked.
   */
  const best = useMemo(() => {
    const out: Record<string, number> = {};
    for (const c of columns) {
      const values = products
        .map((p) => p.facets.find((f) => f.facet === c.facet)?.value)
        .filter((v): v is number => v !== undefined);
      if (!values.length) continue;
      const top = c.better === "low" ? Math.min(...values) : Math.max(...values);
      if (values.filter((v) => v === top).length <= Math.max(1, products.length / 4)) {
        out[c.facet] = top;
      }
    }
    return out;
  }, [columns, products]);

  const rows = useMemo(() => {
    if (!sort) return products;
    const value = (p: CategoryProduct) => p.facets.find((f) => f.facet === sort.facet)?.value;
    return [...products].sort((a, b) => {
      const x = value(a);
      const y = value(b);
      // A model with no figure for this column sorts to the bottom either way.
      // Floating it to the top of an ascending sort would read as "quietest".
      if (x === undefined) return y === undefined ? 0 : 1;
      if (y === undefined) return -1;
      return sort.dir === "asc" ? x - y : y - x;
    });
  }, [products, sort]);

  function toggle(facet: string, better: "high" | "low") {
    setSort((prev) =>
      prev?.facet === facet
        ? { facet, dir: prev.dir === "asc" ? "desc" : "asc" }
        : // First press sorts best-first, which is what someone clicking a
          // column called "Noise" almost always means.
          { facet, dir: better === "low" ? "asc" : "desc" }
    );
  }

  return (
    <div className="rail -mx-5 overflow-x-auto px-5 pb-3 sm:mx-0 sm:px-0">
      <table className="w-full min-w-[42rem] border-collapse text-left">
        <caption className="sr-only">
          {`Every model, with its measured ${columns.map((c) => c.label.toLowerCase()).join(", ")}. Column headers sort the table.`}
        </caption>
        <thead>
          <tr className="border-b border-line-strong">
            <th scope="col" className="py-3 pr-6 text-sm font-semibold">
              Model
            </th>
            {columns.map((c) => {
              const on = sort?.facet === c.facet;
              return (
                <th
                  key={c.facet}
                  scope="col"
                  aria-sort={on ? (sort.dir === "asc" ? "ascending" : "descending") : "none"}
                  className="py-3 pr-6 text-sm font-semibold last:pr-0"
                >
                  <button
                    type="button"
                    onClick={() => toggle(c.facet, c.better)}
                    className={`flex items-baseline gap-1.5 transition-colors hover:text-teal ${
                      on ? "text-teal" : ""
                    }`}
                  >
                    {c.label}
                    <span className="readout text-[0.6875rem] font-normal text-ink-muted">
                      {c.unit}
                    </span>
                    <span aria-hidden="true" className="text-xs">
                      {on ? (sort.dir === "asc" ? "↑" : "↓") : "↕"}
                    </span>
                    <span className="sr-only">
                      {on ? `, sorted ${sort.dir === "asc" ? "ascending" : "descending"}` : ", sort"}
                    </span>
                  </button>
                </th>
              );
            })}
          </tr>
        </thead>
        <tbody>
          {rows.map((p) => (
            <tr key={p.slug} className="border-b border-line last:border-0">
              <th scope="row" className="py-3 pr-6 font-normal">
                <Link href={`/${p.slug}/`} className="group block">
                  <span className="readout block text-xs text-teal">{p.model_code}</span>
                  <span className="mt-0.5 block text-sm leading-snug transition-colors group-hover:text-teal">
                    {p.name}
                  </span>
                </Link>
              </th>
              {columns.map((c) => {
                const f = p.facets.find((x) => x.facet === c.facet);
                const top = f !== undefined && f.value === best[c.facet];
                return (
                  <td key={c.facet} className="py-3 pr-6 last:pr-0">
                    {f ? (
                      <span
                        className={`readout text-sm ${top ? "font-semibold text-teal" : "text-ink"}`}
                      >
                        {fmt(f.value)}
                        {/* The best value in the column, named rather than
                            colour-coded: teal alone is not information if you
                            cannot see it. */}
                        {top && <span className="sr-only"> (best in range)</span>}
                      </span>
                    ) : (
                      <>
                        {/* Five of the 39 products publish no figure for a
                            column their category otherwise fills. A dash is
                            the honest cell; a zero would be a wrong number. */}
                        <span aria-hidden="true" className="text-sm text-ink-muted">
                          &ndash;
                        </span>
                        <span className="sr-only">not published</span>
                      </>
                    )}
                  </td>
                );
              })}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

function fmt(n: number): string {
  return Number.isInteger(n) ? n.toLocaleString("en-MY") : String(n);
}
