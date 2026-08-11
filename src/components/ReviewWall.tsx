"use client";

import Image from "next/image";
import { useRef, useState } from "react";

import type { Review } from "@/lib/queries/category";
import { GOOGLE_REVIEWS } from "@/lib/site";

/**
 * The Google reviews, in the shape the live site's Trustindex widget renders
 * them: a rating panel, then a rail of cards you can push along.
 *
 * Rendered from our own `review` table rather than by embedding the widget.
 * The embed is a render-blocking third-party script on the highest-traffic
 * template on the site, its markup is not ours to make accessible, and it goes
 * dark whenever Trustindex does. Every value here — the five stars, the dates,
 * the aggregate count — was read out of that widget's own markup, so this is
 * the same information without the runtime dependency.
 *
 * Deliberately NO Review or AggregateRating JSON-LD. Self-serving review
 * markup on your own site is against Google's structured data guidelines, and
 * the penalty for getting that wrong is worse than the rich result is worth.
 */
export function ReviewWall({ reviews, heading }: { reviews: Review[]; heading: string }) {
  const rail = useRef<HTMLUListElement>(null);

  /** One card plus its gap, so a press moves by exactly one card. */
  function push(direction: 1 | -1) {
    const el = rail.current;
    if (!el) return;
    const card = el.firstElementChild as HTMLElement | null;
    const step = card ? card.offsetWidth + 20 : el.clientWidth;
    el.scrollBy({ left: step * direction, behavior: "smooth" });
  }

  if (reviews.length === 0) return null;

  return (
    <section aria-labelledby="reviews-heading" className="border-y border-line bg-surface">
      <div className="mx-auto max-w-6xl px-5 py-16 sm:px-8 sm:py-24">
        <h2
          id="reviews-heading"
          className="mx-auto max-w-[24ch] text-balance text-center text-3xl font-semibold tracking-[-0.03em] sm:text-4xl"
        >
          {heading}
        </h2>

        <div className="mt-12 grid gap-8 lg:grid-cols-[minmax(0,0.7fr)_minmax(0,2.3fr)] lg:items-center lg:gap-12">
          {/* The aggregate. "Excellent" is Trustindex's own band for a 4.5+
              average and it is the word the live site prints, so it is theirs
              rather than ours to justify. */}
          <div className="text-center">
            <p className="text-2xl font-semibold uppercase tracking-[0.06em]">Excellent</p>
            <Stars count={5} className="mt-3 justify-center text-2xl" label="Rated 5 out of 5" />
            <p className="mt-3 text-sm text-ink-muted">
              Based on <span className="readout font-semibold text-ink">{GOOGLE_REVIEWS}</span>{" "}
              reviews
            </p>
            <Image
              src="/google-mark.svg"
              alt="Google"
              width={28}
              height={28}
              className="mx-auto mt-4"
            />
          </div>

          {/* min-w-0 is load-bearing. A grid track sized `auto` takes its base
              size from its items' min-content, and the min-content of a nowrap
              flex row is the sum of its items — ten 17rem cards, 2,900px. The
              rail scrolls, so it never needed that width, but the track grew to
              it anyway and pushed the whole page sideways. The lg template
              guards the same trap with minmax(0,…); below lg the column is
              implicit and this is the only place to say it. */}
          <div className="relative min-w-0">
            {/* Scroll-snap and a real scrollbar underneath, so the rail works
                by swipe, by trackpad and by keyboard even before the arrows
                are found. The bar was hidden here at first, on the grounds
                that the arrows covered it — but hiding the one control that
                shows POSITION as well as direction left no way to tell three
                reviews from ten. It is themed now, so there is nothing to
                hide from. */}
            <ul
              ref={rail}
              className="rail flex snap-x snap-mandatory gap-5 overflow-x-auto pb-3"
            >
              {reviews.map((review) => (
                <li
                  key={`${review.author}-${review.posted_at}`}
                  className="w-[17rem] shrink-0 snap-start sm:w-[19rem]"
                >
                  <ReviewCard review={review} />
                </li>
              ))}
            </ul>

            <div className="mt-5 flex justify-center gap-3 lg:justify-end">
              {([-1, 1] as const).map((d) => (
                <button
                  key={d}
                  type="button"
                  onClick={() => push(d)}
                  className="flex size-10 items-center justify-center rounded-full border border-line-strong text-ink transition-colors hover:border-teal hover:text-teal"
                >
                  <span aria-hidden="true">{d === -1 ? "←" : "→"}</span>
                  <span className="sr-only">{d === -1 ? "Previous" : "Next"} reviews</span>
                </button>
              ))}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}

/** Long reviews collapse. Two of the ten run past 350 characters. */
const CLAMP = 190;

function ReviewCard({ review }: { review: Review }) {
  const [open, setOpen] = useState(false);
  const long = review.body.length > CLAMP;

  return (
    <figure className="flex h-full flex-col rounded-sm bg-void p-5">
      <div className="flex items-start gap-3">
        <Avatar name={review.author} />
        <figcaption className="min-w-0 flex-1">
          <p className="truncate font-semibold leading-tight">{review.author}</p>
          <p className="mt-1 text-xs text-ink-muted">{ago(review.posted_at)}</p>
        </figcaption>
        <Image src="/google-mark.svg" alt={`Posted on ${review.source}`} width={18} height={18} />
      </div>

      <Stars count={review.rating} className="mt-4" label={`${review.rating} out of 5`} />

      <blockquote className="mt-3 whitespace-pre-line text-sm leading-relaxed text-ink">
        {open || !long ? review.body : `${review.body.slice(0, CLAMP).trimEnd()}…`}
      </blockquote>

      {long && (
        <button
          type="button"
          onClick={() => setOpen((v) => !v)}
          className="mt-3 self-start text-sm text-teal transition-opacity hover:opacity-80"
        >
          {open ? "Show less" : "Read more"}
        </button>
      )}
    </figure>
  );
}

/**
 * Initials on a tinted disc, not the reviewer's Google profile photo.
 *
 * The widget hotlinks those from googleusercontent.com, which puts a request
 * for a named individual's picture on every page load, breaks when the URL
 * rotates, and copies someone's photograph onto our CDN if we mirror it. The
 * initial is what every review platform falls back to anyway.
 *
 * The tint is derived from the name so a given reviewer keeps the same colour
 * between builds, and it is a rotation of the brand hue rather than a random
 * one, so the row cannot land on a colour the palette does not own.
 */
function Avatar({ name }: { name: string }) {
  const seed = [...name].reduce((n, c) => n + c.charCodeAt(0), 0);
  const hue = 200 + ((seed % 5) - 2) * 34;

  return (
    <span
      aria-hidden="true"
      style={{ background: `oklch(0.52 0.07 ${hue})` }}
      className="flex size-10 shrink-0 items-center justify-center rounded-full text-sm font-semibold text-white"
    >
      {name.trim().charAt(0).toUpperCase()}
    </span>
  );
}

function Stars({
  count,
  className = "",
  label,
}: {
  count: number;
  className?: string;
  label: string;
}) {
  return (
    <p className={`flex gap-0.5 leading-none text-ember ${className}`}>
      <span aria-hidden="true">{"★".repeat(count)}</span>
      <span className="sr-only">{label}</span>
    </p>
  );
}

/**
 * "4 months ago", the way every review platform writes it.
 *
 * Computed at render rather than stored, so it does not go stale — but this is
 * a Client Component and the page is statically generated, so the server pass
 * stamps build time and the browser corrects it on hydration. The two agree to
 * within a month for anything older than a month, which every one of these is.
 */
function ago(iso: string): string {
  const days = Math.floor((Date.now() - new Date(iso).getTime()) / 86_400_000);
  if (days < 30) return days <= 1 ? "today" : `${days} days ago`;
  const months = Math.floor(days / 30);
  if (months < 12) return months === 1 ? "a month ago" : `${months} months ago`;
  const years = Math.floor(days / 365);
  return years === 1 ? "a year ago" : `${years} years ago`;
}
