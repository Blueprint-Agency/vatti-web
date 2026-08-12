"use client";

import Image from "next/image";
import { useState } from "react";
import type { ProductImage } from "@/lib/queries/product";

export function ProductGallery({ images, name }: { images: ProductImage[]; name: string }) {
  const [active, setActive] = useState(0);
  const current = images[active];

  if (!current) return null;

  return (
    <div className="flex flex-col gap-4">
      <div className="relative aspect-square overflow-hidden rounded-sm border border-line bg-surface">
        <Image
          src={current.url}
          alt={current.alt || `${name}, view ${active + 1} of ${images.length}`}
          fill
          priority
          sizes="(max-width: 1024px) 100vw, 46vw"
          className="object-contain"
        />
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
                  i === active
                    ? "border-teal"
                    : "border-line hover:border-line-strong"
                }`}
              >
                <Image
                  src={img.url}
                  alt=""
                  fill
                  sizes="80px"
                  className="object-contain"
                />
              </button>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
