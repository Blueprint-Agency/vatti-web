import { Fan } from "@phosphor-icons/react/dist/ssr/Fan";
import { Funnel } from "@phosphor-icons/react/dist/ssr/Funnel";
import { HandWaving } from "@phosphor-icons/react/dist/ssr/HandWaving";
import { Lightning } from "@phosphor-icons/react/dist/ssr/Lightning";
import { ShieldCheck } from "@phosphor-icons/react/dist/ssr/ShieldCheck";
import { Sparkle } from "@phosphor-icons/react/dist/ssr/Sparkle";
import { Thermometer } from "@phosphor-icons/react/dist/ssr/Thermometer";
import { WifiHigh } from "@phosphor-icons/react/dist/ssr/WifiHigh";
import { Wind } from "@phosphor-icons/react/dist/ssr/Wind";
import { Drop } from "@phosphor-icons/react/dist/ssr/Drop";
import Image from "next/image";
import Link from "next/link";
import type { CSSProperties, ReactNode } from "react";

import { CompareSelector } from "@/components/CompareSelector";
import { CompareTable } from "@/components/CompareTable";
import { CtaBar } from "@/components/CtaBar";
import { EnquiryBuilder } from "@/components/EnquiryBuilder";
import { ModelGrid } from "@/components/ModelGrid";
import { Reveal } from "@/components/Reveal";
import { ReviewWall } from "@/components/ReviewWall";
import { SignatureBand } from "@/components/SignatureBand";
import { SiteHeader } from "@/components/SiteHeader";
import { SoundLevelMark } from "@/components/SoundLevelMark";
import { Inline } from "@/lib/markdown";
import type {
  Category,
  CategoryProduct,
  Column,
  Extreme,
  Faq,
  FilterGroup,
  Guide,
  Reason,
  Review,
  Signature,
} from "@/lib/queries/category";
import type { ArticleTeaser, Region } from "@/lib/queries/home";
import { WHATSAPP, whatsappLink } from "@/lib/site";

/**
 * The category template. These pages outrank the homepage — /kitchen-hood/ and
 * /kitchen-hood-in-malaysia/ between them carry more search traffic than every
 * product page combined — so this is the page that has to answer the whole
 * question, not just list the models.
 *
 * It runs: what the range reaches, the model it leads with, every model with
 * filters over it, how to choose one, all of them side by side, why this brand,
 * what owners say about the service, the guide, the FAQ, and how to buy.
 *
 * Every section below the grid renders from its own table and disappears when
 * that table has no rows for the category, so a page with nothing written for
 * it prints no empty heading. All five carry that copy now.
 *
 * The sections that are not copy are gated on the model count instead, and
 * those gates open and close by themselves as the catalogue changes: the grid
 * needs two models to be a grid, the signature band steps aside at exactly two
 * (see below), and the questionnaire and the comparison table both need more
 * than two to have anything to narrow or to compare. The dishwasher page is
 * the one model case today — hero, the band, the guide, the reasons, the
 * reviews and the FAQ, and no chrome around a range of one.
 */
