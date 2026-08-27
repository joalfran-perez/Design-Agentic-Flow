# Gotcha: `use_figma` output truncation (~20KB)

**Symptom:** A `use_figma` call returning a large array (full Color variable list, full paint-style list,
full component list) comes back cut off mid-array, with no error — data is silently missing past the
truncation point.

**Cause:** `use_figma` return values are capped at roughly 20KB.

**Fix:** Never `return` a raw large array (100+ items). Split into multiple calls:
1. Category counts only (`name.split('/')[...]`, tally) — always fits.
2. Targeted follow-up calls per category to resolve sample/representative values.
See `decisions/001-adaptive-compression.md` and `skills/figma-inventory-extraction.md` step 5.

**Rule of thumb:** if you expect >~50-80 items in the return value, compress before calling, don't call
and hope.
