// Credential reader. Shared by media-upload.mjs and the importers so the credentials
// have exactly one parser.
//
// process.env wins over .env.local: locally the file is the source (see .env.example),
// and in CI the same names arrive as secrets with no file on disk. A missing .env.local
// is therefore not an error — a missing *variable* is, and `required` says which.
import { existsSync, readFileSync } from "node:fs";
import path from "node:path";

const file = path.join(import.meta.dirname, "..", ".env.local");

const fromFile = existsSync(file)
  ? Object.fromEntries(
      readFileSync(file, "utf8")
        .split("\n")
        .filter((l) => l.trim() && !l.startsWith("#"))
        .map((l) => {
          const i = l.indexOf("=");
          return [l.slice(0, i).trim(), l.slice(i + 1).trim()];
        }),
    )
  : {};

export const env = { ...fromFile, ...process.env };

export function required(name) {
  const value = env[name];
  if (!value) throw new Error(`${name} missing — set it in .env.local (see .env.example)`);
  return value;
}
