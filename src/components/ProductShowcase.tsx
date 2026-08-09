"use client";

import Image from "next/image";
import Link from "next/link";
import { useCallback, useEffect, useId, useRef, useState } from "react";

import type { Bestseller } from "@/lib/queries/home";

const CYCLE_MS = 6000;

/**
 * Supplied in-kitchen renders, keyed by model code, used here instead of the
 * catalogue image.
 *
 * The database hero for each of these is a cut-out on a transparent ground,
 * which is the right picture for a product page and a weak one for a homepage
 * showcase: it shows the appliance but not what it looks like installed. These
 * four are square, shot in context, and consistent with each other. Nothing
 * else changes — the product pages still render the catalogue images from R2.
 *
 * A model with no entry here falls back to its catalogue image, so adding a
 * slug to BESTSELLER_SLUGS cannot produce a blank panel.
 */
const SHOWCASE_IMAGES: Record<string, string> = {
  V919: "/showcase-v919.webp",
  C861G: "/showcase-c861g.webp",
  VA06: "/showcase-va06.webp",
  VA05: "/showcase-va05.webp",
};

/**
 * The promoted models, one at a time, picked from a list.
 *
 * This replaces a horizontal scroll strip. Four cards in a snap row always cut
 * the last one in half, and a half-visible card is only an affordance if the
 * visitor already knows the row scrolls — on desktop, with no scrollbar and no
 * touch, most do not. A tab list has no hidden state: every model is named, the
 * selected one is obvious, and nothing is clipped.
 *
 * Auto-advance stops on hover, on keyboard focus anywhere inside, and entirely
 * under prefers-reduced-motion. WCAG 2.2.2 wants a way to pause anything that
 * moves on its own, and hover alone does not give keyboard users one.
 */
