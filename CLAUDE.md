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
- SQLite via **`node:sqlite`** (stdlib), queried **at build time only**. Not `better-sqlite3` —
  it needs a native build, has no prebuild for current Node, and the stdlib module covers every
  read we make. Requires Node ≥23.4 (`engines` enforces it); set the same on Vercel.
  Caveat: Node's bundled SQLite has **no FTS5**. Site search must be a client-side index generated
  at build, which is what a static site needs anyway.
- Every page is statically generated. **Do not set `output: 'export'`** — it disables route
  handlers, and the two form endpoints need them. Plain Next.js on Vercel already emits static HTML
  for every page here.
- Deployed on Vercel. **All** media on Cloudflare R2 behind a CDN — see § Images.

Serverless route handlers exist only for the two forms (`/api/enquiry`, `/api/ewarranty`).
They send email via Resend. **They never write to SQLite** — the filesystem is read-only at runtime.

## Data flow

```
data/sql/*.sql   ← source of truth, committed, reviewable in PRs
      ↓  pnpm db:build
.data/vatti.db   ← build artifact, gitignored
      ↓  src/lib/db.ts (node:sqlite, read-only)
generateStaticParams / page components
      ↓  next build
static HTML
```

Content changes are SQL edits. Never edit `.data/vatti.db` directly — it is regenerated on every
build and your change will vanish.

`db:build` is called **explicitly** at the front of the `build` script, not via a `prebuild` hook.
pnpm does not reliably run pre/post lifecycle scripts in CI (`enable-pre-post-scripts`), and a
missing `.data/vatti.db` fails the build on Vercel while working fine locally. Do not "tidy" this
back into a `prebuild` entry.

Node is pinned to `24.x` in `engines`. `node:sqlite` is only unflagged from Node 23.4, and Vercel
must be set to the same major.

If a build fails with `EPERM` or `Device or resource busy` on `.data/vatti.db`, a dev/prod server is
still running and holding the file — stop it first.

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
- **Images live on R2, never in `public/`.** See § Images — it is a hard rule, not a default.
- Category pages exist in two parallel URL families (`/kitchen-hood/` and
  `/kitchen-hood-in-malaysia/`). Both stay live. The `-in-malaysia` page is canonical — it carries
  the traffic. See § Duplicate categories in the plan.

## Images

**Every image belongs on R2. `public/` is not for content images.** That covers product hero
shots, every image on a product page, category and article imagery, store photos, and PDFs. Do
not put a picture in `public/` because it is quicker — quicker is the whole reason the rule
exists.

Why: R2 is already the media host the URL contract points at. The `/wp-content/uploads/` prefix
301s there, 1,228 legacy objects live there, and several PDFs rank on their own. A second home
for media means two places to look, two cache stories, and image bytes in git.

The route in:

```bash
# 1. stage the file at the bucket key it should be served under
cp shot.webp old-media/2026/08/v929-detail-01.webp
# 2. upload — idempotent, skips anything already there at the same size
node scripts/media-upload.mjs
# 3. reference https://<CDN_HOST>/2026/08/v929-detail-01.webp
```

`old-media/` is gitignored, and a file's path inside it **is** its bucket key. `next.config.ts`
already allows the CDN host in `images.remotePatterns`, so `next/image` needs nothing new.

- **Product and page images are data, not code.** Their URLs belong in `data/sql/*.sql` and are
  read from the DB. Never hardcode a product image path in a component.
- Legacy `i0.wp.com` (Jetpack) and `/wp-content/uploads/` URLs must not survive into the DB.
  `pnpm db:check` asserts this.
- Give a changed picture a **new key**. R2 is served with a long max-age and the image optimizer
  caches by path, so replacing the bytes under an existing key serves the old picture to everyone
  who has already seen the page.
- The CDN host is written down twice — `CDN_HOST` in `next.config.ts` and the duplicate in
  `src/lib/site.ts`. Swap both together at cutover.

**Uploads are blocked on this machine.** `scripts/media-upload.mjs` needs `R2_ACCESS_KEY_ID`,
`R2_SECRET_ACCESS_KEY`, `R2_BUCKET` and `R2_ENDPOINT`. `.env.local` currently holds only
`R2_PUBLIC_HOST`, so step 2 fails until the write keys are restored from the Cloudflare dashboard.

**Not yet migrated.** 40 files (2.6 MB) still sit in `public/` and predate this rule:
`hero-kitchen.png`, `hero-v929-panel.webp`, `signature-v929-scene.webp`, four `showcase-*.webp`,
three `award-*.png`, `google-mark.svg`, and 29 `partners/*`. Each is referenced by a literal path
in TSX, so moving them is an upload plus an edit at every call site. Move them when the write keys
are back. Until then, do not add to them.

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
