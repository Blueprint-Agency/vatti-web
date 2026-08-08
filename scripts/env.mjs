// .env.local reader. Shared by media-upload.mjs and import-products.mjs so the
// credentials have exactly one parser.
import { readFileSync } from "node:fs";
import path from "node:path";

const file = path.join(import.meta.dirname, "..", ".env.local");

export const env = Object.fromEntries(
  readFileSync(file, "utf8")
    .split("\n")
    .filter((l) => l.trim() && !l.startsWith("#"))
    .map((l) => {
      const i = l.indexOf("=");
      return [l.slice(0, i).trim(), l.slice(i + 1).trim()];
    }),
);

export function required(name) {
  const value = env[name];
  if (!value) throw new Error(`${name} missing from .env.local`);
  return value;
}
