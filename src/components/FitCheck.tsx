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
 *
 * Beside the numbers stands the same elevation the manufacturer draws — floor,
 * counter, hood, ducting hole — redrawn from whatever the visitor typed. Two
 * readouts saying "1,400 to 1,500 mm off the floor" are only worth trusting if
 * the reader can see WHERE that is measured from, which is the whole job of
 * the arrows on the original PDF.
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

      {/* Placed rather than ordered: on a phone the drawing belongs between the
          inputs and the answer, so a thumb sees it move. From lg it stands
          beside both, spanning the two rows. */}
      <div className="mt-6 grid items-start gap-x-8 gap-y-7 lg:grid-cols-[minmax(0,1fr)_16rem]">
        <div className="grid gap-5 sm:grid-cols-2 lg:col-start-1 lg:row-start-1">
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

        <div className="mx-auto w-full max-w-[15rem] lg:col-start-2 lg:row-span-2 lg:row-start-1 lg:max-w-none">
          <FitDiagram
            model={model}
            metrics={metrics}
            counter={counter}
            opening={opening}
            tone={verdict.tone}
          />
        </div>

        {/* Announced on change rather than on a press: there is no submit, so a
            screen reader would otherwise never learn that the answer moved. */}
        <div aria-live="polite" className="lg:col-start-1 lg:row-start-2">
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

/* ---------------------------------------------------------------------------
   The elevation.

   The viewBox IS the kitchen: one user unit is one millimetre, so a 896 mm
   hood is 896 units wide and every arrow is exactly as long as the number it
   carries. Nothing is scaled, rounded or nudged to make the picture work,
   which is the only reason a drawing is allowed to sit beside a calculator.

   Its height therefore moves with the counter height, so the frame is a fixed
   aspect box and the drawing is fitted into it. A picture that resized the
   card on every keystroke would push the answer off the reader's screen.
   --------------------------------------------------------------------------- */

/** How much wall the elevation shows. Wide enough for a 900 mm hood between
    two cabinet runs without the drawing becoming a corridor. */
const WALL = 1500;
const CX = WALL / 2;
/** Drawn, not quoted. No VATTI drawing publishes a canopy or chimney height,
    and the diagram needs a hood-shaped thing to hang off the clearance. Every
    dimension carrying a number comes from `product_dimension`; these carry
    none, and no arrow points at them. */
const CANOPY = 230;
const CHIMNEY = 320;
const HOB = 780;
const WORKTOP = 44;
/** Wall left above the ducting hole, so the chimney has somewhere to go. */
const HEADROOM = 320;
/** Half of a 7 inch duct, which is what these drawings specify without
    exception — see the note on every `duct_above_counter` row. */
const DUCT_R = 89;
/** Label size in millimetres of wall. Large in the drawing's own units and
    around 13px on screen, which is the floor for a figure someone squints at. */
const LABEL = 78;
/** Air above the ceiling line and below the floor line. */
const PAD = 70;

