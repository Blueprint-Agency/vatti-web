import type { Spec } from "@/lib/queries/product";

/**
 * The source site renders specs as a flat "➥" bullet list. Only 41 of 332
 * bullets parse as "Key: Value"; the rest are feature sentences. So keyed rows
 * render as a real two-column table, and the unkeyed remainder renders as a
 * labelled list underneath rather than being forced into a fake column.
 */
export function SpecTable({ specs }: { specs: Spec[] }) {
  const keyed = specs.filter((s) => s.spec_key && s.spec_value);
  const unkeyed = specs.filter((s) => !s.spec_key || !s.spec_value);

  if (specs.length === 0) return null;

  return (
    <div className="flex flex-col gap-10">
      {keyed.length > 0 && (
        <table className="w-full border-collapse text-left">
          <caption className="sr-only">Specifications</caption>
          <tbody>
            {keyed.map((s, i) => (
              <tr key={i} className="border-b border-line">
                <th
                  scope="row"
                  className="py-3.5 pr-6 align-top text-sm font-medium text-ink-muted"
                >
                  {s.spec_key}
                </th>
                <td className="readout py-3.5 text-right align-top text-sm font-medium text-ink sm:text-base">
                  {s.spec_value}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      )}

      {unkeyed.length > 0 && (
        <div>
          {/* Only label this when there is a table above it to distinguish it
              from. Once the readout strip has consumed every keyed spec, the
              bullets ARE the specifications and a second heading is noise. */}
          {keyed.length > 0 && <h3 className="text-sm font-semibold text-ink-muted">Features</h3>}
          <ul className={`grid gap-x-8 gap-y-3 sm:grid-cols-2 ${keyed.length > 0 ? "mt-4" : ""}`}>
            {unkeyed.map((s, i) => (
              <li key={i} className="flex gap-3 text-[0.9375rem] leading-snug text-ink">
                <span aria-hidden="true" className="mt-2 size-1.5 shrink-0 rounded-full bg-teal-core" />
                {s.raw_text}
              </li>
            ))}
          </ul>
        </div>
      )}
    </div>
  );
}
