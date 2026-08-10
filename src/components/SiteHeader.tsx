import Link from "next/link";

import { ThemeToggle } from "@/components/ThemeToggle";
import { CATALOGUE } from "@/lib/site";

/**
 * The WordPress primary menu, item for item: Home · Categories ▾ · About Us ·
 * Contact Us · Store Locations · eWarranty · Blog ▾ · Catalog. Visitors arriving
 * from search on a deep page navigate by this menu, so it is part of what the
 * rebuild inherits — not a design decision to re-take.
 *
 * The one label change: WordPress writes the water purifier as "Single Tap Water
 * Filter / One Tap Water Purifier", which is a keyword string, not a menu item.
 * Shortened to match the footer. The href is unchanged.
 *
 * Dropdowns are CSS only — hover on pointer devices, `focus-within` for the
 * keyboard, and on mobile the whole menu is a native <details> drawer with the
 * groups flattened into headed sections. No client component, no JS bundle.
 */
const CATEGORIES = [
  { href: "/kitchen-hood-in-malaysia/", label: "Kitchen Hood" },
  { href: "/cooker-hob-in-malaysia/", label: "Cooker Hob" },
  { href: "/combi-and-steam-oven-in-malaysia/", label: "Combi Oven" },
  { href: "/dishwasher-in-malaysia/", label: "Dishwasher" },
  { href: "/one-tap-purifier-in-malaysia/", label: "One Tap Water Purifier" },
];

const BLOG = [
  { href: "/category/buying-guide/", label: "Buying Guide" },
  { href: "/category/tips-tricks/", label: "Tips & Tricks" },
  { href: "/category/recipe/", label: "Recipe" },
];

const PAGES = [
  { href: "/about-us/", label: "About Us" },
  { href: "/contact-us/", label: "Contact Us" },
  { href: "/store-locations/", label: "Store Locations" },
  { href: "/vatti-ewarranty/", label: "eWarranty" },
];

const ITEM = "text-ink-muted transition-colors hover:text-ink";

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

function Dropdown({ label, items }: { label: string; items: typeof CATEGORIES }) {
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

function Section({ label, items }: { label: string; items: typeof CATEGORIES }) {
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

export function SiteHeader() {
  return (
    <header className="sticky top-0 z-[var(--z-sticky)] border-b border-line bg-void/92 backdrop-blur-sm">
      {/* gap-3 below sm: the wordmark, the ground selector and the menu button
          are all fixed-width, so on a 360px Android — common here — gap-6
          between the last two is what tips the row into overflowing. */}
      <div className="mx-auto flex max-w-6xl items-center gap-3 px-5 py-3.5 sm:gap-6 sm:px-8">
        <Link
          href="/"
          className="font-semibold tracking-[-0.02em] text-ink transition-colors hover:text-teal"
        >
          VATTI<span className="text-ink-muted"> Malaysia</span>
        </Link>

        <nav aria-label="Main" className="ml-auto hidden lg:block">
          <ul className="flex items-center gap-6 text-sm">
            <li>
              <Link href="/" className={ITEM}>
                Home
              </Link>
            </li>
            <Dropdown label="Categories" items={CATEGORIES} />
            {PAGES.map((p) => (
              <li key={p.href}>
                <Link href={p.href} className={ITEM}>
                  {p.label}
                </Link>
              </li>
            ))}
            <Dropdown label="Blog" items={BLOG} />
            <li>
              <a href={CATALOGUE} className={ITEM}>
                Catalog
              </a>
            </li>
          </ul>
        </nav>

        {/* Between the nav and the menu button in the DOM, which puts it on the
            right on both layouts: on desktop the nav already carries ml-auto,
            on mobile the nav is gone and the switch takes it. */}
        <ThemeToggle className="ml-auto lg:ml-0" />

        <details className="group lg:hidden">
          <summary className="flex cursor-pointer list-none items-center gap-2 rounded-sm border border-line-strong px-3.5 py-2 text-sm font-medium text-ink [&::-webkit-details-marker]:hidden">
            Menu
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
                <Link href="/" className="block py-1.5 text-ink">
                  Home
                </Link>
              </li>
              <Section label="Categories" items={CATEGORIES} />
              <Section label="Blog" items={BLOG} />
              <li className="pt-4 text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ink-muted">
                Company
              </li>
              {PAGES.map((p) => (
                <li key={p.href}>
                  <Link href={p.href} className="block py-1.5 pl-3 text-ink">
                    {p.label}
                  </Link>
                </li>
              ))}
              <li>
                <a href={CATALOGUE} className="block py-1.5 pl-3 text-ink">
                  Catalog
                </a>
              </li>
            </ul>
          </nav>
        </details>
      </div>
    </header>
  );
}