export function CategoryView({
  category,
  products,
  filters,
  summary,
  columns,
  signature,
  guides,
  reasons,
  faqs,
  reviews,
  regions,
  guideArticle,
}: {
  category: Category;
  products: CategoryProduct[];
  filters: FilterGroup[];
  summary: Extreme[];
  columns: Column[];
  signature?: Signature;
  guides: Guide[];
  reasons: Reason[];
  faqs: Faq[];
  reviews: Review[];
  regions: Region[];
  guideArticle?: ArticleTeaser;
}) {
  const noun = category.name.toLowerCase();
  const figures = guides.filter((g) => g.figure);
  const prose = guides.filter((g) => !g.figure);
  const scene = category.hero_product_image_url;

  /**
   * The hero runs full screen when the photograph IS the hero: a backdrop, and
   * no cut-out set over it.
   *
   * Both halves of that condition earn their place. Without a backdrop this
   * would be a viewport of empty ground. And with a cut-out the section height
   * is already set by the product column standing in it, so stretching it to
   * the screen would scale that product to fill a viewport it was not shot for.
   *
   * As it stands all five categories carry a backdrop and none carries a
   * cut-out, so every one of them takes the full-screen branch. The split hero
   * below is therefore unexercised by current data rather than dead: it is what
   * `hero_product_image_url` is for, and filling that column in is what turns a
   * category page back into a split. Anything measured against the full-screen
   * hero — the deep drift, the parallax on the copy, what counts as
   * below-the-fold in ModelGrid — is being measured against the only shape the
   * five actually take today.
   */
  const banner = !scene && Boolean(category.hero_image_url);

  return (
    <>
      <SiteHeader />

      <main id="main">
        {/* Hero. Split where there is a photograph of the category installed,
            and single-column where there is not: a hero built around a cut-out
            on a white plate is the same picture the grid repeats sixteen times
            two screens further down. */}
        {/* 3.375rem is the sticky header: py-3.5 either side of a 1.5rem line,
            plus its bottom border. Subtracting it puts the hero's bottom edge
            exactly on the fold rather than one header-height below it. Keep
            the two in step if SiteHeader's padding moves. */}
        <section
          className={`hero-scene relative isolate ${
            banner ? "flex min-h-[calc(100dvh-3.375rem)] flex-col" : ""
          }`}
        >
          {/* Full bleed, which is why the width constraint sits on the div
              below rather than on the section: a banner backdrop stopping at
              the 6xl gutter reads as a floating panel, not as the ground the
              hero stands on. Same treatment as the questionnaire band — half
              transparent, then a wash of --void that carries the contrast in
              both themes.

              The frame carries the overflow clip and the drift element carries
              the movement, the same division the home page hero makes: .hero-
              drift is scaled 1.08 so it has somewhere to travel, and without a
              clip here that overscan shows past the section edge. The clip goes
              on this frame rather than on the section because an overflow-
              hidden ancestor silently stops any sticky below it.

              The wash sits outside the drift on purpose. It is a contrast
              floor, not scenery — if it moved with the photograph the type
              would drift in and out of its own knock-down. */}
          {category.hero_image_url && (
            <div aria-hidden className="absolute inset-0 -z-10 overflow-hidden">
              {/* One drift class or the other, never both: each carries its own
                  scale AND its own animation, so applying the pair would leave
                  the cascade to pick a scale from one and keyframes from the
                  other. See globals.css for why the full-screen banner needs
                  its own tuning rather than a bigger number. */}
              <div
                className={`${
                  banner ? "category-hero-drift-deep" : "category-hero-drift"
                } absolute inset-0`}
              >
                <Image
                  src={category.hero_image_url}
                  alt=""
                  fill
                  priority
                  // The frame is overscanned by the drift's scale, so it is
                  // painted larger than the viewport it sits in. Asking for
                  // 100vw hands the optimizer a candidate it then has to
                  // stretch; 150vw covers the deep variant. The source is
                  // 1200px, so this only helps up to that.
                  sizes={banner ? "150vw" : "100vw"}
                  className="object-cover opacity-50"
                />
              </div>
              <div className="absolute inset-0 bg-void/45" />
              {/* The wash above is a contrast floor and nothing else: it lowers
                  the whole frame by one flat amount, so whatever the photograph
                  is already doing survives at full amplitude. On four of these
                  five backdrops what it is doing is architecture — a countertop
                  run on the dishwasher page, a cabinet line on the hood page —
                  and a flat knock-down leaves that edge as a hard, full-width
                  brightness step landing just under the breadcrumb. Measured
                  against --void: 66 above the dishwasher's counter edge and 16
                  below it, across the whole width. At that amplitude, with no
                  lighting anywhere else in the frame to explain it, the eye
                  reads a rendering fault rather than a kitchen.

                  So the frame gets lit. These two ramp --void back in towards
                  every edge and leave the middle untouched, which is a vignette
                  built the way the rest of the file builds things — two utility
                  layers on a token that flips with the ground, rather than a
                  filter or a second image.

                  Symmetric on both axes, and that is the requirement rather
                  than the taste: this copy is CENTRED. The home page hero
                  weights its ramp left (`from-void/92 ... to-void/15`) because
                  its copy ranges left against a lit hood, and the same ramp
                  here would leave the headline sitting off the bright side of
                  its own backdrop. `via-void/0` rather than `via-transparent`
                  so the midpoint is this colour at zero alpha and the ramp
                  cannot pick up a cast on the way through.

                  Horizontal is the stronger of the two because the imbalance
                  is: the oven backdrop runs 66 down the left gutter against 28
                  through the column. Vertical is lighter, and bottom-heavy
                  rather than even — the top only needs enough to stop the
                  breadcrumb strip reading as its own plate, while the foot is
                  also the join into the summary band, which is the seam the
                  home hero spends its third layer on.

                  Measured over all five backdrops at 1920, 1440, 1280 and 1100
                  in both grounds, worst case: the vertical step falls 47 -> 32
                  and the horizontal 45 -> 27 in the dark ground, and 47 -> 43
                  and 44 -> 34 in the light one, where the wash has already
                  carried the photograph most of the way to white and there is
                  less left to compress. They cannot flatten a photograph
                  completely and should not: what is left is a gradient, and a
                  gradient reads as light falling on a room. A step that is IN
                  the picture — the dishwasher's counter edge is the one that
                  survives largest — wants a different backdrop, not a heavier
                  overlay. Re-measure per DESIGN.md § Verification if either
                  number moves. */}
              <div className="absolute inset-0 bg-gradient-to-r from-void/45 via-void/0 to-void/45" />
              <div className="absolute inset-0 bg-gradient-to-b from-void/35 via-void/0 to-void/45" />
            </div>
          )}

          <div
            className={`relative mx-auto w-full max-w-6xl px-5 pb-12 pt-8 sm:px-8 sm:pb-16 sm:pt-12 ${
              banner ? "flex flex-1 flex-col" : ""
            }`}
          >
            <nav aria-label="Breadcrumb" className="mb-8 text-sm">
              <ol className="flex flex-wrap items-center gap-2 text-ink-muted">
                <li>
                  <Link href="/" className="transition-colors hover:text-ink">
                    Home
                  </Link>
                </li>
                <li aria-hidden="true">/</li>
                <li className="text-ink">{category.name}</li>
              </ol>
            </nav>

            {/* my-auto, not a centred flex parent: it leaves the breadcrumb at
                the top of the section where it belongs and centres the copy in
                whatever height is left under it. */}
            <div
              className={
                scene
                  ? "grid items-center gap-10 lg:grid-cols-[minmax(0,1fr)_minmax(0,1fr)] lg:gap-16"
                  : banner
                    ? "my-auto"
                    : ""
              }
            >
              {/* No product shot means the copy has the whole banner, so it
                  centres over the photograph rather than ranging left against
                  an empty half. The hob page is the case this is written for:
                  its backdrop is already the appliance installed, so there is
                  nothing to set beside the words. */}
              {/* No max-w on the centred block. The headline sets its own
                  measure below and the paragraph carries its own 54ch, so a
                  cap here would only ever be the thing that stopped the
                  headline using the banner it is standing on. */}
              <div className={scene ? "" : "mx-auto text-center"}>
                {/* The three planes. Descending --depth, so the headline
                    travels furthest and the buttons least: the block layers
                    against the backdrop instead of sliding as one slab. Only
                    on the full-screen hero — see .hero-parallax.

                    The banner headline is set to run the width of the section
                    and break twice, longest line first. Three things had to
                    move together for that:

                    * The 18ch measure. At this type size that is about 20
                      characters a line, and both written headlines are in the
                      mid-60s, so it could not come out as anything but three
                      lines stacked down the middle of an empty banner.
                    * text-balance. It equalises the lines it breaks, which is
                      the opposite of the ask. Greedy wrapping fills the first
                      line before it starts the second, so a long-then-short
                      pair is what it gives you for free. text-pretty keeps
                      the one guarantee worth having, that the last line is
                      never left as a single orphan word.
                    * The type scale. Filling the measure needs ~42 characters
                      a line, and at 3.75rem that wants ~1120px against the
                      1088px this section actually has. 3.5rem fits, and the
                      slower vw coefficient keeps it fitting down the range
                      rather than only at the top of it: the headline grows
                      more slowly than the column it sits in, where before it
                      outran it.

                    Under ~850px the two lines come out near enough equal
                    again, because below that the column is narrowing faster
                    than the type. That is phone and small-tablet width, where
                    a headline of this length is wrapping anyway. If the break
                    has to be exact at every width it has to be authored into
                    the copy, which is a data change, not this. */}
                <h1
                  style={banner ? ({ "--depth": 1.15 } as CSSProperties) : undefined}
                  className={
                    banner
                      ? "hero-parallax mx-auto text-pretty text-[clamp(2rem,1.2rem+2.8vw,3.5rem)] font-semibold leading-[1.06] tracking-[-0.035em]"
                      : `max-w-[18ch] text-balance text-[clamp(2rem,1.2rem+3.2vw,3.75rem)] font-semibold leading-[1.03] tracking-[-0.04em] ${
                          scene ? "" : "mx-auto"
                        }`
                  }
                >
                  {category.h1 ?? `${category.name} in Malaysia`}
                </h1>

                {category.intro_md && (
                  <p
                    style={banner ? ({ "--depth": 0.85 } as CSSProperties) : undefined}
                    className={`mt-6 max-w-[54ch] text-[1.0625rem] leading-relaxed text-ink-muted ${
                      scene ? "" : "mx-auto"
                    } ${banner ? "hero-parallax" : ""}`}
                  >
                    {category.intro_md}
                  </p>
                )}

                <div
                  style={banner ? ({ "--depth": 0.6 } as CSSProperties) : undefined}
                  className={`mt-9 flex flex-wrap gap-3 ${scene ? "" : "justify-center"} ${
                    banner ? "hero-parallax" : ""
                  }`}
                >
                  <a
                    href={WHATSAPP}
                    className="rounded-sm bg-teal px-6 py-3 font-semibold text-void transition-opacity hover:opacity-90"
                  >
                    WhatsApp us
                  </a>
                  {/* Only where there is a range to see. One model does not
                      need an anchor down to a grid holding it. */}
                  {products.length > 1 && (
                    <a
                      href="#models"
                      className="rounded-sm border border-line-strong px-6 py-3 font-medium text-ink transition-colors hover:border-teal hover:text-teal"
                    >
                      See all {products.length} models
                    </a>
                  )}
                </div>
              </div>

              {/* A cut-out on transparency, so no frame, no plate and no
                  crop — object-contain, because cropping a product shot is
                  cropping the thing the page is selling. Above lg it leaves
                  the grid and spans the full height of the section; the column
                  it vacates is the one the copy is already sitting beside, so
                  the grid still reserves the space.

                  Where it sits in that column comes from the category, because
                  it depends on the shape of the appliance: a wide hob floats
                  centred, and the hood is pinned to the top so its canopy
                  meets the header instead of drifting down beside the copy.
                  NULL centres, which is the CSS default.

                  Every file here is staged trimmed to its alpha bounds. It
                  matters more than it looks: contain scales the whole canvas,
                  so a shot with empty margin scales the margin too and the
                  appliance comes out small and off-centre. */}
              {scene && (
                <div className="relative aspect-square lg:absolute lg:inset-y-0 lg:right-8 lg:aspect-auto lg:w-[calc(50%-3rem)]">
                  <Image
                    src={scene}
                    alt={category.hero_product_image_alt ?? ""}
                    fill
                    priority
                    sizes="(max-width: 1024px) 100vw, 560px"
                    style={{ objectPosition: category.hero_product_image_focus ?? undefined }}
                    className="object-contain"
                  />
                </div>
              )}
            </div>
          </div>
        </section>

        {/* What the range reaches. The same component as the product page's
            readout strip, one level up: there it is this model's figures, here
            it is the best each measurement gets to across the category, with
            the model that holds it named underneath.

            overflow-hidden clips the drifting grid at the band edge. Safe
            here and nowhere near as safe as it looks elsewhere on this page:
            an overflow-hidden ancestor silently kills position:sticky in
            everything below it, which is what broke the questionnaire panel
            once already. This section holds one dl and nothing sticky. */}
        {summary.length > 0 && (
          <section
            aria-label={`${category.name} range summary`}
            className="readout-band overflow-hidden border-y border-line bg-surface"
          >
            {/* Columns follow the cell count. Hoods fill all four; a category
                measured on one figure would otherwise leave half the band
                empty at desktop width.

                The band lags the scroll and that is the whole of it. The cells
                carry no entrance of their own: they are figures, and a figure
                that assembles itself on approach reads as a page still
                loading. The band was on `.animate-readout` — a 620ms settle
                fired at load — and then on a staggered scroll-driven arrival;
                both have been taken out. The numbers are simply there. */}
            <dl
              className={`readout-drift mx-auto grid max-w-6xl gap-px bg-line ${
                SUMMARY_COLUMNS[summary.length + 1] ?? "grid-cols-2 md:grid-cols-4"
              }`}
            >
              <div className="bg-surface px-5 py-6 sm:px-7 sm:py-8">
                <dt className="text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ink-muted">
                  Models
                </dt>
                <dd className="mt-2">
                  <span className="readout text-3xl font-semibold leading-none text-teal sm:text-4xl">
                    {products.length}
                  </span>
                </dd>
                <dd className="mt-3 text-xs text-ink-muted">in the current range</dd>
              </div>
              {summary.map((s) => (
                <div key={s.facet} className="bg-surface px-5 py-6 sm:px-7 sm:py-8">
                  <dt className="text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ink-muted">
                    {s.label}
                  </dt>
                  <dd className="mt-2 flex items-baseline gap-1.5">
                    <span className="readout text-3xl font-semibold leading-none text-teal sm:text-4xl">
                      {fmt(s.value)}
                    </span>
                    <span className="readout text-sm text-ink-muted">{s.unit}</span>
                  </dd>
                  <dd className="readout mt-3 text-xs text-ink-muted">{s.model}</dd>
                </div>
              ))}
            </dl>
          </section>
        )}

        {/* The model the range leads with. Suppressed at exactly two models:
            promoting one of a pair, with the grid right underneath holding
            both, is a section that says nothing the grid does not.

            One model is the other side of that same argument. There the grid
            below is a single card, so this band is not competing with it — it
            IS the product section, and the grid is the part that goes. The
            dishwasher page is the case: one machine, shown once, at the size
            the only thing on the page deserves. */}
        {signature && products.length !== 2 && (
          <SignatureBand
            signature={signature}
            scene={
              category.signature_image_url
                ? {
                    src: category.signature_image_url,
                    alt: category.signature_image_alt ?? "",
                    focus: category.signature_image_focus,
                  }
                : undefined
            }
            // "Where the range starts" is a claim about a range, and a
            // category with one model does not have one. There the band takes
            // over the sentence the grid used to carry — "Every dishwasher we
            // sell", now said about the single machine it is said of.
            heading={
              products.length === 1
                ? `The ${signature.model_code} is the ${noun} we sell`
                : signature.series
                  ? `The ${signature.series} is where the range starts`
                  : `The ${signature.model_code} is where the range starts`
            }
          />
        )}

        {/* Every model, with the filters over it. Gone where there is only one
            of them: "Every dishwasher we sell", a filter bar with nothing to
            filter, and a grid of one card is three controls' worth of chrome
            around a product the band above has just shown at full height and
            linked. */}
        {products.length > 1 && (
          <section
            id="models"
            aria-labelledby="models-heading"
            className="mx-auto max-w-6xl scroll-mt-20 border-t border-line px-5 py-16 sm:px-8 sm:py-24"
          >
            <h2
              id="models-heading"
              className="max-w-[20ch] text-3xl font-semibold tracking-[-0.03em] sm:text-4xl"
            >
              Every {noun} we sell
            </h2>
            <p className="mt-4 max-w-[56ch] leading-relaxed text-ink-muted">
              {filters.length > 0
                ? "Filter by what the kitchen has to do. The figures on each card are the measured ones, taken from the same spec sheet the product page prints."
                : "The figures on each card are the measured ones, taken from the same spec sheet the product page prints."}
            </p>

            <div className="mt-10">
              <ModelGrid products={products} groups={filters} noun={noun} />
            </div>
          </section>
        )}

        {/* How to choose one. Blocks with a measured figure lead; the prose
            blocks follow in a 2x2, which is where ducted and ductless sit side
            by side without either being framed as the default. */}
        {guides.length > 0 && (
          <section aria-labelledby="choose-heading" className="border-y border-line bg-surface">
            <div className="mx-auto max-w-6xl px-5 py-16 sm:px-8 sm:py-24">
              <h2
                id="choose-heading"
                className="max-w-[22ch] text-3xl font-semibold tracking-[-0.03em] sm:text-4xl"
              >
                Choosing a {noun} in Malaysia
              </h2>

              {figures.length > 0 && (
                <ul className="mt-10 grid gap-5 sm:grid-cols-2">
                  {figures.map((g, i) => (
                    // Reveal INSIDE the li, not around it: a <ul> may only
                    // contain <li>, and Reveal renders a div.
                    <li key={g.heading}>
                      <Reveal delay={i * 80} className="h-full">
                        <div className="h-full rounded-sm border border-line bg-void p-6 sm:p-8">
                          <p className="flex items-baseline gap-2">
                            <span className="readout text-4xl font-semibold leading-none text-teal">
                              {g.figure}
                            </span>
                            <span className="readout text-sm text-ink-muted">{g.figure_unit}</span>
                          </p>
                          <h3 className="mt-5 text-xl font-semibold tracking-[-0.025em]">
                            {g.heading}
                          </h3>
                          <p className="mt-3 leading-relaxed text-ink-muted">
                            <Inline text={g.body_md} />
                          </p>
                        </div>
                      </Reveal>
                    </li>
                  ))}
                </ul>
              )}

              {prose.length > 0 && (
                <ul className="mt-12 grid gap-x-12 gap-y-10 sm:grid-cols-2">
                  {prose.map((g) => (
                    <li key={g.heading} className="border-t border-line pt-6">
                      <h3 className="text-lg font-semibold tracking-[-0.02em]">{g.heading}</h3>
                      <p className="mt-3 max-w-[52ch] leading-relaxed text-ink-muted">
                        <Inline text={g.body_md} />
                      </p>
                    </li>
                  ))}
                </ul>
              )}
            </div>
          </section>
        )}

        {/* Narrow it down, then compare what is left. The questionnaire comes
            first because answering five questions is how a visitor works out
            which two or three models to put in the table underneath — and
            because the answer to "which of these" is often "message them",
            which the WhatsApp button makes a one-tap move. */}
        {products.length > 2 && (
          <section
            aria-labelledby="finder-heading"
            // No overflow-hidden here, however much the absolute backdrop below
            // looks like it wants one. The readout panel inside EnquiryBuilder
            // is lg:sticky, and an ancestor that hides overflow becomes its
            // scroll container — the panel would then stick to a box that never
            // scrolls and sit dead while the questions move past it. Nothing
            // escapes anyway: `fill` is inset to this box and object-cover
            // clips at the element. `isolate` stays, so the -z-10 backdrop
            // lands behind this section rather than behind the page.
            className="relative isolate border-t border-line bg-surface"
          >
            {/* The kitchen the questions are about, standing behind them. Half
                transparent as asked, and then a wash of --void over that, which
                is doing the real work: the photograph is a bright white kitchen,
                so at 50% alone it lifts the dark ground to mid-grey and takes
                --ink-muted — every helper line and every chip label in the left
                column — with it. The wash puts the ground back where the tokens
                were checked, and because --void flips with the theme it darkens
                the plate in the dark ground and lightens it in the light one
                off a single rule. Re-measure per DESIGN.md § Verification if
                the percentage moves. Decorative, so alt="" — the heading
                underneath already says what the section is. */}
            {category.finder_image_url && (
              <div aria-hidden className="absolute inset-0 -z-10">
                <Image
                  src={category.finder_image_url}
                  alt=""
                  fill
                  sizes="100vw"
                  className="object-cover opacity-50"
                />
                <div className="absolute inset-0 bg-void/45" />
              </div>
            )}

            <div className="mx-auto max-w-6xl px-5 py-16 sm:px-8 sm:py-24">
              <div className="max-w-[52ch]">
                <h2
                  id="finder-heading"
                  className="text-3xl font-semibold tracking-[-0.03em] sm:text-4xl"
                >
                  Tell us about your kitchen
                </h2>
                <p className="mt-4 text-lg leading-relaxed text-ink-muted">
                  Answer what you can. The message writes itself as you go, and we will come back
                  with the model that fits and the dealer who stocks it.
                </p>
              </div>

              <div className="mt-10">
                {/* Hob width is a real question on the two pages where the
                    cooking surface decides the model, and noise on the oven
                    page. See EnquiryBuilder. */}
                <EnquiryBuilder
                  regions={regions}
                  category={category.name}
                  hobWidth={
                    category.slug === "kitchen-hood-in-malaysia" ||
                    category.slug === "cooker-hob-in-malaysia"
                  }
                />
              </div>
            </div>
          </section>
        )}

        {/* Side by side. */}
        {columns.length > 1 && products.length > 2 && (
          <section
            id="compare"
            aria-labelledby="compare-heading"
            className="mx-auto max-w-6xl scroll-mt-20 px-5 py-16 sm:px-8 sm:py-24"
          >
            {/* The four categories whose h1 is still the mis-scraped compare
                heading would otherwise print the same sentence twice on one
                page, once as the H1 and once here. */}
            <h2
              id="compare-heading"
              className="max-w-[20ch] text-3xl font-semibold tracking-[-0.03em] sm:text-4xl"
            >
              {category.h1?.toLowerCase().startsWith("compare")
                ? "Model by model"
                : `Compare VATTI ${category.name} Models`}
            </h2>
            <p className="mt-4 max-w-[58ch] leading-relaxed text-ink-muted">
              Every figure here is the measured one from the model&rsquo;s own spec sheet. A dash
              means it does not publish that measurement, not that it scores zero.
            </p>

            <div className="mt-10">
              <CompareSelector
                products={products}
                columns={columns}
                initial={openingThree(products, signature?.slug)}
              />
            </div>

            {/* The whole range, still in the HTML. The selector shows three at
                a time by design, but a category page that renders only three
                models' figures has stopped being the reference page it ranks
                as — and <details> content is in the DOM whether or not it is
                open, so this costs nothing to a crawler and one click to a
                reader who wants everything at once. */}
            <details className="group mt-12 border-t border-line">
              <summary className="disclosure flex cursor-pointer list-none items-center justify-between gap-6 py-5 font-medium">
                All {products.length} models, side by side
                <span
                  aria-hidden="true"
                  className="shrink-0 text-lg leading-none text-teal transition-transform duration-300 ease-[var(--ease-out-quart)] group-open:rotate-45"
                >
                  +
                </span>
              </summary>
              <div className="pb-4">
                <CompareTable products={products} columns={columns} />
              </div>
            </details>
          </section>
        )}

        {/* Why this brand. Six claims, each carried by its title and its copy
            alone. The measured figures that used to close three of these six
            cells are gone from the page but not from category_reason: the same
            numbers are printed by the summary band at the top of this page and
            again in the comparison table, so a third appearance here was the
            page repeating itself rather than evidencing itself. */}
        {reasons.length > 0 && (
          <section aria-labelledby="reasons-heading" className="border-y border-line bg-surface">
            <div className="mx-auto max-w-6xl px-5 py-16 sm:px-8 sm:py-24">
              <h2
                id="reasons-heading"
                className="mx-auto max-w-[24ch] text-center text-3xl font-semibold tracking-[-0.03em] sm:text-4xl"
              >
                {reasons.length} reasons to buy a VATTI {noun}
              </h2>

              <dl className="mt-12 grid gap-px bg-line sm:grid-cols-2 lg:grid-cols-3">
                {reasons.map((r) => {
                  const Icon = r.icon ? REASON_ICONS[r.icon] : undefined;
                  return (
                  <div key={r.title} className="reason-cell flex flex-col bg-surface p-6 sm:p-7">
                    {/* Light weight and ink-muted, deliberately. Teal on this
                        site means "measured value", and a mark is not one.
                        It is here to give the eye somewhere to land and to
                        state the claim a second way — once in the glyph, once
                        in how it moves. See REASON_MOTION. */}
                    {Icon && (
                      <Icon
                        size={26}
                        weight="light"
                        aria-hidden="true"
                        className={[
                          "mb-5 shrink-0 text-ink-muted",
                          r.icon ? REASON_MOTION[r.icon] : undefined,
                        ]
                          .filter(Boolean)
                          .join(" ")}
                      />
                    )}
                    <dt className="font-semibold leading-snug">{r.title}</dt>
                    <dd className="mt-3 text-[0.9375rem] leading-relaxed text-ink-muted">
                      <Inline text={r.body_md} />
                    </dd>
                  </div>
                  );
                })}
              </dl>
            </div>
          </section>
        )}

        {/* The service, in the words of people who have needed it. Appliances
            are bought on whether somebody turns up when they break, and every
            one of these reviews is about exactly that. */}
        <ReviewWall
          reviews={reviews}
          heading={`${category.name} trusted by 10,000+ Malaysians`}
        />

        {/* The long-form guide, for the reader who wants the whole argument
            rather than the six blocks above. */}
        {guideArticle && (
          <section aria-labelledby="guide-heading" className="border-y border-line bg-surface">
            <div className="mx-auto grid max-w-6xl items-center gap-8 px-5 py-14 sm:px-8 sm:py-16 lg:grid-cols-[minmax(0,1fr)_minmax(0,1.1fr)] lg:gap-14">
              {guideArticle.url && (
                <div className="relative aspect-[16/9] overflow-hidden rounded-sm">
                  <Image
                    src={guideArticle.url}
                    alt={guideArticle.alt ?? ""}
                    fill
                    loading="lazy"
                    sizes="(max-width: 1024px) 100vw, 520px"
                    className="object-cover"
                  />
                </div>
              )}
              <div>
                <h2 id="guide-heading" className="text-2xl font-semibold tracking-[-0.03em] sm:text-3xl">
                  {guideArticle.title}
                </h2>
                <p className="mt-4 max-w-[52ch] leading-relaxed text-ink-muted">
                  The long version: how the types differ, which of the numbers actually decide it,
                  and which one suits the kitchen you already have.
                </p>
                <Link
                  href={`/${guideArticle.path}/`}
                  className="mt-6 inline-block text-teal transition-opacity hover:opacity-80"
                >
                  Read the guide
                  {guideArticle.reading_minutes && (
                    <span className="readout ml-2 text-xs text-ink-muted">
                      {guideArticle.reading_minutes} min
                    </span>
                  )}
                </Link>
              </div>
            </div>
          </section>
        )}

        {/* FAQ. Native <details>, so it opens with no JavaScript, is findable
            with the browser's own in-page search once open, and costs nothing
            to hydrate. */}
        {faqs.length > 0 && (
          <section
            aria-labelledby="faq-heading"
            className="mx-auto max-w-6xl px-5 py-16 sm:px-8 sm:py-24"
          >
            <div className="grid gap-10 lg:grid-cols-[minmax(0,0.8fr)_minmax(0,1.2fr)] lg:gap-16">
              <div className="lg:sticky lg:top-24 lg:self-start">
                <h2
                  id="faq-heading"
                  className="text-3xl font-semibold tracking-[-0.03em] sm:text-4xl"
                >
                  Questions we get asked
                </h2>
                <p className="mt-5 max-w-[42ch] leading-relaxed text-ink-muted">
                  If yours is not here, send it. We answer on WhatsApp, usually the same day.
                </p>
                <a
                  href={WHATSAPP}
                  className="mt-6 inline-block text-teal transition-opacity hover:opacity-80"
                >
                  012-3366082 →
                </a>
              </div>

              <div>
                {faqs.map((f) => (
                  <details
                    key={f.question}
                    className="group border-b border-line first:border-t"
                  >
                    <summary className="disclosure flex cursor-pointer list-none items-baseline justify-between gap-6 py-5 font-medium">
                      {f.question}
                      <span
                        aria-hidden="true"
                        className="shrink-0 text-lg leading-none text-teal transition-transform duration-300 ease-[var(--ease-out-quart)] group-open:rotate-45"
                      >
                        +
                      </span>
                    </summary>
                    <p className="max-w-[62ch] pb-6 leading-relaxed text-ink-muted">
                      <Inline text={f.answer_md} />
                    </p>
                  </details>
                ))}
              </div>
            </div>
          </section>
        )}

        {/* How to buy. One primary action, the same one the hero opened with. */}
        <section aria-labelledby="category-cta" className="border-t border-line bg-surface">
          <div className="mx-auto max-w-6xl px-5 py-16 sm:px-8 sm:py-24">
            <div className="max-w-2xl">
              <h2
                id="category-cta"
                className="text-3xl font-semibold tracking-[-0.03em] sm:text-4xl"
              >
                Not sure which {noun} fits?
              </h2>
              {/* Deliberately not written for hoods. This band renders on all
                  five category pages, and ducting questions on the dishwasher
                  page would read as a template someone forgot to fill in. */}
              <p className="mt-4 max-w-[58ch] leading-relaxed text-ink-muted">
                Send us the kitchen: what you cook, how the space is laid out, and what has to fit
                where. We will narrow it to one model and the nearest dealer who stocks it.
              </p>
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
              <p className="mt-8 text-sm text-ink-muted">
                Already bought one?{" "}
                <Link href="/vatti-ewarranty/" className="text-teal transition-opacity hover:opacity-80">
                  Register it for warranty
                </Link>
                .
              </p>
            </div>
          </div>
        </section>
      </main>

      {faqs.length > 0 && (
        <script
          type="application/ld+json"
          // Static JSON built from DB columns, serialised with JSON.stringify.
          // The answers carry inline markdown links, which are stripped here —
          // FAQPage wants plain text and Google ignores the markup anyway.
          dangerouslySetInnerHTML={{ __html: JSON.stringify(faqPage(faqs)) }}
        />
      )}

      {/* The same bar the product pages carry. These pages outrank the
          homepage, so a phone arriving from search lands here first and the
          "how to buy" section is nine screens down. The message names the
          range, in the questionnaire's own words. */}
      <CtaBar href={whatsappLink(`Hi VATTI Malaysia. I am looking at your ${noun} range.`)} />
    </>
  );
}

