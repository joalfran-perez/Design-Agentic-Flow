# 008 — Open-questions review: reconciliation, report, public repo

**Date:** 2026-08-28

**What:** Reviewed all 5 open questions from `state/current.md` with the user, one by one. 4/5 resolved,
1 deferred:

1. **Token reconciliation → start it.** Built `context/canonical-tokens.md` (proposed canonical schema for
   spacing/radius/color/typography/effects, synthesized entirely from already-captured `tokens/*.json` —
   no new Figma reads). Explicitly framed as a proposal/target, not a live edit to any system's own files
   (`decisions/011`).
2. **Data-quality issues → report them.** Wrote `reports/figma-data-quality-issues.md` (8 severity-tagged
   items: spacing drift, stray variable, 195 duplicate paint styles, duplicate component sets, orphaned
   purple ramp, elevation-color inversion, radius-full value mismatch, informal maturity-order note). New
   `reports/` folder added to the memory map — external-facing deliverables, distinct from internal
   `context/`/`decisions/`.
3. **GitHub visibility → made public** (`gh repo edit --visibility public`).
4. **Per-faculty theming → confirmed** in `context/design.md`, using the shipped code's
   `--custom-secondary-*` override pattern as evidence.
5. **Accordion/Modal Testing-page follow-up → deferred**, per explicit user decision; no action taken.

**New finding while building the canonical schema (not previously known):** main system and USS One's
dark-mode "elevation replacement" colors are inverted (`Elevation 1`/`Elevation 2` map to the same two hex
values but in opposite pairing between the two files). Flagged in both `context/canonical-tokens.md` and
`reports/figma-data-quality-issues.md` item 5 — not resolved, needs a design-team call.

**3 new open questions surfaced** (in `context/canonical-tokens.md`'s "Open follow-ups"), then resolved
2 of 3 in the same session (`decisions/011` addenda):
- **Radius-Full canonical value → decided: `9999px`** (the published code's value, not Extension Library's
  Figma `Radius-1000` = 1000px). Precedent set: code wins over Figma when the two conflict, since code is
  what's actually shipped.
- **Orphaned purple `Terciary` ramp → decided: keep it.** Formalized as `Themes/Amatista` (new top-level
  `Themes/` group), with its duplicate-step bug fixed (step 100 → `#2f1d3c`).
- **Elevation-color pairing (main system vs. USS One, inverted) → explicitly deferred** by the user, not
  just left unaddressed — `state/current.md` records which pairing looks more conventional as a
  tie-breaker hint for whoever picks this up later.

Also still open: whether the data-quality report should actually be sent anywhere yet.

**Follow-up (same session):** repurposing `Terciary` for `Themes/Amatista` left the Facultad blue-gray
values with no formal backing ramp in Extension Library (hardcoded only, unlike USS One's real `_Base/
Secondary` ramp). Decision: keep the values unchanged, log creating that ramp as a **pending task** —
tracked in both the `uss-extension-library-inventory` canvas (new callout) and
`reports/figma-data-quality-issues.md` (new item 9). `decisions/011` addendum 3.

**Files touched:** `decisions/011` (+ 3 addenda), `context/canonical-tokens.md` (new), `context/design.md`,
`context/decisiones.md`, `reports/figma-data-quality-issues.md` (new, 9 items), `AGENTS.md` (memory map +
skill routing), `state/current.md`, `uss-extension-library-inventory.canvas.tsx` (Amatista rename + pending
task callout).
