"use client";

import { ArrowsOut } from "@phosphor-icons/react/dist/ssr/ArrowsOut";
import { CaretLeft } from "@phosphor-icons/react/dist/ssr/CaretLeft";
import { CaretRight } from "@phosphor-icons/react/dist/ssr/CaretRight";
import { X } from "@phosphor-icons/react/dist/ssr/X";
import Image from "next/image";
import { useCallback, useEffect, useRef, useState } from "react";

import type { ProductImage } from "@/lib/queries/product";

export function ProductGallery({ images, name }: { images: ProductImage[]; name: string }) {
  const [active, setActive] = useState(0);
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
