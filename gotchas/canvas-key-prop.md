# Gotcha: `key` prop TypeScript error in canvas `.map()` calls

**Symptom:** Canvas TypeScript check fails with `Property 'key' does not exist` on a custom component
(e.g. `ColorCategoryTable`, `CollapsibleSection`, `Text`) when `key` is passed directly inside a `.map()`.

**Cause:** Custom components in this SDK don't always type/forward the `key` prop the way native DOM
elements do.

**Fix:** Wrap the custom component in a native `<div key={...}>` instead of passing `key` to the custom
component directly:
```tsx
// Wrong
{items.map(item => <CollapsibleSection key={item.id} ... />)}

// Right
{items.map(item => <div key={item.id}><CollapsibleSection ... /></div>)}
```
Applied consistently across all 3 inventory canvases.
