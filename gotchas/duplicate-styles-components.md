# Gotcha: inflated counts from duplicate styles/components

**Symptom:** A category's item count is a suspiciously clean multiple of the expected distinct-name count
(e.g. 260 "Light mode" paint styles where only 65 distinct semantic names were expected — exactly 4x).

**Cause:** Some Figma files (confirmed in USS Extension Library) contain exact-duplicate PaintStyle or
component-set objects: identical name AND identical resolved value, but different style/node IDs. Likely
from repeated library imports/merges over time, not intentional variants.

**Detection:** Always compute both `total objects` and `distinct names` when a count looks inflated:
```js
const names = items.map(s => s.name);
return { total: names.length, distinct: new Set(names).size };
```

**Fix:** Report BOTH numbers, flag the delta explicitly as a data-quality note (per `decisions/005`) —
never silently dedupe the source file, and never just report the distinct count as if the duplicates don't
exist (they do, and matter for whoever cleans up the Figma file).

**Also watch for:** duplicate COMPONENT_SET names on the same page (not just styles) — found in both
Extension Library files (`Button icon 📱` on Mobile, `Card Persona S horizontal` on Desktop). Same
detection/reporting approach applies.
