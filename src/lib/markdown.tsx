import Image from "next/image";
import Link from "next/link";
import type { ReactNode } from "react";

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
export function Markdown({ md, sizes = {} }: { md: string; sizes?: ImageSizes }) {
  const lines = md.split("\n");
  const out: ReactNode[] = [];

  for (let i = 0; i < lines.length; i++) {
    const line = lines[i].trim();
    if (!line) continue;

    const heading = /^(#{2,4}) +(.*)$/.exec(line);
    if (heading) {
      const level = heading[1].length;
      const Tag = `h${level}` as "h2" | "h3" | "h4";
      out.push(
        <Tag key={i} className={HEADING[level]}>
          {inline(heading[2])}
        </Tag>
      );
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
      const parsed = table(lines, i);
      out.push(
        <div key={i} className="my-8 overflow-x-auto">
          {parsed.node}
        </div>
      );
      i = parsed.end - 1;
      continue;
    }

    const list = ITEM.exec(line);
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
                    ? "readout shrink-0 text-sm text-teal-deep"
                    : "mt-[0.6em] size-1.5 shrink-0 rounded-full bg-teal-deep"
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
    out.push(
      <p key={i} className="my-5 leading-[1.75]">
        {inline(buf.join(" "))}
      </p>
    );
    i = j - 1;
  }

  return <>{out}</>;
}

const HEADING: Record<number, string> = {
  2: "mt-12 mb-4 text-[clamp(1.5rem,1.2rem+1vw,2rem)] font-semibold tracking-[-0.03em]",
  3: "mt-9 mb-3 text-[1.25rem] font-semibold tracking-[-0.025em]",
  4: "mt-7 mb-2 text-[1.0625rem] font-semibold",
};

const ITEM = /^([-*+]|\d+[.)]) +(.*)$/;
const STRUCTURAL = /^(#{2,4} |[-*+] |\d+[.)] |!\[|\|)/;

/** `image.url` -> the dimensions stored for it, for the 221 body placements. */
export type ImageSizes = Record<string, { width: number; height: number }>;

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
          <a key={key++} href={href} rel="noopener" className={LINK}>
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
  "text-teal-deep underline decoration-teal-deep/35 underline-offset-[3px] transition-colors hover:decoration-teal-deep";

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
function table(lines: string[], start: number): { node: ReactNode; end: number } {
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
