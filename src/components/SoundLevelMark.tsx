/**
 * A speaker dropping from four sound waves to one.
 *
 * The reason it says "quiet" is the motion, not the glyph: it opens loud, sheds
 * a wave at a time, and comes to rest on the single wave — which is exactly
 * Phosphor's SpeakerSimpleLow, the mark this card used to carry as a still
 * image. A reader who never sees it move still sees the right icon.
 *
 * Hand-drawn because Phosphor's speaker family stops at two waves
 * (SpeakerSimpleNone, -Low, -High), and there is no four-wave member to reach
 * for. Nothing here is invented, though: the body is Phosphor's own
 * SpeakerSimpleNone `light` path verbatim, and the four bars are its own bar
 * shape continued along its own progression — centres 32 apart at x=200, 232,
 * 264, 296, heights stepping 48, 80, 112, 144. The first two ARE Phosphor's
 * Low and High bars, byte for byte.
 *
 * Which is why the viewBox is 320 wide and not 256. Four bars at that spacing
 * reach x=302, and squeezing them into a 256 box means either tightening the
 * gaps to ~8 units — under a pixel at the size these render, so the bars merge
 * — or scaling the whole mark down, which thins the strokes and leaves this
 * one lighter than the five Phosphor marks beside it. Extra canvas costs
 * neither: 320 units into 32.5px is the same unit-per-pixel as 256 into 26, so
 * the stroke weight matches its neighbours exactly. The mark is 6.5px wider
 * than they are, and since each one sits alone at the head of its own card
 * with nothing to line up against horizontally, that is invisible. Height is
 * what aligns them, and height is identical.
 *
 * The per-wave timing lives in globals.css — see .reason-vol-*.
 */
export function SoundLevelMark({
  size = 26,
  className,
  // Destructured to keep it OFF the element. It is in the signature so this
  // slots into REASON_ICONS beside the Phosphor marks, which are all called
  // with weight="light" — but `weight` is not an SVG attribute, and spreading
  // it through would put an unknown prop on the DOM and a warning in the
  // console. There is nothing to honour: the paths below are already drawn at
  // light's 12-unit thickness.
  weight: _weight,
  ...rest
}: {
  size?: number;
  weight?: "light";
  className?: string;
  "aria-hidden"?: boolean | "true";
}) {
  return (
    <svg
      xmlns="http://www.w3.org/2000/svg"
      viewBox="0 0 320 256"
      width={(size * 320) / 256}
      height={size}
      fill="currentColor"
      className={className}
      {...rest}
    >
      {/* Phosphor SpeakerSimpleNone, `light`. */}
      <path d="M162.64,26.61a6,6,0,0,0-6.32.65L85.94,82H40A14,14,0,0,0,26,96v64a14,14,0,0,0,14,14H85.94l70.38,54.74A6,6,0,0,0,166,224V32A6,6,0,0,0,162.64,26.61ZM154,211.73,91.68,163.26A6,6,0,0,0,88,162H40a2,2,0,0,1-2-2V96a2,2,0,0,1,2-2H88a6,6,0,0,0,3.68-1.26L154,44.27Z" />
      {/* Wave 1 never animates. It is the resting state — the quiet the card
          is claiming — and it is the frame a reduced-motion reader is left
          looking at once the blanket reset stops the other three. */}
      <path d="M206,104v48a6,6,0,0,1-12,0V104a6,6,0,0,1,12,0Z" />
      <path className="reason-vol-2" d="M238,88v80a6,6,0,0,1-12,0V88a6,6,0,0,1,12,0Z" />
      <path className="reason-vol-3" d="M270,72v112a6,6,0,0,1-12,0V72a6,6,0,0,1,12,0Z" />
      <path className="reason-vol-4" d="M302,56v144a6,6,0,0,1-12,0V56a6,6,0,0,1,12,0Z" />
    </svg>
  );
}
