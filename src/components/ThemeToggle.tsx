"use client";

import { useEffect, useState } from "react";

/**
 * The ground selector: dark chassis or light paper, for the whole site.
 *
 * Two buttons rather than one that flips, because a single toggle only tells
 * you where you are if you already know which way it points — here both grounds
 * are named and the lit one is the current one. The choice is written to
 * localStorage and re-applied by the boot script in the root layout.
 *
 * Nothing about the rendered markup depends on the current theme: the knob and
 * the lit glyph are pure CSS keyed off `data-theme` on <html> (see globals.css
 * § ground selector). That is what lets a statically-generated page hydrate
 * clean while already showing the visitor's stored ground. The only piece of
 * state here is `aria-pressed`, which is held back until after mount for the
 * same reason — the server cannot know it, so it renders no attribute at all
 * rather than a wrong one.
 */
export const THEME_STORAGE_KEY = "vatti-theme";

type Ground = "dark" | "light";

const OPTIONS: { value: Ground; label: string; icon: React.ReactNode }[] = [
  {
    value: "dark",
    label: "Dark",
    icon: (
      <svg viewBox="0 0 16 16" aria-hidden="true" className="size-4 fill-none stroke-current stroke-[1.4]">
        <path d="M13.2 10.1A5.7 5.7 0 0 1 5.9 2.8a5.7 5.7 0 1 0 7.3 7.3Z" strokeLinejoin="round" />
      </svg>
    ),
  },
  {
    value: "light",
    label: "Light",
    icon: (
      <svg viewBox="0 0 16 16" aria-hidden="true" className="size-4 fill-none stroke-current stroke-[1.4]">
        <circle cx="8" cy="8" r="3.1" />
        <path
          d="M8 1.2v1.5M8 13.3v1.5M1.2 8h1.5M13.3 8h1.5M3.2 3.2l1.1 1.1M11.7 11.7l1.1 1.1M12.8 3.2l-1.1 1.1M4.3 11.7l-1.1 1.1"
          strokeLinecap="round"
        />
      </svg>
    ),
  },
];

export function ThemeToggle({ className = "" }: { className?: string }) {
  const [ground, setGround] = useState<Ground | null>(null);

  useEffect(() => {
    setGround(document.documentElement.dataset.theme === "light" ? "light" : "dark");
  }, []);

  function choose(next: Ground) {
    document.documentElement.dataset.theme = next;
    setGround(next);
    // A blocked or full localStorage is not a reason to fail the switch — the
    // ground still changes, it just will not survive the next page load.
    try {
      window.localStorage.setItem(THEME_STORAGE_KEY, next);
    } catch {}
  }

  return (
    <div
      role="group"
      aria-label="Colour theme"
      className={`ground-switch relative flex items-center rounded-sm border border-line p-0.5 ${className}`}
    >
      <span
        aria-hidden="true"
        className="ground-knob pointer-events-none absolute inset-y-0.5 left-0.5 w-[calc(50%-0.125rem)] rounded-[2px] bg-raised"
      />
      {OPTIONS.map((o) => (
        <button
          key={o.value}
          type="button"
          data-ground={o.value}
          onClick={() => choose(o.value)}
          aria-pressed={ground === null ? undefined : ground === o.value}
          className="relative flex size-7 items-center justify-center rounded-[2px] text-ink-muted transition-colors hover:text-ink"
        >
          <span className="sr-only">{o.label}</span>
          {o.icon}
        </button>
      ))}
    </div>
  );
}
