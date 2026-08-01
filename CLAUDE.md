# CLAUDE.md — Vatti Malaysia

Rebuild of `vattimalaysia.com` (WordPress + Elementor) as a statically-generated Next.js site
backed by SQLite. **Existing URLs must not change.**

## The one rule

Every URL in `data/sql/redirects.sql` and every path in the legacy sitemap must resolve 200 or
301 — never 404. The site earns ~10.8k organic clicks per 90 days and several PDFs rank on their
own. Before you touch routing, read `docs/REBUILD-PLAN.md` § URL Contract.

Legacy URLs have **trailing slashes**. `trailingSlash: true` is set in `next.config.ts`. Do not
remove it.

## Stack

- Next.js (App Router), TypeScript, Tailwind
- SQLite via `better-sqlite3`, queried **at build time only**
- Every page is statically generated. **Do not set `output: 'export'`** — it disables route
  handlers, and the two form endpoints need them. Plain Next.js on Vercel already emits static HTML
  for every page here.
- Deployed on Vercel. Media on Cloudflare R2 behind a CDN.

Serverless route handlers exist only for the two forms (`/api/enquiry`, `/api/ewarranty`).
They send email via Resend. **They never write to SQLite** — the filesystem is read-only at runtime.

## Data flow

```
data/sql/*.sql   ← source of truth, committed, reviewable in PRs
      ↓  pnpm db:build
.data/vatti.db   ← build artifact, gitignored
      ↓  src/lib/db.ts (better-sqlite3, read-only)
generateStaticParams / page components
      ↓  next build
static HTML
```

Content changes are SQL edits. Never edit `.data/vatti.db` directly — it is regenerated on every
build and your change will vanish. `pnpm db:build` is wired into `prebuild`, so `next build` is
always working from current SQL.

## Commands

```bash
pnpm db:build     # data/sql/*.sql -> .data/vatti.db (idempotent, drops and recreates)
pnpm db:check     # FK + orphan + duplicate-slug + redirect-loop assertions; run before commit
pnpm dev
pnpm build
pnpm links:check  # crawls the built output, fails on any 404 or broken internal link
```

## Conventions

- **Queries live in `src/lib/queries/`**, one file per entity, each exporting plain functions that
  return typed rows. Components never open the database themselves.
- **Slugs are the join key**, not integer ids. The scraped WordPress ids are kept in
  `wp_id` columns for provenance only — never reference them in application code.
- Specs are an **ordered list of bullets with a nullable key**, not columns. The source site has no
  spec table; only 41 of 332 bullets parse as `Key: Value`. Do not "improve" this into a wide table —
  it would be ~90% NULL. See `product_specs`.
- Images: every URL in the DB points at the R2 CDN. Use `next/image` with a fixed `loader`.
  Legacy `i0.wp.com` (Jetpack) and `/wp-content/uploads/` URLs must not survive into the DB.
- Category pages exist in two parallel URL families (`/kitchen-hood/` and
  `/kitchen-hood-in-malaysia/`). Both stay live. The `-in-malaysia` page is canonical — it carries
  the traffic. See § Duplicate categories in the plan.

## Gotchas inherited from the source site

- `vatti-built-in-air-fryer-oven-07559` — the slug uses digit `0`, not letter `O`. It is wrong, and
  it is the live URL. Keep it; add the correct spelling as a 301 source.
- V917 Carbon Grey and V917 White are the same product with byte-identical specs. Modelled as one
  product with two colourways via `variant_group`, but **both legacy URLs must still resolve**.
- 10 posts under `/tips-tricks/` are categorised as Buying Guide in WordPress. The URL wins; the
  category is corrected in the DB.
- `tips-tricks/clean-baking-sheets-2` is a true duplicate of `clean-baking-sheets` → 301.
- Product feature content is **baked into images** on the source site (5–20 full-width JPEGs per
  product, text rendered as pixels). Transcribing that to real text is a content task, not a code
  task, and it is the single biggest quality win available. Tracked in the plan.

## Style

Match the surrounding code. No new dependency for something a few lines of SQL or stdlib can do.
Prefer deleting a template over adding a config flag to it.
