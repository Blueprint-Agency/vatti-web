# Vatti Malaysia

Rebuild of [vattimalaysia.com](https://vattimalaysia.com) — Vatti kitchen appliances (range hoods,
hobs, ovens, combi/steam ovens, dishwashers, water purifiers) for the Malaysian market.

The current site is WordPress + Elementor: ~465 KB of HTML on the homepage, 891 KB on
`/store-locations/`, and a lazy-loaded hero image that guarantees a poor LCP. This repo replaces it
with a statically-generated Next.js site backed by SQLite, **preserving every existing URL**.

It is a lead-generation site, not a shop. There is no cart, no checkout and no prices — enquiries go
to a form, and buyers are routed to one of 75 dealer stores.

## Quick start

```bash
pnpm install
pnpm db:build      # builds .data/vatti.db from data/sql/*.sql
pnpm dev           # http://localhost:3000
```

## How content works

There is no CMS. Content lives in version-controlled SQL and is compiled into a SQLite file at
build time; every page is static HTML by the time it reaches a user.

```
data/sql/*.sql  →  pnpm db:build  →  .data/vatti.db  →  next build  →  static HTML
```

To change a product spec, an article, or a store address: edit the relevant file in `data/sql/`,
run `pnpm db:build`, and commit. `pnpm db:check` validates foreign keys, duplicate slugs and
redirect loops before you push.

`.data/vatti.db` is a build artifact and is gitignored. Never edit it by hand.

## Layout

```
data/sql/          content source of truth (schema.sql, products.sql, articles.sql, stores.sql, redirects.sql)
research/          the WordPress audit this rebuild is based on — scraped JSON, not shipped
scripts/           db:build, db:check, media migration, link checker
src/app/           routes; mirrors the legacy URL structure exactly
src/lib/queries/   typed data access, one file per entity
docs/REBUILD-PLAN.md   page inventory, data model, phased build plan, SEO guardrails
```

## Non-negotiables

- **URLs never change.** Legacy paths keep their trailing slash. Anything retired gets a 301, never
  a 404 — ranked PDF manuals included.
- **Mobile first.** 64% of organic traffic is mobile.
- `/kitchen-hood-in-malaysia/` outranks the homepage and is the single most valuable page on the
  site. Treat it accordingly.

## Deployment

Vercel. `prebuild` runs `db:build`, so the database is always current. Media is served from
Cloudflare R2 via CDN. The only server-side code is two form handlers (`/api/enquiry`,
`/api/ewarranty`) which email through Resend and persist nothing.

Full detail, including the phased migration and verification steps, is in
[`docs/REBUILD-PLAN.md`](docs/REBUILD-PLAN.md).
