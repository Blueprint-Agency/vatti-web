import Image from "next/image";
import Link from "next/link";
import type { ReactNode } from "react";
import { ArrowRight } from "@phosphor-icons/react/dist/ssr/ArrowRight";
import { WhatsappLogo } from "@phosphor-icons/react/dist/ssr/WhatsappLogo";
import { Plus } from "@phosphor-icons/react/dist/ssr/Plus";
import type { ProductCard } from "@/lib/queries/product";

/**
 * A renderer for the markdown our own importer writes, not a markdown library.
 *
 * The corpus was measured before this was written (106 articles, 15,096 lines).
 * It contains exactly six constructs: `##`/`###`/`####` headings, `- ` bullets,
 * two `1. ` lines, standalone `![alt](url)` image lines, `**bold**`, `*italic*`,
 * `[text](href)`, and GitHub-style tables (see `table` below). There is not one
 * `<` character, not one HTML entity, not one code fence, not one blockquote and
 * not one nested list in the whole corpus. A markdown dependency would be ~40 KB
 * to parse a grammar we already control.
 *
 * Underscore emphasis is deliberately NOT supported: `_` appears 16 times and
 * every occurrence is inside a URL query string (`?embeds_euri=`, `&app_`).
 * Supporting it would corrupt links, which is the opposite of what a renderer
 * should do to text it does not understand.
 *
 * Nothing here uses dangerouslySetInnerHTML. Every node is a React element, so
 * text is escaped by React on the way out and content can never inject markup —
 * the body is scraped from WordPress, and treating it as trusted HTML for the
 * sake of a shorter function would be the wrong trade even though today's
 * corpus is clean.
 */