/**
 * The three models the comparison opens on: the signature, then the first two
 * from series it has not already shown.
 *
 * Catalogue order alone put the V929 next to the V993 and the V999, which are
 * both Athenas rated at the same 2,500 m³/h — a comparison table whose default
 * view is two near-identical columns teaches a visitor that the table is not
 * worth touching. Spreading across series is the cheapest way to make the
 * opening state demonstrate what the control is for.
 *
 * Falls back to catalogue order when a category has too few distinct series to
 * fill three columns, so the table is never short of a model.
 */
function openingThree(products: CategoryProduct[], signatureSlug?: string): string[] {
  const first = products.find((p) => p.slug === signatureSlug) ?? products[0];
  const picked = [first];
  const seen = new Set([first.series]);

  for (const p of products) {
    if (picked.length === 3) break;
    if (picked.includes(p) || seen.has(p.series)) continue;
    picked.push(p);
    seen.add(p.series);
  }
  for (const p of products) {
    if (picked.length === 3) break;
    if (!picked.includes(p)) picked.push(p);
  }
  return picked.map((p) => p.slug);
}

/**
 * `category_reason.icon` names a subject; this is the only place that decides
 * what it looks like. Keep it in step with the CHECK constraint on that column
 * — SQL rejects a name that is not in the list, and a name in the list with no
 * entry here renders a reason with a gap where its mark should be.
 *
 * Imported one file at a time from the package's `ssr` entry rather than from
 * its barrel: these are decorative marks on a statically generated page, and
 * the client build of this library carries a React context for size and weight
 * that would make the whole reasons grid a Client Component to draw six SVGs.
 *
 * `noise` is the one entry Phosphor does not supply. Its speaker family stops
 * at two waves and the claim needs four falling to one, so it is drawn here —
 * see SoundLevelMark, which is built out of Phosphor's own geometry to sit
 * level with the ten around it.
 */
