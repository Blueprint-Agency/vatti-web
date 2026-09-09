"use client";

import { useMemo, useState } from "react";

import type { CategoryCard, Region } from "@/lib/queries/home";
import { whatsappLink } from "@/lib/site";

/**
 * The questionnaire behind the WhatsApp message, shared by the two layouts
 * that ask it: EnquiryBuilder (every question on one screen, category pages)
 * and EnquiryFunnel (one question at a time, the front page).
 *
 * Deliberately not a form. src/lib/site.ts records the owner's decision that
 * this site has no forms, and this does not break it: nothing is submitted,
 * nothing is stored, there is no endpoint. The answers only ever become text in
 * a wa.me link, and the visitor still presses send inside WhatsApp. That is why
 * both layouts show the message in full rather than hiding it behind the button
 * — the visitor can see exactly what they are about to send before anything
 * happens.
 *
 * Every question is optional. A half-answered questionnaire still produces a
 * sensible message, and the button never blocks.
 */

export type Question = {
  id: string;
  /** The visitor-facing question. */
  legend: string;
  /** How the answer is introduced in the message. */
  label: string;
  /** One or two words for a step rail. */
  short: string;
  /** Why we ask. Shown under the question in the stepped layout only. */
  hint: string;
  options: string[];
  multiple?: boolean;
};

/**
 * Fixed questions. The two data-driven ones are built in `buildQuestions`, and
 * one of these is dropped on the pages it does not apply to — see `hobWidth`.
 */
const BASE: Question[] = [
  {
    id: "project",
    legend: "What is the project?",
    label: "Project",
    short: "Project",
    hint: "A replacement has to fit the hole that is already there. A new build can start from the model.",
    options: ["Renovating", "New build", "Replacing a unit", "Still researching"],
  },
  {
    id: "cooking",
    legend: "How do you cook?",
    // The two definite answers first, the hedge last: "a mix of both" only
    // means anything once you have read the two things it sits between.
    label: "Cooking",
    short: "Cooking",
    hint: "Wok smoke asks more of a hood than a pot of soup does.",
    options: ["Wok on high heat, most days", "Mostly light cooking", "A mix of both"],
  },
  {
    id: "kitchen",
    legend: "What is the kitchen like?",
    label: "Kitchen",
    short: "Kitchen",
    hint: "Condo ducting and open-plan layouts each rule a few models out.",
    options: ["Condo or apartment", "Landed house", "Open plan", "Wet and dry"],
  },
  {
    id: "hob",
    legend: "How much hob space is there?",
    label: "Hob space",
    short: "Hob space",
    hint: "Roughly is fine. A hood should be at least as wide as the hob under it.",
    options: ["Under 700mm", "700 to 800mm", "800 to 900mm", "Over 900mm", "Not measured yet"],
  },
  {
    id: "timing",
    legend: "When do you need it?",
    label: "Timing",
    short: "Timing",
    hint: "So the dealer knows whether to hold stock for you.",
    options: ["This month", "In one to three months", "Later than that", "Just planning"],
  },
];

export function buildQuestions({
  categories,
  regions,
  category,
  hobWidth,
}: {
  categories?: CategoryCard[];
  regions: Region[];
  category?: string;
  hobWidth: boolean;
}): Question[] {
  // Category and region wording comes from the database so the message uses the
  // same names as the catalogue and the dealer list.
  return [
    ...(category
      ? []
      : [
          {
            id: "looking",
            legend: "What are you looking for?",
            label: "Looking at",
            short: "Looking for",
            hint: "Pick everything on the list. One is fine.",
            options: (categories ?? []).map((c) => c.name),
            multiple: true,
          },
        ]),
    ...BASE.filter((q) => q.id !== "hob" || hobWidth),
    {
      id: "area",
      legend: "Where are you?",
      label: "Area",
      short: "Area",
      hint: "We point you at the dealer nearest you.",
      options: regions.map((r) => r.region),
    },
  ];
}

/** Answers, name and the message they compose. */
export function useEnquiry(questions: Question[], category?: string) {
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

  return { answers, name, setName, toggle, answered, message, href: whatsappLink(message) };
}

/** "a, b and c" — the message should read like a person wrote it. */
function list(items: string[]): string {
  if (items.length <= 1) return items[0] ?? "";
  return `${items.slice(0, -1).join(", ")} and ${items[items.length - 1]}`;
}
