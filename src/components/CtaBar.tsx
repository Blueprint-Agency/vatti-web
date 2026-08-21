import { WhatsappLogo } from "@phosphor-icons/react/dist/ssr/WhatsappLogo";

import { WHATSAPP } from "@/lib/site";

/**
 * The sales line, parked at the bottom of a phone.
 *
 * Two thirds of this site's traffic is on a phone, there is no cart and no
 * enquiry form, and every conversion is a WhatsApp message the visitor chooses
 * to send. On a desktop the CTA sits in the page and stays in view because the
 * page is wide; on a phone it scrolls away in a second and the visitor is
 * eleven screens deep in specifications with nothing to press.
 *
 * Hidden from lg, where the in-page buttons do this job and a bar pinned across
 * a 1,400px window is just chrome.
 *
 * One button, full width. A bar with two is a bar asking a question, and the
 * thumb that has to choose between them is the thumb that presses neither. The
 * dealer list is a link away in the footer and in the page's own "where to buy"
 * section on every template that has one.
 *
 * The label sells rather than names the app, so the mark carries the
 * destination: a visitor should not have to press it to learn it opens a chat.
 *
 * `href` is a prefilled wa.me link wherever the page knows what the enquiry is
 * about — see `whatsappLink`. A page that knows nothing passes nothing and gets
 * an empty chat, which is still better than no button.
 */
export function CtaBar({ href = WHATSAPP }: { href?: string }) {
  return (
    <div
      className="fixed inset-x-0 bottom-0 z-[var(--z-sticky)] border-t border-line bg-void/95 px-4 pt-3 backdrop-blur-sm lg:hidden"
      // The home indicator on a modern iPhone sits over the bottom ~34px of the
      // viewport, and it is drawn on top of this bar. Without the inset the
      // button keeps its full height and loses its bottom third to a gesture
      // area that swipes the browser away instead of opening WhatsApp.
      style={{ paddingBottom: "calc(0.75rem + env(safe-area-inset-bottom))" }}
    >
      <a
        href={href}
        className="flex items-center justify-center gap-2.5 rounded-sm bg-teal px-4 py-3.5 text-center text-[1.0625rem] font-semibold text-void"
      >
        <WhatsappLogo size={22} weight="fill" aria-hidden="true" />
        Let us help you now
      </a>
    </div>
  );
}
