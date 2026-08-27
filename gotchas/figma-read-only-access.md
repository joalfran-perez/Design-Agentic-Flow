# Gotcha: `use_figma` blocked by read-only file access

**Symptom:** `use_figma` throws `"Operation attempted to modify the file while in read-only mode"` even
for a script that only reads data (no mutation).

**Cause:** The Figma account/session used has view-only (not edit) access to that specific file. This
varies per file and per session — e.g. the original USS Desktop/Mobile files were view-only while
Foundations was edit; USS One and Extension Library later had edit access on all 3 files.

**Fix:** For that file, use the remote MCP read tools instead of `use_figma`:
- `get_metadata` — page/node structure (XML), no selection required for page-level calls.
- `get_variable_defs` — needs an actual node/selection, not just a page ID (see next gotcha-note below);
  pass a specific instance or frame node ID, not a bare page ID, or it errors with "nothing selected".

**Always check access first** (via the overview `use_figma` call in
`skills/figma-inventory-extraction.md` step 3) before assuming a file is editable.
