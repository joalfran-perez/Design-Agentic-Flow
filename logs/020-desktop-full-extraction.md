# 020 — All three Desktop files extracted; 6-page catalog was a channel artifact

**Date:** 2026-09-25

**What happened:** User flagged `context/code-design-mapping.md`'s "Desktop is 6 pages" claim against
known Figma parity. Confirm-only re-read via `use_figma` listed 46 / 51 / 46 pages. User then asked
to extract and propagate.

**Numbers:**
- Main Desktop: 32 core of 46 / **106 sets / 920 variants**, no Testing. +Navigation stack, +Sheets vs Mobile.
- USS One Desktop: 28 core of 51 / **88 / 676**. Testing: Accordion, Breadcrumb-Tittle, Buttons, Empty State, Modals, Tags.
- Extension Desktop: 24 core of 46 / **55 / 620**. Testing: Avatar, Accordion, Cards, Header, Carousel, Footer, Page hero, Alert, Table.

Sheets on the main file was the only page that threw read-only; recovered via `get_metadata`.

**Key findings:**
1. Same `get_metadata` under-count as Mobile (`decisions/021`). The "desktop consumer must adapt from Mobile" conclusion is void.
2. 23/26 code components now match the main system on **Desktop and Mobile**. Empty state still the only missing core spec.
3. New data-quality items 15–17 (broken/junk Card ghost, Tag secondary missing `type`).

**Action taken:** three `desktop-components.md` rewrites; READMEs; design.md; code-design-mapping.md;
018 second correction; both Planner reports; data-quality 15–17; gotcha + extraction skill; state;
three canvases; `decisions/022`. Archived `logs/004` first (`logs/` was at 16).

**Open questions:** none new. Empty state still Testing-only / absent from core.
