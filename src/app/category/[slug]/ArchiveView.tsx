import Image from "next/image";
import Link from "next/link";

import { CtaBar } from "@/components/CtaBar";
import { SiteHeader } from "@/components/SiteHeader";
import type { Archive, ArticleCard } from "@/lib/queries/article";
import { formatDate } from "@/lib/site";

/** Page 1 keeps the bare archive URL; the rest carry WordPress's /page/N/. */
export function archiveHref(slug: string, page: number): string {
  return page <= 1 ? `/category/${slug}/` : `/category/${slug}/page/${page}/`;
}

/**
 * The blog archive, shared by /category/<slug>/ and /category/<slug>/page/N/.
 * It runs on the dark chassis like the product category pages — it is an index
 * of cards, not a reading surface. The paper ground starts at the article.
 */
export function ArchiveView({
  archive,
  page,
  articles,
}: {
  archive: Archive;
  page: number;
  articles: ArticleCard[];
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
              <li className="text-ink">{archive.name}</li>
            </ol>
          </nav>

          <h1 className="max-w-[18ch] text-balance text-[clamp(2rem,1.2rem+3.2vw,3.75rem)] font-semibold leading-[1.03] tracking-[-0.04em]">
            {archive.name}
          </h1>

          <p className="readout mt-4 text-sm text-ink-muted">
            {archive.total} {archive.total === 1 ? "article" : "articles"}
            {archive.pages > 1 && ` · page ${page} of ${archive.pages}`}
          </p>
        </div>

        <section
          aria-label={`${archive.name} articles`}
          className="mx-auto max-w-6xl px-5 pb-14 sm:px-8 sm:pb-20"
        >
          <ul className="grid gap-5 [grid-template-columns:repeat(auto-fit,minmax(280px,1fr))]">
            {articles.map((a, i) => (
              <li key={a.path}>
                <Link
                  href={`/${a.path}/`}
                  className="group flex h-full flex-col gap-4 rounded-sm border border-line bg-surface p-4 transition-colors hover:border-line-strong"
                >
                  {a.url && (
                    <div className="relative aspect-[3/2] overflow-hidden rounded-sm bg-void">
                      <Image
                        src={a.url}
                        alt={a.alt ?? ""}
                        fill
                        // The first row is above the fold on every viewport.
                        loading={i < 3 ? "eager" : "lazy"}
                        sizes="(max-width: 640px) 100vw, (max-width: 1024px) 45vw, 320px"
                        className="object-cover"
                      />
                    </div>
                  )}
                  <h2 className="font-medium leading-snug transition-colors group-hover:text-teal">
                    {a.title}
                  </h2>
                  {a.meta_description && (
                    <p className="line-clamp-3 text-sm leading-relaxed text-ink-muted">
                      {a.meta_description}
                    </p>
                  )}
                  <p className="readout mt-auto flex flex-wrap gap-x-3 border-t border-line pt-3 text-xs text-ink-muted">
                    <time dateTime={a.published_at.slice(0, 10)}>
                      {formatDate(a.published_at)}
                    </time>
                    {a.reading_minutes && <span>{a.reading_minutes} min</span>}
                  </p>
                </Link>
              </li>
            ))}
          </ul>

          {archive.pages > 1 && (
            <nav aria-label="Pagination" className="mt-14">
              <ul className="flex flex-wrap items-center gap-2">
                <li>
                  <Pager
                    href={archiveHref(archive.slug, page - 1)}
                    disabled={page === 1}
                    label="Previous page"
                  >
                    Prev
                  </Pager>
                </li>
                {Array.from({ length: archive.pages }, (_, i) => i + 1).map((n) => (
                  <li key={n}>
                    <Pager
                      href={archiveHref(archive.slug, n)}
                      current={n === page}
                      label={`Page ${n}`}
                    >
                      <span className="readout">{n}</span>
                    </Pager>
                  </li>
                ))}
                <li>
                  <Pager
                    href={archiveHref(archive.slug, page + 1)}
                    disabled={page === archive.pages}
                    label="Next page"
                  >
                    Next
                  </Pager>
                </li>
              </ul>
            </nav>
          )}
        </section>
      </main>

      <CtaBar />
    </>
  );
}

function Pager({
  href,
  label,
  children,
  current = false,
  disabled = false,
}: {
  href: string;
  label: string;
  children: React.ReactNode;
  current?: boolean;
  disabled?: boolean;
}) {
  const base = "block min-w-11 rounded-sm border px-3.5 py-2 text-center text-sm transition-colors";

  if (disabled) {
    return (
      <span aria-hidden="true" className={`${base} border-line text-ink-muted opacity-40`}>
        {children}
      </span>
    );
  }
  return (
    <Link
      href={href}
      aria-label={label}
      aria-current={current ? "page" : undefined}
      className={`${base} ${
        current
          ? "border-teal text-teal"
          : "border-line text-ink-muted hover:border-line-strong hover:text-ink"
      }`}
    >
      {children}
    </Link>
  );
}
