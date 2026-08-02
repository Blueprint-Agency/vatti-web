import Image from "next/image";
import Link from "next/link";

import { SiteHeader } from "@/components/SiteHeader";
import { all } from "@/lib/db";

type Row = {
  slug: string;
  name: string;
  model_code: string;
  series: string | null;
  category_name: string;
  category_slug: string;
  url: string | null;
  alt: string | null;
};

export default function HomePage() {
  const products = all<Row>(
    `SELECT p.slug, p.name, p.model_code, p.series,
            c.name AS category_name, c.slug AS category_slug,
            i.url, i.alt
       FROM product p
       JOIN product_category c ON c.id = p.category_id
       LEFT JOIN image i ON i.id = p.hero_image_id
      WHERE p.is_published = 1
      ORDER BY c.sort_order, p.sort_order`
  );

  const groups = products.reduce<Record<string, Row[]>>((acc, p) => {
    (acc[p.category_name] ||= []).push(p);
    return acc;
  }, {});

  return (
    <>
      <SiteHeader />
      <main id="main" className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20">
        <h1 className="max-w-[18ch] text-balance text-[clamp(2rem,1.2rem+3.4vw,4rem)] font-semibold leading-[1.03] tracking-[-0.04em]">
          Built for high heat.
        </h1>
        <p className="mt-6 max-w-[58ch] text-lg leading-relaxed text-ink-muted">
          VATTI has engineered kitchen appliances since 1992. Every model below is sold and serviced
          through 75 authorised dealers across Malaysia.
        </p>

        {Object.entries(groups).map(([category, items]) => (
          <section key={category} className="mt-16" aria-labelledby={`cat-${items[0].category_slug}`}>
            <div className="flex items-baseline justify-between gap-4 border-b border-line pb-3">
              <h2
                id={`cat-${items[0].category_slug}`}
                className="text-xl font-semibold tracking-[-0.02em]"
              >
                {category}
              </h2>
              <Link
                href={`/${items[0].category_slug}/`}
                className="readout shrink-0 text-sm text-teal transition-opacity hover:opacity-80"
              >
                {items.length} models
              </Link>
            </div>

            <ul className="mt-6 grid gap-5 [grid-template-columns:repeat(auto-fit,minmax(200px,1fr))]">
              {items.map((p) => (
                <li key={p.slug}>
                  <Link
                    href={`/${p.slug}/`}
                    className="group flex h-full flex-col gap-4 rounded-sm border border-line bg-surface p-4 transition-colors hover:border-line-strong"
                  >
                    {p.url && (
                      <div className="relative aspect-square overflow-hidden rounded-sm bg-void">
                        <Image
                          src={p.url}
                          alt=""
                          fill
                          loading="lazy"
                          sizes="(max-width: 640px) 50vw, 240px"
                          className="object-contain"
                        />
                      </div>
                    )}
                    <div className="mt-auto">
                      <p className="readout text-xs text-teal">{p.model_code}</p>
                      <p className="mt-1 text-sm font-medium leading-snug text-ink transition-colors group-hover:text-teal">
                        {p.name}
                      </p>
                    </div>
                  </Link>
                </li>
              ))}
            </ul>
          </section>
        ))}
      </main>
    </>
  );
}
