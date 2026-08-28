import Link from "next/link";
import { FacebookLogo } from "@phosphor-icons/react/dist/ssr/FacebookLogo";
import { InstagramLogo } from "@phosphor-icons/react/dist/ssr/InstagramLogo";
import { YoutubeLogo } from "@phosphor-icons/react/dist/ssr/YoutubeLogo";

/** Phosphor has no Xiaohongshu/RedNote mark, so this stands in with the same
 *  rounded-square badge shape as the other filled logo glyphs it sits beside,
 *  the "R" punched out in the footer's own background color. */
function RedNoteLogo({ size = 20 }: { size?: number }) {
  return (
    <svg viewBox="0 0 256 256" width={size} height={size} aria-hidden="true">
      <rect x="20" y="20" width="216" height="216" rx="56" fill="currentColor" />
      <text
        x="128"
        y="132"
        textAnchor="middle"
        dominantBaseline="central"
        fontSize="140"
        fontWeight="700"
        fontFamily="Arial, Helvetica, sans-serif"
        style={{ fill: "var(--color-void)" }}
      >
        R
      </text>
    </svg>
  );
}

const SOCIALS = [
  { label: "Facebook", href: "https://www.facebook.com/vattimalaysia", Icon: FacebookLogo },
  { label: "Instagram", href: "https://www.instagram.com/vattimalaysia/", Icon: InstagramLogo },
  { label: "RedNote", href: "https://xhslink.cn/m/1slnUiXf40q", Icon: RedNoteLogo },
  { label: "YouTube", href: "https://www.youtube.com/@vattimalaysia8049", Icon: YoutubeLogo },
];

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
    /* pb clears the mobile sticky CTA bar, which every template except
       /vatti-ewarranty/ now carries. See CtaBar. */
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
            <ul className="mt-4 flex items-center gap-4">
              {SOCIALS.map(({ label, href, Icon }) => (
                <li key={label}>
                  <a
                    href={href}
                    target="_blank"
                    rel="noopener noreferrer"
                    aria-label={label}
                    className="block text-ink-muted transition-colors hover:text-teal"
                  >
                    <Icon size={20} weight="fill" />
                  </a>
                </li>
              ))}
            </ul>
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
