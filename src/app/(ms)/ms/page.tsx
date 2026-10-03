import { HomePage, homeMetadata } from "@/views/HomeView";

/** The home page in this edition. The page itself is src/views/HomeView. */
export const metadata = homeMetadata("ms");

export default function Page() {
  return <HomePage locale="ms" />;
}
