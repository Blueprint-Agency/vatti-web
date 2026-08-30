/**
 * The public read host for R2 media, script side.
 *
 * Deliberately code and not an env var: the app half of this fact is a literal in
 * next.config.ts (`.env.local` is gitignored, so an env read would be undefined on
 * Vercel), and a host written in both a file and a secret can disagree with itself.
 * Credentials come from the environment; the public base does not.
 *
 * Currently the bucket's r2.dev dev URL — rate-limited and not for production. Swap for
 * cdn.vattimalaysia.com once the domain's nameservers move to Cloudflare, together with
 * CDN_HOST in next.config.ts, then re-run the importers so the URLs baked into data/sql
 * match.
 */
export const CDN_HOST = "pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev";
export const CDN = `https://${CDN_HOST}`;
