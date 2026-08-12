import type { Metadata } from "next";
import { notFound } from "next/navigation";

import { archives, getArchive, getArchiveArticles } from "@/lib/queries/article";

import { ArchiveView } from "../../ArchiveView";

/**
 * Pages 2..N of a blog archive. WordPress serves these at
 * /category/<slug>/page/2/ and they are indexed, so the literal `page` segment
 * is part of the URL contract, not a convention we chose. Page 1 lives at the
 * bare /category/<slug>/ and is deliberately not generated here — two URLs for
 * the same 8 articles would be duplicate content.
 */
export function generateStaticParams() {
  return archives().flatMap((a) =>
    Array.from({ length: a.pages - 1 }, (_, i) => ({ slug: a.slug, n: String(i + 2) }))
  );
}

type Params = { params: Promise<{ slug: string; n: string }> };

export async function generateMetadata({ params }: Params): Promise<Metadata> {
  const { slug, n } = await params;
  const archive = getArchive(slug);
  const page = Number(n);
  if (!archive || !Number.isInteger(page) || page < 2 || page > archive.pages) return {};

  return {
    title: `${archive.name} | Page ${page}`,
    description: `Page ${page} of ${archive.pages}: VATTI Malaysia ${archive.name.toLowerCase()} articles on built-in kitchen appliances.`,
    alternates: { canonical: `/category/${archive.slug}/page/${page}/` },
  };
}

export default async function Page({ params }: Params) {
  const { slug, n } = await params;
  const archive = getArchive(slug);
  const page = Number(n);
  if (!archive || !Number.isInteger(page) || page < 2 || page > archive.pages) notFound();

  return (
    <ArchiveView
      archive={archive}
      page={page}
      articles={getArchiveArticles(archive.slug, page)}
    />
  );
}
