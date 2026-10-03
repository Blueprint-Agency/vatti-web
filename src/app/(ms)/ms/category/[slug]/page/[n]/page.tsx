import { ArchivePage, archiveMetadata, archivePagedParams } from "@/views/ArchiveView";

/** Pages 2..N of a blog archive. See src/views/ArchiveView. */
// Exhaustive: every archive's real page 2..n. See src/views/ArchiveView.
export const dynamicParams = false;

export function generateStaticParams() {
  return archivePagedParams("ms");
}

type Params = { params: Promise<{ slug: string; n: string }> };

export async function generateMetadata({ params }: Params) {
  const { slug, n } = await params;
  return archiveMetadata("ms", slug, Number(n));
}

export default async function Page({ params }: Params) {
  const { slug, n } = await params;
  return <ArchivePage locale="ms" slug={slug} page={Number(n)} />;
}
