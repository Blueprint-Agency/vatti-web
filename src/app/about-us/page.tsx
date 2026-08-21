import { Compass } from "@phosphor-icons/react/dist/ssr/Compass";
import { Hammer } from "@phosphor-icons/react/dist/ssr/Hammer";
import { Handshake } from "@phosphor-icons/react/dist/ssr/Handshake";
import { UserFocus } from "@phosphor-icons/react/dist/ssr/UserFocus";
import { UsersFour } from "@phosphor-icons/react/dist/ssr/UsersFour";
import type { Metadata } from "next";
import Image from "next/image";
import Link from "next/link";
import type { CSSProperties } from "react";

import { Reveal } from "@/components/Reveal";
import { SiteHeader } from "@/components/SiteHeader";
import { getCategory } from "@/lib/queries/category";
import { getCategoryCards, getRegions } from "@/lib/queries/home";
import { CtaBar } from "@/components/CtaBar";
import { WHATSAPP } from "@/lib/site";

// Title and description kept verbatim from the live page — it earns 218 clicks
// and titles are a CTR surface. See research/utility-pages.json.
export const metadata: Metadata = {
  title: { absolute: "About Us | Best Kitchen Appliance Distributor | VATTI Malaysia" },
  description:
    "VATTI, a global-listed corporation in kitchen appliances. We distribute high-quality kitchen appliances worldwide, anytime, anywhere.",
  alternates: { canonical: "/about-us/" },
};

/**
 * The two photographs this page stands on, named by the category that owns
 * them rather than by their bucket key. Page pictures are data (CLAUDE.md
 * § Images), so nothing here is a URL: the slug is the editorial choice and
 * the file, its alt text and its crop anchor all come out of the database.
 *
 * The hood carries the page because it is the range and the traffic; the hob
 * scene sits beside the corporate copy because it is the one photograph of an
 * appliance at rest rather than working, which is the right temperature for a
 * paragraph about patents.
 */
const BANNER_CATEGORY = "kitchen-hood-in-malaysia";
const STORY_CATEGORY = "cooker-hob-in-malaysia";

/**
 * The five core values, as the source site states them.
 *
 * The NAMES are the client's and are verbatim. The bodies are NOT: the source
 * page publishes five headings and nothing under them, so every sentence here
 * is drafted and needs the owner's sign-off before it can be called their
 * charter. Each one glosses the value it sits under and claims nothing about
 * how the company operates, which is the only honest thing to write without
 * being told.
 *
 * Marks are Phosphor at light weight in --ink-muted, the same treatment the
 * category reason cells give theirs. Deliberately not teal and deliberately
 * still: teal on this site means a measured value, and the reason marks move
 * only because each one's motion is a second reading of its label. A value has
 * no motion of its own, and a mark that moved decoratively would be worse than
 * one that did not.
 */
const VALUES = [
  {
    name: "Customer First",
    body: "Every decision starts with the person who will cook on it, not with what is cheapest to build.",
    Icon: UserFocus,
  },
  {
    name: "Enterprising Spirit",
    body: "Willing to build something before the market asks for it, and to carry the risk of being early.",
    Icon: Compass,
  },
  {
    name: "Mutual Sharing & Win-win Corporation",
    body: "Dealers, suppliers and staff do better when the company does. None of it is meant to work one way.",
    Icon: Handshake,
  },
  {
    name: "Efficient Collaboration",
    body: "Work handed over cleanly, so less time goes on restating what somebody in the room already knew.",
    Icon: UsersFour,
  },
  {
    name: "Craftsman Spirit",
    body: "A finish worth running a hand over, and the same care given to the parts nobody sees.",
    Icon: Hammer,
  },
];

/**
 * Five cards, five cells, no filler. Three across then two, so the row that
 * holds fewer cards holds wider ones rather than leaving a hole at the end of
 * the grid. At tablet width the last card takes the full row for the same
 * reason. Literal strings, because Tailwind reads source for class names and
 * would never see one that was assembled.
 */
const VALUE_SPAN = [
  "lg:col-span-2",
  "lg:col-span-2",
  "lg:col-span-2",
  "lg:col-span-3",
  "sm:col-span-2 lg:col-span-3",
];

