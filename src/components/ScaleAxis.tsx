import Link from "next/link";

import type { Tick } from "@/lib/queries/home";

/**
 * Every model in a category plotted on the axis of the figure that decides the
 * purchase. This is the homepage signature: the source site shows extraction
 * numbers as pixels inside marketing JPEGs, one product at a time, so nobody
 * can see where a model sits in the lineup. Here that is the first thing on
 * the page.
 *
 * Ticks are decoration for assistive tech — the endpoints are real links and
 * the sr-only summary carries the range. Tick targets are 2px wide; making
 * them links would fail the 24px target minimum.
 */
export function ScaleAxis({
  label,
  unit,
  ticks,
  footnote,
}: {
  label: string;
  unit: string;
  ticks: Tick[];
  footnote?: string;
}) {
  if (ticks.length < 2) return null;

  const lo = ticks[0];
  const hi = ticks[ticks.length - 1];
  const span = hi.value - lo.value;

  return (
    <figure className="rounded-sm border border-line bg-surface p-6 sm:p-8">
      <figcaption className="flex items-baseline justify-between gap-4">
        <span className="text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ink-muted">
          {label}
        </span>
        <span className="readout shrink-0 text-xs text-ink-muted">
          {ticks.length} models · {unit}
        </span>
      </figcaption>

      <p className="sr-only">
        {ticks.length} models, from {fmt(lo.value)} to {fmt(hi.value)} {unit}.
      </p>

      {/* The plot sits on void, inset in the panel — a window in the chassis. */}
      <div className="mt-5 rounded-sm border border-line bg-void px-4 py-4">
        <div className="relative h-24" aria-hidden="true">
          {ticks.map((t, i) => {
            const end = i === 0 || i === ticks.length - 1;
            return (
              <span
                key={t.slug}
                title={`${t.model_code} — ${fmt(t.value)} ${unit}`}
                style={{
                  left: `${((t.value - lo.value) / span) * 100}%`,
                  animationDelay: `${i * 40}ms`,
                }}
                className={`animate-readout absolute bottom-0 -translate-x-1/2 ${
                  end ? "h-24 w-0.5 bg-teal" : "h-14 w-px bg-line-strong"
                }`}
              />
            );
          })}
          <span className="absolute inset-x-0 bottom-0 h-px bg-line-strong" />
        </div>
      </div>

      <div className="mt-4 flex items-start justify-between gap-4">
        {[lo, hi].map((t, i) => (
          <Link
            key={t.slug}
            href={`/${t.slug}/`}
            className={`group flex flex-col gap-0.5 ${i === 1 ? "items-end text-right" : ""}`}
          >
            <span className="readout text-lg font-semibold text-teal sm:text-xl">
              {fmt(t.value)}
            </span>
            <span className="readout text-xs text-ink-muted transition-colors group-hover:text-ink">
              {t.model_code}
            </span>
          </Link>
        ))}
      </div>

      {footnote && <p className="mt-6 text-sm text-ink-muted">{footnote}</p>}
    </figure>
  );
}

function fmt(n: number): string {
  return Number.isInteger(n) ? n.toLocaleString("en-MY") : String(n);
}
