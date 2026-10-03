import type { Metadata } from "next";

import { NotFoundView, notFoundTitle } from "@/views/NotFoundView";

/** notFound() inside the English edition. See src/views/NotFoundView. */
export const metadata: Metadata = { title: notFoundTitle("en") };

export default function NotFound() {
  return <NotFoundView locale="en" />;
}
