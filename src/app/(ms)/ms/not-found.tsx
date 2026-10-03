import type { Metadata } from "next";

import { NotFoundView, notFoundTitle } from "@/views/NotFoundView";

/** notFound() inside the Malay edition. See src/views/NotFoundView. */
export const metadata: Metadata = { title: notFoundTitle("ms") };

export default function NotFound() {
  return <NotFoundView locale="ms" />;
}
