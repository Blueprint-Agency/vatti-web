import type { Facet } from "@/lib/queries/product";

/**
 * The signature component. These figures are Vatti's only objective advantage
 * over Bosch/Rubine/Elba and the source site buries them inside JPEGs.
 *
 * Degrades to null: the dishwasher and the two ceramic hobs have no measured
 * value in the source data, and a wrong spec number is worse than an absent one.
 */
export function ReadoutStrip({ facets }: { facets: Facet[] }) {
  if (facets.length === 0) return null;

  return (
    <section aria-label="Key measurements" className="border-y border-line bg-surface">
      <dl className="mx-auto grid max-w-6xl grid-cols-2 gap-px bg-line md:grid-cols-4">
        {facets.map((f, i) => (
          <div
            key={f.facet}
            className="animate-readout bg-surface px-5 py-6 sm:px-7 sm:py-8"
            style={{ animationDelay: `${i * 70}ms` }}
          >
            <dt className="text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ink-muted">
              {f.label}
            </dt>
            <dd className="mt-2 flex items-baseline gap-1.5">
              <span className="readout text-3xl font-semibold leading-none text-teal sm:text-4xl">
                {formatValue(f.value)}
              </span>
              <span className="readout text-sm text-ink-muted">{f.unit}</span>
            </dd>
          </div>
        ))}
      </dl>
    </section>
  );
}

function formatValue(n: number): string {
  return Number.isInteger(n) ? n.toLocaleString("en-MY") : String(n);
}
