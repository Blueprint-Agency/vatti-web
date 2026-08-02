import Link from "next/link";

const CATEGORIES = [
  { slug: "kitchen-hood-in-malaysia", name: "Kitchen Hood" },
  { slug: "cooker-hob-in-malaysia", name: "Cooker Hob" },
  { slug: "combi-and-steam-oven-in-malaysia", name: "Oven" },
  { slug: "dishwasher-in-malaysia", name: "Dishwasher" },
  { slug: "one-tap-purifier-in-malaysia", name: "Water Purifier" },
];

export function SiteHeader() {
  return (
    <header className="sticky top-0 z-[var(--z-sticky)] border-b border-line bg-void/92 backdrop-blur-sm">
      <div className="mx-auto flex max-w-6xl items-center gap-6 px-5 py-3.5 sm:px-8">
        <Link
          href="/"
          className="font-semibold tracking-[-0.02em] text-ink transition-colors hover:text-teal"
        >
          VATTI<span className="text-ink-muted"> Malaysia</span>
        </Link>

        <nav aria-label="Product categories" className="ml-auto hidden lg:block">
          <ul className="flex items-center gap-6 text-sm">
            {CATEGORIES.map((c) => (
              <li key={c.slug}>
                <Link
                  href={`/${c.slug}/`}
                  className="text-ink-muted transition-colors hover:text-ink"
                >
                  {c.name}
                </Link>
              </li>
            ))}
          </ul>
        </nav>

        <Link
          href="/store-locations/"
          className="ml-auto shrink-0 rounded-sm border border-line-strong px-3.5 py-2 text-sm font-medium text-ink transition-colors hover:border-teal hover:text-teal lg:ml-0"
        >
          Find a dealer
        </Link>
      </div>
    </header>
  );
}
