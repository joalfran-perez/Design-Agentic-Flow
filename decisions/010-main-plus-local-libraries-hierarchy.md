# 010 — Model USS One / Extension Library as local libraries connected to the main USS system

**Date:** 2026-08-28

**Context:** Until now, this repo treated the three Figma file-sets as "three parallel/independent systems"
(`AGENTS.md` §1, `context/design.md`) — a flat, sibling-branch model. The user asked for an explicit
architectural redefinition: `USS Design System Inventory/` (the original system) is the **main / core**
design system, and `USS One Design System Inventory/` and `USS Extension Library Design System Inventory/`
are **local libraries connected to it**, not independent peers.

**Decision:** Adopt a hub-and-spoke hierarchy for how this repo *describes and organizes* the three systems:

- **Main / core:** `USS Design System Inventory/` — the canonical reference point.
- **Local library:** `USS One Design System Inventory/` — connected to / extends the main system.
- **Local library:** `USS Extension Library Design System Inventory/` — connected to / extends the main
  system.

This is an **organizational/reference model**, not a factual claim that USS One's or Extension Library's
Figma files literally import shared library assets from the main USS Figma files today — they each still
have their own separate Foundations file and (per `decisions/004`) genuinely different token-delivery
architectures. What changes is how this repo *frames the relationship* in prose/tables (hub + extensions,
not three flat siblings), consistent with the real-world evidence already on record: shared page IDs across
all 9 files, identical brand hex values, and — per `context/code-design-mapping.md` — the Extension Library
explicitly describing itself as "a lighter-weight Extension Library that layers on top of a
consumed/published core library rather than owning canonical tokens."

**Consequence:** Updated in this pass to use "main / core system" + "local library" language consistently:
`AGENTS.md` §1 (identity table), `context/design.md` (full reframe: sources table, token/component tables,
open-question section), `context/decisiones.md` (index row), `state/inventories.md` (role column),
`state/current.md` (bootstrap pointer wording), and all three inventories' `README.md` files (each now
states its role and links to the others). `decisions/004`'s finding (each file's color architecture stays
genuinely different, don't normalize) still holds — the hierarchy changes *framing*, not the underlying
per-file data captured in each `tokens/*.json`.

**Open follow-up:** does "connected to" ever need to become a literal technical link (e.g. a shared Figma
library file both USS One and Extension Library actually consume)? Not established by any Figma evidence
so far — flag to the user before asserting that in any inventory file.
