// data/sql/*.sql -> .data/vatti.db
// Idempotent: drops and recreates the file every run. Called explicitly at the
// front of the build script — NOT via a prebuild hook, see CLAUDE.md.

import { readFileSync, existsSync, mkdirSync, rmSync, readdirSync } from "node:fs";
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import { DatabaseSync } from "node:sqlite";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");
const out = join(root, ".data/vatti.db");

// Explicit, not alphabetical. products.sql writes image rows with literal ids
// 1..401; the article and store importers reuse some of those files and rely on
// the rowid continuing past them, so products must land first. Anything not
// listed here has no cross-file dependency and follows, sorted.
const ORDER = ["schema.sql", "products.sql", "articles.sql", "stores.sql"];

// A stale `next dev` / `next start` keeps the file open, which on Windows makes
// unlink fail EPERM/EBUSY, and a reader that attaches mid-rebuild makes SQLite
// report "database is locked". Same cause, and the raw stack names none of it.
const isLocked = (err) =>
  err.code === "EPERM" ||
  err.code === "EBUSY" ||
  /database is locked/i.test(err.message || "");

try {
  mkdirSync(join(root, ".data"), { recursive: true });
  for (const f of [out, out + "-shm", out + "-wal"]) if (existsSync(f)) rmSync(f);

  const dir = join(root, "data/sql");
  const files = readdirSync(dir).filter((f) => f.endsWith(".sql"));
  const ordered = [
    ...ORDER.filter((f) => files.includes(f)),
    ...files.filter((f) => !ORDER.includes(f)).sort(),
  ];

  const db = new DatabaseSync(out);
  db.exec("PRAGMA foreign_keys = ON");

  for (const f of ordered) {
    try {
      db.exec(readFileSync(join(dir, f), "utf8"));
    } catch (err) {
      if (isLocked(err)) throw err;
      throw new Error(`${f}: ${err.message}`);
    }
  }

  const count = (t) => db.prepare(`SELECT count(*) AS n FROM ${t}`).get().n;
  const groups = [
    ["product_category", "product", "product_facet", "product_spec", "image", "product_image", "product_download", "product_video", "product_related"],
    ["blog_category", "article", "article_category", "article_image", "article_link", "recipe", "recipe_ingredient", "recipe_step"],
    ["store", "redirect"],
    ["warranty_dealer", "warranty_product_type", "warranty_model"],
  ];
  for (const g of groups) console.log(g.map((t) => `${t}=${count(t)}`).join("  "));
  db.close();
  console.log("built .data/vatti.db");
} catch (err) {
  if (!isLocked(err)) throw err;
  console.error("a dev or prod server is holding .data/vatti.db — stop it first");
  console.error(`  (${err.code || "SQLITE_BUSY"}: ${err.message})`);
  process.exit(1);
}
