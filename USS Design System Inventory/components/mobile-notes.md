# Componentes Mobile — Notes

Source: https://www.figma.com/design/uH4MBdFSPYvfxwXcrdFic9/USS---Componentes-Mobile

## Accessible page

Only "👋🏼 Comenzar" (index) is returned by the document's page list under this account's current
permissions.

The Comenzar page is a scrolling index of ~30 `Card M` link-cards grouped under implicit sections ending in
dividers labeled `Patterns` and `Templates` — the same structure as the Desktop file's own landing page, just
organized for viewports up to 575px wide ("Componentes Mobile — Para pantallas hasta 575px de ancho").

## Access limitation

Unlike the Desktop file, this account's view of the Mobile file's page index returns only the Comenzar page —
the per-component pages it links out to (mobile Buttons, Cards, Tags, Badges, etc.) are not enumerated by the
document's page list here. To get the full mobile component/variant inventory, re-run this extraction with an
account that has at least viewer access to those individual pages, or ask a file editor to share direct
`node-id` links to each mobile component page.

## Shared token confirmation

Variable sampling on the Comenzar frame confirms it resolves the same token set as Desktop and Foundations:

- `Color Tokens/Text interactive/Default`
- `Desktop/Títulos/Título 1` (typography tokens are shared/named the same regardless of which file consumes them)
- `Light mode/Botones/Terciario - default`
- `Neutral/Neutral 100`, `Neutral/Neutral 10 (blanco)`
- `Light mode/Border/Subtle`, `Light mode/Background/Background 2`

This confirms the mobile component set is built on the identical design-token foundation as Desktop and
Foundations — only page-level access differs for this account.
