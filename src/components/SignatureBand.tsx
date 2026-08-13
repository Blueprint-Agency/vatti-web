import Image from "next/image";
import Link from "next/link";

import type { Signature } from "@/lib/queries/category";

/**
 * Where each line of the copy fades in, as a window on the section's own
 * scroll progress. `cover 0%` is the moment the track's top edge reaches the
 * bottom of the viewport and `cover 100%` the moment its bottom edge leaves
 * the top, so these are fractions of the whole pass, not seconds.
 *
 * These numbers are pinned to the 210vh track height in globals.css. Against a
 * 100dvh frame the cover pass is 310vh of scrolling, and the frame is stuck to
 * the top of the viewport between:
 *
 *     pin   = 100vh / 310vh = 32%      (track top reaches viewport top)
 *     release = 210vh / 310vh = 68%    (track bottom reaches viewport bottom)
 *
 * So every window below sits inside 32-68%: nothing moves on the way in, the
 * copy arrives while the section is held still, and the last line is in by 61%
 * — leaving a beat before the page starts moving again. Change the track
 * height and these have to be recalculated.
 */
const rise = (index: number) =>
  ({
    "--rise-from": `${34 + index * 3}%`,
    "--rise-to": `${46 + index * 3}%`,
  }) as React.CSSProperties;

/**
 * The model a category leads with, over a photograph of it working.
 *
 * Two layouts, picked by whether an installed photograph exists for the
 * category. The band below is the one this was designed for; `SignaturePlate`
 * at the foot of this file is what the remaining three categories get, and it
 * is the studio cut-out on a white well that the whole site already uses.
 *
 * Everything that moves here is scroll-driven CSS on a view-timeline (see
 * globals.css § .signature-scene). No client component, no scroll listener,
 * nothing to hydrate: the section ships as static HTML and the motion is the
 * browser's problem.
 */
