"use client";

import Image from "next/image";
import Link from "next/link";
import { useMemo, useState } from "react";

import type { CategoryProduct, FilterGroup } from "@/lib/queries/category";
import { WHATSAPP } from "@/lib/site";

/**
 * The model grid, with the filters above it.
 *
 * Filtering happens here rather than in the URL on purpose. Every one of these
 * pages is statically generated and several of them rank; a `?airflow=2` query
 * string would either need a route that does not exist or would produce a
 * second crawlable address for a page whose canonical is already earning the
 * traffic. The full list is in the HTML either way, so a crawler and a reader
 * with no JavaScript both see all sixteen models.
 *
 * Within a group the options are OR ("either band"), across groups they are
 * AND ("that band AND a BLDC motor"). That is what the counts on the chips
 * describe, and it is the only combination that keeps a count honest.
 */
export function ModelGrid({
  products,
  groups,
  noun,
}: {
  products: CategoryProduct[];
  groups: FilterGroup[];
  /** Singular, lower case: 'kitchen hood'. Used in the empty state. */
  noun: string;
}) {
  const [active, setActive] = useState<string[]>([]);

  const shown = useMemo(() => {
    if (active.length === 0) return products;
    return products.filter((p) =>
      groups.every((g) => {
        const wanted = g.options.filter((o) => active.includes(o.id));
        return wanted.length === 0 || wanted.some((o) => p.filters.includes(o.id));
      })
    );
  }, [active, groups, products]);

  function toggle(id: string) {
    setActive((prev) => (prev.includes(id) ? prev.filter((x) => x !== id) : [...prev, id]));
  }

  return (
    <div>
      {groups.length > 0 && (
        <div className="flex flex-col gap-6 border-y border-line py-6">
          {groups.map((group) => (
            <fieldset key={group.key} className="min-w-0">
              <legend className="text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ink-muted">
                {group.label}
              </legend>
              <div className="mt-3 flex flex-wrap gap-2">
                {/* The series group keeps the "All" tab the live site has.
                    Deselecting every chip already shows everything, but on a
                    tab bar that reads as no answer rather than as "all of
                    them" — and it is the control people reach for to get back. */}
                {group.all && (
                  <button
                    type="button"
                    aria-pressed={!group.options.some((o) => active.includes(o.id))}
                    onClick={() =>
                      setActive((prev) =>
                        prev.filter((id) => !group.options.some((o) => o.id === id))
                      )
                    }
                    className={`flex items-baseline gap-2 rounded-sm border px-3 py-1.5 text-sm transition-colors ${
                      group.options.some((o) => active.includes(o.id))
                        ? "border-line text-ink-muted hover:border-line-strong hover:text-ink"
                        : "border-teal bg-teal text-void"
                    }`}
                  >
                    All
                    <span
                      className={`readout text-xs ${
                        group.options.some((o) => active.includes(o.id))
                          ? "text-ink-muted"
                          : "text-void/70"
                      }`}
                    >
                      {products.length}
                    </span>
                  </button>
                )}
                {group.options.map((option) => {
                  const on = active.includes(option.id);
                  return (
                    <button
                      key={option.id}
                      type="button"
                      aria-pressed={on}
                      onClick={() => toggle(option.id)}
                      className={`flex items-baseline gap-2 rounded-sm border px-3 py-1.5 text-sm transition-colors ${
                        on
                          ? "border-teal bg-teal text-void"
                          : "border-line text-ink-muted hover:border-line-strong hover:text-ink"
                      }`}
                    >
                      {option.label}
                      {/* Not a decorative badge: this is how many models are
                          behind the chip, which is the only thing that makes a
                          filter worth pressing before you press it. */}
                      <span className={`readout text-xs ${on ? "text-void/70" : "text-ink-muted"}`}>
                        {option.count}
                      </span>
                    </button>
                  );
                })}
              </div>
            </fieldset>
          ))}
        </div>
      )}

      <div className="flex flex-wrap items-center justify-between gap-4 py-5">
        <p className="readout text-sm text-ink-muted" aria-live="polite">
          {shown.length === products.length
            ? `${products.length} ${products.length === 1 ? "model" : "models"}`
            : `${shown.length} of ${products.length} models`}
        </p>
        {active.length > 0 && (
          <button
            type="button"
            onClick={() => setActive([])}
            className="text-sm text-teal transition-opacity hover:opacity-80"
          >
            Clear filters
          </button>
        )}
      </div>

      {shown.length === 0 ? (
        <div className="border-t border-line py-16 text-center">
          <p className="text-lg">No {noun} carries all of those at once.</p>
          <p className="mx-auto mt-3 max-w-[46ch] text-ink-muted">
            Drop one of the filters, or tell us what the kitchen has to do and we will say which
            model gets closest.
          </p>
          <div className="mt-8 flex flex-wrap justify-center gap-3">
            <button
              type="button"
              onClick={() => setActive([])}
              className="rounded-sm border border-line-strong px-6 py-3 font-medium text-ink transition-colors hover:border-teal hover:text-teal"
            >
              Clear filters
            </button>
            <a
              href={WHATSAPP}
              className="rounded-sm bg-teal px-6 py-3 font-semibold text-void transition-opacity hover:opacity-90"
            >
              Ask us instead
            </a>
          </div>
        </div>
      ) : (
        // Two layouts in one list.
        //
        // Below sm it is a horizontal snap rail. A 240px minimum track only
        // ever fits one column on a phone, which turned sixteen models into
        // sixteen full-width cards and a scroll most people would never reach
        // the end of. Sideways, the same sixteen cost one screen of height and
        // the card peeking at the right edge is what says there are more.
        //
        // From sm it is the grid, and auto-FILL rather than auto-fit: both lay
        // out identically when the grid is full, but auto-fit collapses the
        // tracks nothing landed in, so filtering down to a single model
        // stretched one card across the whole row. auto-fill keeps the empty
        // tracks, so a card is the same size whether the filter leaves sixteen
        // of them or one.
        //
        // The negative margin lets the rail run to both screen edges while the
        // rest of the section keeps its gutter; both are undone at sm.
        <ul className="rail -mx-5 flex snap-x snap-mandatory gap-5 overflow-x-auto px-5 pb-3 sm:mx-0 sm:grid sm:snap-none sm:overflow-x-visible sm:px-0 sm:pb-0 sm:[grid-template-columns:repeat(auto-fill,minmax(240px,1fr))]">
          {shown.map((p, i) => (
            <li
              // Keyed on the filter state as well as the slug, so the surviving
              // cards remount and settle in again. Without that a filter press
              // silently swaps the contents of the grid, and on a wide screen
              // where the whole grid is visible at once nothing tells you it
              // worked. The animation is a no-op under reduced motion.
              key={`${p.slug}:${active.join("|")}`}
              // Fixed width and no shrinking while it is a rail; a grid track
              // decides the width from sm up. 16rem against a 390px screen
              // leaves about a third of the next card showing, which is the
              // only thing telling a first-time visitor the row moves.
              className="animate-readout w-64 shrink-0 snap-start sm:w-auto sm:shrink"
              style={{ animationDelay: `${Math.min(i, 8) * 40}ms` }}
            >
              <Link
                href={`/${p.slug}/`}
                className="group flex h-full flex-col gap-4 rounded-sm border border-line bg-surface p-4 transition-colors hover:border-line-strong"
              >
                {p.url && (
                  <div className="relative aspect-square overflow-hidden rounded-sm bg-void">
                    <Image
                      src={p.url}
                      alt={p.alt || ""}
                      fill
                      // Lazy for the whole grid, including the first row.
                      //
                      // This said "the first row is above the fold on every
                      // viewport" and loaded four of them eagerly. That was true
                      // when a category hero was a shallow band. It is not true
                      // now: every category has a backdrop and no cut-out, so
                      // CategoryView takes the `banner` branch and the hero runs
                      // a full 100dvh. This grid is the far side of a screenful
                      // on all five.
                      //
                      // It was not merely wasted, it was contended. next/image
                      // emits a <link rel=preload as=image> per eager image, so
                      // the hero backdrop was racing four product shots that
                      // nobody had scrolled to yet, none of the five carrying
                      // fetchpriority. The LCP element should not be sharing the
                      // preload queue with images a screen below it.
                      loading="lazy"
                      // 256px below sm, not 100vw: the card is a fixed-width
                      // rail item there, and asking for a full-viewport image
                      // to fill a quarter of one is the kind of waste that
                      // only shows up on the connection least able to afford it.
                      sizes="(max-width: 640px) 256px, (max-width: 1024px) 45vw, 280px"
                      className="object-contain transition-transform duration-500 ease-[var(--ease-out-expo)] group-hover:scale-[1.04]"
                    />
                  </div>
                )}
                <div>
                  <p className="readout text-xs text-teal">
                    {p.model_code}
                    {p.secondary_model && ` + ${p.secondary_model}`}
                  </p>
                  <p className="mt-1 font-medium leading-snug transition-colors group-hover:text-teal">
                    {p.name}
                  </p>
                </div>
                {p.facets.length > 0 && (
                  <dl className="mt-auto flex flex-wrap gap-x-5 gap-y-1 border-t border-line pt-3">
                    {p.facets.slice(0, 3).map((f) => (
                      <div key={f.facet}>
                        <dt className="text-[0.625rem] uppercase tracking-[0.12em] text-ink-muted">
                          {f.label}
                        </dt>
                        <dd className="readout text-sm text-ink">
                          {fmt(f.value)}
                          <span className="text-ink-muted"> {f.unit}</span>
                        </dd>
                      </div>
                    ))}
                  </dl>
                )}
              </Link>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}

function fmt(n: number): string {
  return Number.isInteger(n) ? n.toLocaleString("en-MY") : String(n);
}
