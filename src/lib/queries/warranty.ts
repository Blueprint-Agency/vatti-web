import { all } from "@/lib/db";

export type WarrantyType = {
  name: string;
  /** Model codes for this appliance, in catalogue order. Never empty. */
  models: string[];
};

/**
 * The authorised-dealer select. 79 options, ordered here rather than by a
 * sort_order column — see data/sql/warranty.sql for why the source order was
 * not kept. COLLATE NOCASE because the list mixes `Filken Kulai` with
 * `FILKEN BUKIT INDAH` and a binary sort files those pages apart.
 */
export function warrantyDealers(): string[] {
  return all<{ name: string }>(
    `SELECT name FROM warranty_dealer ORDER BY name COLLATE NOCASE`
  ).map((r) => r.name);
}

/**
 * Appliance types with their model codes, for the two chained selects on the
 * form. One query and a group in JS: eight types over 41 models is not worth a
 * round trip each, and the form needs every list up front anyway — the model
 * select has to repopulate the moment the type changes, with no request.
 */
export function warrantyTypes(): WarrantyType[] {
  const rows = all<{ type: string; code: string }>(
    `SELECT t.name AS type, m.code
       FROM warranty_product_type t
       JOIN warranty_model m ON m.type_id = t.id
      ORDER BY t.sort_order, m.sort_order`
  );

  const types: WarrantyType[] = [];
  for (const row of rows) {
    const last = types[types.length - 1];
    if (last?.name === row.type) last.models.push(row.code);
    else types.push({ name: row.type, models: [row.code] });
  }
  return types;
}
