import type { Metadata } from "next";
import { notFound } from "next/navigation";

import { archives, getArchive, getArchiveArticles } from "@/lib/queries/article";

import { ArchiveView } from "./ArchiveView";

/**
 * Page 1 of the four live blog archives. `/category/<slug>/page/N/` is the
 * sibling route; both are indexed, so neither URL shape may drift.
 */
export function generateStaticParams() {
  return archives().map((a) => ({ slug: a.slug }));
}

type Params = { params: Promise<{ slug: string }> };

export async function generateMetadata({ params }: Params): Promise<Metadata> {
  const { slug } = await params;
  const archive = getArchive(slug);
  if (!archive) return {};

  return {
    title: archive.name,
    description: `${archive.total} VATTI Malaysia ${archive.name.toLowerCase()} articles on choosing, using and caring for built-in kitchen appliances.`,
    alternates: { canonical: `/category/${archive.slug}/` },
  };
}

export default async function Page({ params }: Params) {
  const { slug } = await params;
  const archive = getArchive(slug);
  if (!archive) notFound();

  return (
    <ArchiveView archive={archive} page={1} articles={getArchiveArticles(archive.slug, 1)} />
  );
}
