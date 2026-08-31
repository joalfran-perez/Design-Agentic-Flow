# Kit Digital USS — Resumen de cambios v0 → v2 (para ticket de Jira)

**Preparado:** 2026-08-31 · **Audiencia:** equipo de desarrollo de ModUSS Planner (consumidor externo de
este repo de auditoría). **Propósito:** documento listo para pegar en un ticket de Jira, explicando qué
cambió entre la versión original de la norma visual usada para el vibe-coding inicial
(`kit-digital.md`, fuera del alcance de este repo) y la versión final revisada
(`deliverables/kitdigital-v2.md`), tras auditar el código fuente y compilado real de
`@ussebastian/kitdigital` en vez de asumir su comportamiento.

Full trazabilidad de cada hallazgo: `decisions/014` a `017`, `logs/011` a `014`,
`context/code-design-mapping.md`.

---

## Contexto

La versión original de esta regla (`kit-digital.md`) se basaba en supuestos razonables pero no verificados
contra el código real del Kit. Se hizo una auditoría línea por línea del SCSS fuente y del **CSS compilado
real** (`dist/css/main.css`) de `@ussebastian/kitdigital`, lo que reveló que varias reglas originales **no
se cumplen en producción tal como estaban escritas** — no por error de implementación, sino porque el Kit
funciona distinto a lo asumido. La v2 corrige eso y además declara explícitamente varias escalas que antes
no existían en ningún documento.

## Tabla resumen

| Área | v0 (original) | v2 (revisada) | Acción requerida |
|---|---|---|---|
| Íconos | `text-[Npx]` para tamaño | **Bug encontrado:** el Kit fuerza `font-size:1.5rem !important` en `.uss-icon` — un tamaño arbitrario de Tailwind nunca lo vence. Nueva escala de tamaños nativa (`uss-icon--xs/sm/lg/xl` + `icon-size-*` de Bootstrap hasta 64px) | Revisar todo uso de `text-[Npx]` sobre íconos; reemplazar por el modificador nativo correspondiente |
| Espaciado y grid | "Tailwind para layout y espaciado" (sin más detalle) | Sección nueva: el Kit **es Bootstrap 5 real** con su propia escala de espaciado/ancho/alto (`!important`), grid de 12 columnas, y nombres de utilidad de flex distintos a los de Tailwind (`.align-items-center` no `.items-center`) | Desactivar `padding`/`margin`/`gap`/`width`/`height` en `corePlugins` de `tailwind.config.js`; auditar código que use nombres de flex "estilo Tailwind" para alineación/wrap |
| Color | Bridge simple vía `tailwind.config.ts` (ejemplos sueltos) | Declarada la escala completa: 7 rampas base × 10 pasos + ~60 tokens semánticos por modo (light/dark). Documentadas 2 "trampas" de nombres invertidos (`--background` = tarjeta, no página) | Reemplazar `theme.colors` (no extender) en `tailwind.config.js` para eliminar la paleta de stock de Tailwind como riesgo de colisión |
| Tipografía | 2 líneas: familia únicamente (`font-serif`/`font-sans`), tamaño/peso quedaban en manos de Tailwind | Escala completa declarada (17 tamaños, 8 pesos) + tabla de cada clase semántica (h1-h6, display, intro, body, blockquote...) con valores móvil/escritorio exactos | Desactivar `fontSize`/`fontWeight`/`fontFamily`/`lineHeight`/`letterSpacing` en `corePlugins`; ver bug de cascada abajo |
| Geometría de componentes | No existía | Sección nueva con 6 ajustes puntuales necesarios (Modal, formularios, tablas hechas con `<div>`, tabs, overflow) | Verificar que el adaptador CSS del proyecto cubra estos 6 puntos |
| Orden de carga del CSS | No especificado | Orden explícito documentado, con la razón técnica (ver bug de cascada) | Confirmar que el import order del proyecto coincide |
| Checklist de PR | No existía | 8 puntos de verificación antes de cerrar una tarea de UI | Adoptar como checklist de revisión de PR |

## Hallazgos técnicos concretos (no solo estilo, son bugs reales)

1. **Bug de tamaño de ícono:** la regla original (`text-[Npx]`) nunca funciona sobre `.uss-icon` porque el
   Kit ya fuerza el tamaño con `!important`. Cualquier ícono en producción con un tamaño "personalizado" vía
   Tailwind probablemente esté mostrando 24px (el tamaño por defecto del Kit) en vez del tamaño intentado.
2. **Bug de cascada en tipografía (el más importante a nivel de riesgo):** las reglas de tipografía del Kit
   **no llevan `!important`**. Si `@tailwind base` (Preflight) se carga después del CSS del Kit — como
   especifica el orden de este proyecto — y un `<h1>`/`<p>`/`<blockquote>` se usa **sin su clase explícita**
   (`uss-h1`, `p`, `blockquote`), Preflight resetea silenciosamente el tamaño/peso de fuente.
   **Recomendación: auditar el código existente buscando etiquetas de encabezado sin su clase del Kit — es
   un defecto visual invisible hasta que se revisa el CSS calculado en el navegador.**
3. **Utilidades de Tailwind que nunca existen en el Kit:** `bg-*`/`text-*`/`border-*`/`rounded-*`/
   `opacity-*` de Bootstrap fueron removidas deliberadamente del CSS compilado del Kit. Si el código del
   proyecto usa alguna, no rompe nada visualmente pero tampoco hace nada — cae en silencio al valor por
   omisión del navegador.
4. **Ancho/alto es porcentaje, no píxeles**, en las utilidades nativas del Kit (`.w-10` = 10% de ancho, no
   40px como en Tailwind) — cualquier `w-*`/`h-*` que dependa hoy de la escala de Tailwind necesita
   revisión si se adopta la utilidad nativa.
5. **Dos desvíos de diseño detectados (no bugs de código, sino gaps con Figma):** el peso de `.uss-h4` en
   escritorio y el tamaño de `.uss-display` en escritorio no coinciden con la especificación de Figma
   vigente — reportados aparte para que el equipo de diseño decida si Figma debe actualizarse (el código
   tiene un comentario fuente `// antes era 60` que sugiere que sí).

## Próximo paso sugerido para el equipo

Revisar `tailwind.config.js` del proyecto contra los dos bloques de configuración documentados en la v2
(`corePlugins` para espaciado/tipografía + reemplazo de `theme.colors`), y correr una pasada de auditoría
visual sobre encabezados/íconos existentes para detectar los dos bugs de cascada/tamaño ya mencionados.
