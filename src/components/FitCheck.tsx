"use client";

import { useId, useState } from "react";

export type FitMetrics = {
  /** How wide the appliance is. */
  width: number;
  /** The clear opening it needs, which is wider than the appliance. */
  opening: number;
  /** Hob surface to the bottom of the hood. */
  clearance: { min: number; max: number };
  /** Counter surface to the middle of the ducting hole. */
  duct: { min: number; max: number };
};

/**
 * The one question that ends a shortlist: does it fit MY kitchen.
 *
 * The drawing answers it for the kitchen the drawing was made in — an 850mm
 * counter — and every figure on it is quoted from the floor. A Malaysian condo
 * fit-out is rarely 850, so a visitor is left doing arithmetic on a PDF while
 * standing in a showroom. This does that arithmetic.
 *
 * Nothing here is a lead form. It asks for two numbers, answers immediately,
 * stores nothing and posts nothing — a tool that emails you the result is a
 * form wearing a calculator's coat, and this page's conversion is a WhatsApp
 * message the visitor chooses to send.
 *
 * Every constant comes from `product_dimension.metric`, so the same component
 * serves any model whose drawing has been transcribed, and appears on no model
 * where it has not.
 */
export function FitCheck({ model, metrics }: { model: string; metrics: FitMetrics }) {
  const id = useId();
  // Defaults are the drawing's own kitchen: a visitor who changes nothing sees
  // the numbers the PDF states, which is the honest starting position.
  const [counter, setCounter] = useState(850);
  const [opening, setOpening] = useState(metrics.opening);

  const valid = counter >= 600 && counter <= 1200;
  const hood = { min: counter + metrics.clearance.min, max: counter + metrics.clearance.max };
  const duct = { min: counter + metrics.duct.min, max: counter + metrics.duct.max };

  const verdict =
    opening >= metrics.opening
      ? {
          tone: "yes" as const,
          text: `Fits. The ${model} is ${mm(metrics.width)} wide and wants ${mm(metrics.opening)} of clear opening.`,
        }
      : opening >= metrics.width
        ? {
            tone: "tight" as const,
            text: `Tight. The ${model} is ${mm(metrics.width)} wide, so it goes in, but it is ${mm(metrics.opening - opening)} short of the ${mm(metrics.opening)} the installer wants to work in.`,
          }
        : {
            tone: "no" as const,
            text: `Too narrow. The ${model} is ${mm(metrics.width)} wide and your opening is ${mm(opening)}.`,
          };

  return (
    <div className="rounded-sm border border-line bg-surface p-5 sm:p-7">
      <h3 className="text-[1.0625rem] font-semibold tracking-[-0.02em]">Check it against your kitchen</h3>
      <p className="mt-2 max-w-[54ch] text-sm text-ink-muted">
        The drawing is quoted from the floor of a kitchen with an 850mm counter. Put your own
        numbers in and it re-reads itself.
      </p>

      <div className="mt-6 grid gap-5 sm:grid-cols-2">
        <Field
          id={`${id}-counter`}
          label="Your counter height"
          value={counter}
          min={600}
          max={1200}
          onChange={setCounter}
        />
        <Field
          id={`${id}-opening`}
          label="Clear width above your hob"
          value={opening}
          min={500}
          max={2000}
          onChange={setOpening}
        />
      </div>

      {/* Announced on change rather than on a press: there is no submit, so a
          screen reader would otherwise never learn that the answer moved. */}
      <div aria-live="polite" className="mt-6">
        {valid ? (
          <>
            <dl className="grid gap-4 sm:grid-cols-2">
              <Result label="Bottom of the hood, off the floor" value={`${range(hood)} mm`} />
              <Result label="Ducting hole, off the floor" value={`${range(duct)} mm`} />
            </dl>
            <p
              className={`mt-5 border-l-2 pl-4 text-sm leading-relaxed ${
                verdict.tone === "yes"
                  ? "border-teal text-ink"
                  : verdict.tone === "tight"
                    ? "border-ember text-ink"
                    : "border-line-strong text-ink-muted"
              }`}
            >
              {verdict.text}
            </p>
          </>
        ) : (
          <p className="text-sm text-ink-muted">
            Counter heights run from 600 to 1,200 mm. Check the number above.
          </p>
        )}
      </div>

      <p className="mt-5 text-xs text-ink-muted">
        A guide, not a survey. Your dealer measures the run before quoting.
      </p>
    </div>
  );
}

function Field({
  id,
  label,
  value,
  min,
  max,
  onChange,
}: {
  id: string;
  label: string;
  value: number;
  min: number;
  max: number;
  onChange: (n: number) => void;
}) {
  return (
    <div>
      <label htmlFor={id} className="block text-sm text-ink-muted">
        {label}
      </label>
      <div className="mt-2 flex items-center gap-2">
        <input
          id={id}
          type="number"
          inputMode="numeric"
          value={value}
          min={min}
          max={max}
          step={10}
          onChange={(e) => onChange(Number(e.target.value))}
          className="readout w-full rounded-sm border border-line bg-void px-3.5 py-2.5 text-ink outline-none transition-colors focus:border-teal"
        />
        <span className="readout text-xs text-ink-muted">mm</span>
      </div>
    </div>
  );
}

function Result({ label, value }: { label: string; value: string }) {
  return (
    <div className="border-t border-line pt-3">
      <dt className="text-xs text-ink-muted">{label}</dt>
      <dd className="readout mt-1 text-lg text-teal">{value}</dd>
    </div>
  );
}

const mm = (n: number) => `${n.toLocaleString("en-MY")} mm`;
const range = (r: { min: number; max: number }) =>
  r.min === r.max
    ? r.min.toLocaleString("en-MY")
    : `${r.min.toLocaleString("en-MY")} to ${r.max.toLocaleString("en-MY")}`;
