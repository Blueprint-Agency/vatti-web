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

One serverless route handler exists: `/api/ewarranty`, which emails the registration via Resend
(plain `fetch`, no SDK) and **never writes to SQLite** — the filesystem is read-only at runtime, so
the email is the record. `/api/enquiry` was planned and is not built: every other conversion path
ends in WhatsApp by the owner's decision. See `src/lib/site.ts`.

The eWarranty form is therefore the only form on the site. Its two big selects are data, not code:
`warranty_dealer` (79 authorised dealers) and `warranty_model` (41 codes under 8 appliance types).
Appointing a dealer is a SQL edit in `data/sql/warranty.sql`. That list is deliberately **not** the
same as `store` — 79 against 76, and they do not line up row for row. Do not "unify" them without
the client reconciling the two by hand first; a fuzzy name match silently drops dealers off a
warranty form.

`RESEND_API_KEY`, `EWARRANTY_TO` and `EWARRANTY_FROM` configure delivery — see README § Environment.
Without the key the endpoint returns 503 and the form tells the visitor, rather than swallowing a
registration.

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
- **Product page content is four hand-authored tables**, all keyed on slug, all in
  `data/sql/product-*.sql`: `product_feature` (the story), `product_dimension` (the drawing as
  text), `product_faq` (per-model questions, answers may carry internal markdown links, which
  `db:check` verifies) and the metadata columns on `product_video`. The template renders whichever
  of them a product has. **All 39 published products are done.** Nothing is left on the caption
  stack; `product_image.caption_md` is now a transcription record rather than a rendering source.
  Five products have no dimension figures because VATTI publishes none for them (V936, C830G,
  C861G, C835G, M822G, ER3601T, ER5902T, M626 and the O7549 among them state only what their own
  panels state) and their FAQ says so rather than borrowing another model's numbers. One hood, V936, has no published
  dimension drawing and therefore no `product_dimension` rows: the table and the fit checker stay
  off that page rather than being filled with a guess.
- **Cutting the picture out of a composite is a manifest, not a script.** Boxes live in
  `data/crops/<model>.json` as fractions of the source; `node scripts/feature-crop.mjs [model]`
  writes them into `old-media/` and `node scripts/media-upload.mjs` pushes them. Sources are cached
  under `.cache/crop-src/`, so re-cutting after nudging a box is free. Verify a batch by building a
  contact sheet of the OUTPUT and looking at it — a crop that still clips a letter is the one defect
  this whole exercise exists to remove.
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
pnpm media:upload
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
- **The public host is code; only the credentials are secrets.** `scripts/cdn.mjs` states it once
  and `next.config.ts`, the three importers and `build-url-inventory.mjs` all read it from there.
  It is currently the bucket's **r2.dev dev URL** — rate-limited and not for production. At cutover
  edit that one file to `cdn.vattimalaysia.com` and re-run the importers so the URLs baked into
  `data/sql` match. Two literals still predate the rule and must be swapped by hand with it:
  `CATALOGUE` in `src/lib/site.ts` and `ENQUIRY_BACKDROP` in `src/app/page.tsx`.

**Uploads work.** `pnpm media:upload` needs `R2_ACCOUNT_ID`, `R2_ACCESS_KEY_ID`,
`R2_SECRET_ACCESS_KEY` and `R2_BUCKET_NAME` — copy `.env.example` to `.env.local` and fill it in
(the S3 endpoint is derived from the account id, and `process.env` wins over the file so CI can
pass the same names as secrets). If step 2 fails on a missing variable, the keys are in the
Cloudflare dashboard under R2 → Manage API tokens.

Upload **before** you push anything that references a new key. The build embeds the CDN URL in
static HTML, so a deploy that lands ahead of its objects serves a page with a hole in it, and the
optimizer caches the 404.

**Not yet migrated.** 39 files (2.5 MB) still sit in `public/` and predate this rule:
`hero-kitchen.png`, `hero-v929-panel.webp`, four `showcase-*.webp`, three `award-*.png`,
`google-mark.svg`, and 29 `partners/*`. Each is referenced by a literal path in TSX, so moving
them is an upload plus an edit at every call site.

Nothing blocks that migration now except the work itself. Do not add to them. `hero-v929-panel.webp`
is shared rather than owned by one page — it is the home page hero AND was the hood category's
hero panel. Grep the whole of `src/` before you assume a file has one call site.

`signature-v929-scene.webp` was the third shared literal and is done: it is on R2 under
`2026/08/kitchen-hood-signature-scene.webp` and its URL now lives in
`product_category.signature_image_url`, which is where a page picture belongs. That is the third
category image to leave `CategoryView.tsx` for a column, after the hero backdrops and the hero
product shot. There is no image record left in that file.

## Gotchas inherited from the source site

- `vatti-built-in-air-fryer-oven-07559` — the slug uses digit `0`, not letter `O`. It is wrong, and
  it is the live URL. Keep it; add the correct spelling as a 301 source.
- V917 Carbon Grey and V917 White are the same product with byte-identical specs. Modelled as one
  product with two colourways via `variant_group`, but **both legacy URLs must still resolve**.
- 10 posts under `/tips-tricks/` are categorised as Buying Guide in WordPress. The URL wins; the
  category is corrected in the DB.
- `tips-tricks/clean-baking-sheets-2` is a true duplicate of `clean-baking-sheets` → 301.
- Product feature content is **baked into images** on the source site (5–20 full-width JPEGs per
  product, text rendered as pixels). `product_image.caption_md` transcribes that text verbatim for
  the products still on the old stack; `product_feature` replaces it, holding the copy as real text
  beside a crop of the same picture with the words cut off. A product with rows in
  `data/sql/product-features.sql` renders those blocks instead of the JPEG stack — see
  `ProductFeatures.tsx`. **V993 is the first one done**; the other 33 are still on captions.
  Cropping is a prep step, not a build step: cut the picture out of the composite, save it under a
  new key in `old-media/`, upload, and record the crop box in a comment on the row. It is the single
  biggest quality win available.

## Style

Match the surrounding code. No new dependency for something a few lines of SQL or stdlib can do.
Prefer deleting a template over adding a config flag to it.
