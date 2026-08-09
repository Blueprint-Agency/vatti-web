"use client";

import { useEffect, useRef, useState } from "react";

/**
 * Fades a block up the first time it crosses into the viewport.
 *
 * Same contract as `.animate-readout`: the base state is VISIBLE. The hidden
 * state is armed by this effect, so a crawler, a failed hydration or a reduced-
 * motion reader still gets the content. Everything this wraps sits a full
 * viewport below the fold, so the visible-to-hidden arm never paints.
 *
 * IntersectionObserver rather than a scroll listener — one callback per
 * crossing instead of one per frame. See DESIGN.md § Motion.
 */
export function Reveal({
  children,
  className = "",
  delay = 0,
}: {
  children: React.ReactNode;
  className?: string;
  /** Milliseconds. Staggers tiles that all cross the threshold together. */
  delay?: number;
}) {
  const ref = useRef<HTMLDivElement>(null);
  const [state, setState] = useState<"idle" | "armed" | "in">("idle");

  useEffect(() => {
    const el = ref.current;
    if (!el) return;
    if (window.matchMedia("(prefers-reduced-motion: reduce)").matches) return;

    setState("armed");
    const io = new IntersectionObserver(
      ([entry]) => {
        if (!entry.isIntersecting) return;
        setState("in");
        io.disconnect();
      },
      { threshold: 0.2, rootMargin: "0px 0px -10% 0px" }
    );
    io.observe(el);
    return () => io.disconnect();
  }, []);

  return (
    <div
      ref={ref}
      style={state === "in" && delay ? { transitionDelay: `${delay}ms` } : undefined}
      className={`${className} ${
        state === "armed"
          ? "translate-y-8 opacity-0"
          : state === "in"
            ? "translate-y-0 opacity-100 transition-[opacity,transform] duration-700 ease-[var(--ease-out-expo)]"
            : ""
      }`}
    >
      {children}
    </div>
  );
}