export function ProductShowcase({ products }: { products: Bestseller[] }) {
  const baseId = useId();
  const [active, setActive] = useState(0);
  const [paused, setPaused] = useState(false);
  const [still, setStill] = useState(false);
  const [onScreen, setOnScreen] = useState(false);
  const tabRefs = useRef<(HTMLButtonElement | null)[]>([]);
  const rootRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const query = window.matchMedia("(prefers-reduced-motion: reduce)");
    const sync = () => setStill(query.matches);
    sync();
    query.addEventListener("change", sync);
    return () => query.removeEventListener("change", sync);
  }, []);

  // Only cycle while the section is actually on screen. Otherwise a visitor who
  // reads the page top to bottom arrives to find it already on the third model,
  // having missed the first two entirely.
  useEffect(() => {
    const el = rootRef.current;
    if (!el) return;
    const io = new IntersectionObserver(([entry]) => setOnScreen(entry.isIntersecting), {
      threshold: 0.4,
    });
    io.observe(el);
    return () => io.disconnect();
  }, []);

  const go = useCallback(
    (next: number) => setActive((next + products.length) % products.length),
    [products.length]
  );

  const cycling = onScreen && !paused && !still && products.length > 1;

  useEffect(() => {
    if (!cycling) return;
    const timer = setTimeout(() => go(active + 1), CYCLE_MS);
    return () => clearTimeout(timer);
  }, [active, cycling, go]);

  /** Roving focus, the arrow-key behaviour a tablist is expected to have. */
  function onKeyDown(event: React.KeyboardEvent, index: number) {
    const map: Record<string, number> = {
      ArrowDown: index + 1,
      ArrowRight: index + 1,
      ArrowUp: index - 1,
      ArrowLeft: index - 1,
      Home: 0,
      End: products.length - 1,
    };
    const next = map[event.key];
    if (next === undefined) return;
    event.preventDefault();
    const target = (next + products.length) % products.length;
    setActive(target);
    tabRefs.current[target]?.focus();
  }

  if (products.length === 0) return null;
  const current = products[active];

  return (
    <div
      ref={rootRef}
      className="grid gap-8 lg:grid-cols-[minmax(0,0.85fr)_minmax(0,1.15fr)] lg:gap-14"
      onMouseEnter={() => setPaused(true)}
      onMouseLeave={() => setPaused(false)}
      onFocusCapture={() => setPaused(true)}
      onBlurCapture={() => setPaused(false)}
    >
      {/* The picture leads on a phone, where the list would otherwise push it
          off the first screen of the section. */}
      <div className="order-1 lg:order-2">
        {/* Square, because the renders are square and composed to the edges:
            the hood needs its chimney at the top and its hob at the bottom,
            and a 4:3 crop takes both. No plate and no padding either — these
            are photographs that fill the frame, not cut-outs floating on one. */}
        <div className="relative aspect-square overflow-hidden rounded-sm border border-line bg-raised">
          {products.map((product, index) => {
            const src = SHOWCASE_IMAGES[product.model_code] ?? product.url;
            const inContext = product.model_code in SHOWCASE_IMAGES;
            return (
              <div
                key={product.slug}
                id={`${baseId}-panel-${index}`}
                role="tabpanel"
                aria-labelledby={`${baseId}-tab-${index}`}
                hidden={index !== active}
                className="absolute inset-0"
              >
                {/* Keyed on the active index so the fade replays on every
                    change. A tabpanel that is not selected is `hidden`, so the
                    outgoing picture cannot cross-fade with the incoming one —
                    the new one settling in is the whole transition. */}
                {src && (
                  <Image
                    key={active}
                    src={src}
                    alt={
                      inContext
                        ? `A VATTI ${product.model_code} ${product.category.toLowerCase()} installed in a fitted kitchen.`
                        : (product.alt ?? product.name)
                    }
                    fill
                    sizes="(max-width: 1024px) 100vw, 620px"
                    className={`animate-panel ${
                      inContext ? "object-cover" : "object-contain p-8 sm:p-12"
                    }`}
                  />
                )}
              </div>
            );
          })}
        </div>

        <div className="mt-4 flex items-center justify-between gap-4">
          <p className="readout text-xs text-ink-muted">
            {active + 1} / {products.length}
          </p>
          <div className="flex gap-2">
            <button
              type="button"
              onClick={() => go(active - 1)}
              className="rounded-sm border border-line-strong px-3 py-1.5 text-ink transition-colors hover:border-teal hover:text-teal"
            >
              <span aria-hidden>←</span>
              <span className="sr-only">Previous model</span>
            </button>
            <button
              type="button"
              onClick={() => go(active + 1)}
              className="rounded-sm border border-line-strong px-3 py-1.5 text-ink transition-colors hover:border-teal hover:text-teal"
            >
              <span aria-hidden>→</span>
              <span className="sr-only">Next model</span>
            </button>
          </div>
        </div>
      </div>

      <div
        role="tablist"
        aria-orientation="vertical"
        aria-label="Promoted models"
        // Top-aligned, not centred: against a square panel the list was
        // floating in the middle of it. Sharing a top edge with the picture
        // gives the two columns something to line up on.
        className="order-2 self-start lg:order-1"
      >
        {products.map((product, index) => {
          const selected = index === active;
          return (
            <button
              key={product.slug}
              ref={(el) => {
                tabRefs.current[index] = el;
              }}
              id={`${baseId}-tab-${index}`}
              role="tab"
              type="button"
              aria-selected={selected}
              aria-controls={`${baseId}-panel-${index}`}
              tabIndex={selected ? 0 : -1}
              onClick={() => setActive(index)}
              onKeyDown={(e) => onKeyDown(e, index)}
              className="group relative flex w-full items-baseline gap-4 border-t border-line py-5 pl-4 text-left last:border-b"
            >
              {/* The rail carries the countdown to the next model, so the
                  movement explains itself instead of the picture simply
                  changing on its own. */}
              <span
                aria-hidden
                className="absolute inset-y-0 left-0 w-0.5 overflow-hidden bg-line"
              >
                {selected && (
                  <span
                    key={`${active}-${paused}-${still}`}
                    className={`block w-full origin-top bg-teal ${
                      paused || still ? "h-full" : "h-full animate-tab-rail"
                    }`}
                  />
                )}
              </span>

              <span
                className={`readout shrink-0 text-xs transition-colors ${
                  selected ? "text-teal" : "text-ink-muted"
                }`}
              >
                {product.model_code}
              </span>

              <span className="flex-1">
                {/* One size for every row. Growing the selected name reflowed
                    the list on each advance, and a list that shuffles itself
                    while you are reading it is worse than a quieter highlight.
                    Colour, weight and the rail carry the selection instead. */}
                <span
                  className={`block text-lg font-semibold tracking-[-0.02em] transition-colors ${
                    selected ? "text-ink" : "text-ink-muted group-hover:text-ink"
                  }`}
                >
                  {product.name}
                </span>
                <span className="mt-1 block text-sm text-ink-muted">{product.category}</span>
              </span>
            </button>
          );
        })}

        <Link
          href={`/${current.slug}/`}
          className="mt-6 inline-block text-teal transition-opacity hover:opacity-80"
        >
          View the {current.model_code} →
        </Link>
      </div>
    </div>
  );
}
