// Re-converts the 2026-08 photo shoot with alpha preserved (no white flatten),
// overwriting the same old-media/ keys in place. No SQL/DB changes — the
// filenames, dimensions and row data from generate-product-images-2026-08.mjs
// stay valid. Run, then re-run media-upload.mjs.
import { mkdirSync, readdirSync } from "node:fs";
import path from "node:path";
import sharp from "sharp";

const ROOT = "C:/Users/danie/vatti-web";
const SRC = "C:/Users/danie/Downloads/vatti product images/Vatti Product Image";

const FOLDERS = [
  ["Cooker Hood/V993", "athena-series-lifting-type-range-hood-v993"],
  ["Cooker Hood/V999", "athena-series-lifting-type-range-hood-v999"],
  ["Cooker Hood/V991", "athena-series-lifting-type-range-hood-v991"],
  ["Cooker Hood/V931", "artemis-series-t-type-range-hood-v931"],
  ["Cooker Hood/V995", "slim-series-type-range-hood-v995"],
  ["Cooker Hood/V996", "vatti-slim-series-type-range-hood-v996"],
  ["Cooker Hood/V919", "vatti-magic-series-cooker-hood-v919"],
  ["Cooker Hood/V929", "vatti-aetheris-series-cooker-hood-v929"],
  ["Cooker Hood/V997 (Black)", "vatti-range-hood-v997"],
  ["Cooker Hood/V998", "vatti-smart-oxygen-range-hood-v998"],
  ["Cooker Hood/V938", "vatti-hidden-series-range-hood-v938"],
  ["Cooker Hood/V960", "vatti-stellar-series-cooker-hood-v960"],
  ["Cooker Hood/V917/Carbon Black", "vatti-cooker-hood-v917-carbon-grey"],
  ["Cooker Hob/C720S", "professional-series-c720s"],
  ["Cooker Hob/C821G", "professional-series-c821g"],
  ["Cooker Hob/C822G", "vatti-flexi-hob-c822g"],
  ["Cooker Hob/C823G", "vatti-flexi-hob-c823g"],
  ["Cooker Hob/C830G", "vatti-3-burner-gas-hob-c830g"],
  ["Cooker Hob/C835G", "vatti-ai-hob-c835g"],
  ["Cooker Hob/C836 (AG Grey)", "vatti-flexi-hob-c836g"],
  ["Cooker Hob/C861G", "vatti-magic-series-cooker-hob-c861g"],
  ["Cooker Hob/M822G", "vatti-oylimpic-hob-m822g"],
  ["Combi Oven/M626", "built-in-microwave-m626"],
  ["Combi Oven/VA05", "built-in-combi-oven-va05"],
  ["Combi Oven/VA06", "vatti-magic-series-combi-oven-va06"],
  ["Water Filter/DWHG01 & V818WD", "vatti-one-tap-water-purifier-wdhg01-with-v818wd"],
  ["Dishwasher/DWID3 (AG Grey)", "vatti-dishwasher-dwid3-ag-grey"],
  ["Dishwasher/DWID3 (White)", "vatti-dishwasher-dwid3-white"],
];

const TABLE = {
  F: "front", F_OP: "front-open", QF: "quarter-front", QF_OP: "quarter-front-open",
  QF_02: "quarter-front-2", S: "side", S_OP: "side-open", OF_OP: "open-detail",
};

function suffixFor(basename) {
  const key = basename.trim().toUpperCase().replace(/\s+/g, "_");
  if (TABLE[key]) return TABLE[key];
  const slug = basename.normalize("NFKD").replace(/[^a-zA-Z0-9]+/g, "-").replace(/^-+|-+$/g, "").toLowerCase();
  return slug || "detail";
}

let converted = 0;
for (const [folder, slug] of FOLDERS) {
  const abs = path.join(SRC, folder);
  const files = readdirSync(abs).filter((f) => /\.(png|jpe?g|webp)$/i.test(f));
  const seen = new Map();
  for (const file of files) {
    const base = path.basename(file, path.extname(file));
    let suffix = suffixFor(base);
    const n = seen.get(suffix) ?? 0;
    if (n > 0) suffix = `${suffix}-${n + 1}`;
    seen.set(suffix, n + 1);

    const dest = path.join(ROOT, "old-media", "2026/08", `${slug}-${suffix}.webp`);
    mkdirSync(path.dirname(dest), { recursive: true });
    await sharp(path.join(abs, file)).webp({ quality: 90, effort: 6 }).toFile(dest);
    converted++;
  }
  console.log(`${folder} -> ${slug}`);
}
console.log(`\n${converted} images re-converted with alpha preserved`);
