import { RootDocument, rootMetadata } from "@/components/RootDocument";
import "../../globals.css";

/**
 * The Chinese edition's root layout: every page under /zh/ is drawn with
 * <html lang="zh-MY">. The static segment `zh` outranks the English tree's
 * dynamic [slug], so /zh/… never reaches a product or category lookup.
 */
export const metadata = rootMetadata("zh");

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return <RootDocument locale="zh">{children}</RootDocument>;
}
