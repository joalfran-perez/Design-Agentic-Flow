# Índice de Decisiones (ES)

Resumen rápido en español. El razonamiento completo de cada una vive en `decisions/NNN-*.md` (inglés).
No dupliques contenido aquí — solo referencia.

| # | Decisión | Por qué (1 línea) | Archivo |
|---|---|---|---|
| 001 | Compresión adaptativa obligatoria en lecturas grandes de Figma | `use_figma` trunca ~20KB; sistemas tienen 150–575+ items | `decisions/001-adaptive-compression.md` |
| 002 | Estructura fija de carpeta por inventario (`README.md` + `tokens/` + `components/`) | Permite comparar sistemas mecánicamente vía `context/design.md` | `decisions/002-inventory-folder-structure.md` |
| 003 | Un canvas por conjunto de archivos Figma, nunca duplicar | Regla del skill de canvas: 1 archivo, sin fetch, autocontenido | `decisions/003-one-canvas-per-file-set.md` |
| 004 | No normalizar la arquitectura de color entre sistemas — documentar tal cual | Cada sistema entrega color distinto (variables vs. estilos); normalizar ocultaría el hallazgo real | `decisions/004-preserve-per-file-color-architecture.md` |
| 005 | Anomalías se marcan (`note`), nunca se corrigen silenciosamente | Este repo audita Figma, no lo corrige | `decisions/005-flag-dont-silently-fix-anomalies.md` |
| 006 | Automatizar el Definition of Done: script + hook `stop` | Evitar que la estructura se rompa sin que nadie lo note | `decisions/006-automate-dod-validation.md` |
| 007 | Archivar `logs/` cuando supere 15 entradas (manual, sin hook) | Mantener `logs/` corto y barato de leer | `decisions/007-logs-archival-policy.md` |
| 008 | Renombrar `USS Design system Inventory` → `...System Inventory` | Consistencia de casing con los otros 2 sistemas | `decisions/008-rename-original-folder-casing.md` |

## Cómo añadir una decisión nueva
1. Crear `decisions/NNN-slug-en-ingles.md` con: fecha, contexto, decisión, consecuencia.
2. Añadir una fila a la tabla de arriba.
3. Si afecta a `context/design.md`, actualizar la tabla correspondiente ahí también.
