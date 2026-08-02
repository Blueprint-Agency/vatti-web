import { DatabaseSync } from "node:sqlite";
import { join } from "node:path";

// Build-time only. There is no database at runtime — every page is static HTML
// by the time it reaches a user. Opened read-only, once, and reused across
// generateStaticParams and page renders in the same build process.
let handle: DatabaseSync | null = null;

export function db(): DatabaseSync {
  if (!handle) {
    handle = new DatabaseSync(join(process.cwd(), ".data/vatti.db"), { readOnly: true });
  }
  return handle;
}

// node:sqlite returns null-prototype objects. React refuses to serialise those
// across the server/client boundary, so rows are copied into plain objects here
// once, rather than at each call site.
export function all<T>(sql: string, ...params: (string | number)[]): T[] {
  return (db().prepare(sql).all(...params) as T[]).map((row) => ({ ...row }));
}

export function get<T>(sql: string, ...params: (string | number)[]): T | undefined {
  const row = db().prepare(sql).get(...params) as T | undefined;
  return row === undefined ? undefined : { ...row };
}
