/**
 * The warranty agreement, carried over from the live page.
 *
 * Shared rather than local to a page because it is now read in two places: as
 * sections of /vatti-ewarranty/, where it is static HTML that a visitor (and a
 * crawler) can read without starting anything, and again on the last step of
 * the registration wizard, immediately above the box that says you have read
 * it. Those two must never drift apart, which is what a second copy of the
 * strings would eventually do.
 *
 * Copy is tidied from the source, not rewritten: the substance of every clause
 * is unchanged and the order is the order on the live page. The original is
 * machine-translated in places ("it is necessary for VATTI products buy only
 * from authorized dealers") and this is a document people are asked to agree
 * to, so it reads as English.
 */

/**
 * The figures the 4-step WPForms wizard never showed you until the end.
 *
 * Reconciled against the VATTI Kitchen Solutions Catalog 2026 (p.23) on
 * 2026-09-05. Two things changed. The catalogue names microwave, water
 * dispenser and dishwasher in the 2 year clause, which the agreement carried
 * over from the live page did not, and it prints a 2+3 year term on the cooker
 * hood's auto-clean components that the site had never stated at all. Both are
 * benefits the site was under-selling, not new promises.
 */
export const PERIODS = [
  {
    value: "2",
    unit: "years",
    label:
      "Cooker hood, cooker hob, combi oven, built-in oven, built-in steam oven, microwave, water dispenser and dishwasher",
  },
  { value: "10", unit: "years", label: "Cooker hood motor, all models" },
  {
    value: "2+3",
    unit: "years",
    label: "Cooker hood auto-clean components, with eWarranty registration",
  },
  { value: "Lifetime", unit: "", label: "Cooker hob tempered glass, against cracking" },
];

export const TERMS = [
  "Warranty is effective only for the original buyer, and VATTI products must be purchased from an authorised dealer.",
  "For a warranty claim, the eWarranty registration must be filled in properly and completely at the time of purchase.",
  "A VATTI product warranty claim is based on manufacturing defect or poor workmanship under normal use.",
  "Product warranty period and maintenance are as per VATTI Malaysia policy.",
  "Where home service is provided, visit charges apply as per policy.",
];

export const EXCLUSIONS_HEADING =
  "Those who fall into one of the following situations are not covered by the free maintenance";

export const EXCLUSIONS = [
  "Damage caused by improper use.",
  "Damage caused by installation, disassembly or maintenance carried out by a non-VATTI service outlet.",
  "No warranty card or valid purchase certificate can be provided, or either has been altered.",
  "The product model and serial number on the warranty card or purchase certificate do not match the product being repaired.",
  "Electrical short circuit, voltage fluctuation, poor wiring, wrong use, missing parts, accidental damage and force majeure.",
  "Products that are outside the warranty period.",
];

export const PAID_SERVICE =
  "If a product fails outside the warranty period, VATTI after-sales outlets will still provide a warm, thoughtful and timely paid service as per policy.";

/**
 * What a given appliance is covered for, in the two clauses a product page has
 * room for. Derived from PERIODS above rather than typed again, in the sense
 * that it says the same thing — the mapping is explicit because PERIODS lists
 * its scope as prose ("Cooker hood, cooker hob, combi oven...") and a product
 * carries a `kind`, not a sentence.
 *
 * Every kind is now named. Microwave, dishwasher and water purifier returned
 * NULL here until the 2026 catalogue audit, on the reasoning that stating a
 * term the document does not cover is worse than stating none. The catalogue
 * covers them: "Built-in Oven, Combi Oven, Steam Oven, Microwave, Water
 * Dispenser & Dishwasher — 2 years general warranty" (p.23). So they get the
 * line, and the reasoning stands for anything the catalogue still omits.
 */
export function warrantyFor(kind: string): { headline: string; extra: string | null } | null {
  switch (kind) {
    case "range hood":
      return {
        headline: "2 year warranty",
        extra: "10 years on the motor, 2+3 on the auto-clean parts",
      };
    case "hob":
      return { headline: "2 year warranty", extra: "lifetime on the glass top" };
    case "oven":
    case "combi-steam oven":
    case "microwave":
    case "dishwasher":
    case "water purifier":
      return { headline: "2 year warranty", extra: null };
    default:
      return null;
  }
}
