"use client";

import { useMemo } from "react";

import type { CategoryCard, Region } from "@/lib/queries/home";

import { buildQuestions, useEnquiry } from "./enquiry";

/**
 * Every question on one screen, the message beside them. The category pages
 * use this; the front page asks the same questions one at a time in
 * EnquiryFunnel. What the questions are and how they become a message lives
 * in ./enquiry.
 */
export function EnquiryBuilder({
  categories,
  regions,
  category,
  hobWidth = true,
}: {
  /** The whole catalogue, when no category is given. */
  categories?: CategoryCard[];
  regions: Region[];
  /**
   * One category name, when this sits on that category's own page. It answers
   * "what are you looking for?" on the visitor's behalf, so that question is
   * dropped rather than asked about a page they are already standing on.
   */
  category?: string;
  /**
   * Ask how much hob space there is. True everywhere it is a real question:
   * the hood and hob pages, where the width of the cooking surface is the
   * measurement that rules models out — a hood narrower than the hob leaks
   * smoke at the edges however hard it pulls.
   *
   * False on the oven page. Nothing about an oven follows from the hob it
   * happens to sit under, and a questionnaire that asks anyway reads as a form
   * built for a different product and reused, which is the impression this
   * whole section exists to avoid.
   */
  hobWidth?: boolean;
}) {
  const questions = useMemo(
    () => buildQuestions({ categories, regions, category, hobWidth }),
    [categories, category, regions, hobWidth]
  );
  const { answers, name, setName, toggle, answered, message, href } = useEnquiry(
    questions,
    category
  );

  return (
    <div className="grid gap-10 lg:grid-cols-[minmax(0,1.15fr)_minmax(0,0.85fr)] lg:gap-14">
      <div>
        {questions.map((q) => (
          <fieldset key={q.id} className="border-t border-line py-6">
            <legend className="sr-only">{q.legend}</legend>
            <p aria-hidden className="font-medium">
              {q.legend}
              {q.multiple && (
                <span className="ml-2 text-sm font-normal text-ink-muted">choose any</span>
              )}
            </p>
            <div className="mt-4 flex flex-wrap gap-2">
              {q.options.map((option) => {
                const checked = (answers[q.id] ?? []).includes(option);
                return (
                  <label key={option} className="cursor-pointer">
                    {/* A real input, visually hidden: the chip keeps keyboard
                        focus, arrow-key groups and screen-reader semantics that
                        a div with an onClick throws away. */}
                    <input
                      type={q.multiple ? "checkbox" : "radio"}
                      name={q.id}
                      value={option}
                      checked={checked}
                      onChange={() => toggle(q, option)}
                      className="peer sr-only"
                    />
                    <span
                      className="block rounded-sm border border-line-strong px-3.5 py-2.5 text-sm text-ink transition-colors hover:border-teal hover:text-teal peer-checked:border-teal peer-checked:bg-teal peer-checked:font-semibold peer-checked:text-void peer-focus-visible:outline peer-focus-visible:outline-2 peer-focus-visible:outline-offset-2 peer-focus-visible:outline-teal"
                    >
                      {option}
                    </span>
                  </label>
                );
              })}
            </div>
          </fieldset>
        ))}

        <div className="border-y border-line py-6">
          <label htmlFor="enquiry-name" className="block font-medium">
            Your name
          </label>
          <p className="mt-1 text-sm text-ink-muted">Optional. It just makes the reply friendlier.</p>
          <input
            id="enquiry-name"
            type="text"
            value={name}
            onChange={(e) => setName(e.target.value)}
            autoComplete="given-name"
            className="mt-3 w-full max-w-sm rounded-sm border border-line-strong bg-void px-3.5 py-2.5 text-ink placeholder:text-ink-muted focus-visible:border-teal"
            placeholder="Aisyah"
          />
        </div>
      </div>

      {/* The message, in full, as it is being written. Sticky on wide screens so
          it stays beside the questions being answered. */}
      <div className="lg:sticky lg:top-24 lg:self-start">
        <div className="rounded-sm border border-line bg-void p-5 sm:p-6">
          <div className="flex items-baseline justify-between gap-4 border-b border-line pb-4">
            <p className="text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ink-muted">
              Your message
            </p>
            <p className="readout shrink-0 text-xs text-ink-muted">
              {answered}/{questions.length} answered
            </p>
          </div>

          {/* Preformatted, because this is the literal text WhatsApp receives —
              line breaks included. */}
          <p className="mt-5 whitespace-pre-line leading-relaxed text-ink">{message}</p>

          <a
            href={href}
            target="_blank"
            rel="noopener"
            className="mt-6 block rounded-sm bg-teal px-6 py-3 text-center font-semibold text-void transition-opacity hover:opacity-90"
          >
            Open WhatsApp
          </a>
          <p className="mt-3 text-center text-sm text-ink-muted">
            Opens a chat with this text ready. You still press send.
          </p>
        </div>
      </div>
    </div>
  );
}
