import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  // Legacy URLs all carry a trailing slash. Do not remove this.
  trailingSlash: true,

  // A stray lockfile in the home directory makes Next infer the wrong workspace
  // root, which breaks output file tracing.
  outputFileTracingRoot: import.meta.dirname,

  // Do NOT set output: 'export' — it disables route handlers, and the two form
  // endpoints need them. Every page here is statically generated regardless.

  images: {
    // Pre-migration: media still served from WordPress so pages render today.
    // Phase 2 repoints these at the R2 CDN.
    remotePatterns: [{ protocol: "https", hostname: "vattimalaysia.com" }],
    formats: ["image/avif", "image/webp"],
  },

  // better-sqlite3 is deliberately absent: node:sqlite (stdlib) covers the
  // build-time reads and needs no native compilation.
  serverExternalPackages: ["node:sqlite"],
};

export default nextConfig;
