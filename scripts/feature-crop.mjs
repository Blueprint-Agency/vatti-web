// data/crops/*.json -> old-media/  (then: node scripts/media-upload.mjs)
//
//   node scripts/feature-crop.mjs                 every manifest
//   node scripts/feature-crop.mjs v929 v999       named ones
//
// The source site sets its product copy INSIDE the picture. Splitting the two
// means cutting the picture out of the composite, and the cut has to be written
// down somewhere reviewable: a box in a JSON file is a diff, a box typed into a
// one-off script is folklore. `data/crops/<name>.json`:
//
//   { "product": "vatti-aetheris-series-cooker-hood-v929",
//     "crops": [
//       { "from": "2025/07/V929-PG-8.webp",
//         "to":   "2026/08/v929-pm25-kitchen.webp",
//         "box":  [0, 0.11, 1, 0.87],          // x0 y0 x1 y1, fractions
//         "why":  "heading band top, captions bottom" } ] }
//
// Sources are pulled from R2 and cached under .cache/crop-src/, so a re-run
// after adjusting a box costs nothing. Output goes to old-media/<to>, which IS
// the bucket key — see CLAUDE.md § Images.
//
// Idempotent: a crop whose output already exists is skipped unless --force.
import { existsSync, mkdirSync, readFileSync, readdirSync, writeFileSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";

import sharp from "sharp";

import { CDN } from "./cdn.mjs";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");
const cache = join(root, ".cache/crop-src");
const force = process.argv.includes("--force");
const names = process.argv.slice(2).filter((a) => !a.startsWith("--"));

const dir = join(root, "data/crops");
const manifests = readdirSync(dir)
  .filter((f) => f.endsWith(".json"))
  .filter((f) => !names.length || names.includes(f.replace(".json", "")));

if (!manifests.length) {
  console.error(`no manifest matched${names.length ? ` (${names.join(", ")})` : ""}`);
  process.exit(1);
}

mkdirSync(cache, { recursive: true });
let written = 0;
let skipped = 0;

for (const file of manifests) {
  const manifest = JSON.parse(readFileSync(join(dir, file), "utf8"));
  console.log(`\n${manifest.product}`);

  for (const crop of manifest.crops) {
    const out = join(root, "old-media", crop.to);
    if (existsSync(out) && !force) {
      skipped++;
      continue;
    }

    const src = join(cache, crop.from.replaceAll("/", "_"));
    if (!existsSync(src)) {
      const res = await fetch(`${CDN}/${crop.from}`);
      if (!res.ok) throw new Error(`${crop.from}: ${res.status}`);
      writeFileSync(src, Buffer.from(await res.arrayBuffer()));
    }

    // `frame` picks one page out of an animation. Six of the V999 slides ship
    // as 100-frame GIFs, 53MB between them on one page: the motion is marketing
    // and the information is in the still, so a frame is cut out and the
    // animation is dropped. Without it, sharp reads page 0.
    const read = crop.frame === undefined ? {} : { page: crop.frame };
    const probe = await sharp(src).metadata();
    const frame = crop.frame === -1 ? (probe.pages ?? 1) - 1 : crop.frame;
    if (frame !== undefined) read.page = frame;
    const meta = await sharp(src, read).metadata();
    const [x0, y0, x1, y1] = crop.box ?? [0, 0, 1, 1];
    // On an animated source `height` is the whole filmstrip; a box is written
    // against one frame, so pageHeight is the height a fraction refers to.
    const pageHeight = meta.pageHeight ?? meta.height;
    const left = Math.round(x0 * meta.width);
    const top = Math.round(y0 * pageHeight);
    // Rounding both edges independently can overrun the source by a pixel,
    // which libvips rejects outright rather than clamping.
    const width = Math.min(Math.round((x1 - x0) * meta.width), meta.width - left);
    const height = Math.min(Math.round((y1 - y0) * pageHeight), pageHeight - top);

    mkdirSync(dirname(out), { recursive: true });
    await sharp(src, read)
      .extract({ left, top, width, height })
      .webp({ quality: 90, effort: 6 })
      .toFile(out);

    console.log(`  ${crop.to}  ${width}x${height}${crop.why ? `  (${crop.why})` : ""}`);
    written++;
  }
}

console.log(`\n${written} written, ${skipped} already there`);
console.log("next: node scripts/media-upload.mjs");
