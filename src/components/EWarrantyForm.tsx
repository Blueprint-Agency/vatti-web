"use client";

import { useEffect, useId, useRef, useState } from "react";

import type { WarrantyType } from "@/lib/queries/warranty";
import { formatDate } from "@/lib/site";
import {
  EXCLUSIONS,
  EXCLUSIONS_HEADING,
  PAID_SERVICE,
  PERIODS,
  TERMS,
} from "@/lib/warranty-terms";

/**
 * The eWarranty registration wizard.
 *
 * This is the one real form on the site. Everywhere else the owner's decision
 * stands and a conversion path ends in WhatsApp (see src/lib/site.ts) — but a
 * warranty registration carries a serial number, an invoice number and a
 * photograph of a receipt, and none of that survives being retyped into a chat
 * window. It posts to /api/ewarranty, which emails the service desk. Nothing is
 * stored: SQLite is read-only at runtime.
 *
 * Reproduces the retired WPForms wizard field for field, minus one step. The
 * original opened on a page of warranty-period text and closed on a page of
 * terms. The opening page is gone: it is a section of this page now, readable
 * before anyone commits to filling anything in. The closing page stayed, which
 * is why step 3 carries the whole agreement above the checkbox rather than a
 * link to it.
 *
 * Steps are mounted one at a time rather than hidden with CSS, which is what
 * makes `reportValidity()` on Next mean "this step is complete" — the browser
 * only validates fields that are in the document.
 */

const TITLES = ["Mr", "Ms", "Mrs", "Mdm", "Dr"];

const STEPS = ["Your details", "Your products", "Confirm"];

/**
 * Vercel caps a serverless request body at 4.5 MB and the whole registration
 * travels in one, so the receipts get 4 MB and the JSON has the rest. A phone
 * photograph of an invoice is 2 to 4 MB, so this is one or two pictures at full
 * size and five once they have been trimmed — the counter below says which,
 * before the visitor has spent a minute filling the form in.
 */
const MAX_TOTAL_BYTES = 4 * 1024 * 1024;
const MAX_FILES = 5;
const ACCEPT = "image/*,.pdf";

type Product = {
  /** Local key for React. Not sent. */
  key: number;
  serial: string;
  purchased: string;
  invoice: string;
  dealer: string;
  type: string;
  model: string;
};

const blankProduct = (key: number): Product => ({
  key,
  serial: "",
  purchased: "",
  invoice: "",
  dealer: "",
  type: "",
  model: "",
});

type Status = { state: "idle" | "sending" | "sent" } | { state: "error"; message: string };

