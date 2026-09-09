"use client";

import { useEffect, useMemo, useRef, useState } from "react";

import type { CategoryCard, Region } from "@/lib/queries/home";

import { buildQuestions, useEnquiry } from "./enquiry";

/**
 * The same questionnaire as EnquiryBuilder, asked one question at a time.
 *
 * Front page only. A visitor arriving cold is answering seven things about a
 * kitchen they may not have planned yet, and a wall of chips makes that look
 * like a form. One card, one question, a Next button and a rail that shows
 * how far there is to go reads as a conversation instead, and the message
 * writing itself underneath is the proof that the answers are going somewhere.
 *
 * Nothing else changes. Every question is still optional (Next reads "Skip"
 * on an unanswered card rather than refusing), the rail jumps to any step, and
 * the WhatsApp button is live from the first card because the opening line
 * stands on its own. See ./enquiry for why this is not a form.
 */
export function EnquiryFunnel({
  categories,
  regions,
}: {
  categories: CategoryCard[];
  regions: Region[];
}) {
  const questions = useMemo(
    () => buildQuestions({ categories, regions, hobWidth: true }),
    [categories, regions]
  );
  const { answers, name, setName, toggle, answered, message, href } = useEnquiry(questions);

  // The name is the last card. It is the only step that is not a question, so
  // it is counted here and nowhere in ./enquiry.
  const steps = questions.length + 1;
  const [step, setStep] = useState(0);
  const question = step < questions.length ? questions[step] : null;
  const last = step === steps - 1;

  function isDone(i: number): boolean {
    const q = questions[i];
    return q ? (answers[q.id] ?? []).length > 0 : name.trim().length > 0;
  }
  const doneHere = isDone(step);

  // Focus follows the card, so a keyboard or screen-reader visitor who pressed
  // Next lands on the new question rather than on a button that has just
  // changed its label under them. Not on first paint: nothing has moved yet,
  // and stealing focus on load would scroll the page to this section.
  const headingRef = useRef<HTMLHeadingElement>(null);
  const moved = useRef(false);
  useEffect(() => {
    if (!moved.current) {
      moved.current = true;
      return;
    }
    headingRef.current?.focus({ preventScroll: true });
  }, [step]);

  const headingClass = "text-2xl font-semibold tracking-[-0.02em] outline-none sm:text-[1.75rem]";

  return (
    <div className="grid gap-8 lg:grid-cols-[minmax(0,1.15fr)_minmax(0,0.85fr)] lg:gap-14">
      <div>
        {/* The rail. Every step is a button because every question is optional:
          jumping ahead loses nothing, and jumping back is how an answer gets
          changed. */}
        <ol className="flex flex-wrap gap-x-5 gap-y-2 text-sm">
          {[...questions.map((q) => q.short), "Name"].map((label, i) => {
            const current = i === step;
            const done = isDone(i);
            return (
              <li key={label}>
                <button
                  type="button"
                  onClick={() => setStep(i)}
                  aria-current={current ? "step" : undefined}
                  className={`flex items-center gap-2 py-1 transition-colors ${
                    current
                      ? "font-medium text-ink"
                      : done
                        ? "text-teal hover:text-ink"
                        : "text-ink-muted hover:text-ink"
                  }`}
                >
                  <span
                    aria-hidden
                    className={`size-2 shrink-0 rounded-full transition-[background-color,box-shadow] ${
                      current || done ? "bg-teal" : "bg-line-strong"
                    } ${current ? "shadow-[0_0_0_4px_color-mix(in_oklch,var(--color-teal)_25%,transparent)]" : ""}`}
                  />
                  {label}
                </button>
              </li>
            );
          })}
        </ol>

        <div className="mt-5 overflow-hidden rounded-sm border border-line bg-void">
          {/* Progress, as a rule along the top of the card. */}
          <div aria-hidden className="h-0.5 bg-line">
            <div
              className="h-full bg-teal transition-[width] duration-500 ease-[var(--ease-out-expo)]"
              style={{ width: `${((step + 1) / steps) * 100}%` }}
            />
          </div>

          {/* Keyed on the step so the card settles in fresh each time, the same
            motion the showcase panels use. */}
          <div key={step} className="animate-panel p-5 sm:p-8">
            <p className="readout text-xs text-ink-muted">
              Step {step + 1} of {steps}
            </p>

            {question ? (
              <fieldset className="mt-3">
                <legend>
                  <h3 ref={headingRef} tabIndex={-1} className={headingClass}>
                    {question.legend}
                  </h3>
                </legend>
                <p className="mt-2 max-w-[48ch] text-ink-muted">
                  {question.hint}
                  {question.multiple && " Choose any."}
                </p>

                <div className="mt-6 grid gap-2">
                  {question.options.map((option) => {
                    const checked = (answers[question.id] ?? []).includes(option);
                    return (
                      <label key={option} className="cursor-pointer">
                        {/* A real input, visually hidden: the row keeps keyboard
                          focus, arrow-key groups and screen-reader semantics
                          that a div with an onClick throws away. */}
                        <input
                          type={question.multiple ? "checkbox" : "radio"}
                          name={question.id}
                          value={option}
                          checked={checked}
                          onChange={() => toggle(question, option)}
                          className="peer sr-only"
                        />
                        <span
                          className={`flex items-center gap-3.5 rounded-sm border px-4 py-3.5 transition-colors peer-focus-visible:outline peer-focus-visible:outline-2 peer-focus-visible:outline-offset-2 peer-focus-visible:outline-teal ${
                            checked
                              ? "border-teal bg-teal/10 font-semibold text-ink"
                              : "border-line-strong text-ink hover:border-teal"
                          }`}
                        >
                          <span
                            aria-hidden
                            className={`grid size-[1.125rem] shrink-0 place-items-center border transition-colors ${
                              question.multiple ? "rounded-[3px]" : "rounded-full"
                            } ${checked ? "border-teal" : "border-line-strong"}`}
                          >
                            {checked && (
                              <span
                                className={`size-2.5 bg-teal ${
                                  question.multiple ? "rounded-[1px]" : "rounded-full"
                                }`}
                              />
                            )}
                          </span>
                          {option}
                        </span>
                      </label>
                    );
                  })}
                </div>
              </fieldset>
            ) : (
              <div className="mt-3">
                <h3
                  ref={headingRef}
                  tabIndex={-1}
                  id="funnel-name-heading"
                  className={headingClass}
                >
                  Your name
                </h3>
                <p className="mt-2 max-w-[48ch] text-ink-muted">
                  Optional. It just makes the reply friendlier.
                </p>
                <input
                  type="text"
                  aria-labelledby="funnel-name-heading"
                  value={name}
                  onChange={(e) => setName(e.target.value)}
                  autoComplete="given-name"
                  className="mt-6 w-full max-w-sm rounded-sm border border-line-strong bg-void px-3.5 py-2.5 text-ink placeholder:text-ink-muted focus-visible:border-teal"
                  placeholder="Aisyah"
                />
              </div>
            )}

            <div className="mt-8 flex items-center justify-between gap-4 border-t border-line pt-5">
              <button
                type="button"
                onClick={() => setStep((s) => Math.max(0, s - 1))}
                disabled={step === 0}
                className="rounded-sm border border-line-strong px-4 py-2.5 text-sm font-medium text-ink transition-colors hover:border-teal hover:text-teal disabled:cursor-not-allowed disabled:opacity-40 disabled:hover:border-line-strong disabled:hover:text-ink"
              >
                Back
              </button>

              {last ? (
                <p className="text-right text-sm text-ink-muted">
                  That is everything. Your message is ready to send.
                </p>
              ) : (
                <button
                  type="button"
                  onClick={() => setStep((s) => Math.min(steps - 1, s + 1))}
                  className={`rounded-sm px-5 py-2.5 text-sm font-semibold transition-[opacity,color,border-color] ${
                    doneHere
                      ? "bg-teal text-void hover:opacity-90"
                      : "border border-line-strong text-ink hover:border-teal hover:text-teal"
                  }`}
                >
                  {doneHere ? "Next" : "Skip"}
                </button>
              )}
            </div>
          </div>
        </div>
      </div>

      {/* The message, in full, as it is being written. Beside the card on a
          desktop and sticky, so it stays in view while the steps change under
          the cursor; under the card on a phone, where the text growing a line
          at a time is what shows each answer landed. */}
      <div className="rounded-sm border border-line bg-void p-5 sm:p-6 lg:sticky lg:top-24 lg:self-start">
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
  );
}