export function Markdown({
  md,
  sizes = {},
  callouts,
  article = false,
}: {
  md: string;
  sizes?: ImageSizes;
  callouts?: Callouts;
  /**
   * The article reading surface: section ids and rules for the contents list,
   * the summary panel, term rows, FAQ disclosures and the product panel. Off
   * for product pages and ProductFeatures, which own their own layout.
   */
  article?: boolean;
}) {
  const lines = md.split("\n");
  const out: ReactNode[] = [];
  let h2s = 0;
  let inFaq = false;

  for (let i = 0; i < lines.length; i++) {
    const line = lines[i].trim();
    if (!line) continue;

    if (article) {
      // "### Quick answer" (or Ringkasan, 简短回答…) followed by a list, before
      // the first section: the article's answer in one look. It becomes the
      // summary panel, with each bold lead set as the row's term.
      const h3 = /^### +(.*)$/.exec(line);
      const next = nextLine(lines, i);
      if (h3 && h2s === 0 && next >= 0 && ITEM.exec(lines[next].trim())) {
        const { items, last } = listAt(lines, next);
        out.push(
          // Set like the head of a spec sheet rather than boxed as a callout: a
          // small heading over a heavy rule, then the answers ruled beneath it.
          <section key={i} className="my-10">
            <h3 className="text-sm font-medium text-paper-muted">{inline(h3[1])}</h3>
            <div className="mt-2 border-t-2 border-paper-ink">
              <TermRows items={items} compact />
            </div>
          </section>
        );
        i = last;
        continue;
      }
    }

    // A link standing alone on its line is a pointer, not prose: "Explore
    // VATTI Kitchen Hood" closing an article, "Enquire With Us" under a Quick
    // Answer, or a sibling guide behind a 👉 or a **RELATED:** label. 138 of
    // them across the corpus, and every one was rendering as a bare underlined
    // sentence. Each becomes the affordance it is: a card for a guide, a
    // button for a product or category page, the WhatsApp button for the
    // sales line. The 👉 and the label are dropped; the card says "related".
    const alone = STANDALONE.exec(line);
    if (alone) {
      out.push(<Callout key={i} label={alone[1]} href={alone[2]} callouts={callouts} />);
      continue;
    }

    const heading = /^(#{2,4}) +(.*)$/.exec(line);
    if (heading) {
      const level = heading[1].length;
      const Tag = `h${level}` as "h2" | "h3" | "h4";
      if (article && level === 2) {
        // Each section after the first opens on a rule, so the page reads as
        // sections rather than one column; the id is what the contents list
        // links to (see `outline`). Numbered by order, not slugged: a Chinese
        // heading slugs to nothing.
        h2s++;
        inFaq = FAQ_HEADING.test(heading[2]);
        out.push(
          <h2
            key={i}
            id={`section-${h2s}`}
            className={`${HEADING[2]} scroll-mt-24 ${h2s > 1 ? "border-t border-paper-line pt-10 !mt-14" : ""}`}
          >
            {inline(heading[2])}
          </h2>
        );
        continue;
      }
      out.push(
        <Tag key={i} className={HEADING[level]}>
          {inline(heading[2])}
        </Tag>
      );
      continue;
    }

    // A picture wrapped in a link is a product shot pointing at its page:
    // "[![VATTI V960 cooker hood](https://cdn…/v960-front.webp)](/vatti-…-v960/)".
    // A buying guide names a model and the reader wants to see it, but a
    // cut-out on white at full column width is a poster, not a reference. So
    // it renders as a small card, and consecutive lines share one row: the
    // "V960 or V938" picks sit side by side.
    if (PRODUCT_SHOT.test(line)) {
      const shots: RegExpExecArray[] = [];
      let j = i;
      for (; j < lines.length; j++) {
        const m = PRODUCT_SHOT.exec(lines[j].trim());
        if (!m) break;
        shots.push(m);
      }
      const cards = callouts?.products;
      if (article && cards && shots.every(([, , , href]) => cards[slugOf(href)])) {
        out.push(<ProductPanel key={i} shots={shots} callouts={callouts!} />);
        i = j - 1;
        continue;
      }
      out.push(
        <div
          key={i}
          className={`my-7 grid gap-4 ${shots.length > 1 ? "grid-cols-2" : "max-w-[16rem] grid-cols-1"}`}
        >
          {shots.map(([, alt, src, href]) => {
            const box = sizes[src] ?? { width: 1000, height: 1000 };
            const name = callouts?.pages[href.replace(/^\/|\/$/g, "")] ?? alt;
            return (
              <Link
                key={src}
                href={href}
                className="group flex flex-col rounded-sm border border-paper-line bg-paper-surface p-2 transition-colors hover:border-teal"
              >
                <Image
                  src={src}
                  alt={alt}
                  width={box.width}
                  height={box.height}
                  loading="lazy"
                  sizes="(max-width: 768px) 45vw, 256px"
                  className="h-40 w-full rounded-sm bg-white object-contain p-3 sm:h-48"
                />
                <span className="mt-2 mb-1 text-center text-sm font-semibold group-hover:text-teal">
                  {name}
                </span>
              </Link>
            );
          })}
        </div>
      );
      i = j - 1;
      continue;
    }

    const image = /^!\[([^\]]*)\]\(([^)\s]+)\)$/.exec(line);
    if (image) {
      // Real dimensions come from `image.width`/`height`, which the importer
      // reads out of the old-media file headers. The fallback only fires for a
      // src the article is not linked to in `article_image`; h-auto keeps the
      // true aspect ratio either way, so only the pre-load box would be nominal.
      const box = sizes[image[2]] ?? { width: 1200, height: 800 };
      out.push(
        <Image
          key={i}
          src={image[2]}
          alt={image[1]}
          width={box.width}
          height={box.height}
          sizes="(max-width: 768px) 100vw, 720px"
          className="my-8 h-auto w-full rounded-sm border border-paper-line"
        />
      );
      continue;
    }

    if (line.startsWith("|")) {
      const parsed = table(lines, i, article);
      out.push(
        <div key={i} className="rail my-8 overflow-x-auto pb-2">
          {parsed.node}
        </div>
      );
      i = parsed.end - 1;
      continue;
    }

    const list = ITEM.exec(line);
    if (article && list && !/^\d/.test(list[1])) {
      // A bullet list whose every item opens on a bold term ("**Flow.** A slow
      // tap…") is a set of definitions, and reads faster as term and text side
      // by side than as a column of dots.
      const { items, last } = listAt(lines, i);
      if (items.length >= 2 && items.every((t) => LEAD.test(t))) {
        out.push(<TermRows key={i} items={items} />);
        i = last;
        continue;
      }
    }
    if (list) {
      const ordered = /^\d/.test(list[1]);
      const items: string[] = [];
      let last = i;
      // Items are separated by blank lines throughout the corpus, so a blank is
      // not a list terminator here — a non-item line is.
      for (let j = i; j < lines.length; j++) {
        const s = lines[j].trim();
        if (!s) continue;
        const m = ITEM.exec(s);
        if (!m || /^\d/.test(m[1]) !== ordered) break;
        items.push(m[2]);
        last = j;
      }
      const Tag = ordered ? "ol" : "ul";
      out.push(
        <Tag key={i} className="my-6 flex flex-col gap-3 pl-1">
          {items.map((item, k) => (
            <li key={k} className="flex gap-3 leading-relaxed">
              <span
                aria-hidden="true"
                className={
                  ordered
                    ? "readout shrink-0 text-sm text-teal"
                    : "mt-[0.6em] size-1.5 shrink-0 rounded-full bg-teal"
                }
              >
                {ordered ? `${k + 1}.` : null}
              </span>
              <span>{inline(item)}</span>
            </li>
          ))}
        </Tag>
      );
      i = last;
      continue;
    }

    // Paragraph: every following line until a blank or a structural line.
    const buf = [line];
    let j = i + 1;
    for (; j < lines.length; j++) {
      const s = lines[j].trim();
      if (!s || STRUCTURAL.test(s)) break;
      buf.push(s);
    }
    // Under an FAQ heading, "**Question?**" with its answer on the next line is
    // a question and answer. It becomes a native disclosure: scannable as a list
    // of questions, no script, and the answer stays in the HTML for search.
    const faq = article && inFaq ? FAQ_ITEM.exec(buf.join(" ")) : null;
    if (faq) {
      out.push(
        <details
          key={i}
          className="group border-b border-paper-line [:not(details)+&]:mt-6 [:not(details)+&]:border-t"
        >
          <summary className="flex cursor-pointer list-none items-start justify-between gap-4 py-4 font-semibold leading-snug transition-colors hover:text-teal [&::-webkit-details-marker]:hidden">
            <span>{inline(faq[1])}</span>
            <Plus
              size={18}
              aria-hidden="true"
              className="mt-0.5 shrink-0 text-teal transition-transform duration-200 group-open:rotate-45 motion-reduce:transition-none"
            />
          </summary>
          <p className="pb-5 pr-8 leading-[var(--leading-prose)] text-paper-ink/90">{inline(faq[2])}</p>
        </details>
      );
      i = j - 1;
      continue;
    }
    // Leading is a token, not a literal: DESIGN.md § Typography gives
    // light-on-dark +0.05 over the light-mode equivalent, and the reading
    // surface is now whichever ground the visitor chose.
    out.push(
      <p key={i} className="my-5 leading-[var(--leading-prose)]">
        {inline(buf.join(" "))}
      </p>
    );
    i = j - 1;
  }

  return <>{out}</>;
}

