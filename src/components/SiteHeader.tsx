import Image from "next/image";
import Link from "next/link";

import { ThemeToggle } from "@/components/ThemeToggle";
import { LOCALES, NATIVE_NAME, SHORT_NAME, TAG, t, type Locale } from "@/i18n";
import { categoryMenuImages, type MenuImage } from "@/lib/queries/category";
import { archiveHref, categoryHref, homeHref, sectionLabel, staticHref } from "@/lib/routes";
import { CATALOGUE, LOGO_URL } from "@/lib/site";

import type { Editions } from "@/lib/alternates";
export type { Editions };

/**
 * Primary menu, item for item: Home · Products ▾ · Store Locations ·
 * About VATTI · Blog ▾ · eWarranty · Contact Us · Catalog. Visitors arriving
 * from search on a deep page navigate by this menu.
 *
 * The water purifier label is shortened from WordPress's "Single Tap Water
 * Filter / One Tap Water Purifier" (a keyword string, not a menu item) to
 * match the footer. The href is unchanged.
 *
 * Dropdowns are CSS only — hover on pointer devices, `focus-within` for the
 * keyboard, and on mobile the whole menu is a native <details> drawer with the
 * groups flattened into headed sections, products as picture cards. No client
 * component, no JS bundle.
 */
const CATEGORY_SLUGS = [
  "kitchen-hood-in-malaysia",
  "cooker-hob-in-malaysia",
  "combi-and-steam-oven-in-malaysia",
  "dishwasher-in-malaysia",
  "one-tap-purifier-in-malaysia",
];

const BLOG_SECTIONS = ["buying-guide", "tips-tricks", "recipe"];

type Item = { href: string; label: string };

const ITEM = "whitespace-nowrap text-ink-muted transition-colors hover:text-ink";

function Chevron() {
  return (
    <svg
      viewBox="0 0 10 6"
      aria-hidden="true"
      className="h-1.5 w-2.5 fill-none stroke-current stroke-[1.5] opacity-60"
    >
      <path d="M1 1l4 4 4-4" strokeLinecap="round" strokeLinejoin="round" />
    </svg>
  );
}

function Dropdown({ label, items }: { label: string; items: Item[] }) {
  return (
    <li className="group relative">
      {/* Not a <button>: nothing to press — the panel opens on hover and on
          focus. It stays tabbable so the keyboard can reach the panel.
          py/-my stretch the trigger to the full header height so `top-full`
          lands on the header's bottom edge with no dead band for the pointer
          to cross — a gap there drops the hover before it reaches the panel. */}
      <span
        tabIndex={0}
        className={`flex cursor-default items-center gap-1.5 py-3.5 -my-3.5 ${ITEM}`}
      >
        {label}
        <Chevron />
      </span>
      <ul className="invisible absolute left-1/2 top-full z-[var(--z-dropdown)] w-max -translate-x-1/2 rounded-b-sm border border-t-0 border-line bg-surface py-1.5 opacity-0 shadow-lg transition-opacity duration-150 ease-[var(--ease-out-quart)] group-focus-within:visible group-focus-within:opacity-100 group-hover:visible group-hover:opacity-100">
        {items.map((i) => (
          <li key={i.href}>
            <Link
              href={i.href}
              className="block px-4 py-2 text-sm text-ink-muted transition-colors hover:bg-raised hover:text-ink"
            >
              {i.label}
            </Link>
          </li>
        ))}
      </ul>
    </li>
  );
}

/**
 * The mobile drawer's product group: one card per category, the label on the
 * left and the category's lead model on the right, so a visitor picks by the
 * shape of the appliance before reading the word. The picture is decorative
 * (alt=""): the label is the link's name, and repeating it as alt would read
 * every category twice to a screen reader.
 */
function ProductCards({
  label,
  items,
  images,
}: {
  label: string;
  items: (Item & { slug: string })[];
  images: Record<string, MenuImage>;
}) {
  return (
    <>
      <li className="pt-4 text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ink-muted first:pt-0">
        {label}
      </li>
      <li>
        <ul className="grid gap-2 pt-2">
          {items.map((i) => {
            const img = images[i.slug];
            return (
              <li key={i.href}>
                <Link
                  href={i.href}
                  className="flex h-[4.5rem] items-center gap-3 overflow-hidden rounded-md border border-line bg-linear-to-r from-surface to-raised pl-4 pr-3 text-ink transition-colors active:border-line-strong"
                >
                  <span className="min-w-0 flex-1 text-[0.9375rem] font-medium leading-tight">
                    {i.label}
                  </span>
                  {img && (
                    <Image
                      src={img.url}
                      alt=""
                      width={img.width}
                      height={img.height}
                      sizes="112px"
                      className="h-16 w-28 shrink-0 object-contain object-right"
                    />
                  )}
                  <svg
                    viewBox="0 0 6 10"
                    aria-hidden="true"
                    className="h-2.5 w-1.5 shrink-0 fill-none stroke-current stroke-[1.5] opacity-60"
                  >
                    <path d="M1 1l4 4-4 4" strokeLinecap="round" strokeLinejoin="round" />
                  </svg>
                </Link>
              </li>
            );
          })}
        </ul>
      </li>
    </>
  );
}