export function SignatureBand({
  signature,
  scene,
  heading,
}: {
  signature: Signature;
  scene?: { src: string; alt: string; focus: string | null };
  heading: string;
}) {
  if (!scene) return <SignaturePlate signature={signature} heading={heading} />;

  return (
    // The scroll track. No overflow clip here — that would stop the frame
    // inside it from sticking, silently.
    <section
      aria-labelledby="signature-heading"
      className="signature-scene relative border-y border-line"
    >
      {/* The frame: one viewport tall, stuck to the top of the window for as
          long as the track underneath it is still passing. This is what makes
          the band hold still while the copy arrives. */}
      {/* The clip lives on the photograph, not on the frame. The drift is a
          scaled, travelling layer and has to be cut off at the edges — but the
          copy stack on a phone is within a line or two of the frame's own
          height, and a frame that clips would take the CTA off the bottom of
          the tallest of them. */}
      <div className="sticky top-0 isolate flex h-[100dvh] items-center">
        <div className="absolute inset-0 -z-10 overflow-hidden">
          <div className="signature-drift absolute inset-0">
            <Image
              src={scene.src}
              alt={scene.alt}
              fill
              sizes="100vw"
              // The frame is a full viewport tall, so cover crops hard and in
              // a different direction on a phone than on a desktop. What has
              // to survive both is the appliance, and that sits somewhere
              // different in every photograph — so the anchor comes from the
              // category alongside the picture rather than being a constant
              // here. An inline style, not an arbitrary Tailwind class:
              // Tailwind scans source for literals and would never see a value
              // that arrives from the database.
              style={{ objectPosition: scene.focus ?? undefined }}
              className="object-cover"
            />
          </div>

          {/* Portrait puts the copy across the full width, so an even knock-down
            is the honest one there. Wide viewports weight it right, where the
            copy sits, and let it off the left so the hood and the steam stay
            lit — the photograph is the argument, and a flat knock-down over
            the whole frame kills it. Same device as the home page hero, mirrored,
            and the same verified tints. */}
          <div className="absolute inset-0 bg-void/72 lg:hidden" />
          <div className="absolute inset-0 hidden bg-gradient-to-l from-void/92 via-void/55 to-void/10 lg:block" />
          {/* The foot, so the band dissolves into the section below instead of
            ending on a hard edge. */}
          <div className="absolute inset-x-0 bottom-0 h-1/4 bg-gradient-to-t from-void to-transparent" />
        </div>

        {/* items-end, not text-right: the block moves to the right of the band,
          the copy inside it stays ranged left. Right-ragged body text is
          harder to read and the readout row would lose its column edge. */}
        <div className="signature-copy mx-auto flex w-full max-w-6xl flex-col px-5 py-20 sm:px-8 lg:items-end">
          <div className="w-full max-w-[34rem]">
            <p className="signature-rise readout text-xs text-teal" style={rise(0)}>
              {signature.model_code}
            </p>

            <h2
              id="signature-heading"
              style={rise(1)}
              className="signature-rise mt-4 text-balance text-[clamp(2rem,1.2rem+2.4vw,3.25rem)] font-semibold leading-[1.05] tracking-[-0.035em]"
            >
              {heading}
            </h2>

            {signature.intro_md && (
              // Full ink, not ink-muted: contrast against a photograph cannot be
              // pinned to a ratio the way it can against a surface token, so the
              // copy keeps the muted step in size and weight instead of colour.
              <p
                style={rise(2)}
                className="signature-rise mt-5 max-w-[46ch] text-[1.0625rem] leading-relaxed text-ink"
              >
                {signature.intro_md}
              </p>
            )}

            {signature.facets.length > 0 && (
              // border-ink/25 rather than --line: a decorative hairline that is
              // right against a surface disappears against a photograph.
              //
              // The row fades as one block rather than a figure at a time: they
              // are a single readout and four numbers arriving in sequence reads
              // as a loading state.
              <dl
                style={rise(3)}
                className="signature-rise mt-9 grid grid-cols-2 gap-x-6 gap-y-5 sm:grid-cols-4"
              >
                {signature.facets.slice(0, 4).map((f) => (
                  <div key={f.facet} className="border-t border-ink/25 pt-3">
                    <dt className="text-[0.625rem] uppercase tracking-[0.12em] text-ink/70">
                      {f.label}
                    </dt>
                    <dd className="mt-1.5 flex items-baseline gap-1">
                      <span className="readout text-2xl font-semibold leading-none">
                        {fmt(f.value)}
                      </span>
                      <span className="readout text-xs text-ink/70">{f.unit}</span>
                    </dd>
                  </div>
                ))}
              </dl>
            )}

            {signature.highlights.length > 0 && (
              // Hidden on a phone. The pinned frame is exactly one viewport
              // tall, and on the narrowest screens these three pills are what
              // pushes the stack past it — they are the least load-bearing
              // thing here, and every one of them is repeated on the product
              // page one tap away.
              <ul style={rise(4)} className="signature-rise mt-8 hidden flex-wrap gap-2 sm:flex">
                {signature.highlights.slice(0, 3).map((h) => (
                  <li key={h} className="glass rounded-sm px-3 py-1.5 text-sm text-ink">
                    {h}
                  </li>
                ))}
              </ul>
            )}

            {/* The CTA carries its own transform on :active, and the fade is a
              transform too — so it goes on the wrapper, leaving the button's
              press free to run without the two overwriting each other. */}
            <div style={rise(5)} className="signature-rise mt-9">
              <Link
                href={`/${signature.slug}/`}
                className="inline-flex items-center gap-2 rounded-sm bg-teal px-6 py-3 font-semibold text-void transition-transform duration-200 ease-[var(--ease-out-quart)] hover:opacity-90 active:translate-y-px"
              >
                See the {signature.model_code}
                <span aria-hidden="true">→</span>
              </Link>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}

/**
 * The fallback: no installed photograph for this category, so the catalogue
 * cut-out on a white well, as on the home page. Pure white and deliberately
 * not --paper — these are opaque studio plates and a themed surface behind one
 * puts the product in a visible box.
 */
function SignaturePlate({ signature, heading }: { signature: Signature; heading: string }) {
  return (
    <section
      aria-labelledby="signature-heading"
      className="mx-auto max-w-6xl px-5 py-16 sm:px-8 sm:py-24"
    >
      <div className="grid gap-10 lg:grid-cols-[minmax(0,1.05fr)_minmax(0,1fr)] lg:items-center lg:gap-16">
        {signature.url && (
          <div className="relative aspect-[4/3] overflow-hidden rounded-sm bg-white">
            <Image
              src={signature.url}
              alt={signature.alt ?? signature.name}
              fill
              sizes="(max-width: 1024px) 100vw, 600px"
              className="object-contain p-8 sm:p-12"
            />
          </div>
        )}

        <div>
          <p className="readout text-xs text-teal">{signature.model_code}</p>
          <h2
            id="signature-heading"
            className="mt-3 max-w-[16ch] text-balance text-3xl font-semibold tracking-[-0.03em] sm:text-4xl"
          >
            {heading}
          </h2>

          {signature.intro_md && (
            <p className="mt-5 max-w-[52ch] leading-relaxed text-ink-muted">{signature.intro_md}</p>
          )}

          {signature.facets.length > 0 && (
            <dl className="mt-8 grid grid-cols-2 gap-x-8 gap-y-5 sm:grid-cols-4">
              {signature.facets.slice(0, 4).map((f) => (
                <div key={f.facet} className="border-t border-line pt-4">
                  <dt className="text-[0.625rem] uppercase tracking-[0.12em] text-ink-muted">
                    {f.label}
                  </dt>
                  <dd className="mt-1.5 flex items-baseline gap-1">
                    <span className="readout text-2xl font-semibold leading-none">
                      {fmt(f.value)}
                    </span>
                    <span className="readout text-xs text-ink-muted">{f.unit}</span>
                  </dd>
                </div>
              ))}
            </dl>
          )}

          {signature.highlights.length > 0 && (
            <ul className="mt-8 flex flex-wrap gap-2">
              {signature.highlights.slice(0, 5).map((h) => (
                <li
                  key={h}
                  className="rounded-sm border border-line px-3 py-1.5 text-sm text-ink-muted"
                >
                  {h}
                </li>
              ))}
            </ul>
          )}

          <Link
            href={`/${signature.slug}/`}
            className="mt-9 inline-flex items-center gap-2 rounded-sm bg-teal px-6 py-3 font-semibold text-void transition-transform duration-200 ease-[var(--ease-out-quart)] hover:opacity-90 active:translate-y-px"
          >
            See the {signature.model_code}
            <span aria-hidden="true">→</span>
          </Link>
        </div>
      </div>
    </section>
  );
}

function fmt(n: number): string {
  return Number.isInteger(n) ? n.toLocaleString("en-MY") : String(n);
}
