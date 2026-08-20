"use client";

import { useEffect, useState } from "react";

export type NavSection = { id: string; label: string };

/**
 * A rail of the page's own sections, stuck under the header, marking the one
 * being read.
 *
 * The product page is nine sections long now. On a phone, where two thirds of
 * this site's traffic is, "where is the size" costs a lot of thumb, and the
 * sections a buyer wants are rarely the ones at the top: the dimensions and the
 * questions are what close a shortlist.
 *
 * Plain anchors, so it works with JavaScript off and every entry is a real URL
 * that can be shared. The observer only adds the marking.
 *
 * Marking rule: the LAST section whose top has passed the rail. An
 * intersection-ratio rule marks whichever section happens to be biggest on
 * screen, which flickers between two short ones and skips a long one entirely.
 */
export function ProductNav({ sections }: { sections: NavSection[] }) {
  const [active, setActive] = useState(sections[0]?.id);

  useEffect(() => {
    const nodes = sections
      .map((s) => document.getElementById(s.id))
      .filter((n): n is HTMLElement => n !== null);
    if (!nodes.length) return;

    // rootMargin's top is the header plus this rail, so a section counts as
    // reached the moment its heading clears them rather than the viewport.
    const io = new IntersectionObserver(
      () => {
        const line = HEADER + RAIL + 8;
        let current = nodes[0];
        for (const node of nodes) {
          if (node.getBoundingClientRect().top <= line) current = node;
        }
        setActive(current.id);
      },
      { rootMargin: `-${HEADER + RAIL}px 0px 0px 0px`, threshold: [0, 0.01, 0.5, 1] }
    );
    for (const node of nodes) io.observe(node);
    return () => io.disconnect();
  }, [sections]);

  if (sections.length < 3) return null;

  return (
    <nav
      aria-label="On this page"
      className="sticky top-[var(--header-h)] z-[calc(var(--z-sticky)-1)] border-b border-line bg-void/92 backdrop-blur-sm"
    >
      <ul className="rail mx-auto flex max-w-6xl gap-6 overflow-x-auto px-5 sm:px-8">
        {sections.map((s) => (
          <li key={s.id} className="shrink-0">
            <a
              href={`#${s.id}`}
              aria-current={active === s.id ? "true" : undefined}
              className={`block whitespace-nowrap border-b-2 py-3 text-sm transition-colors ${
                active === s.id
                  ? "border-teal text-teal"
                  : "border-transparent text-ink-muted hover:text-ink"
              }`}
            >
              {s.label}
            </a>
          </li>
        ))}
      </ul>
    </nav>
  );
}

/** Both are CSS constants — --header-h in globals.css, and this rail's own
 *  py-3 plus a 20px line. Read here rather than measured: a getBoundingClientRect
 *  on every scroll callback to learn a number that never changes is work for
 *  nothing. */
const HEADER = 53;
const RAIL = 45;
