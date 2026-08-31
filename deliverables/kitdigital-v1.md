---
inclusion: always
---

# Norma visual — Kit Digital USS (DDDI-112) — v1 (Tailwind-first, capa adaptadora)

Todo código de UI nuevo o modificado **debe usar el Kit Digital** (`@ussebastian/kitdigital`, distribución
CSS). Nunca se usan emojis en la interfaz.

> **Procedencia:** generado por ModUSS (repo de auditoría del design system USS) el 2026-08-31, sintetizando
> `context/canonical-tokens.md` y `context/code-design-mapping.md` de ese repo más las lecciones ya vividas
> en la integración real (ADR-012 / DDDI-112). Es una **fotografía puntual**, no sincronizada
> automáticamente con el código real de este proyecto. Si algo aquí diverge del código en `develop`,
> repórtalo de vuelta a ModUSS en vez de asumir que uno de los dos está "mal" — puede ser una decisión de
> diseño nueva que ModUSS todavía no capturó.
>
> **Variante:** esta es la v1 — Tailwind controla layout y espaciado, con una capa adaptadora
> (`kit-adapter.css`) que restaura la escala de Tailwind donde colisiona con las utilidades nativas del Kit.
> Para una variante que usa las utilidades **nativas** del Kit (Bootstrap real) para espaciado y grid en vez
> de pelear contra ellas, ver `deliverables/kitdigital-v2.md` (`decisions/015`).

## La regla de fondo: dos autoridades separadas

La maqueta funcional es la **fuente de verdad funcional** — manda en qué hace cada pantalla. **No es la
referencia visual.** La identidad visual la manda el **Kit Digital**. Si la maqueta usa un emoji para
representar un concepto (📎, 🎯, ⬇, ✅...), se sustituye por el ícono Remix equivalente (ver mapeo abajo) o
por texto plano — nunca se preserva el emoji, aunque la maqueta lo muestre.

## Íconos

- **Remix Icons** exclusivamente. `lucide-react` no se importa.
- Convención de 3 partes: `<i className="uss-icon uss-icon--{tamaño} ri-{nombre}-line" aria-hidden="true" />`.
  El `aria-hidden="true"` es obligatorio: el ícono es decorativo, el significado va en el texto adyacente.
- **No usar `text-[Npx]` para el tamaño.** El Kit fuerza `font-size: 1.5rem` en `.uss-icon` con
  `!important`; un tamaño arbitrario de Tailwind no lo vence. Usar siempre un modificador de tamaño
  dedicado:

  | Modificador | Tamaño | Origen |
  |---|---|---|
  | `uss-icon--xs` | 16 px | Kit |
  | `uss-icon--sm` | 20 px | Kit |
  | (sin modificador) | 24 px | Kit (por omisión) |
  | `uss-icon--lg` | 28 px | Kit |
  | `uss-icon--xl` | 32 px | Kit |
  | `uss-icon--14` / `--22` / `--30` / `--48` | 14 / 22 / 30 / 48 px | **Adaptador del proyecto** — si se
  necesita un paso intermedio nuevo que el Kit no trae, agregarlo aquí con su propio `!important`, nunca con
  `text-[Npx]` |
- Color: transferir al `<i>` la clase Tailwind de color correspondiente (ver bridge de color abajo).
- Animación: `animate-spin` para loaders (`ri-loader-4-line`).

### Mapeo de conceptos frecuentes

| Concepto | Remix Icon | Emoji que sustituye |
|---|---|---|
| Cerrar | `ri-close-line` | ✕ |
| Alerta | `ri-alert-line` | ⚠ |
| Error | `ri-error-warning-line` | — |
| Información | `ri-information-line` | ℹ |
| Descargar | `ri-download-line` | ⬇ |
| Subir | `ri-upload-line` | ⬆ |
| Chevron abajo | `ri-arrow-down-s-line` | ▾ |
| Check | `ri-check-line` | ✅ |
| Agregar | `ri-add-line` | ➕ |
| Editar | `ri-pencil-line` | ✏ |
| Eliminar | `ri-delete-bin-line` | 🗑 |
| Buscar | `ri-search-line` | 🔍 |
| Cargando | `ri-loader-4-line` (+ `animate-spin`) | — |
| Adjunto / clip | `ri-attachment-line` | 📎 |
| Filtro / editar indicadores | `ri-equalizer-line` | 📊 |
| Metas propias | `ri-focus-3-line` | 🎯 |
| No encontrado | `ri-file-unknow-line` | — |

