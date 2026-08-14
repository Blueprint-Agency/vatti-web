import type { NextConfig } from "next";
import { DatabaseSync } from "node:sqlite";
import { existsSync } from "node:fs";
import { join } from "node:path";

// The one place the media host is written down. Swap for cdn.vattimalaysia.com
// once the domain's nameservers move to Cloudflare (r2.dev is rate-limited and
// not for production), then re-run `node scripts/import-products.mjs` so the
// URLs baked into data/sql match. Deliberately not process.env: .env.local is
// gitignored, so it would be undefined on Vercel.
const CDN_HOST = "pub-d0b729df0b8f422289c6f46d17d33f3e.r2.dev";

const nextConfig: NextConfig = {
  // Legacy URLs all carry a trailing slash. Do not remove this.
  trailingSlash: true,

  // A stray lockfile in the home directory makes Next infer the wrong workspace
  // root, which breaks output file tracing.
  outputFileTracingRoot: import.meta.dirname,

  // Do NOT set output: 'export' — it disables route handlers, and the two form
  // endpoints need them. Every page here is statically generated regardless.

  images: {
    remotePatterns: [
      { protocol: "https", hostname: CDN_HOST },
      // Still needed until the article importer routes its images through the
      // CDN too. Drop at cutover.
      { protocol: "https", hostname: "vattimalaysia.com" },
    ],
    formats: ["image/avif", "image/webp"],

    // A year. The default is 60 seconds, and it applies here because R2 sends
    // no Cache-Control of its own — check with `curl -I` against the CDN host
    // and you get Content-Type, ETag and Last-Modified, nothing more. With no
    // upstream max-age to inherit, every optimised image falls back to this
    // number.
    //
    // Safe only because a changed picture gets a NEW KEY under § Images, so a
    // URL's bytes never change and there is nothing to invalidate. If that rule
    // ever stops holding, this has to come down with it.
    //
    // Worth knowing before tuning it: this is not what makes a hero appear
    // late. Next serves an expired entry immediately and revalidates behind it
    // (X-Nextjs-Cache: STALE, ~7ms), and browsers revalidate to a 304 with an
    // empty body. Vercel also applies its own floor — deployed responses come
    // back max-age=3600 regardless. What this buys is fewer re-transforms of
    // pictures that are never going to change, not a faster first paint.
    minimumCacheTTL: 31536000,
  },

  // The URL contract is data, not code: the 177 verified legacy 301s live in the
  // `redirect` table (data/sql/redirects.sql). `pnpm build` runs db:build before
  // `next build`, so .data/vatti.db exists by the time this is evaluated.
  //
  // Missing database => throw. A build with no redirects 404s every legacy URL,
  // which is the one thing CLAUDE.md forbids; failing loudly beats shipping that
  // silently. redirects() only runs during `next build` — a serving process
  // reads .next/routes-manifest.json and never opens the database.
  //
  // statusCode 301 (from redirect.code) rather than `permanent: true`, which is
  // a 308 — the contract in docs/REBUILD-PLAN.md § 5 is 301.
  async redirects() {
    const file = join(import.meta.dirname, ".data/vatti.db");
    if (!existsSync(file)) {
      throw new Error(
        `${file} is missing — run \`node scripts/db-build.mjs\` first (\`pnpm build\` does), ` +
          `otherwise every legacy URL in data/sql/redirects.sql would 404.`
      );
    }
    const db = new DatabaseSync(file, { readOnly: true });
    const rows = db
      .prepare("SELECT from_path, to_path, code FROM redirect ORDER BY from_path")
      .all() as { from_path: string; to_path: string; code: number }[];
    db.close();

    return [
      // 404 on WordPress today and absent from R2, so the prefix rule below
      // would 301 it to a CDN 404. Must come FIRST: /wp-content/uploads/:path*
      // matches this path too, and the first matching rule wins. It also cannot
      // live in the `redirect` table — that prefix rule fires before routing, so
      // the row would never run. 45 organic clicks over 16 months. Owner chose
      // the current 2026 catalogue over the 2025 one deliberately, so old search
      // results land on products still sold.
      {
        source: "/wp-content/uploads/2025/03/Vatti-Catalogue-2025_updated.pdf",
        destination: `https://${CDN_HOST}/2026/07/Vatti-Catalogue_260718.pdf`,
        statusCode: 301,
      },
      // Every legacy asset URL must keep resolving — several PDFs rank on their
      // own. Bucket keys drop the /wp-content/uploads/ prefix, so this one rule
      // covers all 1,228 objects. First because it is a prefix match; no row in
      // `redirect` starts with /wp-content/uploads/, so nothing is shadowed.
      {
        source: "/wp-content/uploads/:path*",
        destination: `https://${CDN_HOST}/:path*`,
        statusCode: 301,
      },
      // Both from_path and to_path already carry the trailing slash that
      // trailingSlash: true expects, and none contain path-to-regexp syntax.
      ...rows.map((r) => ({
        source: r.from_path,
        destination: r.to_path,
        statusCode: r.code,
      })),
    ];
  },

  // better-sqlite3 is deliberately absent: node:sqlite (stdlib) covers the
  // build-time reads and needs no native compilation.
  serverExternalPackages: ["node:sqlite"],
};

export default nextConfig;
