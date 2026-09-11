/**
 * The public read host for R2 media, script side.
 *
 * Deliberately code and not an env var: the app half of this fact is a literal in
 * next.config.ts (`.env.local` is gitignored, so an env read would be undefined on
 * Vercel), and a host written in both a file and a secret can disagree with itself.
 * Credentials come from the environment; the public base does not.
 *
 * The bucket's own r2.dev URL is rate-limited and explicitly not for production; this is
 * the custom domain that replaced it on 2026-09-11. Changing this line and re-running the
 * importers is the whole cutover — every URL in data/sql was rewritten from it, and
 * next.config.ts, src/lib/cdn.ts and build-url-inventory.mjs all read it from here.
 *
 * `grep -rl "r2.dev" data src scripts` must return nothing. If it ever returns a file,
 * something has written a host down a second time and the next swap will miss it.
 */
export const CDN_HOST = "cdn.vattimalaysia.com";
export const CDN = `https://${CDN_HOST}`;
