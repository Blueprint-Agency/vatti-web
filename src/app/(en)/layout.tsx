import { RootDocument, rootMetadata } from "@/components/RootDocument";
import "../globals.css";

/**
 * The English edition's root layout. The route group `(en)` adds nothing to the
 * URL, so every legacy path stays exactly where it was. Malay and Chinese have
 * their own root layouts under (ms)/ms and (zh)/zh; see RootDocument.
 */
export const metadata = rootMetadata("en");

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return <RootDocument locale="en">{children}</RootDocument>;
}
