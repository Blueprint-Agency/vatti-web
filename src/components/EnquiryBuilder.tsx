"use client";

import { useMemo, useState } from "react";

import type { CategoryCard, Region } from "@/lib/queries/home";
import { WHATSAPP } from "@/lib/site";

/**
 * Composes a WhatsApp message out of a short questionnaire.
 *
 * Deliberately not a form. src/lib/site.ts records the owner's decision that
 * this site has no forms, and this does not break it: nothing is submitted,
 * nothing is stored, there is no endpoint. The answers only ever become text in
 * a wa.me link, and the visitor still presses send inside WhatsApp. That is why
 * the message is shown in full rather than hidden behind the button — the
 * visitor can see exactly what they are about to send before anything happens.
 *
 * Every question is optional. A half-answered questionnaire still produces a
 * sensible message, and the button never blocks.
 */

type Question = {
  id: string;
  /** The visitor-facing question. */
  legend: string;
  /** How the answer is introduced in the message. */
  label: string;
  options: string[];
  multiple?: boolean;
};

/** Fixed questions. The two data-driven ones are built in the component. */
const BASE: Question[] = [
  {
    id: "project",
    legend: "What is the project?",
    label: "Project",
    options: ["Renovating", "New build", "Replacing a unit", "Still researching"],
  },
  {
    id: "cooking",
    legend: "How do you cook?",
    // The two definite answers first, the hedge last: "a mix of both" only
    // means anything once you have read the two things it sits between.
    label: "Cooking",
    options: ["Wok on high heat, most days", "Mostly light cooking", "A mix of both"],
  },
  {
    id: "kitchen",
    legend: "What is the kitchen like?",
    label: "Kitchen",
    options: ["Condo or apartment", "Landed house", "Open plan", "Wet and dry"],
  },
  {
    id: "hob",
    legend: "How much hob space is there?",
    label: "Hob space",
    options: ["Under 700mm", "700 to 800mm", "800 to 900mm", "Over 900mm", "Not measured yet"],
  },
  {
    id: "timing",
    legend: "When do you need it?",
    label: "Timing",
    options: ["This month", "In one to three months", "Later than that", "Just planning"],
  },
];

export function EnquiryBuilder({
  categories,
  regions,
  category,
}: {
  /** The whole catalogue, for the front page. Omitted on a category page. */
  categories?: CategoryCard[];
  regions: Region[];
  /**
   * One category name, when this sits on that category's own page. It answers
   * "what are you looking for?" on the visitor's behalf, so that question is
   * dropped rather than asked about a page they are already standing on.
   */
  category?: string;
}) {
  // Category and region wording comes from the database so the message uses the
  // same names as the catalogue and the dealer list.
  const questions = useMemo<Question[]>(
    () => [
      ...(category
        ? []
        : [
            {
              id: "looking",
              legend: "What are you looking for?",
              label: "Looking at",
              options: (categories ?? []).map((c) => c.name),
              multiple: true,
            },
          ]),
      ...BASE,
      {
        id: "area",
        legend: "Where are you?",
        label: "Area",
        options: regions.map((r) => r.region),
      },
    ],
    [categories, category, regions]
  );

  const [answers, setAnswers] = useState<Record<string, string[]>>({});
  const [name, setName] = useState("");

  function toggle(question: Question, option: string) {
    setAnswers((prev) => {
      const current = prev[question.id] ?? [];
      if (!question.multiple) {
        // Tapping the chosen option again clears it: every question is optional
        // and there is no other way back to "no answer".
        return { ...prev, [question.id]: current[0] === option ? [] : [option] };
      }
      return {
        ...prev,
        [question.id]: current.includes(option)
          ? current.filter((v) => v !== option)
          : [...current, option],
      };
    });
  }

  const answered = questions.filter((q) => (answers[q.id] ?? []).length > 0).length;

  const message = useMemo(() => {
    const looking = answers.looking ?? [];
    // A colon list rather than "looking at kitchen hood and cooker hob": the
    // category names are singular in the database, and pluralising them in code
    // would be a rule waiting to be broken by the next category added.
    const lines: string[] = [
      category
        ? `Hi VATTI Malaysia. I am looking at your ${category.toLowerCase()} range.`
        : looking.length > 0
          ? `Hi VATTI Malaysia. I am shopping for: ${looking.join(", ")}.`
          : "Hi VATTI Malaysia. I would like some help choosing kitchen appliances.",
    ];

    const details = questions
      .filter((q) => q.id !== "looking")
      .map((q) => {
        const value = answers[q.id] ?? [];
        return value.length > 0 ? `${q.label}: ${list(value)}` : null;
      })
      .filter((line): line is string => line !== null);

    if (details.length > 0) lines.push("", ...details);
    if (name.trim()) lines.push("", `Thanks, ${name.trim()}`);
    return lines.join("\n");
  }, [answers, category, name, questions]);

  const href = `${WHATSAPP}?text=${encodeURIComponent(message)}`;

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

/** "a, b and c" — the message should read like a person wrote it. */
function list(items: string[]): string {
  if (items.length <= 1) return items[0] ?? "";
  return `${items.slice(0, -1).join(", ")} and ${items[items.length - 1]}`;
}