export function EWarrantyForm({
  dealers,
  types,
}: {
  dealers: string[];
  types: WarrantyType[];
}) {
  const uid = useId();
  const formRef = useRef<HTMLFormElement>(null);
  const headingRef = useRef<HTMLParagraphElement>(null);

  const [step, setStep] = useState(0);
  const [status, setStatus] = useState<Status>({ state: "idle" });

  const [title, setTitle] = useState("");
  const [name, setName] = useState("");
  const [ic, setIc] = useState("");
  const [email, setEmail] = useState("");
  const [address, setAddress] = useState("");
  const [mobile, setMobile] = useState("");

  const [products, setProducts] = useState<Product[]>([blankProduct(0)]);
  const [nextKey, setNextKey] = useState(1);
  const [files, setFiles] = useState<File[]>([]);
  const [fileError, setFileError] = useState("");
  const [agreed, setAgreed] = useState(false);

  // Latest sensible purchase date. Set after mount, not during render: this
  // component is prerendered at build time and a date baked into the static
  // HTML would be wrong by the time anyone read it, and would mismatch on
  // hydration besides.
  const [today, setToday] = useState("");
  useEffect(() => {
    setToday(new Date().toLocaleDateString("en-CA", { timeZone: "Asia/Kuala_Lumpur" }));
  }, []);

  // Moving between steps replaces everything on screen, so focus has to be told
  // where it went. Without this a keyboard or screen-reader user presses Next
  // and lands back at the top of the document.
  useEffect(() => {
    if (status.state === "idle") headingRef.current?.focus();
  }, [step, status.state]);

  function updateProduct(key: number, patch: Partial<Product>) {
    setProducts((prev) =>
      prev.map((p) =>
        p.key !== key
          ? p
          : // Changing the appliance type invalidates whatever model was
            // chosen under the old one, so it is cleared rather than left
            // pointing at a code from a different product line.
            { ...p, ...patch, ...(patch.type !== undefined ? { model: "" } : {}) }
      )
    );
  }

  function chooseFiles(list: FileList | null) {
    const picked = Array.from(list ?? []);
    if (picked.length > MAX_FILES) {
      setFileError(`Please attach at most ${MAX_FILES} files.`);
      return;
    }
    const total = picked.reduce((n, f) => n + f.size, 0);
    if (total > MAX_TOTAL_BYTES) {
      setFileError(
        `That is ${megabytes(total)} MB in total, and the limit is ${megabytes(MAX_TOTAL_BYTES)} MB. ` +
          `Please remove one, or send a smaller photograph.`
      );
      return;
    }
    setFileError("");
    setFiles(picked);
  }

  function next() {
    if (!formRef.current?.reportValidity()) return;
    if (step === 1 && files.length === 0) {
      setFileError("Please attach the invoice or receipt.");
      return;
    }
    setStep((s) => Math.min(s + 1, STEPS.length - 1));
  }

  async function submit(event: React.FormEvent<HTMLFormElement>) {
    event.preventDefault();
    if (step < STEPS.length - 1) return next();

    setStatus({ state: "sending" });
    const body = new FormData();
    body.set(
      "registration",
      JSON.stringify({
        title,
        name,
        ic,
        email,
        address,
        mobile: `+60${mobile.replace(/\D/g, "").replace(/^0/, "")}`,
        products: products.map(({ key: _key, ...p }) => p),
      })
    );
    for (const file of files) body.append("proof", file);

    try {
      // Trailing slash. `trailingSlash: true` in next.config.ts applies to route
      // handlers too, and without it this POST costs a 308 and a second upload
      // of every attachment.
      const response = await fetch("/api/ewarranty/", { method: "POST", body });
      if (!response.ok) {
        const { error } = await response.json().catch(() => ({ error: "" }));
        throw new Error(error || `The server replied ${response.status}.`);
      }
      setStatus({ state: "sent" });
    } catch (err) {
      setStatus({
        state: "error",
        message: err instanceof Error ? err.message : "Something went wrong.",
      });
    }
  }

  if (status.state === "sent") {
    return (
      <div className="rounded-sm border border-line bg-surface p-6 sm:p-10" role="status">
        <p className="readout text-sm text-teal">Registered</p>
        <h3 className="mt-4 text-2xl font-semibold tracking-[-0.025em]">
          Thank you, {name.split(" ")[0] || "and welcome"}.
        </h3>
        <p className="mt-4 max-w-[56ch] leading-relaxed text-ink-muted">
          Your registration is with the service desk and a confirmation is on its way to{" "}
          <span className="text-ink">{email}</span>. Keep the invoice: a claim is checked against it.
          If nothing arrives within two working days, message us and quote the serial number.
        </p>
      </div>
    );
  }

  return (
    <form ref={formRef} onSubmit={submit}>
      {/* Progress. An ordered list rather than a bar: three named steps tell
          the visitor what is still coming, a percentage does not. */}
      <ol className="flex flex-wrap gap-x-6 gap-y-2 border-b border-line pb-4">
        {STEPS.map((label, i) => (
          <li
            key={label}
            aria-current={i === step ? "step" : undefined}
            className={`flex items-baseline gap-2 text-sm ${
              i === step ? "text-ink" : "text-ink-muted"
            }`}
          >
            <span className={`readout text-xs ${i <= step ? "text-teal" : "text-ink-muted"}`}>
              {i + 1}
            </span>
            <span className={i === step ? "font-semibold" : undefined}>{label}</span>
          </li>
        ))}
      </ol>

      <p
        ref={headingRef}
        tabIndex={-1}
        className="mt-8 text-xl font-semibold tracking-[-0.025em] focus-visible:outline-none"
      >
        {STEPS[step]}
      </p>

      {step === 0 && (
        <div className="mt-6">
          <fieldset className="border-t border-line py-6">
            <legend className="sr-only">Title</legend>
            <p aria-hidden className="font-medium">
              Title <Required />
            </p>
            <div className="mt-4 flex flex-wrap gap-2">
              {TITLES.map((option) => (
                <label key={option} className="cursor-pointer">
                  <input
                    type="radio"
                    name="title"
                    value={option}
                    required
                    checked={title === option}
                    onChange={() => setTitle(option)}
                    className="peer sr-only"
                  />
                  <span className="block rounded-sm border border-line-strong px-4 py-2.5 text-sm text-ink transition-colors hover:border-teal hover:text-teal peer-checked:border-teal peer-checked:bg-teal peer-checked:font-semibold peer-checked:text-void peer-focus-visible:outline peer-focus-visible:outline-2 peer-focus-visible:outline-offset-2 peer-focus-visible:outline-teal">
                    {option}
                  </span>
                </label>
              ))}
            </div>
          </fieldset>

          <Field id={`${uid}-name`} label="Customer name" required>
            <input
              id={`${uid}-name`}
              type="text"
              required
              autoComplete="name"
              value={name}
              onChange={(e) => setName(e.target.value)}
              className={INPUT}
            />
          </Field>

          <Field
            id={`${uid}-ic`}
            label="Identity card no. / passport no."
            hint="As it appears on the document, so a claim can be matched to you."
            required
          >
            <input
              id={`${uid}-ic`}
              type="text"
              required
              value={ic}
              onChange={(e) => setIc(e.target.value)}
              className={INPUT}
            />
          </Field>

          <Field id={`${uid}-email`} label="Email" hint="Your confirmation goes here." required>
            <input
              id={`${uid}-email`}
              type="email"
              required
              autoComplete="email"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
              className={INPUT}
            />
          </Field>

          <Field id={`${uid}-address`} label="Address" required>
            <textarea
              id={`${uid}-address`}
              required
              rows={3}
              autoComplete="street-address"
              value={address}
              onChange={(e) => setAddress(e.target.value)}
              className={`${INPUT} resize-y`}
            />
          </Field>

          <Field
            id={`${uid}-mobile`}
            label="Mobile number"
            hint="Malaysian number. The service team calls before a home visit."
            required
          >
            {/* Fixed +60 rather than a country picker. Every dealer in the list
                above is Malaysian and the warranty is a Malaysian one, so a
                picker would offer 200 wrong answers to make one right one
                available. The source form defaulted to a Singapore flag. */}
            <div className="mt-3 flex max-w-sm items-stretch rounded-sm border border-line-strong focus-within:border-teal">
              <span className="readout grid place-items-center border-r border-line-strong px-3.5 text-ink-muted">
                +60
              </span>
              <input
                id={`${uid}-mobile`}
                type="tel"
                required
                inputMode="tel"
                autoComplete="tel-national"
                pattern="[0-9\s-]{9,12}"
                placeholder="12 336 6082"
                value={mobile}
                onChange={(e) => setMobile(e.target.value)}
                className="w-full bg-void px-3.5 py-2.5 text-ink placeholder:text-ink-muted focus-visible:outline-none"
              />
            </div>
          </Field>
        </div>
      )}

      {step === 1 && (
        <div className="mt-6">
          {products.map((product, i) => (
            <fieldset key={product.key} className="border-t border-line py-6">
              <legend className="sr-only">Product {i + 1}</legend>
              <div className="flex items-baseline justify-between gap-4">
                <p aria-hidden className="font-medium">
                  Product {i + 1}
                </p>
                {products.length > 1 && (
                  <button
                    type="button"
                    onClick={() =>
                      setProducts((prev) => prev.filter((p) => p.key !== product.key))
                    }
                    className="text-sm text-ink-muted transition-colors hover:text-ember"
                  >
                    Remove
                  </button>
                )}
              </div>

              <div className="grid gap-x-6 sm:grid-cols-2">
                <Field
                  id={`${uid}-serial-${product.key}`}
                  label="Warranty card no. / serial no."
                  required
                >
                  <input
                    id={`${uid}-serial-${product.key}`}
                    type="text"
                    required
                    value={product.serial}
                    onChange={(e) => updateProduct(product.key, { serial: e.target.value })}
                    className={INPUT}
                  />
                </Field>

                <Field id={`${uid}-purchased-${product.key}`} label="Date of purchase" required>
                  <input
                    id={`${uid}-purchased-${product.key}`}
                    type="date"
                    required
                    max={today || undefined}
                    value={product.purchased}
                    onChange={(e) => updateProduct(product.key, { purchased: e.target.value })}
                    className={INPUT}
                  />
                </Field>

                <Field id={`${uid}-invoice-${product.key}`} label="Invoice no." required>
                  <input
                    id={`${uid}-invoice-${product.key}`}
                    type="text"
                    required
                    value={product.invoice}
                    onChange={(e) => updateProduct(product.key, { invoice: e.target.value })}
                    className={INPUT}
                  />
                </Field>

                <Field
                  id={`${uid}-dealer-${product.key}`}
                  label="Authorised dealer"
                  required
                >
                  <select
                    id={`${uid}-dealer-${product.key}`}
                    required
                    value={product.dealer}
                    onChange={(e) => updateProduct(product.key, { dealer: e.target.value })}
                    className={INPUT}
                  >
                    <option value="">Choose a dealer</option>
                    {dealers.map((dealer) => (
                      <option key={dealer} value={dealer}>
                        {dealer}
                      </option>
                    ))}
                  </select>
                </Field>

                <Field id={`${uid}-type-${product.key}`} label="Type of product" required>
                  <select
                    id={`${uid}-type-${product.key}`}
                    required
                    value={product.type}
                    onChange={(e) => updateProduct(product.key, { type: e.target.value })}
                    className={INPUT}
                  >
                    <option value="">Choose an appliance</option>
                    {types.map((t) => (
                      <option key={t.name} value={t.name}>
                        {t.name}
                      </option>
                    ))}
                  </select>
                </Field>

                {/* The model select only exists once the type is known. The
                    source form rendered all eight and hid seven; one select
                    that repopulates is the same thing without the tab stops
                    into invisible fields. */}
                {product.type && (
                  <Field
                    id={`${uid}-model-${product.key}`}
                    label={`${product.type} product code`}
                    required
                  >
                    <select
                      id={`${uid}-model-${product.key}`}
                      required
                      value={product.model}
                      onChange={(e) => updateProduct(product.key, { model: e.target.value })}
                      className={INPUT}
                    >
                      <option value="">Choose a model</option>
                      {(types.find((t) => t.name === product.type)?.models ?? []).map((code) => (
                        <option key={code} value={code}>
                          {code}
                        </option>
                      ))}
                    </select>
                  </Field>
                )}
              </div>
            </fieldset>
          ))}

          <div className="border-t border-line py-6">
            <button
              type="button"
              onClick={() => {
                setProducts((prev) => [...prev, blankProduct(nextKey)]);
                setNextKey((k) => k + 1);
              }}
              className="rounded-sm border border-line-strong px-5 py-2.5 text-sm font-medium text-ink transition-colors hover:border-teal hover:text-teal"
            >
              Add another product
            </button>
            <p className="mt-3 text-sm text-ink-muted">
              Register everything bought on the same invoice in one go.
            </p>
          </div>

          <div className="border-y border-line py-6">
            <label htmlFor={`${uid}-proof`} className="block font-medium">
              Proof of purchase, invoice or receipt <Required />
            </label>
            <p className="mt-1 text-sm text-ink-muted">
              Up to {MAX_FILES} images or PDFs, {megabytes(MAX_TOTAL_BYTES)} MB in total. A clear
              photograph of the receipt is enough.
            </p>
            <input
              id={`${uid}-proof`}
              type="file"
              multiple
              accept={ACCEPT}
              onChange={(e) => chooseFiles(e.target.files)}
              aria-describedby={fileError ? `${uid}-proof-error` : undefined}
              className="mt-3 block w-full text-sm text-ink-muted file:mr-4 file:cursor-pointer file:rounded-sm file:border file:border-line-strong file:bg-transparent file:px-4 file:py-2.5 file:text-sm file:font-medium file:text-ink hover:file:border-teal hover:file:text-teal"
            />

            {files.length > 0 && (
              <ul className="mt-4">
                {files.map((file, i) => (
                  <li
                    // Two photographs can carry the same name; the position in
                    // the list is what actually identifies one here.
                    key={`${i}-${file.name}`}
                    className="flex flex-wrap items-baseline justify-between gap-x-6 gap-y-1 border-b border-line py-2.5 text-sm first:border-t"
                  >
                    <span className="min-w-0 break-all text-ink">{file.name}</span>
                    <span className="readout shrink-0 text-xs text-ink-muted">
                      {megabytes(file.size)} MB
                    </span>
                  </li>
                ))}
              </ul>
            )}

            {fileError && (
              <p id={`${uid}-proof-error`} role="alert" className="mt-3 text-sm text-ember">
                {fileError}
              </p>
            )}
          </div>
        </div>
      )}

      {step === 2 && (
        <div className="mt-6">
          <dl className="border-t border-line">
            <Row label="Name">
              {title} {name}
            </Row>
            <Row label="Identity card / passport">{ic}</Row>
            <Row label="Email">{email}</Row>
            <Row label="Mobile">+60 {mobile}</Row>
            <Row label="Address">{address}</Row>
            {products.map((p, i) => (
              <Row key={p.key} label={`Product ${i + 1}`}>
                {p.type} {p.model}, serial {p.serial}, invoice {p.invoice}, bought{" "}
                {p.purchased ? formatDate(p.purchased) : ""} from {p.dealer}
              </Row>
            ))}
            <Row label="Proof of purchase">
              {files.map((f) => f.name).join(", ")}
            </Row>
          </dl>

          {/* The agreement itself, in front of the box that says you have read
              it. The same strings render as sections further down the page, so
              somebody weighing up whether to register at all does not have to
              start the form to read them — but the copy on this step is what is
              actually being agreed to, and it is here rather than a scroll
              away. Same source either way; see src/lib/warranty-terms.ts. */}
          <section
            aria-labelledby={`${uid}-terms`}
            className="mt-10 border-t border-line pt-8"
          >
            <h3 id={`${uid}-terms`} className="text-lg font-semibold">
              Terms &amp; conditions
            </h3>
            <ol className="mt-4 list-decimal pl-5 marker:text-ink-muted">
              {TERMS.map((t) => (
                <li key={t} className="mt-2 leading-relaxed text-ink-muted">
                  {t}
                </li>
              ))}
            </ol>

            <h3 className="mt-8 text-lg font-semibold">Warranty period</h3>
            <ul className="mt-4 list-disc pl-5 marker:text-ink-muted">
              {PERIODS.map((p) => (
                <li key={p.label} className="mt-2 leading-relaxed text-ink-muted">
                  <span className="text-ink">
                    {p.value} {p.unit}
                  </span>
                  : {p.label}
                </li>
              ))}
            </ul>

            <h3 className="mt-8 text-lg font-semibold text-ember">{EXCLUSIONS_HEADING}:</h3>
            <ol className="mt-4 list-decimal pl-5 marker:text-ink-muted">
              {EXCLUSIONS.map((t) => (
                <li key={t} className="mt-2 leading-relaxed text-ink-muted">
                  {t}
                </li>
              ))}
            </ol>

            <p className="mt-8 font-medium italic leading-relaxed">{PAID_SERVICE}</p>
          </section>

          <div className="mt-8 rounded-sm border border-line bg-surface p-5 sm:p-6">
            <label className="flex cursor-pointer items-start gap-3">
              <input
                type="checkbox"
                required
                checked={agreed}
                onChange={(e) => setAgreed(e.target.checked)}
                className="mt-1 size-4 shrink-0 accent-teal"
              />
              <span className="leading-relaxed">
                I have read and agree to the terms and conditions of the VATTI product warranty
                agreement above, and confirm the details are correct. <Required />
              </span>
            </label>
          </div>

          {status.state === "error" && (
            <p role="alert" className="mt-6 rounded-sm border border-ember px-5 py-4 text-ember">
              {status.message} Nothing was sent. Try again, or email the same details to{" "}
              <a href="mailto:enquiry@vattimalaysia.com" className="underline">
                enquiry@vattimalaysia.com
              </a>
              .
            </p>
          )}
        </div>
      )}

      <div className="mt-8 flex flex-wrap gap-3">
        {step > 0 && (
          <button
            type="button"
            onClick={() => setStep((s) => s - 1)}
            className="rounded-sm border border-line-strong px-6 py-3 font-medium text-ink transition-colors hover:border-teal hover:text-teal"
          >
            Previous
          </button>
        )}
        {step < STEPS.length - 1 ? (
          <button
            type="button"
            onClick={next}
            className="rounded-sm bg-teal px-6 py-3 font-semibold text-void transition-opacity hover:opacity-90"
          >
            Next
          </button>
        ) : (
          <button
            type="submit"
            disabled={status.state === "sending"}
            className="rounded-sm bg-teal px-6 py-3 font-semibold text-void transition-opacity hover:opacity-90 disabled:opacity-60"
          >
            {status.state === "sending" ? "Sending…" : "Submit registration"}
          </button>
        )}
      </div>
    </form>
  );
}

