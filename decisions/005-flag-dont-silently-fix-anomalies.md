# 005 — Flag data-quality anomalies, never silently fix or drop them

**Date:** 2026-08-27 (retroactive — decided during the Extension Library extraction)

**Context:** Extraction surfaced real anomalies in the source Figma files: a spacing token whose name
implies 216px but resolves to 220px; a `Boolean`-type variable stored in the Radius collection; 195 exact
duplicate paint styles; duplicate component sets with identical names (`Button icon 📱`, `Card Persona S
horizontal`); an accent color ramp renamed to `Terciary` with unrelated hex values.

**Decision:** Every anomaly found is recorded with an explicit `note` field (in JSON) or a `Callout`/flag
(in canvas and Markdown), never silently corrected, normalized away, or omitted for tidiness.

**Rationale:** This repo's job is to audit what actually exists in the Figma files, not to be a "fixed"
source of truth. Whether/how to fix the underlying Figma files is a decision for their owners, informed by
these flags.

**Consequence:** Expect visible "drift"/"anomaly"/"duplicate" notes throughout the inventories — this is
signal, not noise. Don't clean these up without being asked.
