import { NextResponse } from "next/server";

/**
 * eWarranty registrations, emailed to the service desk.
 *
 * One of the two serverless endpoints on an otherwise entirely static site. It
 * writes nothing: SQLite here is a build artefact and the filesystem is
 * read-only at runtime, so the email IS the record. docs/REBUILD-PLAN.md § 9.4
 * records that as a deliberate limit, not an oversight — a searchable registry
 * of serial numbers is a real business need and needs a real runtime database.
 *
 * Resend is called over plain fetch rather than through its SDK. The whole
 * integration is one POST with a JSON body, and CLAUDE.md § Style is explicit
 * about not taking a dependency for that.
 */

const RESEND = "https://api.resend.com/emails";

/** Mirrors the client's cap. Vercel rejects a body over 4.5 MB before this
 *  handler ever runs, so the honest number is enforced on both sides. */
const MAX_TOTAL_BYTES = 4 * 1024 * 1024;
const MAX_FILES = 5;

type Product = {
  serial: string;
  purchased: string;
  invoice: string;
  dealer: string;
  type: string;
  model: string;
};

type Registration = {
  title: string;
  name: string;
  ic: string;
  email: string;
  address: string;
  mobile: string;
  products: Product[];
};

export async function POST(request: Request) {
  const apiKey = process.env.RESEND_API_KEY;
  // Comma-separated, so the service desk can be joined by a second inbox
  // without a deploy. enquiry@vattimalaysia.com is the address the site already
  // publishes on /contact-us/ and the one that answers today, so it is the
  // default rather than something that has to be configured to work.
  const to = (process.env.EWARRANTY_TO ?? "enquiry@vattimalaysia.com")
    .split(",")
    .map((address) => address.trim())
    .filter(Boolean);
  // Resend will only send from a verified domain. Until vattimalaysia.com is
  // verified there, set EWARRANTY_FROM to onboarding@resend.dev to test.
  const from = process.env.EWARRANTY_FROM ?? "VATTI eWarranty <ewarranty@vattimalaysia.com>";

  if (!apiKey) {
    // Loud and specific: a form that silently swallows a warranty registration
    // is worse than one that is visibly out of order.
    console.error("RESEND_API_KEY is not set — eWarranty registration not delivered");
    return NextResponse.json(
      { error: "Registration email is not configured yet." },
      { status: 503 }
    );
  }

  let form: FormData;
  try {
    form = await request.formData();
  } catch {
    return NextResponse.json({ error: "That did not arrive as a form." }, { status: 400 });
  }

  let data: Registration;
  try {
    data = JSON.parse(String(form.get("registration") ?? ""));
  } catch {
    return NextResponse.json({ error: "The registration was unreadable." }, { status: 400 });
  }

  const invalid = validate(data);
  if (invalid) return NextResponse.json({ error: invalid }, { status: 400 });

  const files = form.getAll("proof").filter((f): f is File => f instanceof File && f.size > 0);
  if (files.length === 0) {
    return NextResponse.json({ error: "Attach the invoice or receipt." }, { status: 400 });
  }
  if (files.length > MAX_FILES) {
    return NextResponse.json({ error: `At most ${MAX_FILES} files.` }, { status: 400 });
  }
  if (files.reduce((n, f) => n + f.size, 0) > MAX_TOTAL_BYTES) {
    return NextResponse.json({ error: "The attachments are too large." }, { status: 413 });
  }

  const attachments = await Promise.all(
    files.map(async (file) => ({
      filename: file.name,
      content: Buffer.from(await file.arrayBuffer()).toString("base64"),
    }))
  );

  const models = data.products.map((p) => p.model).join(", ");

  const response = await send(apiKey, {
    from,
    to,
    // So the service desk answers the customer by hitting reply.
    reply_to: data.email,
    subject: `eWarranty registration: ${data.name} (${models})`,
    html: body(data),
    attachments,
  });

  if (!response.ok) {
    // The upstream message can name the account or the domain, so it is logged
    // rather than returned.
    console.error("resend rejected an eWarranty registration", response.status, await response.text());
    return NextResponse.json({ error: "The registration could not be sent." }, { status: 502 });
  }

  // The customer's copy. Sent second and deliberately not awaited into the
  // result: the registration is already with the service desk by this point, and
  // failing the request now would tell the visitor to submit it all again. The
  // form's own wording covers the gap ("if nothing arrives within two working
  // days"), and this line is what tells us which of the two went wrong.
  const receipt = await send(apiKey, {
    from,
    reply_to: to[0],
    to: [data.email],
    subject: `Your VATTI warranty registration (${models})`,
    html: confirmation(data),
  });
  if (!receipt.ok) {
    console.error("confirmation copy not delivered", data.email, receipt.status, await receipt.text());
  }

  return NextResponse.json({ ok: true });
}

