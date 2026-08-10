import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";

import { DealerMap } from "@/components/DealerMap";
import { EnquiryBuilder } from "@/components/EnquiryBuilder";
import { ProductShowcase } from "@/components/ProductShowcase";
import { Reveal } from "@/components/Reveal";
import { SiteHeader } from "@/components/SiteHeader";
import {
  getArticleTeasers,
  getArticlesByPath,
  getBestsellers,
  getCategoryCards,
  getProductCard,
  getRegions,
} from "@/lib/queries/home";

/**
 * The three award marks, keyed out of the Elementor section backgrounds on the
 * live site (2023/12/ball.webp, 2023/01/Untitled-design-15.png,
 * 2023/12/aaward.webp). Each was a logo sitting on a 6912x2880 grey plate; the
 * plate is desaturated and the marks are not, so a chroma-and-luminance key
 * lifts them onto transparency. Exported at 200px against a 56px render, which
 * covers 2x and 3x without carrying a quarter-megabyte PNG per mark. Intrinsic
 * sizes are the file sizes: next/image needs them, these are not static imports.
 */
const AWARD_MARKS = [
  { src: "/award-red-dot.png", alt: "Red Dot Design Award", width: 200, height: 200 },
  { src: "/award-if.png", alt: "iF Design Award", width: 200, height: 200 },
  { src: "/award-awe.png", alt: "AWE Award", width: 200, height: 176 },
];

const AWARDS = [
  {
    name: "Red Dot Design Award",
    year: "2017",
    body: "German international design prize awarded by Red Dot GmbH & Co. KG, won for product design.",
  },
  {
    name: "iF Design Award",
    year: "since 1954",
    body: "One of the longest-running design marks in the world, and a recurring one for VATTI product design.",
  },
  {
    name: "AWE Award",
    year: "China",
    body: "Presented by the China Household Electrical Appliances Association after market and customer testing.",
  },
];

/**
 * How much of the category grid each card takes. Kitchen hoods are the range
 * and the traffic, so that tile is the one that gets room; the dishwasher and
 * the purifier are one model each and get a half-row. Five cards, five cells,
 * no filler.
 */
const CATEGORY_SPAN: Record<string, string> = {
  "kitchen-hood-in-malaysia": "lg:col-span-4 lg:row-span-2",
  "cooker-hob-in-malaysia": "lg:col-span-2",
  "combi-and-steam-oven-in-malaysia": "lg:col-span-2",
  "dishwasher-in-malaysia": "lg:col-span-3",
  "one-tap-purifier-in-malaysia": "lg:col-span-3",
};

/**
 * One guide per major category, rather than the three most recent. Recency puts
 * both halves of the induction-vs-ceramic pair at the top and leaves hoods and
 * ovens unrepresented, which is the wrong shape for a front page.
 */
const GUIDE_PATHS = [
  "buying-guide/types-of-range-hoods",
  "buying-guide/glass-vs-stainless-gas-hob-which-gas-hob-are-best",
  "buying-guide/what-is-a-combi-oven",
];

/**
 * The hood in the hero bento, and the render that shows it.
 *
 * Supplied by the client rather than taken from the CDN, which is why it sits
 * in public/. The V929 images in the media library are all either bare units on
 * white or gallery slides with marketing copy burnt into the pixels; this one
 * is a clean in-kitchen shot. It is square, and the tile crops it to landscape
 * from the centre — the hood body and its lit panel sit in the middle band, so
 * the crop takes ceiling and worktop and leaves the product intact.
 *
 * Give this a NEW filename whenever the render changes. public/ assets are
 * served under a hash-less URL with a long max-age, and Next's image optimizer
 * caches by path, so replacing the bytes under the same name serves the old
 * picture to anyone who has seen the page (and to the build, locally).
 */
const HERO_PRODUCT = "vatti-aetheris-series-cooker-hood-v929";
const HERO_IMAGE = "/hero-v929-panel.webp";

/** Editorial, from the source homepage — there is no sales data in the DB. */
const BESTSELLER_SLUGS = [
  "vatti-magic-series-cooker-hood-v919",
  "vatti-magic-series-cooker-hob-c861g",
  "vatti-magic-series-combi-oven-va06",
  "built-in-combi-oven-va05",
];

