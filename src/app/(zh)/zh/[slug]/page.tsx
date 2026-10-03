import { CategoryPage, categoryMetadata, categoryRouteParams } from "@/views/CategoryPage";

/**
 * Category pages in this edition (product_category_i18n). Products join this
 * route when their pages are translated (Phase 3); until then a product link
 * from here goes to the English page. See src/views/CategoryPage.
 */
export const dynamicParams = false;

export function generateStaticParams() {
  return categoryRouteParams("zh");
}

type Params = { params: Promise<{ slug: string }> };

export async function generateMetadata({ params }: Params) {
  const { slug } = await params;
  return categoryMetadata("zh", slug);
}

export default async function Page({ params }: Params) {
  const { slug } = await params;
  return <CategoryPage locale="zh" slug={slug} />;
}
