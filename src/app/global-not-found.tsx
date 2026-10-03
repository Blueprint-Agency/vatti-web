import type { Metadata } from "next";

import { RootDocument, rootMetadata } from "@/components/RootDocument";
import { t } from "@/i18n";
import { NotFoundView, notFoundTitle } from "@/views/NotFoundView";
import "./globals.css";

/**
 * A URL that no route matches at all. With three root layouts — (en), (ms)/ms,
 * (zh)/zh — there is no single layout to draw a plain not-found.tsx in, so Next
 * needs this file (experimental.globalNotFound in next.config.ts). It draws its
 * own <html>; English, since an unmatched URL belongs to no edition.
 */
// The title template only reaches child segments, and this file has no parent
// layout, so the suffix is applied by hand: "Page not found | VATTI Malaysia".
export const metadata: Metadata = {
  ...rootMetadata("en"),
  title: t("en").doc.titleTemplate.replace("%s", notFoundTitle("en")),
};

export default function GlobalNotFound() {
  return (
    <RootDocument locale="en">
      <NotFoundView locale="en" />
    </RootDocument>
  );
}