/**
 * The inline half of the renderer above, with no block handling and no
 * paragraph of its own.
 *
 * The category page's guide, reason and FAQ copy is one paragraph per row and
 * the surrounding component owns its type — measure, leading and colour differ
 * per block. Wrapping those strings in `Markdown` would hand the paragraph
 * class back to this file, where it would have to be right for all three.
 * Links and emphasis are the only constructs those columns carry.
 */
export function Inline({ text }: { text: string }) {
  return <>{inline(text)}</>;
}

const HEADING: Record<number, string> = {
  2: "mt-12 mb-4 text-[clamp(1.5rem,1.2rem+1vw,2rem)] font-semibold tracking-[-0.03em]",
  3: "mt-9 mb-3 text-[1.25rem] font-semibold tracking-[-0.025em]",
  4: "mt-7 mb-2 text-[1.0625rem] font-semibold",
};

const ITEM = /^([-*+]|\d+[.)]) +(.*)$/;
/** A list item that opens on a bold term: "**Wet kitchen:** the most…", "**它是什么：**把…". */
const LEAD = /^\*\*([^*]+?)[:.：。]?\*\*[:.：。]?\s*(.*)$/;
/** The FAQ section's heading in any edition: "Steam oven FAQs", "Soalan lazim…", "…常见问题". */
const FAQ_HEADING = /\bFAQs?\b|soalan lazim|常见问题/i;
/** "**Question?** Answer", the shape every FAQ in the hand-written guides takes. */
const FAQ_ITEM = /^\*\*([^*]+[?？])\*\*\s+(.+)$/;