function send(apiKey: string, payload: Record<string, unknown>) {
  return fetch(RESEND, {
    method: "POST",
    headers: { Authorization: `Bearer ${apiKey}`, "Content-Type": "application/json" },
    body: JSON.stringify(payload),
  });
}

/** Returns the first problem, or null. The browser has already checked all of
 *  this; a request that reaches here without it did not come from the form. */
function validate(data: Registration): string | null {
  const required: (keyof Registration)[] = ["title", "name", "ic", "email", "address", "mobile"];
  for (const field of required) {
    if (typeof data[field] !== "string" || !data[field].trim()) return `Missing ${field}.`;
  }
  if (!/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(data.email)) return "That email address is not valid.";
  if (!Array.isArray(data.products) || data.products.length === 0) return "Add a product.";
  for (const p of data.products) {
    for (const field of ["serial", "purchased", "invoice", "dealer", "type", "model"] as const) {
      if (typeof p?.[field] !== "string" || !p[field].trim()) return `Missing product ${field}.`;
    }
  }
  return null;
}

/**
 * The email. Deliberately a table of labelled rows rather than a designed
 * template: it is read once, by a person copying serial numbers into a warranty
 * system, and every corporate mail client renders this correctly.
 */
function body(data: Registration): string {
  const rows = [
    ["Name", `${data.title} ${data.name}`],
    ["Identity card / passport", data.ic],
    ["Email", data.email],
    ["Mobile", data.mobile],
    ["Address", data.address],
  ];

  const products = data.products
    .map(
      (p, i) => `
      <h3 style="margin:24px 0 8px">Product ${i + 1}</h3>
      <table cellpadding="6" style="border-collapse:collapse;font:14px sans-serif">
        ${row("Type", p.type)}
        ${row("Model", p.model)}
        ${row("Warranty card / serial no.", p.serial)}
        ${row("Invoice no.", p.invoice)}
        ${row("Date of purchase", p.purchased)}
        ${row("Authorised dealer", p.dealer)}
      </table>`
    )
    .join("");

  return `<div style="font:14px sans-serif;color:#222">
    <h2 style="margin:0 0 16px">eWarranty registration</h2>
    <table cellpadding="6" style="border-collapse:collapse;font:14px sans-serif">
      ${rows.map(([label, value]) => row(label, value)).join("")}
    </table>
    ${products}
    <p style="margin-top:24px;color:#666">
      Proof of purchase is attached. Submitted from vattimalaysia.com/vatti-ewarranty/.
    </p>
  </div>`;
}

/**
 * The customer's copy, which is the only proof of registration they get. It
 * repeats what was registered so a wrong serial number is caught now rather
 * than at the point of claim, and deliberately leaves out the identity card
 * number: this email lands in a personal inbox and gets forwarded, and it does
 * not need to carry that.
 */
function confirmation(data: Registration): string {
  const products = data.products
    .map(
      (p) => `
      <table cellpadding="6" style="border-collapse:collapse;font:14px sans-serif;margin-bottom:16px">
        ${row("Product", `${p.type} ${p.model}`)}
        ${row("Warranty card / serial no.", p.serial)}
        ${row("Date of purchase", p.purchased)}
        ${row("Dealer", p.dealer)}
      </table>`
    )
    .join("");

  return `<div style="font:14px sans-serif;color:#222">
    <h2 style="margin:0 0 16px">Your VATTI warranty is registered</h2>
    <p>Thank you, ${escape(data.title)} ${escape(data.name)}. We have recorded the following:</p>
    ${products}
    <p>
      Keep your invoice. A warranty claim is checked against it, and against the serial number
      above, so please tell us straight away if anything here is wrong.
    </p>
    <p style="color:#666">
      Service care line and WhatsApp: 012-3366082. Warranty periods and the full terms are at
      https://vattimalaysia.com/vatti-ewarranty/.
    </p>
  </div>`;
}

function row(label: string, value: string): string {
  return `<tr>
    <td style="border:1px solid #ddd;background:#f7f7f7;white-space:nowrap"><strong>${escape(label)}</strong></td>
    <td style="border:1px solid #ddd">${escape(value).replace(/\n/g, "<br>")}</td>
  </tr>`;
}

/** Everything in the email is visitor-typed, and it is sent as HTML. */
function escape(value: string): string {
  return value
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;");
}
