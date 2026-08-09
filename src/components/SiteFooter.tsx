import Link from "next/link";

const COLUMNS = [
  {
    heading: "Products",
    links: [
      { label: "Kitchen Hood", href: "/kitchen-hood-in-malaysia/" },
      { label: "Cooker Hob", href: "/cooker-hob-in-malaysia/" },
      { label: "Combi & Steam Oven", href: "/combi-and-steam-oven-in-malaysia/" },
      { label: "Dishwasher", href: "/dishwasher-in-malaysia/" },
      { label: "One Tap Water Purifier", href: "/one-tap-purifier-in-malaysia/" },
    ],
  },
  {
    heading: "Company",
    links: [
      { label: "About us", href: "/about-us/" },
      { label: "Contact us", href: "/contact-us/" },
      { label: "Store locations", href: "/store-locations/" },
      { label: "eWarranty", href: "/vatti-ewarranty/" },
    ],
  },
  {
    heading: "Guides",
    links: [
      { label: "Buying Guide", href: "/category/buying-guide/" },
      { label: "Tips & Tricks", href: "/category/tips-tricks/" },
      { label: "Recipe", href: "/category/recipe/" },
    ],
  },
];

export function SiteFooter() {
  return (
    /* pb clears the product page's mobile sticky CTA bar. */
    <footer className="border-t border-line bg-void">
      <div className="mx-auto max-w-6xl px-5 pb-28 pt-14 sm:px-8 sm:pt-20 lg:pb-14">
        <div className="grid gap-10 sm:grid-cols-2 lg:grid-cols-[minmax(0,1.3fr)_repeat(3,minmax(0,1fr))]">
          <div>
            <p className="font-semibold tracking-[-0.02em]">
              VATTI<span className="text-ink-muted"> Malaysia</span>
            </p>
            <address className="mt-4 not-italic leading-relaxed text-ink-muted">
              Atria Shopping Gallery, Unit 17, 1,
              <br />
              Damansara Jaya, 47400 Petaling Jaya,
              <br />
              Selangor, Malaysia
            </address>
            <p className="mt-4">
              <a
                href="tel:+60123366082"
                className="readout text-teal transition-opacity hover:opacity-80"
              >
                012-3366082
              </a>
            </p>
            <p className="mt-1 text-sm text-ink-muted">Open daily, 10am - 8pm</p>
            <p className="mt-4">
              <a
                href="https://www.facebook.com/vattimalaysia/"
                className="text-sm text-ink-muted transition-colors hover:text-ink"
              >
                Facebook
              </a>
            </p>
          </div>

          {COLUMNS.map((col) => (
            <nav key={col.heading} aria-labelledby={`footer-${col.heading}`}>
              <h2
                id={`footer-${col.heading}`}
                className="text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ink-muted"
              >
                {col.heading}
              </h2>
              <ul className="mt-4 flex flex-col gap-2.5 text-sm">
                {col.links.map((l) => (
                  <li key={l.href}>
                    <Link href={l.href} className="transition-colors hover:text-teal">
                      {l.label}
                    </Link>
                  </li>
                ))}
              </ul>
            </nav>
          ))}
        </div>

        <p className="mt-14 border-t border-line pt-6 text-sm text-ink-muted">
          © {new Date().getFullYear()} VATTI Malaysia. Kitchen hoods, hobs, built-in ovens,
          dishwashers and water purifiers.
        </p>
      </div>
    </footer>
  );
}
