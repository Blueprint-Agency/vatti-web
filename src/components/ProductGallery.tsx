"use client";

import { ArrowsOut } from "@phosphor-icons/react/dist/ssr/ArrowsOut";
import { CaretLeft } from "@phosphor-icons/react/dist/ssr/CaretLeft";
import { CaretRight } from "@phosphor-icons/react/dist/ssr/CaretRight";
import { X } from "@phosphor-icons/react/dist/ssr/X";
import Image from "next/image";
import {
  createContext,
  useCallback,
  useContext,
  useEffect,
  useRef,
  useState,
  type Dispatch,
  type SetStateAction,
} from "react";

import type { ProductImage } from "@/lib/queries/product";

/**
 * Which gallery image is showing, shared with the finish swatches in the other
 * column. A context rather than a module-level store so it starts over on every
 * product page instead of carrying the last product's index across navigation.
 */
const Selection = createContext<[number, Dispatch<SetStateAction<number>>] | null>(null);

export function GallerySelection({ children }: { children: React.ReactNode }) {
  const state = useState(0);
  return <Selection.Provider value={state}>{children}</Selection.Provider>;
}

export function ProductGallery({ images, name }: { images: ProductImage[]; name: string }) {
  const local = useState(0);
  const [active, setActive] = useContext(Selection) ?? local;
  const [open, setOpen] = useState(false);
  const dialog = useRef<HTMLDialogElement>(null);
  const current = images[active];

  const go = useCallback(
    (step: number) => setActive((i) => (i + step + images.length) % images.length),
    [images.length]
  );

  /**
   * A real <dialog>, opened with showModal(): the platform gives the focus
   * trap, the inert background, the Escape key and the top layer, all of which
   * a div would have to reimplement and most reimplementations get wrong.
   */
  useEffect(() => {
    const el = dialog.current;
    if (!el) return;
    if (open && !el.open) el.showModal();
    if (!open && el.open) el.close();
  }, [open]);

  useEffect(() => {
    if (!open) return;
    const onKey = (e: KeyboardEvent) => {
      if (e.key === "ArrowRight") go(1);
      if (e.key === "ArrowLeft") go(-1);
    };
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [open, go]);

  if (!current) return null;

  return (
    <div className="flex flex-col gap-4">
      <div className="group relative aspect-square overflow-hidden rounded-sm border border-line bg-surface">
        <Image
          src={current.url}
          alt={current.alt || `${name}, view ${active + 1} of ${images.length}`}
          fill
          priority
          sizes="(max-width: 1024px) 100vw, 46vw"
          className="object-contain"
        />
        {/* The whole plate is the control, but the corner button is what says
            so. An image that silently grows on click is a surprise; a label in
            the corner is an affordance, and it is the thing a keyboard reaches. */}
        <button
          type="button"
          onClick={() => setOpen(true)}
          // No outline-none here: the global :focus-visible ring draws around
          // the whole plate, which is exactly the target being activated.
          className="absolute inset-0 flex items-end justify-end p-3"
        >
          <span className="flex items-center gap-1.5 rounded-sm border border-line bg-void/85 px-2.5 py-1.5 text-xs text-ink-muted backdrop-blur-sm transition-colors group-hover:text-ink">
            <ArrowsOut aria-hidden="true" weight="bold" className="size-3.5" />
            Enlarge
          </span>
        </button>
      </div>

      {images.length > 1 && (
        <ul className="flex flex-wrap gap-2" aria-label={`${name} images`}>
          {images.map((img, i) => (
            <li key={img.url}>
              <button
                type="button"
                onClick={() => setActive(i)}
                aria-current={i === active}
                aria-label={`Show image ${i + 1}${img.alt ? `: ${img.alt}` : ""}`}
                className={`relative block size-16 overflow-hidden rounded-sm border transition-colors duration-200 sm:size-20 ${
                  i === active ? "border-teal" : "border-line hover:border-line-strong"
                }`}
              >
                <Image src={img.url} alt="" fill sizes="80px" className="object-contain" />
              </button>
            </li>
          ))}
        </ul>
      )}

      <dialog
        ref={dialog}
        onClose={() => setOpen(false)}
        // Clicking the backdrop closes it. The check is on the target being the
        // dialog itself, which is only true for the area outside the panel.
        onClick={(e) => {
          if (e.target === dialog.current) setOpen(false);
        }}
        aria-label={`${name}, enlarged`}
        className="max-h-none max-w-none bg-transparent p-0 backdrop:bg-void/85 backdrop:backdrop-blur-sm"
      >
        {open && (
          <div className="flex h-dvh w-screen flex-col items-center justify-center gap-4 p-4 sm:p-8">
            <div className="relative h-full w-full max-w-4xl">
              <Image
                src={current.url}
                alt={current.alt || `${name}, view ${active + 1} of ${images.length}`}
                fill
                sizes="(max-width: 896px) 100vw, 896px"
                className="object-contain"
              />
            </div>

            <div className="flex items-center gap-2">
              {images.length > 1 && (
                <>
                  <Control label="Previous image" onClick={() => go(-1)}>
                    <CaretLeft aria-hidden="true" weight="bold" className="size-4" />
                  </Control>
                  <p className="readout px-2 text-sm text-ink-muted">
                    {active + 1} / {images.length}
                  </p>
                  <Control label="Next image" onClick={() => go(1)}>
                    <CaretRight aria-hidden="true" weight="bold" className="size-4" />
                  </Control>
                </>
              )}
              <Control label="Close" onClick={() => setOpen(false)}>
                <X aria-hidden="true" weight="bold" className="size-4" />
              </Control>
            </div>
          </div>
        )}
      </dialog>
    </div>
  );
}

export type Swatch = { name: string; url: string; index: number };

/**
 * The finishes one page offers. Each swatch shows its finish's front shot in
 * the gallery. The gallery holds every finish's shots grouped by finish, front
 * first, so the finish on show is the last swatch at or before the active image,
 * and browsing the thumbnails keeps the right swatch lit.
 */
export function ColourSwatches({ swatches }: { swatches: Swatch[] }) {
  const local = useState(0);
  const [active, setActive] = useContext(Selection) ?? local;
  const current = swatches.filter((s) => s.index <= active).at(-1);

  return (
    <ul className="mt-3 flex flex-wrap gap-2">
      {swatches.map((c) => {
        const on = c === current;
        return (
          <li key={c.name}>
            <button
              type="button"
              onClick={() => setActive(c.index)}
              aria-pressed={on}
              className={`flex items-center gap-2.5 rounded-sm border py-1.5 pl-1.5 pr-3.5 text-sm transition-colors ${
                on
                  ? "border-teal text-teal"
                  : "border-line text-ink-muted hover:border-line-strong hover:text-ink"
              }`}
            >
              {/* The button's text already names the finish. */}
              <Image
                src={c.url}
                alt=""
                width={64}
                height={64}
                sizes="32px"
                className="h-8 w-8 rounded-sm object-contain"
              />
              {c.name}
            </button>
          </li>
        );
      })}
    </ul>
  );
}

function Control({
  label,
  onClick,
  children,
}: {
  label: string;
  onClick: () => void;
  children: React.ReactNode;
}) {
  return (
    <button
      type="button"
      onClick={onClick}
      aria-label={label}
      className="flex size-10 items-center justify-center rounded-sm border border-line bg-void/85 text-ink transition-colors hover:border-teal hover:text-teal"
    >
      {children}
    </button>
  );
}
