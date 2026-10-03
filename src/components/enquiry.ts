"use client";

import { useMemo, useState } from "react";

import { listJoin, t, type Dict, type Locale } from "@/i18n";
import type { CategoryCard, Region } from "@/lib/queries/home";
import { whatsappLink } from "@/lib/site";

/**
 * The questionnaire behind the WhatsApp message. EnquiryFunnel asks it one
 * question at a time on the front page and on every category page.
 *
 * Deliberately not a form. src/lib/site.ts records the owner's decision that
 * this site has no forms, and this does not break it: nothing is submitted,
 * nothing is stored, there is no endpoint. The answers only ever become text in
 * a wa.me link, and the visitor still presses send inside WhatsApp. That is why
 * the message is shown in full rather than hidden behind the button — the
 * visitor can see exactly what they are about to send before anything
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
  /** Why we ask. Shown under the question. */
  hint: string;
  options: string[];
  multiple?: boolean;
};

/**
 * Fixed questions, in the order they are asked. Their words are in src/i18n
 * (funnel.questions); one of them is dropped on the pages it does not apply
 * to — see `hobWidth`. Option texts are copied into the WhatsApp message as
 * the visitor picked them, so the message arrives in the visitor's language.
 */
const BASE_IDS = ["project", "cooking", "kitchen", "hob", "timing"] as const;

function question(locale: Locale, id: keyof Dict["funnel"]["questions"]): Question {
  return { id, ...t(locale).funnel.questions[id] };
}

export function buildQuestions({
  locale = "en",
  categories,
  regions,
  category,
  hobWidth,
}: {
  locale?: Locale;
  categories?: CategoryCard[];
  regions: Region[];
  category?: string;
  hobWidth: boolean;
}): Question[] {
  const regionNames = t(locale).regions;
  // Category and region wording comes from the database so the message uses the
  // same names as the catalogue and the dealer list.
  return [
    ...(category
      ? []
      : [
          {
            ...question(locale, "looking"),
            options: (categories ?? []).map((c) => c.name),
            multiple: true,
          },
        ]),
    ...BASE_IDS.filter((id) => id !== "hob" || hobWidth).map((id) => question(locale, id)),
    {
      ...question(locale, "area"),
      options: regions.map((r) => regionNames[r.slug] ?? r.region),
    },
  ];
}

/** Answers, name and the message they compose. */
export function useEnquiry(questions: Question[], category?: string, locale: Locale = "en") {
  const f = t(locale).funnel;
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
        ? f.helloCategory(category.toLowerCase())
        : looking.length > 0
          ? f.helloShopping(looking.join(locale === "zh" ? "、" : ", "))
          : f.helloGeneral,
    ];

    const details = questions
      .filter((q) => q.id !== "looking")
      .map((q) => {
        const value = answers[q.id] ?? [];
        return value.length > 0 ? `${q.label}${locale === "zh" ? "：" : ": "}${listJoin(locale, value)}` : null;
      })
      .filter((line): line is string => line !== null);

    if (details.length > 0) lines.push("", ...details);
    if (name.trim()) lines.push("", f.thanks(name.trim()));
    return lines.join("\n");
  }, [answers, category, name, questions, locale, f]);

  return { answers, name, setName, toggle, answered, message, href: whatsappLink(message) };
}
