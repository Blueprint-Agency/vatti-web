# Design

Visual system for the Vatti Malaysia rebuild. Strategy lives in [PRODUCT.md](PRODUCT.md);
this file is how it looks. Every colour below is verified, not asserted — see § Verification.

## Direction

**Instrument.** The reference is measurement equipment and HVAC schematics: a near-black chassis,
teal used as an emissive readout rather than decoration, and the product's measured figures —
airflow, static pressure, noise, capacity, warranty years — promoted to hero typography.

The reasoning is commercial, not stylistic. Airflow and pressure exist on 16 of 16 range hoods and
no competitor foregrounds them. Vatti's own site buries them inside JPEGs. Making the numbers the
visual system converts the brand's only objective advantage into its aesthetic.

**Two worlds, one voice.** Product, category and home surfaces run dark — the instrument chassis.
The 107 long-form articles run light: reading 900 words of grease-filter maintenance on near-black
is hostile, and pretending otherwise would be style over use. Type, spacing and teal accent carry
across both; only the ground changes.

### What this is not

Not terminal-dark developer cliché — there is no monospace body copy, no green-on-black, no fake
CLI chrome. Not Bosch/Miele sterile minimal. Not the Sahara-palette Elementor site. Not
editorial-magazine (no display serif, no italic drop caps, no ruled broadsheet columns). Not
shadcn-generic (no glassmorphism, no icon-heading-text feature grids, no gradient text).

## Color

Teal is retained from the current site so returning visitors recognise the brand, but rebuilt in
OKLCH. The old `#2A9D8F` was Elementor's stock Sahara teal; it is muddy at small sizes and its
orange/yellow siblings are dropped entirely.

Neutrals are tinted **toward the brand hue** (chroma 0.012–0.022 at hue 200), never toward warm —
the cream/sand default is banned.

### Dark — the chassis (product, category, home)

| Token | OKLCH | Hex | Role |
|---|---|---|---|
| `--void` | `0.16 0.012 200` | `#070f0f` | page ground |
| `--surface` | `0.21 0.014 200` | `#111a1b` | panels, cards |
| `--raised` | `0.26 0.016 200` | `#1b2627` | hover, active, popovers |
| `--line` | `0.32 0.018 200` | `#283636` | decorative dividers |
| `--line-strong` | `0.55 0.022 200` | `#637677` | input borders, focus rings |
| `--ink` | `0.97 0.004 200` | `#f2f6f6` | primary text |
| `--ink-muted` | `0.78 0.012 200` | `#afbaba` | secondary text |
| `--teal` | `0.78 0.115 185` | `#4dcfc1` | readout glow, links, primary CTA |
| `--teal-core` | `0.68 0.105 190` | `#32ada7` | fills, chart marks |
| `--ember` | `0.76 0.150 55` | `#f99549` | heat / warning only — never decorative |

### Light — the reading surface (articles)

| Token | OKLCH | Hex | Role |
|---|---|---|---|
| `--paper` | `0.985 0.003 200` | `#f8fbfb` | article ground |
| `--paper-surface` | `0.955 0.005 200` | `#ecf1f1` | pull-quotes, callouts |
| `--paper-ink` | `0.24 0.015 200` | `#172122` | body text |
| `--paper-muted` | `0.49 0.015 200` | `#576364` | captions, meta |
| `--paper-line` | `0.86 0.008 200` | `#cbd3d3` | rules |
| `--teal-deep` | `0.52 0.084 193` | `#157876` | links, accents on light |

### Strategy

**Committed**, not restrained. The dark chassis is the surface — teal is not a 10% accent sprinkled
on neutral, it is the readout colour that carries product identity. `--ember` is rationed: heat
indicators and warnings only. Two accents, no more.

## Typography

**Archivo** (display + UI + body) and **Martian Mono** (measured values only).

Both are variable with a width axis, verified live on Google Fonts:

```
Archivo:wdth,wght@62..125,100..900
Martian+Mono:wdth,wght@75..112.5,100..800
```

Archivo is an industrial grotesque with signage lineage — it reads as a machined faceplate rather
than a startup landing page. Its `wdth` axis supplies condensed-through-expanded display from a
single family, so the contrast comes from one voice, not a mismatched pair.

Martian Mono appears **only** on measured values: `23 m³/min`, `520 Pa`, `52 dB`, `10 yr`. Mono as
generic "technical" costume is banned; mono on an actual instrument readout is the point. Never in
body copy, never in headings, never in nav.

