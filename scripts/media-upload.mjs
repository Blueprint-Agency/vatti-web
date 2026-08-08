// old-media/ -> Cloudflare R2. Run: node scripts/media-upload.mjs [maxFiles]
//
// Idempotent: lists the bucket first and skips anything already there at the
// same size, so a killed run resumes by re-running it.
//
// ponytail: hand-rolled SigV4 over node:crypto instead of @aws-sdk/client-s3.
// It is ~60 lines, this is the only S3 call site in the project, and the SDK
// would add ~15MB of dependency for PUT and GET.
import { createHash, createHmac } from "node:crypto";
import { readFile, readdir, stat } from "node:fs/promises";
import path from "node:path";

import { required } from "./env.mjs";

const ROOT = path.join(import.meta.dirname, "..");
const MEDIA = path.join(ROOT, "old-media");
const LIMIT = Number(process.argv[2]) || Infinity;
const CONCURRENCY = 6;

// Elementor editor screenshots are page thumbnails for the WP admin UI, not
// site content. Nothing links to them.
const SKIP_DIRS = new Set(["elementor"]);

const KEY = required("R2_ACCESS_KEY_ID");
const SECRET = required("R2_SECRET_ACCESS_KEY");
const BUCKET = required("R2_BUCKET");
const HOST = new URL(required("R2_ENDPOINT")).host;

const TYPES = {
  ".webp": "image/webp", ".jpg": "image/jpeg", ".jpeg": "image/jpeg",
  ".png": "image/png", ".gif": "image/gif", ".svg": "image/svg+xml",
  ".pdf": "application/pdf", ".mp4": "video/mp4",
  ".docx": "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
};

const sha256 = (b) => createHash("sha256").update(b).digest("hex");
const hmac = (k, s) => createHmac("sha256", k).update(s).digest();

// AWS uriEncode: everything except unreserved. encodeURIComponent leaves !'()*
// alone, and the signature breaks on the one Chinese-named PDF without this.
const uriEncode = (s) =>
  encodeURIComponent(s).replace(/[!'()*]/g, (c) => "%" + c.charCodeAt(0).toString(16).toUpperCase());
const encodeKeyPath = (key) => "/" + key.split("/").map(uriEncode).join("/");

const unescapeXml = (s) =>
  s.replace(/&(amp|lt|gt|quot|apos|#39);/g, (_, e) =>
    ({ amp: "&", lt: "<", gt: ">", quot: '"', apos: "'", "#39": "'" })[e]);

function sign({ method, canonicalPath, query = "", payloadHash, contentType }) {
  const now = new Date().toISOString().replace(/[:-]|\.\d{3}/g, "");
  const date = now.slice(0, 8);
  const headers = { host: HOST, "x-amz-content-sha256": payloadHash, "x-amz-date": now };
  if (contentType) headers["content-type"] = contentType;

  const names = Object.keys(headers).sort();
  const canonical = [
    method,
    canonicalPath,
    query,
    names.map((n) => `${n}:${headers[n]}\n`).join(""),
    names.join(";"),
    payloadHash,
  ].join("\n");

  const scope = `${date}/auto/s3/aws4_request`;
  const toSign = ["AWS4-HMAC-SHA256", now, scope, sha256(canonical)].join("\n");
  const signingKey = hmac(hmac(hmac(hmac(`AWS4${SECRET}`, date), "auto"), "s3"), "aws4_request");
  const sig = createHmac("sha256", signingKey).update(toSign).digest("hex");

  return {
    ...headers,
    Authorization: `AWS4-HMAC-SHA256 Credential=${KEY}/${scope}, SignedHeaders=${names.join(";")}, Signature=${sig}`,
  };
}

async function listExisting() {
  const seen = new Map();
  let token;
  do {
    const parts = ["list-type=2", "max-keys=1000"];
    if (token) parts.push(`continuation-token=${uriEncode(token)}`);
    const query = parts.sort().join("&");
    const res = await fetch(`https://${HOST}/${BUCKET}?${query}`, {
      headers: sign({ method: "GET", canonicalPath: `/${BUCKET}`, query, payloadHash: sha256("") }),
    });
    if (!res.ok) throw new Error(`list failed ${res.status}: ${await res.text()}`);
    const xml = await res.text();
    // R2 orders these <Key><Size><LastModified><ETag>, which is not the order
    // AWS documents. Parse each block on its own rather than assume a sequence.
    for (const [, block] of xml.matchAll(/<Contents>(.*?)<\/Contents>/gs)) {
      const key = block.match(/<Key>(.*?)<\/Key>/s)?.[1];
      const size = block.match(/<Size>(\d+)<\/Size>/)?.[1];
      if (key && size) seen.set(unescapeXml(key), Number(size));
    }
    token = xml.match(/<NextContinuationToken>([^<]+)<\/NextContinuationToken>/)?.[1];
  } while (token);
  return seen;
}

async function* walk(dir, base = "") {
  for (const entry of await readdir(dir, { withFileTypes: true })) {
    const rel = base ? `${base}/${entry.name}` : entry.name;
    if (entry.isDirectory()) {
      if (!base && SKIP_DIRS.has(entry.name)) continue;
      yield* walk(path.join(dir, entry.name), rel);
    } else {
      yield rel;
    }
  }
}

// ponytail: buffers each file to hash it, because SigV4 needs the payload
// digest up front. Peak memory is CONCURRENCY x largest file (~200MB for the
// e-brochure). Switch to UNSIGNED-PAYLOAD + streaming if that ever hurts.
async function put(key, absPath) {
  const body = await readFile(absPath);
  const contentType = TYPES[path.extname(key).toLowerCase()] ?? "application/octet-stream";
  const canonicalPath = `/${BUCKET}${encodeKeyPath(key)}`;
  const res = await fetch(`https://${HOST}${canonicalPath}`, {
    method: "PUT",
    body,
    headers: sign({ method: "PUT", canonicalPath, payloadHash: sha256(body), contentType }),
  });
  if (!res.ok) throw new Error(`${key} -> ${res.status} ${await res.text()}`);
  return body.length;
}

const existing = await listExisting();
console.log(`bucket has ${existing.size} objects`);

const queue = [];
for await (const rel of walk(MEDIA)) {
  const size = (await stat(path.join(MEDIA, rel))).size;
  if (existing.get(rel) === size) continue;
  queue.push({ rel, size });
  if (queue.length >= LIMIT) break;
}

const totalBytes = queue.reduce((n, f) => n + f.size, 0);
console.log(`${queue.length} to upload, ${(totalBytes / 1e9).toFixed(2)} GB\n`);

let done = 0, bytes = 0;
const failures = [];
await Promise.all(
  Array.from({ length: CONCURRENCY }, async () => {
    for (let f; (f = queue.shift()); ) {
      try {
        // Not `bytes += await ...` — that reads bytes before suspending, so
        // concurrent workers clobber each other's updates.
        const n = await put(f.rel, path.join(MEDIA, f.rel));
        bytes += n;
      } catch (err) {
        failures.push({ key: f.rel, error: String(err.message).slice(0, 200) });
      }
      if (++done % 25 === 0 || !queue.length) {
        console.log(`  ${done} files · ${(bytes / 1e9).toFixed(2)} GB · ${failures.length} failed`);
      }
    }
  }),
);

console.log(`\ndone: ${done - failures.length} uploaded, ${failures.length} failed`);
for (const f of failures) console.log(`  FAIL ${f.key}: ${f.error}`);
process.exit(failures.length ? 1 : 0);
