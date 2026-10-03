import { ArticlePage, articleMetadata, articleParams } from "@/views/ArticleView";

/** English articles: the 106 legacy editorial URLs. The page itself is src/views/ArticleView. */
// Exhaustive from the article table; an unknown pair is a 404 off the static
// shell rather than a serverless render that ends in notFound(). See [slug]/page.tsx.
export const dynamicParams = false;

export function generateStaticParams() {
  return articleParams("en");
}

type Params = { params: Promise<{ slug: string; article: string }> };

export async function generateMetadata({ params }: Params) {
  const { slug, article } = await params;
  return articleMetadata("en", slug, article);
}

export default async function Page({ params }: Params) {
  const { slug, article } = await params;
  return <ArticlePage locale="en" segment={slug} leaf={article} />;
}