/** Shared input skin. Matches the name field in EnquiryBuilder. */
const INPUT =
  "mt-3 w-full rounded-sm border border-line-strong bg-void px-3.5 py-2.5 text-ink placeholder:text-ink-muted focus-visible:border-teal";

function Required() {
  return (
    <span className="text-ember" aria-hidden>
      *
    </span>
  );
}

function Field({
  id,
  label,
  hint,
  required,
  children,
}: {
  id: string;
  label: string;
  hint?: string;
  required?: boolean;
  children: React.ReactNode;
}) {
  return (
    <div className="border-t border-line py-6">
      <label htmlFor={id} className="block font-medium">
        {label} {required && <Required />}
      </label>
      {hint && <p className="mt-1 text-sm text-ink-muted">{hint}</p>}
      {children}
    </div>
  );
}

function Row({ label, children }: { label: string; children: React.ReactNode }) {
  return (
    <div className="flex flex-wrap items-baseline justify-between gap-x-8 gap-y-1 border-b border-line py-3.5">
      <dt className="text-[0.6875rem] font-semibold uppercase tracking-[0.14em] text-ink-muted">
        {label}
      </dt>
      <dd className="min-w-0 max-w-[52ch] text-right">{children}</dd>
    </div>
  );
}

/** '2.4' — one decimal is the precision a size limit is argued in. */
function megabytes(bytes: number): string {
  return (bytes / 1024 / 1024).toFixed(1);
}
