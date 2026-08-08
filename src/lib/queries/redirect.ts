import { all } from "@/lib/db";

/**
 * The 177 legacy paths that 301 (next.config.ts turns the same table into
 * `redirects()`). Read here only so the sitemap can assert it lists none of
 * them — a sitemap entry that redirects is a Search Console coverage error.
 */
export function redirectPaths(): string[] {
  return all<{ from_path: string }>(`SELECT from_path FROM redirect`).map((r) => r.from_path);
}
