# Gotcha: `use_figma` blocked by read-only file access

**Symptom:** `use_figma` throws `"Operation attempted to modify the file while in read-only mode"` even
for a script that only reads data (no mutation).

**Cause:** The Figma account/session used has view-only (not edit) access to that specific file. This
varies per file and per session.

**Fix:** For that file, use the remote MCP read tools instead of `use_figma`:
- `get_metadata` — page/node structure (XML), no selection required for page-level calls.
- `get_variable_defs` — needs an actual node/selection, not just a page ID; pass a specific instance or
  frame node ID, not a bare page ID, or it errors with "nothing selected".

**Always check access first** (via the overview `use_figma` call in
`skills/figma-inventory-extraction.md` step 3) before assuming a file is editable.

---

## Do NOT confuse this with the page-enumeration gotcha (corrected 2026-09-25)

This file previously cited the main/core **USS Componentes Mobile** file as an example of the symptom
above, stating its per-component pages were "blocked by permissions." **That diagnosis was wrong**, and it
cost this repo a year-long phantom blocker plus a retracted code↔design conclusion (`decisions/021`).

The real behaviour: `get_metadata` with no `nodeId` **under-counts pages on large component files**.
On all 3 Mobile files it returns only `👋🏼 Comenzar`. On all 3 Desktop files it returns Comenzar plus
the same 6 component pages (Badges/Buttons/Cards/Divider/Image-video/Tags) — which this repo treated
as the real catalog until 2026-09-25 (`decisions/022`). A read-only `use_figma` script
(`figma.root.children.map(p => ({id: p.id, name: p.name}))`) returns the full list on all 9 files
(Desktop: 46 / 51 / 46; Mobile: 44 / 49 / 54).

**Rule:** a short page list from `get_metadata` is evidence of nothing. Before recording any access
limitation, confirm it through `use_figma`. Only an actual thrown error — the read-only message at the
top of this file, or an auth/permission error — is evidence of an access limit.

**Per-page exception (Desktop Sheets, main system):** `use_figma` on page `8762:3101` threw the
genuine read-only error even though every other page in the same view-only file succeeded. Fallback
to `get_metadata` with that `nodeId` recovered the structure (Bottom sheet 4 + side sheet 8). So the
read-only throw can be **page-scoped**, not only file-scoped.

**Session variance (2026-09-25 parity pass):** the same main Desktop file, plus Foundations
(`16PDlIOKg8kb176dMz0Ckg`, historically *edit*), threw file-level read-only on a page-list
`use_figma` script. Mobile still listed pages; Mobile **Tabs** (`1393:10823`) then threw on a
per-page sample. Fall back to `get_metadata` / `get_variable_defs` for that session — do not treat
a prior session's successful Plugin API walk as a guarantee.

Distinguishing the two symptoms:

| Observation | Meaning |
|---|---|
| `use_figma` throws "read-only mode" | genuine view-only access on that file *or that page*; fall back to `get_metadata` |
| `get_metadata` returns few/one page, `use_figma` works | **not** an access problem; use `use_figma`, trust its list |
| Both channels error with auth/permission | genuine access problem; check `whoami` for plan/seat |

See `state/inventories.md` § MCP channel note for the full verified matrix across all 9 files.