const MISSION = [
  "We, VATTI, hope to bring the best products into the kitchen of every family and give cooks the best product experience.",
  "We have high requirements on the quality of each VATTI product. It is our responsibility to bring the best products to consumers.",
  "Our development team is constantly developing products with the latest technology, and strives to create good looking, user friendly and clean products.",
  "Create the safest and most comfortable kitchen for consumers.",
];

// The source page renders these as three certificate JPEGs with no alt text.
// Named in markup instead — an image of a certificate is not a certificate.
const CERTIFICATIONS = [
  "Occupational Health & Safety Management System certification",
  "Quality Management System certification",
  "VATTI Malaysia sole distributorship certificate",
];

export default function AboutPage() {
  const categories = getCategoryCards();
  const banner = getCategory(BANNER_CATEGORY);
  const story = getCategory(STORY_CATEGORY);

  const models = categories.reduce((n, c) => n + c.model_count, 0);
  const regions = getRegions();
  const dealers = regions.reduce((n, r) => n + r.count, 0);

  return (
    <>
      <SiteHeader />

      <main id="main">
        {/* The banner. Same composition as a category hero and deliberately so:
            a photograph of the range working, the copy set over it on three
            planes, and the whole thing full-bleed so the picture reads as the
            ground the page stands on rather than a panel parked at the top.

            3.375rem is the sticky header — py-3.5 either side of a 1.5rem line
            plus its bottom border. Subtracting it puts the bottom edge of this
            section exactly on the fold. Keep the two in step if SiteHeader's
            padding moves.

            The drift and the parallax are scroll-driven CSS on the --hero
            view-timeline (globals.css § .hero-scene). No listener, nothing to
            hydrate, and a browser without animation-timeline gets the still
            frame, which is the composition anyway. .category-hero-drift-deep is
            the variant tuned for a viewport-tall banner at the top of a
            document; the shallow one is calibrated for a band and disappears
            at this height. */}
        <section className="hero-scene relative isolate flex min-h-[calc(100dvh-3.375rem)] flex-col">
          {banner?.hero_image_url && (
            <div aria-hidden className="absolute inset-0 -z-10 overflow-hidden">
              <div className="category-hero-drift-deep absolute inset-0">
                <Image
                  src={banner.hero_image_url}
                  alt=""
                  fill
                  priority
                  // Overscanned by the drift's 1.45 scale, so the frame is
                  // painted larger than the viewport it sits in. 100vw would
                  // hand the optimizer a candidate it then has to stretch.
                  sizes="150vw"
                  className="object-cover opacity-50"
                />
              </div>
              {/* The wash sits outside the drift on purpose: it is a contrast
                  floor, not scenery. Moving it with the photograph would drift
                  the type in and out of its own knock-down. */}
              <div className="absolute inset-0 bg-void/45" />
            </div>
          )}

          <div className="relative mx-auto flex w-full max-w-6xl flex-1 flex-col px-5 pb-12 pt-8 sm:px-8 sm:pb-16 sm:pt-12">
            <nav aria-label="Breadcrumb" className="mb-8 text-sm">
              <ol className="flex flex-wrap items-center gap-2 text-ink-muted">
                <li>
                  <Link href="/" className="transition-colors hover:text-ink">
                    Home
                  </Link>
                </li>
                <li aria-hidden="true">/</li>
                <li className="text-ink">About Us</li>
              </ol>
            </nav>

            {/* my-auto rather than a centred flex parent: the breadcrumb stays
                at the top of the section where it belongs and the copy centres
                in whatever height is left under it. */}
            <div className="my-auto text-center">
              {/* Descending --depth, so the headline travels furthest and the
                  buttons least. The block layers against the backdrop instead
                  of sliding as one slab. */}
              {/* No measure cap, and the clamp floor comes down to 2rem. Three
                  words fit on one line at every width above a small phone, and
                  the only break available to them is "About VATTI / Malaysia",
                  which cuts the entity name in half. Better to let the type
                  shrink than to author that break in. */}
              <h1
                style={{ "--depth": 1.15 } as CSSProperties}
                className="hero-parallax text-balance text-[clamp(2rem,1.1rem+4vw,4.5rem)] font-semibold leading-[1.02] tracking-[-0.04em]"
              >
                About VATTI Malaysia
              </h1>
              {/* Full ink, not ink-muted: contrast against a photograph cannot
                  be pinned to a ratio the way it can against --color-surface,
                  so the subtext keeps the muted step in size, not in colour. */}
              <p
                style={{ "--depth": 0.85 } as CSSProperties}
                className="hero-parallax mx-auto mt-6 max-w-[52ch] text-lg leading-relaxed text-ink"
              >
                Premium kitchen appliances since 1992, sold and serviced across Malaysia through{" "}
                {dealers} authorised dealers.
              </p>
              <div
                style={{ "--depth": 0.6 } as CSSProperties}
                className="hero-parallax mt-9 flex flex-wrap justify-center gap-3"
              >
                <a
                  href={WHATSAPP}
                  className="rounded-sm bg-teal px-6 py-3 font-semibold text-void transition-opacity hover:opacity-90"
                >
                  WhatsApp us
                </a>
                {/* Glass rather than a hairline border, as on the home page
                    hero: an opaque outline over a photograph reads as a sticker,
                    and the pane carries its own verified contrast floor. */}
                <Link
                  href="/store-locations/"
                  className="glass rounded-sm px-6 py-3 font-medium text-ink transition-colors hover:text-teal"
                >
                  Find a dealer
                </Link>
              </div>
            </div>
          </div>
        </section>

        {/* The company in four figures. Two are fixed facts with a date on
            them, two are counted out of the database so a new model or a new
            dealer cannot date the page.

            Same band as the category range summary: it lags the scroll and the
            figures themselves carry no entrance. A number that assembles itself
            on approach reads as a page that has not finished loading.

            overflow-hidden clips the drifting grid at the band edge. Safe here
            because this section holds one dl and nothing sticky — an
            overflow-hidden ancestor silently kills position:sticky below it. */}
        <section
          aria-label="VATTI in figures"
          className="readout-band overflow-hidden border-y border-line bg-surface"
        >
          <dl className="readout-drift mx-auto grid max-w-6xl grid-cols-2 gap-px bg-line md:grid-cols-4">
            {[
              { label: "Founded", value: "1992", note: "in Zhongshan, Guangdong" },
              { label: "Valid patents", value: "838", note: "as of 10 May 2018" },
              {
                label: "Models",
                value: String(models),
                note: `across ${categories.length} categories`,
              },
              {
                label: "Authorised dealers",
                value: String(dealers),
                note: `in ${regions.length} regions`,
              },
            ].map((f) => (
              <div key={f.label} className="bg-surface px-5 py-6 sm:px-7 sm:py-8">
                <dt className="text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ink-muted">
                  {f.label}
                </dt>
                <dd className="mt-2">
                  <span className="readout text-3xl font-semibold leading-none text-teal sm:text-4xl">
                    {f.value}
                  </span>
                </dd>
                <dd className="mt-3 text-xs text-ink-muted">{f.note}</dd>
              </div>
            ))}
          </dl>
        </section>

        {/* Who the company is, beside a photograph of what it makes. The 838
            is stated above as a figure and argued here as prose, which is the
            division the rest of the site makes: the band carries the number,
            the paragraph carries what the number is worth. */}
        <section
          aria-labelledby="innovation-heading"
          className="mx-auto max-w-6xl px-5 py-16 sm:px-8 sm:py-24"
        >
          <div className="grid gap-10 lg:grid-cols-[minmax(0,1.1fr)_minmax(0,1fr)] lg:items-center lg:gap-16">
            <div>
              <h2
                id="innovation-heading"
                className="max-w-[18ch] text-3xl font-semibold tracking-[-0.03em] sm:text-4xl"
              >
                VATTI product innovation
              </h2>
              <p className="mt-6 max-w-[62ch] leading-relaxed text-ink-muted">
                Since 1992, VATTI has pioneered the industry of premium kitchen appliances, keeping
                innovation as a corporate strategy. It has grown from a locally listed company to a
                world-class corporation, and distributes its appliances anywhere, at any time.
              </p>
              <p className="mt-4 max-w-[62ch] leading-relaxed text-ink-muted">
                The VATTI Group adheres to innovation and has been authorised to make 838 valid
                patents. The number is among the highest in the industry, and has won two honours:
                the National Industrial Design Center and the Nationally Recognized Enterprise
                Technology Center.
              </p>
            </div>

            {/* Still, not drifting. The banner above and the band below both
                move; a third moving thing in the same screenful stops reading
                as depth and starts reading as a page that will not settle. */}
            {story?.signature_image_url && (
              <div className="relative aspect-[4/3] overflow-hidden rounded-sm bg-surface lg:aspect-[4/5]">
                <Image
                  src={story.signature_image_url}
                  alt={story.signature_image_alt ?? ""}
                  fill
                  sizes="(max-width: 1024px) 100vw, 520px"
                  // The crop anchor belongs to the photograph, so it comes from
                  // the category row alongside it. An inline style, not an
                  // arbitrary class: Tailwind scans source for literals and
                  // would never see a value arriving from the database.
                  style={{ objectPosition: story.signature_image_focus ?? undefined }}
                  className="object-cover"
                />
              </div>
            )}
          </div>
        </section>

        {/* What the distributorship actually covers. Five categories, five
            cells, each fronted by the product shot the database already holds
            for it — the same picture the home page and the category pages lead
            with, so a visitor who has seen one recognises the other. */}
        <section aria-labelledby="range-heading" className="border-y border-line bg-surface">
          <div className="mx-auto max-w-6xl px-5 py-16 sm:px-8 sm:py-24">
            <div className="flex flex-wrap items-end justify-between gap-4">
              <div>
                <h2
                  id="range-heading"
                  className="max-w-[20ch] text-3xl font-semibold tracking-[-0.03em] sm:text-4xl"
                >
                  What we distribute in Malaysia
                </h2>
                <p className="mt-5 max-w-[56ch] leading-relaxed text-ink-muted">
                  Hoods, hobs, ovens, dishwashers and water purifiers, built for the heat and the
                  oil of a Malaysian kitchen.
                </p>
              </div>
              <Link href="/#categories" className="text-teal transition-opacity hover:opacity-80">
                See the full range →
              </Link>
            </div>

            <ul className="mt-10 grid gap-4 sm:grid-cols-2 lg:grid-cols-5">
              {categories.map((c, i) => (
                <li key={c.slug}>
                  <Reveal delay={i * 70} className="h-full">
                    <Link
                      href={`/${c.slug}/`}
                      className="group flex h-full flex-col overflow-hidden rounded-sm border border-line transition-colors hover:border-line-strong"
                    >
                      {/* Pure white, deliberately not --color-paper: four of
                          the five catalogue shots are opaque #ffffff studio
                          plates, so the well has to BE that white or every
                          product sits in a visible box. Photography
                          continuing, not a surface colour. */}
                      {c.url && (
                        <div className="relative aspect-square overflow-hidden bg-white">
                          <Image
                            src={c.url}
                            alt={c.alt ?? ""}
                            fill
                            sizes="(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 220px"
                            className="object-contain p-5 transition-transform duration-500 ease-[var(--ease-out-expo)] group-hover:scale-[1.04]"
                          />
                        </div>
                      )}
                      <div className="flex flex-1 flex-col justify-between gap-2 p-4">
                        <h3 className="font-semibold leading-snug tracking-[-0.02em] transition-colors group-hover:text-teal">
                          {c.name}
                        </h3>
                        <span className="readout text-xs text-ink-muted">
                          {c.model_count} {c.model_count === 1 ? "model" : "models"}
                        </span>
                      </div>
                    </Link>
                  </Reveal>
                </li>
              ))}
            </ul>
          </div>
        </section>

        {/* The values, as cards that turn over under the pointer. They were a
            column of small type parked beside a heading, which is how you set a
            footnote, not a principle.

            What makes the turn worth having is that there is something on the
            other side. The mechanics are in globals.css § .value-card: both
            faces ship in the HTML, the stacked reading is the default, and the
            flip is layered on only where there is a pointer that can hover and
            no stated preference against motion. */}
        <section
          aria-labelledby="values-heading"
          className="mx-auto max-w-6xl px-5 py-16 sm:px-8 sm:py-24"
        >
          <h2
            id="values-heading"
            className="text-3xl font-semibold tracking-[-0.03em] sm:text-4xl"
          >
            Our vision and core values
          </h2>
          <p className="mt-5 max-w-[52ch] text-lg leading-relaxed text-ink-muted">
            Leading global provider of high-end kitchen appliances.
          </p>

          <ul className="mt-12 grid gap-4 sm:grid-cols-2 lg:grid-cols-6">
            {VALUES.map(({ name, body, Icon }, i) => (
              <li
                key={name}
                // Focusable so the flip is reachable without a mouse. The
                // outline lands on this element, which does not rotate, so it
                // stays square around the card while the faces turn inside it.
                tabIndex={0}
                className={`value-card min-h-[13.5rem] rounded-sm border border-line bg-surface transition-colors hover:border-line-strong ${VALUE_SPAN[i]}`}
              >
                <div className="value-card-inner">
                  <div className="value-card-face flex flex-col p-6">
                    <Icon size={26} weight="light" aria-hidden="true" className="text-ink-muted" />
                    <h3 className="mt-5 text-lg font-semibold leading-snug tracking-[-0.02em]">
                      {name}
                    </h3>
                  </div>

                  <div className="value-card-face value-card-back flex flex-col justify-center">
                    <p className="value-card-label text-sm font-semibold leading-snug">{name}</p>
                    <p className="text-[0.9375rem] leading-relaxed text-ink-muted">
                      {body}
                    </p>
                  </div>
                </div>
              </li>
            ))}
          </ul>
        </section>

        {/* Four statements, four cells. The hairlines are the parent's own
            background showing through a 1px grid gap, so the rule between two
            cells belongs to neither of them — which only works while the grid
            has no half-empty row to expose. Four items over one, two or four
            columns always fills. */}
        <section aria-labelledby="mission-heading" className="border-y border-line bg-surface">
          <div className="mx-auto max-w-6xl px-5 py-16 sm:px-8 sm:py-24">
            <h2
              id="mission-heading"
              className="text-3xl font-semibold tracking-[-0.03em] sm:text-4xl"
            >
              Our mission
            </h2>

            <ul className="mt-10 grid gap-px bg-line sm:grid-cols-2">
              {MISSION.map((m) => (
                <li key={m} className="bg-surface p-6 leading-relaxed text-ink-muted sm:p-8">
                  {m}
                </li>
              ))}
            </ul>
          </div>
        </section>

        {/* The close: the paperwork, over the range it covers. A pane rather
            than copy set straight on the photograph — three certificate names
            and two buttons need a surface to sit on, and .glass carries a
            verified contrast floor over any pixel of the picture behind it.

            The shallow drift, not the deep one: this band is only as tall as
            its own copy and sits mid-document. It rides its own --close
            timeline rather than --hero, which the banner at the top of this
            page already declares. */}
        <section
          aria-labelledby="certifications-heading"
          className="close-scene relative isolate border-b border-line"
        >
          {banner?.signature_image_url && (
            <div aria-hidden className="absolute inset-0 -z-10 overflow-hidden">
              <div className="close-drift absolute inset-0">
                <Image
                  src={banner.signature_image_url}
                  alt=""
                  fill
                  loading="lazy"
                  sizes="125vw"
                  style={{ objectPosition: banner.signature_image_focus ?? undefined }}
                  className="object-cover opacity-50"
                />
              </div>
              <div className="absolute inset-0 bg-void/45" />
            </div>
          )}

          <div className="mx-auto max-w-6xl px-5 py-16 sm:px-8 sm:py-24">
            <div className="glass max-w-[46rem] rounded-sm p-6 sm:p-10">
              <h2
                id="certifications-heading"
                className="text-3xl font-semibold tracking-[-0.03em] sm:text-4xl"
              >
                Our certifications
              </h2>
              {/* Full ink inside the pane. --ink is the value .glass is tinted
                  to clear 4.5:1 for over a photograph; --ink-muted on glass is
                  not verified and must not be used here. */}
              <p className="mt-5 max-w-[54ch] leading-relaxed text-ink">
                VATTI Malaysia is the appointed national distributor, supplying {dealers} authorised
                dealers across the country.
              </p>

              {/* Hairlines matched to the pane edge, not to --color-line: an
                  opaque rule on a half-transparent panel reads as a seam in the
                  glass. */}
              <ul className="mt-8">
                {CERTIFICATIONS.map((c) => (
                  <li key={c} className="border-b border-glass-edge py-4 first:border-t">
                    {c}
                  </li>
                ))}
              </ul>

              <div className="mt-9 flex flex-wrap gap-3">
                <a
                  href={WHATSAPP}
                  className="rounded-sm bg-teal px-6 py-3 font-semibold text-void transition-opacity hover:opacity-90"
                >
                  WhatsApp us
                </a>
                <Link
                  href="/store-locations/"
                  className="rounded-sm border border-line-strong px-6 py-3 font-medium text-ink transition-colors hover:border-teal hover:text-teal"
                >
                  Find a dealer
                </Link>
              </div>
            </div>
          </div>
        </section>
      </main>

      <CtaBar />
    </>
  );
}