/** The index of the next non-blank line after `i`, or -1. */
function nextLine(lines: string[], i: number): number {
  for (let j = i + 1; j < lines.length; j++) if (lines[j].trim()) return j;
  return -1;
}

/** The bullet items from `start` on, blank lines allowed between, as the list block reads them. */
function listAt(lines: string[], start: number): { items: string[]; last: number } {
  const items: string[] = [];
  let last = start;
  for (let j = start; j < lines.length; j++) {
    const s = lines[j].trim();
    if (!s) continue;
    const m = ITEM.exec(s);
    if (!m || /^\d/.test(m[1])) break;
    items.push(m[2]);
    last = j;
  }
  return { items, last };
}

const slugOf = (href: string) => href.replace(/^\/|\/$/g, "");

/**
 * The article's sections, in the order Markdown numbers them, for the contents
 * list beside the body. Inline markup is stripped to its words.
 */
export function outline(md: string): string[] {
  return md
    .split("\n")
    .map((l) => /^## +(.*)$/.exec(l.trim()))
    .filter((m): m is RegExpExecArray => m !== null)
    .map((m) => m[1].replace(/\[([^\]]*)\]\([^)]*\)/g, "$1").replace(/\*\*?/g, "").trim());
}

/**
 * Term beside text, one row per item, ruled between. Used for the summary panel
 * (compact) and for any bullet list that is really a set of definitions. Items
 * without a bold lead still render, as a full-width row.
 */
function TermRows({ items, compact = false }: { items: string[]; compact?: boolean }) {
  return (
    <dl className={compact ? "" : "my-7"}>
      {items.map((item, k) => {
        const m = LEAD.exec(item);
        return (
          <div
            key={k}
            className={`grid gap-x-8 gap-y-1 border-paper-line sm:grid-cols-[minmax(9rem,14rem)_1fr] ${
              compact ? "py-4" : "py-3"
            } ${k > 0 || !compact ? "border-t" : ""}`}
          >
            {m ? (
              <>
                <dt
                  className={`font-semibold leading-snug text-paper-ink ${
                    compact ? "text-[1.125rem] tracking-[-0.02em]" : ""
                  }`}
                >
                  {inline(m[1])}
                </dt>
                <dd className="leading-relaxed text-paper-ink/90 first-letter:uppercase">{inline(m[2])}</dd>
              </>
            ) : (
              <dd className="leading-relaxed sm:col-span-2">{inline(item)}</dd>
            )}
          </div>
        );
      })}
    </dl>
  );
}

/**
 * The models a passage names, as a slice of the product world set into the
 * reading surface: a teal-tinted panel (built from tokens, so it holds its
 * contrast on both grounds), each model on a white well the way its studio
 * shot was taken, with its best-for line and its first three measured facets
 * in the readout face. This is the one loud element an article has.
 */
