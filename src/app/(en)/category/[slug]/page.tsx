import { ArchivePage, archiveMetadata, archiveParams } from "@/views/ArchiveView";

/**
 * Page 1 of a blog archive. `/category/<slug>/page/N/` is the sibling route;
 * both are indexed, so neither URL shape may drift. See src/views/ArchiveView.
 */
// Exhaustive from the blog archives. See [slug]/page.tsx.
export const dynamicParams = false;

export function generateStaticParams() {
  return archiveParams("en");
}

type Params = { params: Promise<{ slug: string }> };

export async function generateMetadata({ params }: Params) {
  const { slug } = await params;
  return archiveMetadata("en", slug, 1);
}

export default async function Page({ params }: Params) {
  const { slug } = await params;
  return <ArchivePage locale="en" slug={slug} page={1} />;
}