Si aparece un concepto nuevo sin mapeo aquí: buscar primero un ícono Remix semánticamente equivalente antes
de recurrir a texto plano; nunca dejar el emoji de la maqueta.

## Colores — bridge de tokens

Los nombres de clase del proyecto **no cambian**; se resuelven vía `var(--token-del-kit, #hexFallback)`. El
fallback es el valor exacto capturado en Figma (modo Light) para el sistema principal USS — confirmado
byte-a-byte, sin drift, contra `USS Design System Inventory/tokens/colors.json`.

| Clase del proyecto | Token del Kit | Fallback | Origen (Figma, modo Light) |
|---|---|---|---|
| `paper` (fondo de página) | `--background-2` | `#F6F7F7` | Background 2 |
| `surface` (fondo de tarjeta) | `--background` | `#FFFFFF` | Background 1 |
| `line` | `--border-subtle` | `#D4D6D9` | Border · Subtle |
| `line2` | `--neutral-30` | `#DFE0E3` | Neutral 30 |
| `navy` | `--primary-100` | `#001370` | Primary 100 |
| `navy.head` | `--primary-90` | `#001894` | Primary 90 |
| `brand` | `--text-interactive` | `#001894` | Text interactive · Default |
| `ink` | `--text-strong` | `#0B141F` | Text · Strong |
| `ink.600` | `--neutral-80` | — | Neutral 80 |
| `ink.500` | `--text-subtle` | — | Text · Subtle |
| `ink.400` | `--neutral-60` | — | Neutral 60 |
| `ink.300` | **sin token del Kit** | fijo | Sin equivalente — mantener hex fijo, no forzar un token |
| `ok` | `--text-success` | `#007350` | Feedback · Text success |
| `warn` | `--text-warning` | `#836100` | Feedback · Text warning |
| `err` | `--text-error` | `#9D0000` | Feedback · Text error |

**Dos trampas del mapeo — no "corregirlas", son así por diseño del Kit:**
- `--background` es el fondo de **tarjeta** (blanco), no el de página. El fondo de página es
  `--background-2`. Está invertido respecto a lo que sugiere el nombre.
- `--surface-default` **no** sirve como fondo de tarjeta: es una superficie **interactiva** (lavanda). No
  usarla donde se necesite `surface`.

**Excepciones con hex fijo, sin equivalente en el Kit por diseño** — no intentar mapearlas a un token:
`gold` (acento de actividad propia / compartir) y los colores `ind.*` por indicador del proyecto. Si se
necesita un color nuevo que no sea uno de estos casos ya conocidos, resolverlo por token del Kit primero;
solo cae a hex fijo si genuinamente no hay equivalente semántico.

## Tipografía

- Encabezados: Montserrat (600–700) → `font-serif` de Tailwind.
- Cuerpo: Karla (400–500) → `font-sans` de Tailwind.

## Regla de coexistencia Tailwind ↔ Kit

- **Tailwind** para layout y espaciado: `flex`, `grid`, `gap-*`, `p-*`, `m-*`, `w-*`, `h-*`.
- **Kit Digital** para identidad visual: color, tipografía, bordes de componente.
- Al crear un componente nuevo: clases del Kit para lo visual + Tailwind para el layout.

**Causa raíz #1 de bugs de espaciado — colisión de nombres Bootstrap ↔ Tailwind.** El Kit define sus
propias utilidades de espaciado (`.p-4`, `.px-8`, `.mt-16`, `.gap-24`, `.w-10`, `.h-10`...) con `!important`
y en **escala de píxeles**. Esos mismos nombres son válidos en Tailwind, con **escala de `0.25rem`**. Sin
pasar por la capa adaptadora del proyecto, cualquier `px-4`/`mt-16`/`gap-24` se congela silenciosamente al
valor del Kit — sin error, sin warning. Si un espaciado no responde a la clase Tailwind escrita, esta es la
primera causa a revisar.

## Capa adaptadora (`kit-adapter.css`) — checklist de cuándo se necesita una regla nueva

