# 011 — Begin token reconciliation: propose a canonical schema

**Date:** 2026-08-28

**Context:** `context/design.md`'s long-standing open question asked whether the main system and its two
local libraries (`decisions/010`) should be reconciled into one canonical token set. The user decided
(2026-08-28): **yes, start reconciliation work.**

**Decision:** Add a new artifact, `context/canonical-tokens.md`, that proposes one unified target schema
(spacing, radius, color, typography, effects) derived from the three already-captured inventories — no new
Figma reads needed, this is a synthesis of data already on disk.

**Scope boundary (important):** This repo does not edit the source Figma files (identity: documentation/
data repo, no app code, per `AGENTS.md` §1) and has no design-team authority to merge USS One/Extension
Library into the main system. `context/canonical-tokens.md` is therefore a **proposal/target reference**,
not a migration already performed — implementing it back into Figma is a separate initiative for whoever
owns those files. `decisions/004`'s rule (don't normalize each system's captured `tokens/*.json`, document
as-is) still holds: the per-system files are untouched; canonicalization lives only in the new artifact.

**Method:** For each token category, canonical = the value/name shared by all systems where they agree
(true for the vast majority — same brand hex, same spacing/font-size scale). Where systems diverge,
canonical picks the most complete/most-used variant and explicitly flags the others as either (a) a
legitimate local-library extension worth adopting (e.g. Extension Library's `Radius-1000` pill token,
already shipped in code as `--border-radius-full`) or (b) a data-quality bug that shouldn't be canonicalized
at all (e.g. Extension Library's `spacing-216` = 220px drift, stray `Boolean` variable in its Radius
collection, duplicate paint styles). Bugs feed directly into the Q2 report (`reports/figma-data-quality-issues.md`).

**New finding surfaced while building this (not previously documented):** the dark-mode "elevation
replacement" color tokens are inverted between the main system and USS One — main system maps
`Elevation 1 → #242f3c` / `Elevation 2 → #202a37`, while USS One maps `☾ Elevation 1 → #202a37` /
`☾ Elevation 2 → #242f3c` (opposite pairing, same two hex values). Flagged in `context/canonical-tokens.md`
and the data-quality report; not silently "fixed" per `decisions/005`.

**Consequence:** `context/canonical-tokens.md` becomes the reference for "what should X be, going forward"
questions; `context/design.md` remains the reference for "what does each system actually have today."

---

**Addendum (2026-08-28, same day):** first concrete reconciliation call made — the Radius "full/pill" value
disagreement (Extension Library's Figma token `Radius-1000` = 1000px vs. the shipped code's
`--border-radius-full: 9999px`). User decision: **the published code is canonical, 9999px.** Precedent set
for future code-vs-Figma conflicts in this reconciliation effort: prefer whatever is actually shipped/
running over what's drawn in Figma, since Figma is easier to correct after the fact than production code.
Updated `context/canonical-tokens.md` (Radius section) and `reports/figma-data-quality-issues.md` (item 6)
accordingly.

**Addendum 2 (2026-08-28, same day):** second call made — Extension Library's orphaned purple `_Base/
Terciary` ramp. User decision: **keep it, don't delete it** — formalize as a real third accent, not a
Facultad-system alias. Concretely: move it out of `_Base/` into a new top-level group `Themes/`, rename to
`Themes/Amatista`, and fix its duplicate-step bug (step 100 changes from the duplicate `#402851` to
`#2f1d3c`; step 90 unchanged). This introduces `Themes/` as a new canonical group for accent ramps that
aren't the shared brand palette or the Facultad system — currently Extension-Library-only, no
corresponding gap in USS main or USS One since this is a net-new theme, not a ported one. Updated
`context/canonical-tokens.md` and `reports/figma-data-quality-issues.md` (item 4) accordingly.

Only 1 open follow-up remains undecided: the elevation-color pairing (main system vs. USS One) — explicitly
deferred by the user, see `state/current.md`.

**Addendum 3 (2026-08-28, same day):** follow-up to Addendum 2 — freeing the `Terciary` slot for `Themes/
Amatista` left Extension Library's Facultad blue-gray values with no formal backing ramp (they're
hardcoded directly on the accent tokens, unlike USS One's `_Base/Secondary`). User decision: **keep the
Facultad values exactly as they are** (no value change, no move to `Themes/`) but log creating a proper
`_Base/Secondary` ramp — matching USS One's values — as a **pending task**, tracked in two places: the
`uss-extension-library-inventory` canvas (visual documentation) and `reports/figma-data-quality-issues.md`
item 9 (report to the library designers). Updated `context/canonical-tokens.md` accordingly.