type ReasonMark = (props: {
  size?: number;
  weight?: "light";
  className?: string;
  "aria-hidden"?: boolean | "true";
}) => ReactNode;

const REASON_ICONS: Record<string, ReasonMark> = {
  airflow: Wind,
  filtration: Funnel,
  noise: SoundLevelMark,
  motor: Fan,
  clean: Sparkle,
  controls: HandWaving,
  power: Lightning,
  safety: ShieldCheck,
  water: Drop,
  smart: WifiHigh,
  heat: Thermometer,
};

/**
 * How each mark moves, keyed by the same subject REASON_ICONS is keyed by.
 *
 * The motion is a second reading of the claim, not decoration: the motor
 * turns, the hand waves, the sparkle catches, air gusts past, sound pulses,
 * what the filter catches settles through it, the bolt strikes, heat climbs,
 * the shield takes a knock and holds, the drop gathers, and the signal goes
 * out from its own source. Nothing here should be given a motion that merely
 * looks lively — a mark with no honest way to move is better still. All
 * eleven subjects are now rendered by some page and all eleven move; add the
 * motion with the subject if a twelfth is ever introduced, or leave the mark
 * still rather than borrow one.
 *
 * The keyframes are in globals.css. They are deliberately not Tailwind
 * utilities: six bespoke curves are CSS, and arbitrary-value animation classes
 * would put the timing somewhere Tailwind has to be read to find.
 */
