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
| 009 | Fijar `@ussebastian/kitdigital-react` como dependencia de referencia local | Permite auditorías código↔diseño reproducibles sin volver a escanear `node_modules` | `decisions/009-pin-code-library-reference.md` |
| 010 | Modelar USS One y Extension Library como librerías locales conectadas al sistema principal (USS original) | Jerarquía hub + extensiones en vez de 3 sistemas paralelos independientes; no cambia los datos por archivo, solo el framing | `decisions/010-main-plus-local-libraries-hierarchy.md` |
| 011 | Iniciar reconciliación de tokens: proponer un esquema canónico | El usuario decidió reconciliar en vez de mantener divergencia; se documenta como propuesta/objetivo, no se edita Figma ni los `tokens/*.json` por sistema | `decisions/011-begin-token-reconciliation.md` |
| 012 | Alcance del plan de consolidación: armonizar (no fusionar) las 2 librerías locales, objetivo = Variables de Figma, migración por fases | El sistema core queda de solo lectura de forma permanente; ambas librerías locales tienen consumidores reales desconocidos para este repo | `decisions/012-local-library-consolidation-scope.md` |
| 013 | Tratar "ModUSS Planner" como primer consumidor real confirmado del sistema principal | Doc externo compartido por el usuario; cruce de hex 100% coincidente contra `colors.json`, corrobora `decisions/009` con un segundo consumidor | `decisions/013-real-downstream-consumer-moduss-planner.md` |
| 014 | Primer entregable *autoría* (no solo auditoría) para un consumidor externo: `deliverables/kitdigital.md` | Carpeta nueva `deliverables/`, distinta de `reports/`; síntesis de reglas ya evidenciadas, no invención | `decisions/014-author-external-skill-deliverable.md` |
| 015 | Alternativa Bootstrap-nativo del entregable anterior: `deliverables/kitdigital-v2.md` | Inspección del SCSS fuente + verificación contra el CSS compilado de `@ussebastian/kitdigital` reveló arquitectura nativa (Bootstrap real, utilidades removidas, doble sistema de íconos) nunca documentada; archivo original renombrado a `-v1.md` para versionado explícito | `decisions/015-bootstrap-native-kitdigital-v2.md` |
| 016 | Tipografía de `kitdigital-v2.md` consolidada 100% sobre el CSS nativo del Kit (revierte el alcance de `015`, que la dejaba en Tailwind) | El Kit tiene sistema tipográfico completo sin drift de escala vs. Figma, sin API JS/React; hallazgo nuevo de riesgo de cascada (Preflight de Tailwind vs. reglas sin `!important`) | `decisions/016-typography-native-consolidation.md` |
| 017 | Color de `kitdigital-v2.md` consolidado sobre las variables nativas del Kit (7 rampas + ~60 semánticos por modo) | Sin API JS/tema (toggle de clase DOM, igual patrón que tipografía); fix distinto al de espaciado/tipografía — reemplazar `theme.colors` de Tailwind, no desactivar el plugin `colors` completo | `decisions/017-color-native-consolidation.md` |
| 018 | Registrar el análisis de la sesión de revisión de UI de ModUSS Planner (llamada 2026-08-27) y la brecha de componentes Desktop que dejó al descubierto | Primera observación directa de la interfaz de un consumidor real; 11 de los 12 patrones que la app necesita no tienen especificación en ningún archivo Desktop capturado (solo en los Mobile de las librerías locales) — primera brecha a nivel de **componente**, no de token, atribuible a un consumidor con nombre; reabre la pregunta abierta 5 de `state/current.md` | `decisions/018-planner-ui-review-desktop-component-gap.md` |
| 019 | Definir el alcance permanente de `kitdigital-v1.md` (Tailwind, entornos existentes como ModUSS Planner) vs. `-v2.md` (Bootstrap nativo, sin excepciones); portar color/tipografía de v2 a v1 con flexibilidad solo en tipografía | Color no tiene margen de flexibilidad (mismo riesgo de paleta de stock de Tailwind sin importar el espaciado); tipografía sí — v1 no exige desactivar los core plugins de texto de Tailwind, solo prohíbe reconstruir con ellos lo que el Kit ya cubre | `decisions/019-two-tier-deliverable-scope.md` |

## Cómo añadir una decisión nueva
1. Crear `decisions/NNN-slug-en-ingles.md` con: fecha, contexto, decisión, consecuencia.
2. Añadir una fila a la tabla de arriba.
3. Si afecta a `context/design.md`, actualizar la tabla correspondiente ahí también.
