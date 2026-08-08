import { all } from "@/lib/db";

export type Recipe = {
  id: number;
  name: string;
  description: string | null;
  prep_minutes: number | null;
  cook_minutes: number | null;
  total_minutes: number | null;
  yield_qty: string | null;
  yield_label: string | null;
  cuisine: string | null;
  meal_category: string | null;
  calories: string | null;
  /** The card's '### Note'. NULL on cream-puff, the one recipe without one. */
  notes: string | null;
  ingredients: string[];
  steps: string[];
};

/**
 * 0..n per article — 16 of the 26 recipe posts carry real Recipe JSON-LD and the
 * rest are roundups holding several recipes as prose, which is why this hangs
 * off `article` with a position rather than being 1:1. Today every one of the 16
 * has exactly one row; the loop below does not assume that.
 */
export function getRecipes(articleId: number): Recipe[] {
  const rows = all<Omit<Recipe, "ingredients" | "steps">>(
    `SELECT id, name, description, prep_minutes, cook_minutes, total_minutes,
            yield_qty, yield_label, cuisine, meal_category, calories, notes
       FROM recipe WHERE article_id = ? ORDER BY position`,
    articleId
  );
  if (rows.length === 0) return [];

  const holes = rows.map(() => "?").join(",");
  const ids = rows.map((r) => r.id);
  const ingredients = all<{ recipe_id: number; text: string }>(
    `SELECT recipe_id, text FROM recipe_ingredient
      WHERE recipe_id IN (${holes}) ORDER BY position`,
    ...ids
  );
  const steps = all<{ recipe_id: number; text: string }>(
    `SELECT recipe_id, text FROM recipe_step
      WHERE recipe_id IN (${holes}) ORDER BY position`,
    ...ids
  );

  return rows.map((r) => ({
    ...r,
    ingredients: ingredients.filter((x) => x.recipe_id === r.id).map((x) => x.text),
    steps: steps.filter((x) => x.recipe_id === r.id).map((x) => x.text),
  }));
}
