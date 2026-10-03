import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";
import { notFound } from "next/navigation";

import { CtaBar } from "@/components/CtaBar";
import { SiteHeader } from "@/components/SiteHeader";
import { LOCALES, TAG, t, type Locale } from "@/i18n";
import { hreflang, type Editions } from "@/lib/alternates";
import { archives, getArchive, getArchiveArticles, type Archive } from "@/lib/queries/article";
import { archivePageHref, homeHref } from "@/lib/routes";
import { formatDate } from "@/lib/site";

/**
 * The blog archive, shared by /category/<slug>/ and /category/<slug>/page/N/ in
 * every edition (Malay: /ms/category/panduan-membeli/). It runs on the dark
 * chassis like the product category pages — it is an index of cards, not a
 * reading surface. The paper ground starts at the article.
 *
 * WordPress serves pages 2..N at /category/<slug>/page/N/ and they are
 * indexed, so the literal `page` segment is part of the URL contract. Page 1
 * lives at the bare /category/<slug>/ and is never generated as /page/1/ — two
 * URLs for the same 8 articles would be duplicate content.
 */

/** Page 1 of every archive in the edition. */
export function archiveParams(locale: Locale) {
  return archives(locale).map((a) => ({ slug: a.slug }));
}

/**
 * Every archive's real page 2..n. This matters more than the other params —
 * pagination is where crawlers invent URLs (/page/99/, /page/0/), and closing
 * it turns each guess into a static 404 instead of a render.
 */
export function archivePagedParams(locale: Locale) {
  return archives(locale).flatMap((a) =>
    Array.from({ length: a.pages - 1 }, (_, i) => ({ slug: a.slug, n: String(i + 2) }))
  );
}

function resolve(locale: Locale, slug: string, page: number) {
  const archive = getArchive(locale, slug);
  if (!archive || !Number.isInteger(page) || page < 1 || page > archive.pages) return undefined;
  return archive;
}

/**
 * The same section's archive in the other editions, at the same page number
 * where that edition has one. A shorter archive has no page 5, and hreflang
 * must never point at a 404, so those editions drop out of the set.
 */
function editionsOf(section: string, page: number): Editions {
  const editions: Editions = {};
  for (const l of LOCALES) {
    const a = archives(l).find((x) => x.section === section);
    if (a && page <= a.pages) editions[l] = archivePageHref(l, a.slug, page);
  }
  return editions;
}

export function archiveMetadata(locale: Locale, slug: string, page: number): Metadata {
  const archive = resolve(locale, slug, page);
  if (!archive) return {};
  const a = t(locale).archive;
  const href = archivePageHref(locale, archive.slug, page);

  return {
    title: page === 1 ? a.title(archive.name) : a.titlePaged(archive.name, page),
    description:
      page === 1
        ? a.description(archive.total, archive.name)
        : a.descriptionPaged(page, archive.pages, archive.name),
    alternates: { canonical: href, languages: hreflang(editionsOf(archive.section, page)) },
  };
}

export function ArchivePage({ locale, slug, page }: { locale: Locale; slug: string; page: number }) {
  const archive = resolve(locale, slug, page);
  if (!archive) notFound();
  return (
    <ArchiveView
      locale={locale}
      archive={archive}
      page={page}
      editions={editionsOf(archive.section, page)}
    />
  );
}

function ArchiveView({
  locale,
  archive,
  page,
  editions,
}: {
  locale: Locale;
  archive: Archive;
  page: number;
  editions: Editions;
}) {
  const d = t(locale);
  const a = d.archive;
  const articles = getArchiveArticles(locale, archive.section, page);
  const pageHref = (n: number) => archivePageHref(locale, archive.slug, n);

  return (
    <>
      <SiteHeader locale={locale} editions={editions} />

      <main id="main">
        <div className="mx-auto max-w-6xl px-5 py-8 sm:px-8 sm:py-12">
          <nav aria-label="Breadcrumb" className="mb-8 text-sm">
            <ol className="flex flex-wrap items-center gap-2 text-ink-muted">
              <li>
                <Link href={homeHref(locale)} className="transition-colors hover:text-ink">
                  {d.nav.home}
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
            {a.count(archive.total)}
            {archive.pages > 1 && a.pageOf(page, archive.pages)}
          </p>
        </div>

        <section
          aria-label={a.listLabel(archive.name)}
          className="mx-auto max-w-6xl px-5 pb-14 sm:px-8 sm:pb-20"
        >
          <ul className="grid gap-5 [grid-template-columns:repeat(auto-fit,minmax(280px,1fr))]">
            {articles.map((card, i) => (
              <li key={card.href}>
                <Link
                  href={card.href}
                  lang={card.lang === TAG[locale] ? undefined : card.lang}
                  className="group flex h-full flex-col gap-4 rounded-sm border border-line bg-surface p-4 transition-colors hover:border-line-strong"
                >
                  {card.url && (
                    <div className="relative aspect-[3/2] overflow-hidden rounded-sm bg-void">
                      <Image
                        src={card.url}
                        alt={card.alt ?? ""}
                        fill
                        // The first row is above the fold on every viewport.
                        loading={i < 3 ? "eager" : "lazy"}
                        sizes="(max-width: 640px) 100vw, (max-width: 1024px) 45vw, 320px"
                        className="object-cover"
                      />
                    </div>
                  )}
                  <h2 className="font-medium leading-snug transition-colors group-hover:text-teal">
                    {card.title}
                  </h2>
                  {card.meta_description && (
                    <p className="line-clamp-3 text-sm leading-relaxed text-ink-muted">
                      {card.meta_description}
                    </p>
                  )}
                  <p className="readout mt-auto flex flex-wrap gap-x-3 border-t border-line pt-3 text-xs text-ink-muted">
                    <time dateTime={card.published_at.slice(0, 10)}>
                      {formatDate(card.published_at, TAG[locale])}
                    </time>
                    {card.reading_minutes && (
                      <span>
                        {card.reading_minutes} {a.min}
                      </span>
                    )}
                  </p>
                </Link>
              </li>
            ))}
          </ul>

          {archive.pages > 1 && (
            <nav aria-label={a.pagination} className="mt-14">
              <ul className="flex flex-wrap items-center gap-2">
                <li>
                  <Pager href={pageHref(page - 1)} disabled={page === 1} label={a.prevPage}>
                    {a.prev}
                  </Pager>
                </li>
                {Array.from({ length: archive.pages }, (_, i) => i + 1).map((n) => (
                  <li key={n}>
                    <Pager href={pageHref(n)} current={n === page} label={a.page(n)}>
                      <span className="readout">{n}</span>
                    </Pager>
                  </li>
                ))}
                <li>
                  <Pager
                    href={pageHref(page + 1)}
                    disabled={page === archive.pages}
                    label={a.nextPage}
                  >
                    {a.next}
                  </Pager>
                </li>
              </ul>
            </nav>
          )}
        </section>
      </main>

      <CtaBar label={d.cta.help} lang={locale === "en" ? undefined : TAG[locale]} />
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