function Section({ label, items }: { label: string; items: Item[] }) {
  return (
    <>
      <li className="pt-4 text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ink-muted first:pt-0">
        {label}
      </li>
      {items.map((i) => (
        <li key={i.href}>
          <Link href={i.href} className="block py-1.5 pl-3 text-ink">
            {i.label}
          </Link>
        </li>
      ))}
    </>
  );
}

/**
 * The editions this page exists in, each named in its own language. Plain links
 * with hrefLang, no script: changing language is a navigation to another root
 * layout anyway. Renders nothing on a page with a single edition.
 *
 * Closed, it is a globe and a short code. Three full names in the row pushed
 * the desktop menu past the header width and wrapped every two-word label. A
 * <details> rather than a hover panel, so a tap opens it on a phone too.
 */
function LanguageSwitch({
  locale,
  editions,
  className = "",
}: {
  locale: Locale;
  editions?: Editions;
  className?: string;
}) {
  const shown = LOCALES.filter((l) => editions?.[l]);
  if (shown.length < 2) return null;
  const label = t(locale).nav.language;
  return (
    <details className={`relative ${className}`}>
      <summary
        aria-label={`${label}: ${NATIVE_NAME[locale]}`}
        className="flex cursor-pointer list-none items-center gap-1.5 whitespace-nowrap rounded-sm border border-line-strong px-2.5 py-1.5 text-xs text-ink [&::-webkit-details-marker]:hidden"
      >
        <svg
          viewBox="0 0 16 16"
          aria-hidden="true"
          className="hidden h-3.5 w-3.5 fill-none stroke-current stroke-[1.25] opacity-70 sm:block"
        >
          <circle cx="8" cy="8" r="6.5" />
          <path d="M1.5 8h13M8 1.5c1.8 1.8 2.6 4 2.6 6.5S9.8 12.7 8 14.5M8 1.5C6.2 3.3 5.4 5.5 5.4 8s.8 4.7 2.6 6.5" />
        </svg>
        <span lang={TAG[locale]}>{SHORT_NAME[locale]}</span>
        <Chevron />
      </summary>
      <nav
        aria-label={label}
        className="absolute right-0 top-full z-[var(--z-dropdown)] mt-2 w-max rounded-sm border border-line bg-surface py-1.5 shadow-lg"
      >
        <ul className="text-sm">
          {shown.map((l) => (
            <li key={l}>
              {l === locale ? (
                <span lang={TAG[l]} aria-current="true" className="block px-4 py-2 text-ink">
                  {NATIVE_NAME[l]}
                </span>
              ) : (
                <a
                  href={editions![l]}
                  hrefLang={TAG[l]}
                  lang={TAG[l]}
                  className="block px-4 py-2 text-ink-muted transition-colors hover:bg-raised hover:text-ink"
                >
                  {NATIVE_NAME[l]}
                </a>
              )}
            </li>
          ))}
        </ul>
      </nav>
    </details>
  );
}