function FitDiagram({
  model,
  metrics,
  counter,
  opening,
  tone,
}: {
  model: string;
  metrics: FitMetrics;
  counter: number;
  opening: number;
  tone: "yes" | "tight" | "no";
}) {
  // The drawing survives a half-typed number. The readouts refuse to answer
  // outside 600 to 1200 and say so; a picture that vanished mid-keystroke
  // would only look broken.
  const c = clamp(counter || 850, 600, 1200);
  const hoodLo = c + metrics.clearance.min;
  const hoodHi = c + metrics.clearance.max;
  const ductLo = c + metrics.duct.min;
  const ductHi = c + metrics.duct.max;
  const ductMid = (ductLo + ductHi) / 2;

  const TOP = ductHi + HEADROOM;
  const y = (v: number) => TOP - v;

  // The hood hangs at the lowest clearance the drawing allows. Drawing it
  // mid-range would put it at a height the manufacturer never states, so the
  // rest of the range is shown on the dimension line instead of on the
  // appliance — see the dashed run above the arrowhead.
  const band = hoodHi > hoodLo;

  const gap = clamp(opening || metrics.opening, 240, WALL - 60);
  const gapL = CX - gap / 2;
  const gapR = CX + gap / 2;
  const hoodL = CX - metrics.width / 2;
  const hoodR = CX + metrics.width / 2;

  const openTone = tone === "yes" ? "text-teal" : "text-ember";
  const edgeTone = tone === "yes" ? "text-line-strong" : "text-ember";

  return (
    <div className="relative w-full" style={{ aspectRatio: "5 / 9" }}>
      <svg
        // Padded top and bottom, or the floor line, the ceiling line and both
        // arrowheads that land on the floor lose half their stroke to the edge
        // of the box.
        viewBox={`0 ${-PAD} ${WALL} ${TOP + PAD * 2}`}
        preserveAspectRatio="xMidYMid meet"
        role="img"
        aria-label={`Side view of the ${model} over a ${c} mm counter, drawn to the numbers above.`}
        className="absolute inset-0 h-full w-full"
      >
        {/* --- the room -------------------------------------------------- */}
        <g className="text-line" stroke="currentColor" strokeWidth={8} fill="none">
          <line x1={0} y1={y(TOP)} x2={WALL} y2={y(TOP)} />
        </g>

        {/* --- the counter run ------------------------------------------- */}
        <g className="text-line" stroke="currentColor" strokeWidth={8}>
          <rect x={0} y={y(c)} width={WALL} height={c} fill="var(--color-raised)" />
          <line x1={0} y1={y(c - WORKTOP)} x2={WALL} y2={y(c - WORKTOP)} />
          <line x1={0} y1={y(110)} x2={WALL} y2={y(110)} />
        </g>

        {/* The floor is the datum both long arrows land on, so it is the one
            line in the drawing carrying any weight. */}
        <line
          className="text-line-strong"
          x1={0}
          y1={y(0)}
          x2={WALL}
          y2={y(0)}
          stroke="currentColor"
          strokeWidth={13}
        />

        {/* The hob. Nothing measures it, but the clearance is quoted from its
            surface, so the surface has to be visible. */}
        <g className="text-line-strong" stroke="currentColor" strokeWidth={8}>
          <rect x={CX - HOB / 2} y={y(c + 26)} width={HOB} height={26} fill="var(--color-void)" />
          <path d={`M ${CX - 210} ${y(c + 26)} a 62 46 0 0 1 124 0`} fill="var(--color-void)" />
          <path d={`M ${CX + 86} ${y(c + 26)} a 62 46 0 0 1 124 0`} fill="var(--color-void)" />
        </g>

        {/* --- the hood --------------------------------------------------- */}
        <g className="text-line-strong" stroke="currentColor" strokeWidth={9}>
          <rect
            x={CX - CHIMNEY / 2}
            y={y(TOP)}
            width={CHIMNEY}
            height={Math.max(TOP - hoodLo - CANOPY, 0)}
            fill="var(--color-void)"
          />
          <polygon
            points={`${hoodL},${y(hoodLo)} ${hoodR},${y(hoodLo)} ${hoodR - 46},${y(hoodLo + CANOPY)} ${hoodL + 46},${y(hoodLo + CANOPY)}`}
            fill="var(--color-void)"
          />
          <line
            x1={hoodL + 70}
            y1={y(hoodLo + 74)}
            x2={hoodR - 70}
            y2={y(hoodLo + 74)}
            strokeWidth={7}
          />
        </g>

        {/* --- the cabinets the hood slots between ------------------------ */}
        {/* Drawn AFTER the hood on purpose: when the opening is narrower than
            the appliance the cabinet runs cut across it, and the reader sees
            the collision the verdict line is describing. */}
        <g className="text-line" stroke="currentColor" strokeWidth={8}>
          <rect
            x={0}
            y={y(TOP)}
            width={Math.max(gapL, 0)}
            height={TOP - hoodLo}
            fill="var(--color-raised)"
          />
          <rect
            x={gapR}
            y={y(TOP)}
            width={Math.max(WALL - gapR, 0)}
            height={TOP - hoodLo}
            fill="var(--color-raised)"
          />
        </g>
        {/* The two faces the opening is measured between. They only shout when
            the hood does not clear them. */}
        <g className={edgeTone} stroke="currentColor" strokeWidth={11}>
          <line x1={gapL} y1={y(TOP)} x2={gapL} y2={y(hoodLo)} />
          <line x1={gapR} y1={y(TOP)} x2={gapR} y2={y(hoodLo)} />
        </g>

        {/* The appliance does not shrink to fit. Where the cabinets have just
            covered it, its real outline comes back as a hidden line, so the
            reader sees an overlap rather than a smaller hood. */}
        {metrics.width > gap && (
          <polygon
            className="text-ember"
            points={`${hoodL},${y(hoodLo)} ${hoodR},${y(hoodLo)} ${hoodR - 46},${y(hoodLo + CANOPY)} ${hoodL + 46},${y(hoodLo + CANOPY)}`}
            fill="none"
            stroke="currentColor"
            strokeWidth={9}
            strokeDasharray="30 24"
          />
        )}

        {/* The ducting hole is in the wall behind the chimney, so it is drawn
            the way a drawing draws anything hidden: dashed. */}
        <g className="text-teal" stroke="currentColor" strokeWidth={9} fill="none">
          <circle cx={CX} cy={y(ductMid)} r={DUCT_R} strokeDasharray="30 24" />
        </g>

        {/* --- the dimensions --------------------------------------------- */}
        {/* Teal for the two the calculator computes, so the arrow and the
            readout that repeat each other look like each other. The clearance
            is the product's own constant and stays quiet. */}
        <Dim className="text-ink-muted">
          <VLine x={430} from={y(c)} to={y(hoodLo)} />
          <Tick x={430} y={y(c)} />
          <Tick x={430} y={y(hoodLo)} />
          <Label x={496} y={y((c + hoodLo) / 2)} anchor="start">
            {`${range(metrics.clearance)} mm`}
          </Label>
        </Dim>

        <Dim className="text-teal">
          <VLine x={1350} from={y(hoodLo)} to={y(0)} />
          <Tick x={1350} y={y(hoodLo)} />
          {/* The arrow lands on the hood at its lowest legal position and the
              dashed run carries on to its highest, which is the second number
              in the label. */}
          {band && (
            <>
              <line
                x1={1350}
                y1={y(hoodLo)}
                x2={1350}
                y2={y(hoodHi)}
                strokeDasharray="26 22"
                opacity={0.6}
              />
              <Tick x={1350} y={y(hoodHi)} />
            </>
          )}
          <line
            x1={hoodR}
            y1={y(hoodLo)}
            x2={1350}
            y2={y(hoodLo)}
            strokeWidth={6}
            strokeDasharray="24 22"
            opacity={0.6}
          />
          <Label x={1288} y={y(hoodLo * 0.5)} rotate>
            {`${range({ min: hoodLo, max: hoodHi })} mm`}
          </Label>
        </Dim>

        <Dim className="text-teal">
          <VLine x={110} from={y(ductMid)} to={y(0)} />
          <Tick x={110} y={y(ductMid)} />
          <line
            x1={110}
            y1={y(ductMid)}
            x2={CX - DUCT_R}
            y2={y(ductMid)}
            strokeWidth={6}
            strokeDasharray="24 22"
            opacity={0.6}
          />
          <Label x={172} y={y(ductMid * 0.52)} rotate>
            {`${range({ min: ductLo, max: ductHi })} mm`}
          </Label>
        </Dim>

        <Dim className={openTone}>
          {/* Broken for its own label rather than labelled underneath: there is
              a ducting hole 130 mm below this line and nowhere else to put the
              figure. */}
          <HLine y={y(TOP - 150)} from={gapL} to={gapR} breakFor={230} />
          <Label x={CX} y={y(TOP - 150)}>
            {`${gap.toLocaleString("en-MY")} mm`}
          </Label>
        </Dim>
      </svg>
    </div>
  );
}

