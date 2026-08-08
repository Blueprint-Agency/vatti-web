import Image from "next/image";
import Link from "next/link";

import { SiteHeader } from "@/components/SiteHeader";
import type { Category, CategoryProduct } from "@/lib/queries/category";
import { WHATSAPP } from "@/lib/site";

/**
 * The category template. These pages outrank the homepage — /kitchen-hood/ and
 * /kitchen-hood-in-malaysia/ between them carry more search traffic than every
 * product page combined — so the measured figures ride on the card itself
 * rather than waiting behind a click.
 */
export function CategoryView({
  category,
  products,
}: {
  category: Category;
  products: CategoryProduct[];
}) {
  return (
    <>
      <SiteHeader />

      <main id="main">
        <div className="mx-auto max-w-6xl px-5 py-8 sm:px-8 sm:py-12">
          <nav aria-label="Breadcrumb" className="mb-8 text-sm">
            <ol className="flex flex-wrap items-center gap-2 text-ink-muted">
              <li>
                <Link href="/" className="transition-colors hover:text-ink">
                  Home
                </Link>
              </li>
              <li aria-hidden="true">/</li>
              <li className="text-ink">{category.name}</li>
            </ol>
          </nav>

          <h1 className="max-w-[18ch] text-balance text-[clamp(2rem,1.2rem+3.2vw,3.75rem)] font-semibold leading-[1.03] tracking-[-0.04em]">
            {category.h1 ?? `${category.name} in Malaysia`}
          </h1>

          <p className="readout mt-4 text-sm text-ink-muted">
            {products.length} {products.length === 1 ? "model" : "models"}
          </p>

          {category.intro_md && (
            <p className="mt-6 max-w-[62ch] text-[1.0625rem] leading-relaxed text-ink-muted">
              {category.intro_md}
            </p>
          )}
        </div>

        <section
          aria-label={`${category.name} models`}
          className="mx-auto max-w-6xl px-5 pb-14 sm:px-8 sm:pb-20"
        >
          <ul className="grid gap-5 [grid-template-columns:repeat(auto-fit,minmax(240px,1fr))]">
            {products.map((p, i) => (
              <li key={p.slug}>
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
                        // The first row is above the fold on every viewport.
                        loading={i < 4 ? "eager" : "lazy"}
                        sizes="(max-width: 640px) 100vw, (max-width: 1024px) 45vw, 280px"
                        className="object-contain"
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
        </section>

        <section aria-labelledby="category-cta" className="border-t border-line bg-surface">
          <div className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20">
            <div className="max-w-2xl">
              <h2
                id="category-cta"
                className="text-2xl font-semibold tracking-[-0.025em] sm:text-3xl"
              >
                Not sure which {category.name.toLowerCase()} fits?
              </h2>
              <p className="mt-3 max-w-[62ch] text-ink-muted">
                Send us your kitchen layout — hob width, ceiling height, whether you cook with a wok
                daily — and we will narrow it to one model and the nearest dealer who stocks it.
              </p>
              <div className="mt-8 flex flex-wrap gap-3">
                <a
                  href={WHATSAPP}
                  className="rounded-sm bg-teal px-6 py-3 font-semibold text-void transition-opacity hover:opacity-90"
                >
                  WhatsApp us
                </a>
                <Link
                  href="/store-locations/"
                  className="rounded-sm border border-line-strong px-6 py-3 font-medium text-ink transition-colors hover:border-teal hover:text-teal"
                >
                  Find a dealer
                </Link>
              </div>
            </div>
          </div>
        </section>
      </main>
    </>
  );
}

function fmt(n: number): string {
  return Number.isInteger(n) ? n.toLocaleString("en-MY") : String(n);
}
