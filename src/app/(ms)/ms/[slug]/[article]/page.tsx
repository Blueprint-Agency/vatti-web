import { ArticlePage, articleMetadata, articleParams } from "@/views/ArticleView";

/** Malay articles: /ms/<section segment>/<leaf>/. The page itself is src/views/ArticleView. */
export const dynamicParams = false;

export function generateStaticParams() {
  return articleParams("ms");
}

type Params = { params: Promise<{ slug: string; article: string }> };

export async function generateMetadata({ params }: Params) {
  const { slug, article } = await params;
  return articleMetadata("ms", slug, article);
}

export default async function Page({ params }: Params) {
  const { slug, article } = await params;
  return <ArticlePage locale="ms" segment={slug} leaf={article} />;
}