function ProductPanel({ shots, callouts }: { shots: RegExpExecArray[]; callouts: Callouts }) {
  const n = shots.length;
  const single = n === 1;
  // Columns follow the count so no model is left alone on a row: pairs and
  // fours go two across, threes (and anything larger) three across. Three
  // across is narrow, so those cards carry two facets rather than three.
  const threeUp = n === 3 || n >= 5;
  const facetCount = threeUp ? 2 : 3;
  return (
    <div className="my-10 rounded-sm border border-teal/40 bg-[color-mix(in_oklch,var(--color-teal)_11%,var(--color-paper))] p-4 sm:p-5">
      <ul
        className={
          single
            ? "grid"
            : `grid gap-5 sm:gap-x-5 sm:gap-y-8 ${threeUp ? "sm:grid-cols-3" : "sm:grid-cols-2"}`
        }
      >
        {shots.map(([, alt, src, href]) => {
          const p = callouts.products![slugOf(href)];
          const model = p.secondary_model ? `${p.model_code} + ${p.secondary_model}` : p.model_code;
          return (
            <li key={src}>
              <Link
                href={href}
                className={`group flex h-full gap-4 ${single ? "flex-col sm:flex-row sm:items-center sm:gap-6" : "sm:flex-col"}`}
              >
                <div
                  className={`relative shrink-0 overflow-hidden rounded-sm bg-white ${
                    single ? "h-40 sm:h-36 sm:w-52" : "size-28 sm:h-36 sm:w-auto"
                  }`}
                >
                  <Image
                    src={src}
                    alt={alt}
                    fill
                    loading="lazy"
                    sizes="(max-width: 640px) 90vw, 240px"
                    className="object-contain p-3 transition-transform duration-500 ease-[var(--ease-out-expo)] group-hover:scale-[1.04] motion-reduce:transition-none"
                  />
                </div>
                <div className="flex min-w-0 flex-1 flex-col">
                  <p className="readout text-xs text-teal">{model}</p>
                  <p className="mt-1 pb-3.5 font-semibold leading-snug text-paper-ink transition-colors group-hover:text-teal">
                    {p.name}
                  </p>
                  {p.best_for && (
                    <p className="-mt-2 pb-3.5 text-sm leading-snug text-paper-muted">
                      {callouts.labels.bestFor}: {p.best_for}
                    </p>
                  )}
                  {p.facets.length > 0 && (
                    <dl className="mt-auto flex flex-wrap gap-x-5 gap-y-2 border-t border-paper-line pt-3">
                      {p.facets.slice(0, facetCount).map((f) => (
                        <div key={f.facet}>
                          <dt className="text-[0.625rem] uppercase tracking-[0.12em] text-paper-muted">
                            {callouts.labels.facet(f.label)}
                          </dt>
                          <dd className="readout text-sm text-paper-ink">
                            {Number.isInteger(f.value) ? f.value.toLocaleString(callouts.labels.tag) : f.value}
                            {f.unit && (
                              <span className="text-paper-muted">{f.unit === "%" ? "%" : ` ${f.unit}`}</span>
                            )}
                          </dd>
                        </div>
                      ))}
                    </dl>
                  )}
                  <span className="mt-3 inline-flex items-center gap-1.5 text-sm font-medium text-teal">
                    {callouts.labels.viewProduct(p.model_code)}
                    <ArrowRight
                      size={16}
                      aria-hidden="true"
                      className="transition-transform group-hover:translate-x-0.5 motion-reduce:transition-none"
                    />
                  </span>
                </div>
              </Link>
            </li>
          );
        })}
      </ul>
    </div>
  );
}
const STANDALONE = /^(?:👉\s*|\*\*RELATED:\*\*\s*)?\[([^\]]+)\]\(([^)\s]+)\)$/;
const STRUCTURAL = /^(#{2,4} |[-*+] |\d+[.)] |!\[|\[!\[|\||👉\s*\[|\*\*RELATED:\*\*)/;
const PRODUCT_SHOT = /^\[!\[([^\]]*)\]\(([^)\s]+)\)\]\((\/[^)\s]*)\)$/;

/** `image.url` -> the dimensions stored for it, for the 221 body placements. */
export type ImageSizes = Record<string, { width: number; height: number }>;

/* ── callouts ────────────────────────────────────────────────────────────── */

/** What a standalone link can resolve to, keyed by site-relative path. */
export type CalloutArticle = {
  /** URL without surrounding slashes, prefix included: 'ms/panduan-membeli/x'. */
  path: string;
  lang: string;
  title: string;
  section_name: string;
  reading_minutes: number | null;
  url: string | null;
  alt: string | null;
};
export type Callouts = {
  /** Published articles by path: 'tips-tricks/what-is-auto-clean'. */
  articles: Record<string, CalloutArticle>;
  /** Category and product display names by slug. */
  pages: Record<string, string>;
  /** The models the article links to as product shots, for the product panel. */
  products?: Record<string, ProductCard>;
  /** The page's own words for the card and button chrome (src/i18n). */
  labels: {
    related: string;
    minRead: string;
    readTheGuide: string;
    explore: (name: string) => string;
    viewProduct: (model: string) => string;
    bestFor: string;
    /** A facet label as stored (English) in the page's language. */
    facet: (label: string) => string;
    /** BCP 47 tag for number formatting. */
    tag: string;
  };
};

const WHATSAPP_HREF = /^https:\/\/(wa\.me|api\.whatsapp\.com)\//;

