import { RootDocument, rootMetadata } from "@/components/RootDocument";
import "../../globals.css";

/**
 * The Malay edition's root layout: every page under /ms/ is drawn with
 * <html lang="ms-MY">. The static segment `ms` outranks the English tree's
 * dynamic [slug], so /ms/… never reaches a product or category lookup.
 */
export const metadata = rootMetadata("ms");

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return <RootDocument locale="ms">{children}</RootDocument>;
}
