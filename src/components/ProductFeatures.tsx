import Image from "next/image";

import { Inline, Markdown } from "@/lib/markdown";
import type { Feature } from "@/lib/queries/product";

/**
 * The feature story, rendered from `product_feature`.
 *
 * What it replaces: a vertical stack of the source site's composite JPEGs, each
 * one a picture of the appliance with a headline and two lines of copy set into
 * the pixels beside it, and the transcription of those same words repeated
 * underneath. The words are now text and the picture is the picture, cropped
 * apart at build-prep time — see data/sql/product-features.sql.
 *
 * Three shapes, chosen by the row's `layout`:
 *
 *   banner  the in-kitchen shot, full column width, no argument attached
 *   card    one panel of a highlights composite; consecutive cards share a grid
 *   split   a studio detail beside its heading, alternating side down the page
 *
 * The alternation is computed here rather than stored, because it is a property
 * of the sequence: insert a block at the top and every side below it flips, and
 * a `side` column would then be nine edits instead of none.
 */
export function ProductFeatures({ features, name }: { features: Feature[]; name: string }) {
  if (!features.length) return null;

  const blocks: React.ReactNode[] = [];
  let splits = 0;

  for (let i = 0; i < features.length; i++) {
    const f = features[i];

    if (f.layout === "card") {
      // Take the whole run in one pass: four cards are one grid, not four
      // sections with a gap between them.
      const run: Feature[] = [];
      while (i < features.length && features[i].layout === "card") run.push(features[i++]);
      i--;
      blocks.push(<CardGrid key={`cards-${i}`} cards={run} />);
      continue;
    }

    if (f.layout === "banner") {
      blocks.push(<Banner key={i} feature={f} name={name} />);
      continue;
    }

    blocks.push(<Split key={i} feature={f} name={name} flipped={splits++ % 2 === 1} />);
  }

  return <div className="flex flex-col gap-14 sm:gap-20">{blocks}</div>;
}

function Banner({ feature, name }: { feature: Feature; name: string }) {
  return (
    <figure className="overflow-hidden rounded-sm border border-line bg-surface">
      {feature.image_url && (
        <Image
          src={feature.image_url}
          alt={feature.image_alt || name}
          width={feature.image_w ?? 1920}
          height={feature.image_h ?? 900}
          loading="lazy"
          sizes="(max-width: 1200px) 100vw, 1088px"
          className="h-auto w-full"
        />
      )}
      {(feature.title || feature.body_md) && (
        <figcaption className="px-5 py-6 sm:px-8">
          {feature.title && (
            <h3 className="text-[1.25rem] font-semibold tracking-[-0.025em]">{feature.title}</h3>
          )}
          {feature.body_md && <Body md={feature.body_md} className="max-w-[62ch]" />}
        </figcaption>
      )}
    </figure>
  );
}

function Split({
  feature,
  name,
  flipped,
}: {
  feature: Feature;
  name: string;
  flipped: boolean;
}) {
  return (
    <div className="grid items-center gap-7 lg:grid-cols-2 lg:gap-14">
      {feature.image_url && (
        <div
          className={`overflow-hidden rounded-sm border border-line bg-surface ${
            flipped ? "lg:order-2" : ""
          }`}
        >
          <Image
            src={feature.image_url}
            alt={feature.image_alt || name}
            width={feature.image_w ?? 800}
            height={feature.image_h ?? 560}
            loading="lazy"
            sizes="(max-width: 1024px) 100vw, 520px"
            className="h-auto w-full"
          />
        </div>
      )}
      <div className="max-w-[54ch]">
        {feature.title && (
          <h3 className="text-balance text-[clamp(1.25rem,1.05rem+0.7vw,1.75rem)] font-semibold leading-tight tracking-[-0.03em]">
            {feature.title}
          </h3>
        )}
        {feature.body_md && <Body md={feature.body_md} />}
      </div>
    </div>
  );
}

/**
 * `ul` rather than a row of divs: it is a list of four claims about one
 * appliance, and a screen reader announcing "list, 4 items" is the whole
 * structure the composite JPEG used to convey by putting them side by side.
 */
function CardGrid({ cards }: { cards: Feature[] }) {
  return (
    <ul className="grid gap-5 sm:grid-cols-2 lg:grid-cols-4">
      {cards.map((card, i) => (
        <li
          key={i}
          className="flex flex-col overflow-hidden rounded-sm border border-line bg-surface"
        >
          {card.image_url && (
            // Square box, cover crop: the four panels were cut out of one
            // composite and come back a few pixels apart in height, which a
            // fixed ratio hides and a natural one would show as a ragged row.
            <div className="relative aspect-square">
              <Image
                src={card.image_url}
                alt={card.image_alt || ""}
                fill
                loading="lazy"
                sizes="(max-width: 640px) 100vw, (max-width: 1024px) 50vw, 260px"
                className="object-cover"
              />
            </div>
          )}
          <div className="flex flex-col gap-2 p-5">
            {card.title && (
              <h3 className="text-[1.0625rem] font-semibold leading-snug tracking-[-0.02em]">
                {card.title}
              </h3>
            )}
            {card.body_md && (
              <p className="text-[0.9375rem] leading-relaxed text-ink-muted">
                <Inline text={card.body_md} />
              </p>
            )}
          </div>
        </li>
      ))}
    </ul>
  );
}

/**
 * Feature copy is paragraphs and bullets, which `Markdown` already renders with
 * its own vertical rhythm. The first and last margins are cancelled so the
 * block sits against the heading above it and the grid row below.
 */
function Body({ md, className = "" }: { md: string; className?: string }) {
  return (
    <div
      className={`mt-3 text-[1.0625rem] text-ink-muted [&>:first-child]:mt-0 [&>:last-child]:mb-0 ${className}`}
    >
      <Markdown md={md} />
    </div>
  );
}
