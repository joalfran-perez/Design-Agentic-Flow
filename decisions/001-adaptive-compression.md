# 001 — Adaptive compression for large Figma reads

**Date:** 2026-08-27 (retroactive — originated in the first USS extraction session)

**Context:** `use_figma` script output is truncated at ~20KB. Each system has 150–575+ variables, styles,
or component variants. A single call dumping a full array (e.g. all 343 color variables, or all 529 paint
styles) silently loses data past the truncation point with no error.

**Decision:** Never `return` a raw large array from `use_figma`. Instead:
1. Get category-level counts first (split name by `/`, count by segment) — cheap, always fits.
2. Sample/resolve representative values per category, not every item.
3. For genuinely enumerable small sets (≤30 items, e.g. Space/Radius tokens), dump in full — no need to
   compress what already fits.
4. Note duplicate/sync collections by reference ("same values as X, see Y") instead of repeating their
   contents.
5. Resolve all `VARIABLE_ALIAS` to final primitive values before returning (see
   `gotchas/variable-alias-resolution.md`).

**Consequence:** Every `tokens/*.json` file stays under ~200 lines while remaining accurate and complete
at the category level. Applies to every future extraction — do not "just try dumping it" again.
