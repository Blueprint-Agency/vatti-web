import type { Metadata } from "next";

import { NotFoundView, notFoundTitle } from "@/views/NotFoundView";

/** notFound() inside the Chinese edition. See src/views/NotFoundView. */
export const metadata: Metadata = { title: notFoundTitle("zh") };

export default function NotFound() {
  return <NotFoundView locale="zh" />;
}