// The legacy title and description are kept verbatim: this page earns the
// brand-term traffic and titles are a CTR surface. See PRODUCT.md.
export const metadata: Metadata = {
  title: { absolute: "Kitchen Appliances Supplier in Malaysia | VATTI" },
  description:
    "Explore the Best Kitchen Appliances Supplier in Malaysia: Combi Ovens, Cooker Hoods, Cooker Hobs & Built-In Ovens by VATTI. Enhance Your Cooking Now!",
  alternates: { canonical: "/" },
};

export default function HomePage() {
  const categories = getCategoryCards();
  const bestsellers = getBestsellers(BESTSELLER_SLUGS);
  const guides = getArticlesByPath(GUIDE_PATHS);
  const recipes = getArticleTeasers("recipe", 3);
  const regions = getRegions();

  const totalModels = categories.reduce((n, c) => n + c.model_count, 0);
  const dealers = regions.reduce((n, r) => n + r.count, 0);
  const hero = getProductCard(HERO_PRODUCT);

  return (
    <>
      <SiteHeader />

      <main id="main">
        {/* Hero — the kitchen the range was built for, pinned while the claims
            scroll over it. The backdrop is one sticky stage inside a tall
            section: the parallax is the sticky itself, so it costs no JS and
            holds up on a low-end phone. The drift on top of it is scroll-driven
            CSS and is pure enhancement. */}
        <section className="hero-scene relative isolate">
          <div className="absolute inset-0 -z-10">
            <div className="sticky top-0 h-[100dvh] overflow-hidden">
              <div className="hero-drift absolute inset-0">
                <Image
                  src="/hero-kitchen.png"
                  alt="A VATTI cooker hood drawing steam off a wok on a gas hob in an open-plan kitchen."
                  fill
                  priority
                  sizes="100vw"
                  // Portrait crops a 2:1 frame down to a narrow slice, and the
                  // centre of this one is empty cabinetry. Bias the crop right
                  // so the hood, the steam and the wok survive on a phone.
                  className="object-cover object-[68%_50%] lg:object-center"
                />
              </div>
              {/* On wide viewports the ramp is weighted left, where the copy
                  sits, and lifts off the right so the hood and the wok stay
                  lit — the photograph is the argument, and a flat knock-down
                  over the whole frame kills it. Portrait puts the copy across
                  the full width over the lit backsplash, so there the ramp has
                  nothing to ramp between and an even knock-down is honest.
                  The foot dissolves into void so the section below starts
                  without a seam. */}
              <div className="absolute inset-0 bg-void/60 lg:hidden" />
              <div className="absolute inset-0 hidden bg-gradient-to-r from-void/92 via-void/45 to-void/15 lg:block" />
              <div className="absolute inset-x-0 bottom-0 h-1/3 bg-gradient-to-t from-void to-transparent" />
            </div>
          </div>

          <div className="mx-auto flex min-h-[calc(100dvh-4.5rem)] max-w-6xl flex-col justify-center px-5 py-16 sm:px-8">
            {/* Not .readout: Martian Mono is for measured values, and a brand
                line is not one. See DESIGN.md § Typography. */}
            <p className="text-xs font-semibold uppercase tracking-[0.18em] text-teal">
              VATTI Malaysia · since 1992
            </p>
            <h1 className="mt-5 max-w-[26ch] text-balance text-[clamp(2.25rem,1.2rem+3.4vw,4rem)] font-semibold leading-[1.02] tracking-[-0.04em]">
              Kitchen appliances measured for wok heat.
            </h1>
            {/* Full ink, not ink-muted: contrast against a photograph cannot be
                pinned to a single ratio the way it can against --color-surface,
                so the hero subtext gives up the muted step and keeps the
                hierarchy in size and weight instead. */}
            <p className="mt-6 max-w-[46ch] text-lg leading-relaxed text-ink">
              Hoods, hobs, ovens, dishwashers and purifiers. {totalModels} models, serviced through{" "}
              {dealers} authorised dealers nationwide.
            </p>
            <div className="mt-9 flex flex-wrap gap-3">
              <Link
                href="#categories"
                className="rounded-sm bg-teal px-6 py-3 font-semibold text-void transition-opacity hover:opacity-90"
              >
                Browse the range
              </Link>
              <Link
                href="/store-locations/"
                className="glass rounded-sm px-6 py-3 font-medium text-ink transition-colors hover:text-teal"
              >
                Find a dealer
              </Link>
            </div>
          </div>

          {/* The claims, on glass, over the still-pinned kitchen. One bento
              block rather than a ladder of cards: spread down two viewports
              each card sat alone in a mostly empty frame, and the gaps between
              tiles show more of the photograph than the gaps between cards
              did. Panes are half-transparent, so the kitchen reads through
              them and the cluster stays part of the image rather than a slab
              parked on top of it. */}
          <div className="mx-auto max-w-6xl px-5 pb-[8vh] sm:px-8 sm:pb-[10vh]">
            <div className="grid gap-4 sm:grid-cols-2 sm:gap-5 lg:grid-cols-12">
              {/* The hood in a kitchen rather than on a white plate, reachable
                  in one tap. It takes the wide cell because the render is
                  landscape: a scene wants width, where the cut-out it replaced
                  wanted height. The photograph runs to the pane edges, so this
                  is the one tile with no padding. */}
              {hero && (
                <Reveal className="sm:col-span-2 lg:col-span-7">
                  <Link
                    href={`/${hero.slug}/`}
                    className="glass group flex h-full flex-col overflow-hidden rounded-sm"
                  >
                    <div className="relative aspect-[16/9] overflow-hidden">
                      <Image
                        src={HERO_IMAGE}
                        alt={`A VATTI ${hero.model_code} cooker hood mounted in a fitted kitchen, its control panel lit.`}
                        fill
                        sizes="(max-width: 1024px) 100vw, 640px"
                        className="object-cover transition-transform duration-500 ease-[var(--ease-out-expo)] group-hover:scale-[1.04]"
                      />
                      {/* The render is a bright showroom shot dropping straight
                          onto a dark caption bar. A short foot marries the two
                          rather than leaving a hard light-to-dark edge. */}
                      <div className="absolute inset-x-0 bottom-0 h-1/4 bg-gradient-to-t from-void/50 to-transparent" />
                    </div>
                    {/* Hairline matched to the pane edge, not to --color-line:
                        an opaque rule on a half-transparent panel reads as a
                        seam in the glass. */}
                    <div className="border-t border-glass-edge p-5">
                      <p className="readout text-xs text-teal">{hero.model_code}</p>
                      <p className="mt-1 font-medium leading-snug transition-colors group-hover:text-teal">
                        {hero.name}
                      </p>
                    </div>
                  </Link>
                </Reveal>
              )}

              {/* This pane is as tall as the photograph beside it, which is
                  taller than the sentence needs. Centring the text left dead
                  space above and below and read as a mistake; anchoring the
                  claim to the top and the credential to the bottom turns the
                  same gap into structure, and lets the headline run at display
                  size instead of card size. */}
              <Reveal delay={80} className="lg:col-span-5">
                <div className="glass flex h-full flex-col rounded-sm p-6 sm:p-8">
                  <h2 className="text-3xl font-semibold tracking-[-0.03em] sm:text-4xl">
                    Built for how we cook here
                  </h2>
                  <p className="mt-5 text-lg leading-relaxed text-ink-muted">
                    High heat and heavy oil are hard on a kitchen. These are hoods, hobs and ovens
                    designed around that, not adapted to it afterwards.
                  </p>
                  {/* my-auto on the marks, not mt-auto on the line below: the
                      slack then splits above and below the logos, which puts
                      them in the middle of the pane and drops the credential
                      onto the bottom edge. Marks only, no captions — the alt
                      text names each award for anyone who cannot see them. */}
                  <ul className="my-auto flex flex-wrap items-center gap-x-6 gap-y-4 py-6">
                    {AWARD_MARKS.map((a) => (
                      <li key={a.src}>
                        <Image
                          src={a.src}
                          alt={a.alt}
                          width={a.width}
                          height={a.height}
                          className="h-12 w-auto sm:h-14"
                        />
                      </li>
                    ))}
                  </ul>
                  <p className="border-t border-glass-edge pt-5 text-sm leading-relaxed text-ink-muted">
                    Building premium kitchen appliances since 1992.
                  </p>
                </div>
              </Reveal>

              {/* Both stat tiles run figure, unit, hairline, supporting line.
                  Pushing the supporting line to the bottom with mt-auto opened
                  a hole in the middle of the shorter one, since the row is
                  height-matched to its taller neighbour. */}
              <Reveal delay={160} className="lg:col-span-5">
                <div className="glass h-full rounded-sm p-6 sm:p-8">
                  <p className="readout text-4xl font-semibold leading-none text-teal">
                    {totalModels}
                  </p>
                  <p className="mt-3 text-sm text-ink-muted">
                    models across {categories.length} categories
                  </p>
                  <p className="mt-5 border-t border-glass-edge pt-5 leading-relaxed">
                    {categories.map((c) => c.name).join(", ")}.
                  </p>
                </div>
              </Reveal>

              <Reveal delay={240} className="sm:col-span-2 lg:col-span-7">
                <div className="glass h-full rounded-sm p-6 sm:p-8">
                  <p className="readout text-4xl font-semibold leading-none text-teal">{dealers}</p>
                  <p className="mt-3 text-sm text-ink-muted">
                    authorised dealers across {regions.length} regions
                  </p>
                  <div className="mt-5 border-t border-glass-edge pt-5">
                    <p className="leading-relaxed">
                      Sold, installed and serviced locally, from the Klang Valley to Sabah and
                      Sarawak.
                    </p>
                    <Link
                      href="/store-locations/"
                      className="mt-4 inline-block text-teal transition-opacity hover:opacity-80"
                    >
                      Find a dealer →
                    </Link>
                  </div>
                </div>
              </Reveal>
            </div>
          </div>
        </section>

        {/* What we make. The first thing after the hero, because "which of
            these do I need" is the question every visitor arrives with. Sized
            by how much range sits behind each one. */}
        <section
          id="categories"
          aria-labelledby="categories-heading"
          className="mx-auto max-w-6xl scroll-mt-20 px-5 py-16 sm:px-8 sm:py-24"
        >
          <h2
            id="categories-heading"
            className="max-w-[20ch] text-3xl font-semibold tracking-[-0.03em] sm:text-4xl"
          >
            Everything that goes in the kitchen
          </h2>

          <ul className="mt-10 grid gap-4 sm:grid-cols-2 lg:grid-cols-6 lg:gap-5">
            {categories.map((c) => {
              const feature = CATEGORY_SPAN[c.slug]?.includes("row-span-2");
              return (
                <li
                  key={c.slug}
                  className={`${CATEGORY_SPAN[c.slug] ?? "lg:col-span-2"} sm:col-span-2 lg:col-auto`}
                >
                  <Link
                    href={`/${c.slug}/`}
                    className="group flex h-full flex-col overflow-hidden rounded-sm border border-line bg-surface transition-colors hover:border-line-strong"
                  >
                    {/* Pure white, and deliberately not --color-paper: four of
                        the five catalogue shots are opaque #ffffff studio
                        plates and one is transparent, so the well has to BE
                        that white or every product sits in a visible box. This
                        is photography continuing, not a surface colour, which
                        is why the off-white rule in DESIGN.md does not apply. */}
                    {c.url && (
                      <div
                        className={`relative overflow-hidden bg-white ${
                          feature ? "aspect-[16/10]" : "aspect-[3/2]"
                        }`}
                      >
                        <Image
                          src={c.url}
                          alt={c.alt ?? ""}
                          fill
                          sizes={
                            feature
                              ? "(max-width: 1024px) 100vw, 700px"
                              : "(max-width: 1024px) 100vw, 380px"
                          }
                          className={`object-contain transition-transform duration-500 ease-[var(--ease-out-expo)] group-hover:scale-[1.04] ${
                            feature ? "p-8" : "p-4"
                          }`}
                        />
                      </div>
                    )}
                    <div className="flex flex-1 flex-col p-5 sm:p-6">
                      <div className="flex items-baseline justify-between gap-4">
                        <h3
                          className={`font-semibold tracking-[-0.025em] transition-colors group-hover:text-teal ${
                            feature ? "text-2xl sm:text-3xl" : "text-xl"
                          }`}
                        >
                          {c.name}
                        </h3>
                        <span className="readout shrink-0 text-xs text-ink-muted">
                          {c.model_count} {c.model_count === 1 ? "model" : "models"}
                        </span>
                      </div>
                      {feature && c.intro && (
                        <p className="mt-3 max-w-[52ch] leading-relaxed text-ink-muted">
                          {c.intro}
                        </p>
                      )}
                    </div>
                  </Link>
                </li>
              );
            })}
          </ul>
        </section>

        {/* Enquiry. The questionnaire writes a WhatsApp message rather than
            posting anywhere: site.ts records that this site has no forms, and
            WhatsApp is the line the service team actually answers. Asking the
            eight questions up front is what turns "hi, price?" into a
            conversation someone can answer in one reply. */}
        <section aria-labelledby="contact-heading" className="border-t border-line bg-surface">
          <div className="mx-auto max-w-6xl px-5 py-16 sm:px-8 sm:py-24">
            <div className="max-w-[52ch]">
              <h2
                id="contact-heading"
                className="text-3xl font-semibold tracking-[-0.03em] sm:text-4xl"
              >
                Tell us about your kitchen
              </h2>
              <p className="mt-4 text-lg leading-relaxed text-ink-muted">
                Answer what you can. We will point you at the right model and the dealer who stocks
                it, usually the same day.
              </p>
            </div>

            <div className="mt-10">
              <EnquiryBuilder categories={categories} regions={regions} />
            </div>

            <dl className="mt-14 grid gap-px bg-line sm:grid-cols-3">
              <div className="bg-surface py-5 sm:pr-6">
                <dt className="text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ink-muted">
                  Phone
                </dt>
                <dd className="mt-2">
                  <a
                    href="tel:+60123366082"
                    className="readout text-lg text-teal transition-opacity hover:opacity-80"
                  >
                    012-3366082
                  </a>
                </dd>
              </div>
              <div className="bg-surface py-5 sm:px-6">
                <dt className="text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ink-muted">
                  Open
                </dt>
                <dd className="readout mt-2 text-lg">10am - 8pm daily</dd>
              </div>
              <div className="bg-surface py-5 sm:pl-6">
                <dt className="text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ink-muted">
                  Showroom
                </dt>
                <dd className="mt-2 leading-relaxed text-ink-muted">
                  Atria Shopping Gallery, Damansara Jaya, Petaling Jaya
                </dd>
              </div>
            </dl>
          </div>
        </section>

        {/* Bestsellers. Was a scroll-snap shelf, which always cut the fourth
            card in half; on a trackpad, with no scrollbar showing, that reads
            as a layout fault rather than an invitation to scroll. A tab list
            names all four and hides none. */}
        {bestsellers.length > 0 && (
          <section
            aria-labelledby="bestsellers-heading"
            className="mx-auto max-w-6xl px-5 py-16 sm:px-8 sm:py-24"
          >
            <div className="flex flex-wrap items-end justify-between gap-4">
              <h2
                id="bestsellers-heading"
                className="text-3xl font-semibold tracking-[-0.03em] sm:text-4xl"
              >
                The ones people buy
              </h2>
              <Link href="#categories" className="text-teal transition-opacity hover:opacity-80">
                All categories →
              </Link>
            </div>

            <div className="mt-10">
              <ProductShowcase products={bestsellers} />
            </div>
          </section>
        )}

        {/* Trust. Two of the three awards below are the reason a showroom
            visitor takes the brand seriously, so they get names and dates
            rather than a logo strip.

            A hairline, not a surface change: moving the questionnaire up the
            page left this section and the showcase above it both on void, and
            without a seam the two read as one very long band. */}
        <section
          aria-labelledby="about-heading"
          className="mx-auto max-w-6xl border-t border-line px-5 py-16 sm:px-8 sm:py-24"
        >
          <div className="grid gap-10 lg:grid-cols-[minmax(0,1fr)_minmax(0,1.4fr)] lg:gap-16">
            <div>
              <h2
                id="about-heading"
                className="text-3xl font-semibold tracking-[-0.03em] sm:text-4xl"
              >
                Thirty-odd years of kitchens
              </h2>
              <p className="mt-5 max-w-[52ch] leading-relaxed text-ink-muted">
                VATTI has built premium kitchen appliances since 1992, growing from a locally listed
                company into a manufacturer sold worldwide. In Malaysia we supply the Klang Valley,
                Northern, Southern and East Coast regions, plus Sabah and Sarawak.
              </p>
              <Link
                href="/about-us/"
                className="mt-6 inline-block text-teal transition-opacity hover:opacity-80"
              >
                About VATTI Malaysia →
              </Link>
            </div>

            <dl className="grid gap-px self-start bg-line sm:grid-cols-3">
              {AWARDS.map((a) => (
                <div key={a.name} className="bg-void p-5">
                  <dt className="font-semibold leading-snug">{a.name}</dt>
                  <dd className="readout mt-1 text-xs text-teal">{a.year}</dd>
                  <dd className="mt-3 text-sm leading-relaxed text-ink-muted">{a.body}</dd>
                </div>
              ))}
            </dl>
          </div>
        </section>

        {/* 105 posts existed with no route in from the front page. Guides on
            the left because they precede a purchase, recipes on the right
            because they follow one. */}
        <section
          aria-labelledby="reading-heading"
          className="border-y border-line bg-surface"
        >
          <div className="mx-auto max-w-6xl px-5 py-16 sm:px-8 sm:py-24">
            <h2
              id="reading-heading"
              className="text-3xl font-semibold tracking-[-0.03em] sm:text-4xl"
            >
              Work out what you need
            </h2>

            <div className="mt-10 grid gap-12 lg:grid-cols-2 lg:gap-16">
              {[
                {
                  title: "Before you buy",
                  href: "/category/buying-guide/",
                  more: "All buying guides",
                  items: guides,
                },
                {
                  title: "Once it is installed",
                  href: "/category/recipe/",
                  more: "All recipes",
                  items: recipes,
                },
              ].map((col) => (
                <div key={col.title}>
                  <h3 className="text-lg font-semibold tracking-[-0.02em] text-ink-muted">
                    {col.title}
                  </h3>
                  <ul className="mt-4">
                    {col.items.map((a) => (
                      <li key={a.path}>
                        <Link
                          href={`/${a.path}/`}
                          className="group flex items-center gap-4 border-b border-line py-4 first:border-t"
                        >
                          {a.url && (
                            <span className="relative size-16 shrink-0 overflow-hidden rounded-sm bg-raised">
                              <Image
                                src={a.url}
                                alt=""
                                fill
                                sizes="64px"
                                className="object-cover"
                              />
                            </span>
                          )}
                          <span className="flex-1 leading-snug transition-colors group-hover:text-teal">
                            {a.title}
                          </span>
                          {a.reading_minutes && (
                            <span className="readout shrink-0 text-xs text-ink-muted">
                              {a.reading_minutes} min
                            </span>
                          )}
                        </Link>
                      </li>
                    ))}
                  </ul>
                  <Link
                    href={col.href}
                    className="mt-5 inline-block text-teal transition-opacity hover:opacity-80"
                  >
                    {col.more} →
                  </Link>
                </div>
              ))}
            </div>
          </div>
        </section>

        {/* Where to buy. Nobody orders a hood online — they go and look at one,
            and then somebody has to come and fit it.

            The only centred section on the page, and it is centred on purpose:
            the dealer network is the one claim that belongs to all five
            regions equally, and a left-aligned column would leave two thirds
            of the band empty. The obvious filler for that space would be a
            showroom photograph, but all 76 stored dealer photos are
            multi-brand storefronts carrying Bosch, Smeg and Teka signage. */}
        <section
          aria-labelledby="dealers-heading"
          className="mx-auto max-w-6xl px-5 py-16 text-center sm:px-8 sm:py-24"
        >
          <h2
            id="dealers-heading"
            className="mx-auto max-w-[16ch] text-3xl font-semibold tracking-[-0.03em] sm:text-4xl"
          >
            See it before you buy it
          </h2>
          <p className="mx-auto mt-5 max-w-[54ch] leading-relaxed text-ink-muted">
            Every model is sold, installed and serviced through an authorised dealer. Find the
            nearest showroom, see it running, and buy from someone who can come back and service it.
          </p>

          {/* The map carries the same five numbers, on the country they
              describe. It needs width to be readable: five labelled markers in
              a 350px frame collide, so below sm the counts stay a plain grid
              and the map does not render at all rather than rendering badly. */}
          <div className="mt-12 hidden border-y border-line py-10 text-left sm:block">
            <DealerMap regions={regions} />
          </div>

          <ul className="mt-12 grid grid-cols-2 gap-x-6 gap-y-8 border-y border-line py-8 text-left sm:hidden">
            {regions.map((r) => (
              <li key={r.slug}>
                <Link href={`/store-locations/#${r.slug}`} className="group block">
                  <p className="readout text-3xl font-semibold text-teal">{r.count}</p>
                  <p className="mt-2 text-sm text-ink-muted transition-colors group-hover:text-ink">
                    {r.region}
                  </p>
                </Link>
              </li>
            ))}
          </ul>

          <Link
            href="/store-locations/"
            className="mt-12 inline-block rounded-sm bg-teal px-6 py-3 font-semibold text-void transition-opacity hover:opacity-90"
          >
            Find a dealer
          </Link>
        </section>

      </main>
    </>
  );
}