/** A dimension in the drawing's own ink: hairline geometry, solid arrowheads,
    and text carrying its own background so it can cross a cabinet. */
function Dim({ className, children }: { className: string; children: React.ReactNode }) {
  return (
    <g className={className} stroke="currentColor" strokeWidth={9} fill="none">
      {children}
    </g>
  );
}

function VLine({ x, from, to }: { x: number; from: number; to: number }) {
  const [top, bottom] = from < to ? [from, to] : [to, from];
  return (
    <>
      <line x1={x} y1={top} x2={x} y2={bottom} />
      <Head x={x} y={top} dir={1} />
      <Head x={x} y={bottom} dir={-1} />
    </>
  );
}

/** `breakFor` leaves a hole in the middle of the line for the label to sit in,
    the way a drafted dimension carries its own figure. */
function HLine({
  y,
  from,
  to,
  breakFor = 0,
}: {
  y: number;
  from: number;
  to: number;
  breakFor?: number;
}) {
  const mid = (from + to) / 2;
  const stop = Math.min(breakFor, Math.max((to - from) / 2 - 80, 0));
  return (
    <>
      <line x1={from} y1={y} x2={mid - stop} y2={y} />
      <line x1={mid + stop} y1={y} x2={to} y2={y} />
      <Head x={from} y={y} dir={1} flip />
      <Head x={to} y={y} dir={-1} flip />
    </>
  );
}

/** Tip at (x, y), body running back along `dir`. */
function Head({ x, y, dir, flip }: { x: number; y: number; dir: 1 | -1; flip?: boolean }) {
  const points = flip
    ? `${x},${y} ${x + dir * 58},${y - 17} ${x + dir * 58},${y + 17}`
    : `${x},${y} ${x - 17},${y + dir * 58} ${x + 17},${y + dir * 58}`;
  return <polygon points={points} fill="currentColor" stroke="none" />;
}

function Tick({ x, y }: { x: number; y: number }) {
  return <line x1={x - 66} y1={y} x2={x + 66} y2={y} strokeWidth={7} />;
}

function Label({
  x,
  y,
  rotate,
  anchor = "middle",
  children,
}: {
  x: number;
  y: number;
  rotate?: boolean;
  anchor?: "start" | "middle";
  children: string;
}) {
  return (
    <text
      className="readout"
      x={x}
      y={y}
      fontSize={LABEL}
      textAnchor={anchor}
      dominantBaseline="central"
      fill="currentColor"
      stroke="var(--color-surface)"
      strokeWidth={20}
      strokeLinejoin="round"
      // A halo, not an outline: painting the stroke first and the fill over it
      // lets a label sit on a cabinet without a box behind it.
      style={{ paintOrder: "stroke" }}
      transform={rotate ? `rotate(-90 ${x} ${y})` : undefined}
    >
      {children}
    </text>
  );
}

const clamp = (n: number, lo: number, hi: number) => Math.min(Math.max(n, lo), hi);
const mm = (n: number) => `${n.toLocaleString("en-MY")} mm`;
const range = (r: { min: number; max: number }) =>
  r.min === r.max
    ? r.min.toLocaleString("en-MY")
    : `${r.min.toLocaleString("en-MY")} to ${r.max.toLocaleString("en-MY")}`;
