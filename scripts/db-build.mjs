// data/sql/*.sql -> .data/vatti.db
// Idempotent: drops and recreates the file every run. Wired into prebuild.

import { readFileSync, existsSync, mkdirSync, rmSync, readdirSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import { DatabaseSync } from "node:sqlite";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");
const out = join(root, ".data/vatti.db");

mkdirSync(join(root, ".data"), { recursive: true });
for (const f of [out, out + "-shm", out + "-wal"]) if (existsSync(f)) rmSync(f);

// schema first, then the rest alphabetically
const dir = join(root, "data/sql");
const files = readdirSync(dir).filter((f) => f.endsWith(".sql"));
const ordered = ["schema.sql", ...files.filter((f) => f !== "schema.sql").sort()];

const db = new DatabaseSync(out);
db.exec("PRAGMA foreign_keys = ON");

for (const f of ordered) {
  if (!files.includes(f)) continue;
  try {
    db.exec(readFileSync(join(dir, f), "utf8"));
  } catch (err) {
    throw new Error(`${f}: ${err.message}`);
  }
}

const count = (t) => db.prepare(`SELECT count(*) AS n FROM ${t}`).get().n;
const tables = ["product_category", "product", "product_facet", "product_spec", "image", "product_image", "product_download", "product_video", "product_related"];
console.log(tables.map((t) => `${t}=${count(t)}`).join("  "));
db.close();
console.log("built .data/vatti.db");