function Callout({
  label,
  href,
  callouts,
}: {
  label: string;
  href: string;
  callouts?: Callouts;
}) {
  // Labels arrive bolded now and then ("[**range hood maintenance**]").
  const text = label.replace(/\*\*/g, "").trim();

  if (WHATSAPP_HREF.test(href)) {
    return (
      <div className="my-7">
        <a
          href={href}
          target="_blank"
          rel="noopener"
          className="inline-flex items-center gap-2.5 rounded-sm bg-teal px-5 py-3 font-semibold text-void transition-opacity hover:opacity-90"
        >
          <WhatsappLogo size={20} weight="fill" aria-hidden="true" />
          {text}
        </a>
      </div>
    );
  }

  if (href.startsWith("/")) {
    const path = href.replace(/^\/|\/$/g, "");
    const article = callouts?.articles[path];
    if (article) return <ArticleCallout article={article} labels={callouts!.labels} />;

    // The scrape left a few anchors that are the URL itself
    // ("[/vatti-dishwasher-dwbb7/](/dishwasher-in-malaysia/)"). The page's own
    // name reads better than its address.
    const name = callouts?.pages[path];
    const shown =
      /^(https?:\/\/|\/)/.test(text) && name && callouts ? callouts.labels.explore(name) : text;
    return (
      <div className="my-7">
        <Link
          href={href}
          className="group inline-flex items-center gap-2 rounded-sm border border-line-strong px-5 py-3 font-medium text-paper-ink transition-colors hover:border-teal hover:text-teal"
        >
          {shown}
          <ArrowRight
            size={18}
            aria-hidden="true"
            className="transition-transform group-hover:translate-x-0.5"
          />
        </Link>
      </div>
    );
  }

  // Any other standalone link is a sentence like any other.
  return <p className="my-5 leading-[var(--leading-prose)]">{inline(`[${label}](${href})`)}</p>;
}

/**
 * The pointer to a sibling guide, as a card. Same bones as the MoreCard at the
 * foot of the article page (paper-line border, paper-surface ground, teal on
 * hover) laid on its side so it sits inside a column of prose without reading
 * as a section of its own. The thumbnail is the guide's own hero.
 */
function ArticleCallout({
  article,
  labels,
}: {
  article: CalloutArticle;
  labels: Callouts["labels"];
}) {
  return (
    <Link
      href={`/${article.path}/`}
      lang={article.lang}
      className="group my-8 flex gap-4 rounded-sm border border-paper-line bg-paper-surface p-4 transition-colors hover:border-teal sm:gap-5 sm:p-5"
    >
      {article.url && (
        <div className="relative size-20 shrink-0 overflow-hidden rounded-sm bg-paper sm:size-28">
          <Image
            src={article.url}
            alt={article.alt ?? ""}
            fill
            loading="lazy"
            sizes="112px"
            className="object-cover"
          />
        </div>
      )}
      <div className="min-w-0 flex-1 self-center">
        <p className="readout text-xs text-paper-muted">
          {labels.related}
          <span aria-hidden="true"> · </span>
          {article.section_name}
          {article.reading_minutes && (
            <>
              <span aria-hidden="true"> · </span>
              {article.reading_minutes} {labels.minRead}
            </>
          )}
        </p>
        <p className="mt-2 font-semibold leading-snug text-paper-ink transition-colors group-hover:text-teal">
          {article.title}
        </p>
        <p className="mt-3 inline-flex items-center gap-1.5 text-sm font-medium text-teal">
          {labels.readTheGuide}
          <ArrowRight
            size={16}
            aria-hidden="true"
            className="transition-transform group-hover:translate-x-0.5"
          />
        </p>
      </div>
    </Link>
  );
}

/* ── inline ──────────────────────────────────────────────────────────────── */

