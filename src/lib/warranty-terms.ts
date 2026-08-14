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

/** The three figures the 4-step WPForms wizard never showed you until the end. */
export const PERIODS = [
  {
    value: "2",
    unit: "years",
    label: "Cooker hood, cooker hob, combi oven, built-in oven and built-in steam oven",
  },
  { value: "10", unit: "years", label: "Cooker hood motor, all models" },
  { value: "Lifetime", unit: "", label: "Cooker hob glass top" },
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
