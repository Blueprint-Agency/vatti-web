import Link from "next/link";

import { SiteHeader } from "@/components/SiteHeader";
import { t, type Locale } from "@/i18n";
import { categoryHref, homeHref, staticHref } from "@/lib/routes";

/**
 * The 404 every unmatched URL lands on, replacing Next's built-in bare page.
 * Drawn by src/app/global-not-found.tsx (a URL no route matches), by
 * (en)/not-found.tsx and by each edition's not-found.tsx (a route that called
 * notFound()), so a missing Malay page answers in Malay.
 *
 * This site's whole contract is that a legacy URL resolves 200 or 301 and never
 * 404s (CLAUDE.md § The one rule), so in principle nobody should ever see this.
 * In practice someone will: a mistyped address, a link rotted on a third-party
 * site, a URL from a print catalogue that predates the redirect table. When that
 * happens the visitor has already told us what they wanted by the address they
 * typed, so this page's job is to get them back to a real one rather than to
 * apologise. The menu bar alone answers most of it, which is why SiteHeader is
 * here and not just a link home.
 *
 * The status code is what matters for search: this is rendered WITH a 404, so
 * a crawler that reaches a dead URL is told to drop it. That is the correct
 * outcome and the reason a "helpful" soft-404 — a 200 page saying "not found",
 * or a blanket redirect of every miss to the home page — would be worse than
 * useless. Do not add either.
 *
 * No `robots: noindex` is set, deliberately. A 404 is already unindexable; the
 * meta tag would be noise.
 */
const CATEGORY_LINKS = [
  "kitchen-hood-in-malaysia",
  "cooker-hob-in-malaysia",
  "combi-and-steam-oven-in-malaysia",
  "dishwasher-in-malaysia",
  "one-tap-purifier-in-malaysia",
];
const STATIC_LINKS = ["store-locations", "instruction-manual", "vatti-ewarranty"];

export function notFoundTitle(locale: Locale): string {
  return t(locale).notFound.title;
}

export function NotFoundView({ locale }: { locale: Locale }) {
  const n = t(locale).notFound;
  const links = [
    ...CATEGORY_LINKS.map((slug) => ({ href: categoryHref(locale, slug), label: n.links[slug] })),
    ...STATIC_LINKS.map((page) => ({ href: staticHref(locale, page), label: n.links[page] })),
  ];

  return (
    <>
      <SiteHeader locale={locale} />

      <main id="main">
        <section className="mx-auto max-w-6xl px-5 py-14 sm:px-8 sm:py-20">
          <div className="max-w-2xl">
            <p className="readout text-sm text-teal">{n.code}</p>
            <h1 className="mt-3 text-balance text-[clamp(2.25rem,1.2rem+4vw,4.5rem)] font-semibold leading-[1.02] tracking-[-0.04em]">
              {n.heading}
            </h1>
            <p className="mt-6 text-lg leading-relaxed text-ink-muted">{n.body}</p>
          </div>

          <nav aria-label={n.popular} className="mt-12">
            <h2 className="readout text-sm text-ink-muted">{n.goTo}</h2>
            <ul className="mt-5 grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
              {links.map((l) => (
                <li key={l.href}>
                  <Link
                    href={l.href}
                    className="block rounded-sm border border-line bg-surface px-5 py-4 font-semibold transition-colors hover:border-line-strong"
                  >
                    {l.label}
                  </Link>
                </li>
              ))}
            </ul>
          </nav>

          <div className="mt-12">
            <Link
              href={homeHref(locale)}
              className="inline-block rounded-sm bg-teal px-5 py-2.5 font-semibold text-void transition-opacity hover:opacity-90"
            >
              {n.backHome}
            </Link>
          </div>
        </section>
      </main>
    </>
  );
}