function inline(text: string): ReactNode[] {
  const out: ReactNode[] = [];
  let at = 0;
  let key = 0;

  // Built per call, not hoisted: link labels are parsed recursively and a shared
  // /g regex would have its lastIndex reset by the inner call mid-loop.
  const re = /\[([^\]]*)\]\(([^)\s]+)\)|\*\*([^*]+)\*\*|\*([^*\n]+)\*/g;
  for (let m = re.exec(text); m; m = re.exec(text)) {
    if (m.index > at) out.push(text.slice(at, m.index));
    at = m.index + m[0].length;

    if (m[2] !== undefined) {
      // Body hrefs were rewritten to the CDN and to site-relative paths at
      // import; nothing is rewritten again here.
      const href = m[2];
      const label = inline(m[1]);
      if (href === "#") {
        // 17 dead anchors — WordPress's "Print" and "Enquire With Us" buttons,
        // which lost their JavaScript. A link to nowhere is worse than text.
        out.push(<span key={key++}>{label}</span>);
      } else if (href.startsWith("/")) {
        out.push(
          <Link key={key++} href={href} className={LINK}>
            {label}
          </Link>
        );
      } else {
        out.push(
          <a key={key++} href={href} target="_blank" rel="noopener" className={LINK}>
            {label}
          </a>
        );
      }
    } else if (m[3] !== undefined) {
      out.push(
        <strong key={key++} className="font-semibold text-paper-ink">
          {inline(m[3])}
        </strong>
      );
    } else {
      out.push(<em key={key++}>{inline(m[4])}</em>);
    }
  }
  if (at < text.length) out.push(text.slice(at));
  return out;
}

const LINK =
  "text-teal underline decoration-teal/35 underline-offset-[3px] transition-colors hover:decoration-teal";

/* ── tables ──────────────────────────────────────────────────────────────── */

/**
 * GitHub-style tables: a header row, an alignment row, then the body, one row
 * per line and every row fenced with a leading and trailing pipe.
 *
 *     | What You Notice | BLDC Motor Hood | Traditional AC Motor Hood |
 *     | --- | --- | --- |
 *     | Noise | Runs quietly, even at higher speeds | Often louder |
 *
 * scripts/import-articles.mjs is the only writer and emits exactly that shape,
 * splicing the rows back from the intact markup the WordPress REST API still
 * serves — the scrape in research/articles.json had flattened them into loose
 * cells with the row boundaries gone. No cell contains a `|`.
 */
function table(lines: string[], start: number, article = false): { node: ReactNode; end: number } {
  const rows: string[][] = [];
  let end = start;
  for (let i = start; i < lines.length; i++) {
    const raw = lines[i].trim();
    if (!raw.startsWith("|")) break;
    rows.push(raw.replace(/^\|/, "").replace(/\|$/, "").split("|").map((c) => c.trim()));
    end = i + 1;
  }
  // Row 1 is the alignment row. It is required by the format and renders nothing.
  const body = rows.slice(2);

  if (article) {
    // In an article the table is usually the comparison the reader came for,
    // so it gets a ground of its own: a tinted header band, the first column
    // set as the row's name, and rows ruled rather than boxed.
    return {
      node: (
        <table className="w-full min-w-[34rem] border-collapse overflow-hidden rounded-sm border border-paper-line text-left text-[0.9375rem]">
          <thead className="bg-paper-surface">
            <tr>
              {rows[0].map((c, i) => (
                <th key={i} scope="col" className="px-4 py-3 align-bottom font-semibold">
                  {inline(c)}
                </th>
              ))}
            </tr>
          </thead>
          <tbody>
            {body.map((row, r) => (
              <tr key={r} className="border-t border-paper-line align-top">
                {row.map((c, i) =>
                  i === 0 ? (
                    <th key={i} scope="row" className="px-4 py-3 font-semibold leading-snug">
                      {inline(c)}
                    </th>
                  ) : (
                    <td key={i} className="px-4 py-3 leading-relaxed text-paper-ink/90">
                      {inline(c)}
                    </td>
                  )
                )}
              </tr>
            ))}
          </tbody>
        </table>
      ),
      end,
    };
  }

  return {
    node: (
      <table className="w-full min-w-[34rem] border-collapse text-left text-[0.9375rem]">
        <thead>
          <tr className="border-b-2 border-paper-line">
            {rows[0].map((c, i) => (
              <th key={i} scope="col" className="py-3 pr-6 align-top font-semibold">
                {inline(c)}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {body.map((row, r) => (
            <tr key={r} className="border-b border-paper-line align-top">
              {row.map((c, i) => (
                <td key={i} className="py-3 pr-6 leading-relaxed">
                  {inline(c)}
                </td>
              ))}
            </tr>
          ))}
        </tbody>
      </table>
    ),
    end,
  };
}