const REASON_MOTION: Record<string, string> = {
  airflow: "reason-gust",
  filtration: "reason-sift",
  // `noise` is absent on purpose. Its motion is a countdown across four
  // separate waves, so it lives on the paths inside SoundLevelMark; a class on
  // the <svg> could only move the mark as a whole.
  motor: "reason-spin",
  clean: "reason-twinkle",
  controls: "reason-wave",
  power: "reason-strike",
  heat: "reason-climb",
  safety: "reason-guard",
  smart: "reason-signal",
  water: "reason-drip",
};

/** Written out rather than interpolated: Tailwind scans source for literals. */
const SUMMARY_COLUMNS: Record<number, string> = {
  2: "grid-cols-2",
  3: "grid-cols-1 sm:grid-cols-3",
  4: "grid-cols-2 md:grid-cols-4",
};

function faqPage(faqs: Faq[]) {
  return {
    "@context": "https://schema.org",
    "@type": "FAQPage",
    mainEntity: faqs.map((f) => ({
      "@type": "Question",
      name: f.question,
      acceptedAnswer: { "@type": "Answer", text: plain(f.answer_md) },
    })),
  };
}

/** `[label](/href/)` -> `label`. The only markdown these answers carry. */
function plain(md: string): string {
  return md.replace(/\[([^\]]*)\]\([^)\s]+\)/g, "$1").replace(/\*\*?([^*]+)\*\*?/g, "$1");
}

function fmt(n: number): string {
  return Number.isInteger(n) ? n.toLocaleString("en-MY") : String(n);
}