El CSS del Kit está pensado para páginas institucionales anchas. Un dashboard denso necesita ajustes de
**geometría únicamente** (nunca de color ni tipografía — ahí el Kit siempre manda) en estos puntos ya
conocidos; si un componente nuevo cae en uno de estos patrones, extender el adaptador en vez de pelear con
el Kit componente por componente:

1. **Espaciado** — restaurar la escala Tailwind (ver causa raíz #1 arriba) para toda la escala usada + `w-10`/`h-10`, con `!important` propio.
2. **Escalones de ícono** — los tamaños `--14/22/30/48` que el Kit no trae (ver tabla de íconos arriba).
3. **Geometría de componentes**, según se necesite:
   - Modal (`.uss-modal__body`): el Kit lo dispone en fila; forzar columna con padding de dashboard salvo
     que el componente pida layout en fila con ícono de estado (variante `--with-icon`).
   - Formularios (`.uss-form__input`): el Kit usa padding de 1rem, `min-width` 250px y esquinas rectas;
     ajustar a un formulario denso con esquinas redondeadas; corregir checkboxes/radios (el Kit los trata
     como inputs de texto).
   - Tablas hechas con `<div>` (`div.uss-table`): el modo responsive del Kit (`display:block`,
     `max-width:fit-content`, `white-space:nowrap` bajo 1010px) solo tiene sentido para un `<table>` real —
     anularlo para el caso `div`.
   - Striping de tablas `<div>`: la fila de cabecera participa del conteo `:nth-child` (en un `<table>` real
     el `<thead>` queda fuera) — corregir empezando el rayado en la primera fila de datos.
   - Tabs (`.uss-tabs__tablist`/`.uss-tabs__tab`): la altura fija de 68px del Kit recorta contenido en una
     navegación secundaria — reducir el padding vertical.
   - `html, body`: `overflow-x: hidden` — ningún ancho de viewport debe producir scroll horizontal de
     página; cuando se necesite scroll horizontal real (tablas anchas), encapsularlo en un contenedor propio
     (`.table-scroll`).

## Orden de carga del CSS

El orden **importa** y no debe alterarse:

```css
@import '@ussebastian/kitdigital/dist/css/main.css';   /* 1. Kit */
@import './kit-adapter.css';                            /* 2. Adaptador */

@tailwind base;                                         /* 3. Tailwind */
@tailwind components;
@tailwind utilities;
```

El adaptador se importa **después** del Kit y **antes** de Tailwind: a igual especificidad gana por orden de
cascada, sin necesitar `!important` — salvo en los puntos donde el propio Kit ya usa `!important`, donde hay
que igualarlo para vencerlo. El anillo de foco visible (`:focus-visible`) del bloque `@layer base` es un
requisito de accesibilidad: no se elimina.

## Componentes CSS del Kit

| Familia | Clases |
|---|---|
| Botones | `.uss-btn--primary`, `.uss-btn--secondary`, `.uss-btn--tertiary`, `.uss-btn--icon` |
| Formularios | `.uss-form__input`, `.uss-form__label`, `.uss-form__input--error`, `.uss-form__input--disabled` |
| Tablas | `.uss-table`, `.uss-table--stripes`, `.uss-table__row`, `.uss-table__cell` |
| Modales | `.uss-modal`, `.uss-modal__body`, `.uss-modal__footer` |
| Pestañas | `.uss-tabs__tablist`, `.uss-tabs__tab`, `.active` |
| Badges | `.uss-badge--success`, `.uss-badge--warning`, `.uss-badge--error`, `.uss-badge--neutral` |
| Tags | `.uss-tag--primary`, `.uss-tag--secondary` |

## Checklist antes de dar por terminada una tarea de UI

1. **Sin emojis en JSX renderizado** — buscar emojis en el código de interfaz; si aparece uno fuera de
   comentarios/tests, es un defecto.
2. **Sin `lucide-react`** — ninguna importación, no debe estar en las dependencias.
3. **Íconos con `aria-hidden="true"`** y significado en el texto adyacente.
4. **Espaciado con Tailwind**, nunca con las utilidades de espaciado del Kit directamente.
5. **Colores por token**, no hexadecimales nuevos — salvo las excepciones ya documentadas (`gold`, `ind.*`).
6. El gate automatizado del proyecto cubre lint y tipos, **no** el cumplimiento visual — eso se verifica
   leyendo el diff y comparando contra este archivo.
