# 003 — One canvas per Figma file-set

**Date:** 2026-08-27 (retroactive)

**Context:** The Cursor canvas skill mandates exactly one self-contained `.canvas.tsx` file per artifact
(no relative imports, no fetch, embed data inline). Three systems were extracted, each large enough to
deserve its own interactive view.

**Decision:** One canvas per system, named to match its inventory folder in kebab-case
(`uss-design-system-inventory`, `uss-one-design-system-inventory`, `uss-extension-library-inventory`),
stored in the fixed Cursor-managed canvases directory. Never create a second canvas for an already-covered
system — edit the existing file instead.

**Consequence:** 3 canvases exist today, 1:1 with the 3 inventory folders. Any future 4th system gets a
4th canvas following the same naming pattern.
