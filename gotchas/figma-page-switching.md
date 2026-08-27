# Gotcha: page switching inside `use_figma`

**Symptom:** Incomplete/wrong data, or silent no-ops, when a script loops over multiple pages and calls
`figma.setCurrentPageAsync` inside the loop.

**Rules:**
- `figma.currentPage` resets to the first page at the start of every `use_figma` call.
- `await figma.setCurrentPageAsync(page)` — the ONLY way to switch pages. The sync setter
  `figma.currentPage = page` throws `"Setting figma.currentPage is not supported"`.
- Call `setCurrentPageAsync` **at most once per script**. Never loop pages inside one call.

**Fix for multi-page work (always this repo's pattern):** issue N `use_figma` calls — one per page — as
parallel tool calls **in a single message**. Never sequential turns, never one big script with a page
loop. See `skills/figma-inventory-extraction.md` step 6 for the exact per-page script template used here.