Inter and Plus Jakarta Sans — both loaded by the current site — are dropped. They are the most
saturated AI/startup defaults and would undo the whole direction.

- Scale: modular, ratio 1.25, fluid `clamp()` for headings. Display ceiling **6rem**.
- Display letter-spacing floor **-0.04em**. Never tighter.
- Readout figures use `font-variant-numeric: tabular-nums` so spec columns align.
- Body measure capped at **68ch**. `text-wrap: balance` on h1–h3, `pretty` on prose.
- Light-on-dark gets **+0.05** line-height over the light-mode equivalent.

## Layout

- Fluid spacing on a 4px base with `clamp()`. Vary rhythm — generous between sections, tight within
  a spec block.
- Grid for 2D, flex for 1D. Responsive product grids: `repeat(auto-fit, minmax(280px, 1fr))`.
- **The spec table is the signature component**, not a tab at the bottom of the page. Two columns,
  tabular figures, the four normalised facets (`airflow_m3h`, `air_pressure_pa`, `noise_db`,
  `capacity_litres`) lifted into a comparison strip above it.
- Cards only where they are genuinely the affordance. Never nested.
- Semantic z-index scale: `dropdown → sticky → modal-backdrop → modal → toast → tooltip`.

## Motion

Restrained and mechanical — an instrument settling, not a page performing.

- Ease-out-quart/quint. No bounce, no elastic.
- Readout figures count up on first paint where they are the hero; once, never on scroll-repeat.
- Staggered reveal is allowed within a single list, not applied uniformly to every section.
- Reveals **enhance an already-visible default**. Never gate content behind a transition — it ships
  blank in headless renderers and on hidden tabs.
- Every animation has a `prefers-reduced-motion: reduce` alternative (crossfade or instant).

## Imagery

Product photography on the dark chassis, cut out or shot on near-black so it sits in the surface
rather than on it. Dimension diagrams and exploded views are first-class imagery, not afterthoughts.

The current site's 5–20 full-width feature JPEGs per product — with all copy baked into the pixels —
are **not** reproduced. That text becomes real markup in `product_image.caption_md`.

Alt text carries voice: "V993 lifting hood extended over a gas wok burner", not "product image".

## Components

Source mechanical primitives from 21st.dev where they save time — table primitives, filter grids
with live counts, gallery/lightbox, skeletons. Do **not** take its themes (generic shadcn token
dumps) or its comparison tables (all pricing-shaped: three plans, recommended column, check marks —
wrong shape for appliance specs, which are ordered bullets with a nullable key).

Every imported component is restyled to these tokens before it ships. None arrives with its own look.

## Verification

The palette was generated and checked numerically (OKLCH → sRGB, WCAG 2.1 relative luminance). All
values are in sRGB gamut. Contrast floors: **4.5:1** text, **3:1** large text and UI boundaries.

| Pair | Ratio | Requirement |
|---|---|---|
| `ink` on `void` | 17.79 | 4.5 ✓ |
| `ink-muted` on `void` | 9.72 | 4.5 ✓ |
| `ink-muted` on `raised` | 7.76 | 4.5 ✓ |
| `teal` on `void` | 10.17 | 4.5 ✓ |
| `teal` on `surface` | 9.27 | 4.5 ✓ |
| `teal-core` on `void` | 7.05 | 4.5 ✓ |
| `ember` on `void` | 8.65 | 4.5 ✓ |
| `line-strong` on `surface` | 3.68 | 3.0 ✓ |
| `paper-ink` on `paper` | 15.70 | 4.5 ✓ |
| `paper-muted` on `paper` | 5.96 | 4.5 ✓ |
| `teal-deep` on `paper` | 5.06 | 4.5 ✓ |

Two earlier candidates were rejected by this check and are recorded so they are not reintroduced:
`teal-core` at chroma 0.13 and `teal-deep` at chroma 0.10 fell outside sRGB gamut at hue 190–193
(max in-gamut chroma is 0.117 at L 0.68, 0.089 at L 0.52), and `line-strong` at L 0.46 reached only
2.50:1 against `surface`, below the 3:1 required for interactive borders.

Re-run the check whenever a token changes. Placeholder text is held to the same 4.5:1 as body — the
muted-gray placeholder is the most common contrast failure and is not permitted here.
