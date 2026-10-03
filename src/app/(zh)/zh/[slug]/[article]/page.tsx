import { ArticlePage, articleMetadata, articleParams } from "@/views/ArticleView";

/** Chinese articles: /zh/<section>/<leaf>/ (English segments and slugs). The page itself is src/views/ArticleView. */
export const dynamicParams = false;

export function generateStaticParams() {
  return articleParams("zh");
}

type Params = { params: Promise<{ slug: string; article: string }> };

export async function generateMetadata({ params }: Params) {
  const { slug, article } = await params;
  return articleMetadata("zh", slug, article);
}

export default async function Page({ params }: Params) {
  const { slug, article } = await params;
  return <ArticlePage locale="zh" segment={slug} leaf={article} />;
}