export function SiteHeader({
  locale = "en",
  editions,
}: {
  locale?: Locale;
  editions?: Editions;
} = {}) {
  const nav = t(locale).nav;
  const CATEGORIES = CATEGORY_SLUGS.map((slug) => ({
    slug,
    href: categoryHref(locale, slug),
    label: nav.categories[slug],
  }));
  // The one component that reads a query itself rather than taking props: the
  // header is drawn by some fifteen pages and views, and threading five
  // pictures through every one of them buys nothing. Safe because every route
  // here, the not-found pages included, is prerendered at build, where the
  // database exists (src/lib/db.ts).
  const menuImages = categoryMenuImages();
  const BLOG = BLOG_SECTIONS.map((section) => ({
    href: archiveHref(locale, section),
    label: sectionLabel(locale, section),
  }));
  const STORE_LOCATIONS = { href: staticHref(locale, "store-locations"), label: nav.storeLocations };
  const ABOUT_VATTI = { href: staticHref(locale, "about-us"), label: nav.aboutVatti };
  const EWARRANTY = { href: staticHref(locale, "vatti-ewarranty"), label: nav.ewarranty };
  const CONTACT_US = { href: staticHref(locale, "contact-us"), label: nav.contactUs };
  const home = homeHref(locale);

  return (
    <header className="sticky top-0 z-[var(--z-sticky)] border-b border-line bg-void/92 backdrop-blur-sm">
      {/* gap-3 below sm: the wordmark, the ground selector and the menu button
          are all fixed-width, so on a 360px Android — common here — gap-6
          between the last two is what tips the row into overflowing. */}
      <div className="mx-auto flex max-w-6xl items-center gap-3 px-5 py-3.5 sm:gap-5 sm:px-8 xl:gap-6">
        <Link href={home} className="shrink-0 transition-opacity hover:opacity-80">
          <Image
            src={LOGO_URL}
            alt={nav.logoAlt}
            width={1136}
            height={466}
            priority
            className="h-9 w-auto"
          />
        </Link>

        <nav aria-label="Main" className="ml-auto hidden lg:block">
          <ul className="flex items-center gap-5 text-sm xl:gap-6">
            <li>
              <Link href={home} className={ITEM}>
                {nav.home}
              </Link>
            </li>
            <Dropdown label={nav.products} items={CATEGORIES} />
            <li>
              <Link href={STORE_LOCATIONS.href} className={ITEM}>
                {STORE_LOCATIONS.label}
              </Link>
            </li>
            <li>
              <Link href={ABOUT_VATTI.href} className={ITEM}>
                {ABOUT_VATTI.label}
              </Link>
            </li>
            <Dropdown label={nav.blog} items={BLOG} />
            <li>
              <Link href={EWARRANTY.href} className={ITEM}>
                {EWARRANTY.label}
              </Link>
            </li>
            <li>
              <Link href={CONTACT_US.href} className={ITEM}>
                {CONTACT_US.label}
              </Link>
            </li>
            <li>
              <a href={CATALOGUE} target="_blank" rel="noopener" className={ITEM}>
                {nav.catalog}
              </a>
            </li>
          </ul>
        </nav>

        {/* Between the nav and the menu button in the DOM, which puts it on the
            right on both layouts: on desktop the nav already carries ml-auto,
            on mobile the nav is gone and the switch takes it. */}
        <LanguageSwitch locale={locale} editions={editions} className="ml-auto lg:ml-0" />

        <ThemeToggle className={editions && Object.keys(editions).length > 1 ? "" : "ml-auto lg:ml-0"} />

        <details className="group lg:hidden">
          <summary className="flex cursor-pointer list-none items-center gap-2 whitespace-nowrap rounded-sm border border-line-strong px-3.5 py-2 text-sm font-medium text-ink [&::-webkit-details-marker]:hidden">
            {nav.menu}
            <Chevron />
          </summary>
          {/* The sticky <header> is a positioned ancestor, so top-full is its
              bottom edge. Scrolls internally rather than pushing the page. */}
          <nav
            aria-label="Main"
            className="absolute inset-x-0 top-full max-h-[80dvh] overflow-y-auto border-b border-line bg-void px-5 pb-8 pt-2 text-sm sm:px-8"
          >
            <ul className="mx-auto max-w-6xl">
              <li>
                <Link href={home} className="block py-1.5 text-ink">
                  {nav.home}
                </Link>
              </li>
              <ProductCards label={nav.products} items={CATEGORIES} images={menuImages} />
              <li className="pt-3">
                <Link href={STORE_LOCATIONS.href} className="block py-1.5 text-ink">
                  {STORE_LOCATIONS.label}
                </Link>
              </li>
              <li>
                <Link href={ABOUT_VATTI.href} className="block py-1.5 text-ink">
                  {ABOUT_VATTI.label}
                </Link>
              </li>
              <Section label={nav.blog} items={BLOG} />
              <li>
                <Link href={EWARRANTY.href} className="block py-1.5 text-ink">
                  {EWARRANTY.label}
                </Link>
              </li>
              <li>
                <Link href={CONTACT_US.href} className="block py-1.5 text-ink">
                  {CONTACT_US.label}
                </Link>
              </li>
              <li>
                <a
                  href={CATALOGUE}
                  target="_blank"
                  rel="noopener"
                  className="block py-1.5 text-ink"
                >
                  {nav.catalog}
                </a>
              </li>
            </ul>
          </nav>
        </details>
      </div>
    </header>
  );
}
