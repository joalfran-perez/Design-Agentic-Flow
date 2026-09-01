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
> **Alcance definitivo (`decisions/019`, 2026-09-01):** esta es la variante para **entornos de desarrollo
> existentes que ya usan Tailwind**, como ModUSS Planner — Tailwind controla layout y espaciado, con una
> capa adaptadora (`kit-adapter.css`) que restaura su escala donde colisiona con las utilidades nativas del
> Kit. Para un entorno nuevo, o uno existente que pueda migrar a las utilidades **nativas** del Kit
> (Bootstrap real) sin capa adaptadora, ver `deliverables/kitdigital-v2.md` (`decisions/015`). **Ambas
> variantes se mantienen indefinidamente** — no hay plan de reemplazar una por la otra; la elección depende
> del entorno consumidor, no de cuál es "mejor". Color y tipografía comparten el mismo catálogo auditado que
> v2 (mismas escalas nativas, mismos hallazgos de Figma) — la diferencia real entre ambos archivos es
> espaciado/grid, más el nivel de rigidez con que se exige la clase del Kit en tipografía (ver más abajo).

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
  | `uss-icon--xs` | 16 px | Kit (componente) |
  | `uss-icon--sm` | 20 px | Kit (componente) |
  | (sin modificador) | 24 px | Kit (componente, por omisión) |
  | `uss-icon--lg` | 28 px | Kit (componente) |
  | `uss-icon--xl` | 32 px | Kit (componente) |
  | `icon-size-xxl` | 48 px | **Utilidad Bootstrap nativa del Kit** (confirmado compilado con `!important`)
  — revisar esta antes de crear un modificador propio; ya cubre el paso que el adaptador reinventaba como
  `uss-icon--48`. Escala completa: `icon-size-{xs,s,m,l,xl,xxl,xxxl}` = 16/20/24/28/32/48/64 px |
  | `uss-icon--14` / `--22` / `--30` | 14 / 22 / 30 px | **Adaptador del proyecto** — pasos que ni
  `.uss-icon--*` ni `icon-size-*` cubren; agregarlos aquí con su propio `!important`, nunca con
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

## Colores

**Regla de fondo:** el color se consume de las variables CSS del Kit (o de las clases de componente que ya
las traen incorporadas) — nunca de la paleta por omisión de Tailwind ni de un hex nuevo. Esta regla **no
tiene la flexibilidad que sí tiene tipografía** (ver más abajo): el riesgo de que la paleta de stock de
Tailwind (`blue-500`, `red-600`...) coexista en paralelo con los tokens del Kit es idéntico sin importar si
el espaciado viene de Tailwind o de Bootstrap nativo, así que esta sección se porta sin cambios desde
`deliverables/kitdigital-v2.md` (`decisions/019`).

### Dependencias y método — sin API JS, todo es CSS

- **Cero dependencia adicional**: los tokens de color llegan con el mismo `@import
  '@ussebastian/kitdigital/dist/css/main.css';` que ya se necesita para todo lo demás.
- **No existe una API de color/tema en JS.** Se buscó en todo `@ussebastian/kitdigital-react` (`theme`,
  `dark`, `useTheme`, `ThemeProvider`, `colorScheme`) y no aparece ningún resultado. **El cambio claro/oscuro
  es un simple toggle de clase en el DOM** (`.light`/`.dark` en el elemento raíz) — no un hook ni una función
  del Kit. La única "API imperativa" que existe es `document.documentElement.classList.toggle('dark')` (o
  equivalente).
- **Método declarativo:** `var(--token-del-kit, #hexFallback)` en CSS, o el nombre de color de Tailwind
  mapeado 1:1 a esa misma variable vía `theme.colors` (ver regla no negociable más abajo) — nunca un hex
  nuevo ni un color de la paleta por omisión de Tailwind.
- **"Custom styles" del Kit = sus propias clases de componente**, que ya traen el token correcto por dentro
  (`.uss-btn--primary`, `.uss-badge--success/warning/error/neutral`, `.uss-tag--primary/secondary`,
  `.uss-form__input--error`, ver tabla "Componentes CSS del Kit" más abajo). Si existe una clase de
  componente para el caso, se prefiere sobre reconstruir `bg-[var(--token)]` a mano.

### Bridge de tokens — nombres de proyecto ya usados por ModUSS Planner

Los nombres de clase del proyecto **no cambian**; se resuelven vía `var(--token-del-kit, #hexFallback)`. El
fallback es el valor exacto capturado en Figma (modo Light) para el sistema principal USS — confirmado
byte-a-byte, sin drift, contra `USS Design System Inventory/tokens/colors.json`. Es un subconjunto de la
escala completa de abajo, no la única fuente disponible.

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

### Escala nativa — paletas base (7 rampas × 10 pasos, `_colors.scss`)

Idénticas en hex a las tres auditorías de Figma (`context/design.md`) — sin divergencia. Usar esta tabla
cuando se necesite un color fuera del bridge de arriba, antes de caer a un hex fijo:

| Rampa | 10 | 20 | 30 | 40 | 50 | 60 | 70 | 80 | 90 | 100 |
|---|---|---|---|---|---|---|---|---|---|---|
| `--neutral-*` | `#ffffff` | `#f6f7f7` | `#dfe0e3` | `#d4d6d9` | `#c3c5ca` | `#888e96` | `#58616e` | `#283341` | `#19222e` | `#0b141f` |
| `--primary-*` | `#f4f5fd` | `#e4e8fc` | `#c5cdf9` | `#93a3f7` | `#5e77f8` | `#274afb` | `#0024db` | `#001eb8` | `#001894` | `#001370` |
| `--secondary-*` | `#f3f8f8` | `#d2e4e4` | `#b1d1d2` | `#8ebfbf` | `#5aa5a5` | `#248c8a` | `#1e767c` | `#185f6c` | `#114252` | `#092430` |
| `--info-*` | `#f2f8fc` | `#e1eef8` | `#bedbee` | `#8abfdd` | `#57a3c9` | `#2386b1` | `#0073a0` | `#00628d` | `#004a6e` | `#002b41` |
| `--success-*` | `#f2fdf8` | `#e1f9ee` | `#bef1da` | `#8ae1ba` | `#57cf98` | `#23b974` | `#00a85c` | `#00945a` | `#007350` | `#004438` |
| `--warning-*` | `#fffef2` | `#ffffe1` | `#ffffbe` | `#fff88a` | `#ffeb57` | `#fcd923` | `#f4cb00` | `#c19a00` | `#836100` | `#452c00` |
| `--error-*` | `#fdf4f2` | `#fae4e1` | `#f4c5be` | `#e7978a` | `#d66a57` | `#c23d23` | `#b22000` | `#9d0000` | `#7a0000` | `#450005` |

`--secondary-*` es el punto de override por facultad/tenant (`var(--custom-secondary-NN, <hex-de-arriba>)`)
— sobrescribir `--custom-secondary-10`…`100` es el mecanismo soportado para theming por facultad, no
hardcodear un hex nuevo.

### Escala nativa — capa semántica (light + dark, `_colors.scss`)

No se resuelve a hex aquí a propósito (evitar duplicar ~140 valores) — cada semántico es una referencia a la
rampa base de arriba:

| Categoría | Tokens (light → dark, misma variable, valor distinto) |
|---|---|
| Fondo | `--background` (neutral-10 → neutral-100), `--background-2` (neutral-20 → neutral-90) |
| Superficie | `--surface-ghost-default/hover/active`, `--surface-default/hover/active`, `--surface-strong-default/hover/active`, `--surface-disabled` (8 tokens) |
| Borde | `--border-strong`, `--border`, `--border-subtle`, `--border-interactive`, `--border-interactive-subtle`, `--border-disabled` |
| Texto | `--text-strong`, `--text-subtle`, `--text-inverse`, `--text-disabled` |
| Enlaces | `--link`, `--link-hover`, `--link-visited` |
| Texto interactivo | `--text-interactive(-hover/-active/-disabled/-subtle/-subtle-hover/-subtle-active/-inverse/-inverse-hover/-inverse-active)` (10 tokens) |
| Botones | `--button-primary(-hover/-active)`, `--button-secondary(-hover/-active)` |
| Íconos | `--icon-strong`, `--icon-subtle`, `--icon-decorative`, `--icon-inverse` |
| Foco | `--focus`, `--focus-inverse` |
| Feedback (texto) | `--text-{info,success,warning,error}` y `--text-{info,success,warning,error}-strong` (8 tokens) |
| Feedback (superficie) | `--surface-{info,success,warning,error}` y `--surface-{info,success,warning,error}-strong` (8 tokens) |
| Neutral de superficie | `--surface-neutral`, `--surface-neutral-inverse` |
| Elevación | `--elevation-1`, `--elevation-2` (transparente en light; `neutral-82`/`neutral-85` en dark) |

**No usar utilidades Bootstrap de color/borde/radio** (`text-*`, `bg-*`, `border-*`, `rounded-*`) — no
existen en el CSS compilado del Kit (removidas deliberadamente); si una se escribe por error, no hace nada
visible y el estilo cae silenciosamente al valor por omisión del navegador.

### Regla no negociable: reemplazar la paleta de Tailwind, no extenderla

El plugin `colors` de Tailwind **debe seguir activo** — genera las clases `bg-*`/`text-*` que sí se
necesitan, apuntando a los tokens del Kit. El riesgo es que la **paleta por omisión** de Tailwind
(`blue-500`, `red-600`...) siga disponible en paralelo. La solución es **reemplazar `theme.colors`, no
extenderlo con `theme.extend.colors`**:

```js
// tailwind.config.js
module.exports = {
  theme: {
    colors: {
      // Solo nombres mapeados 1:1 a variables del Kit — la paleta de stock de Tailwind
      // (blue, red, green, slate...) queda completamente ausente, no solo sin usar.
      paper: 'var(--background-2, #F6F7F7)',
      surface: 'var(--background, #FFFFFF)',
      line: 'var(--border-subtle, #D4D6D9)',
      navy: 'var(--primary-100, #001370)',
      // ... resto del bridge de arriba, más cualquier semántico nuevo que se necesite
      transparent: 'transparent',
      current: 'currentColor',
    },
  },
  // ...
};
```

Con `theme.colors` reemplazado, `bg-blue-500` deja de existir como clase — el error se ve en build/lint en
vez de renderizar en silencio un color fuera del sistema. Esta regla **no tiene la flexibilidad de
tipografía**: aplica exactamente igual que en `deliverables/kitdigital-v2.md`.

## Tipografía

**Regla de fondo:** para cualquier texto con equivalente auditado en Figma (encabezados `h1`-`h6`,
`.uss-display`, `.uss-intro`, párrafo, `blockquote`, `.overline`), usar la clase semántica del Kit — nunca
reconstruirla con utilidades de tamaño/peso de Tailwind. **A diferencia de `deliverables/kitdigital-v2.md`,
aquí no se desactivan los core plugins de tipografía de Tailwind** — sus utilidades de texto siguen
habilitadas y son válidas para contenido específico del dashboard sin equivalente en el Kit. Esta es la
flexibilidad que distingue a esta variante (`decisions/019`).

- Encabezados: Montserrat (600–700). La clase del Kit (`uss-h1`…`uss-h6`) ya trae su propio font-family —
  `font-serif` de Tailwind queda como respaldo solo para texto sin clase semántica del Kit.
- Cuerpo: Karla (400–500). Ídem — `p`/`.p` del Kit ya trae Karla; `font-sans` de Tailwind es el respaldo
  para el resto.

### Dependencias y método — igual que v2, no hay API imperativa

- **Cero dependencia adicional**: la tipografía llega con el mismo `@import
  '@ussebastian/kitdigital/dist/css/main.css';` que ya se necesita para todo lo demás.
- **No existe un componente `Typography`/`Heading`/`Text` en `@ussebastian/kitdigital-react`** — revisado el
  listado completo de `dist/components/` y no aparece. No hay método imperativo para tipografía.
- **Único método declarativo:** una etiqueta HTML semántica (`<h1>`, `<p>`, `<blockquote>`) o una clase
  `.uss-*`/`.p-size--*`/`.blockquote-size--*` — nunca una reconstrucción manual vía `style={{}}` inline. Para
  el residual de texto sin equivalente en el Kit, la utilidad de Tailwind sí es un método declarativo válido
  en esta variante (ver "Dónde sigue habiendo flexibilidad" abajo).

### Escala nativa (variables CSS, `_variables.scss`)

- **`--font-size-*`** (17 pasos, rem/px): `10, 12, 14, 16(=base), 18, 20, 25, 28, 32, 36, 40, 48, 56, 60, 72,
  80`. Coincide exactamente con la escala tipográfica auditada en Figma (`context/canonical-tokens.md` §
  Typography) — sin divergencia.
- **`--font-weight-*`** (8 pasos): `100, 200, 300, 400, 500, 600, 700, 800`.

### Estilos semánticos (responsive en `min-width: 1010px`, confirmado en el CSS compilado)

Mismo corte `md` que ya usan grid y espaciado. Ninguna de estas reglas lleva `!important` — ver la
advertencia de cascada más abajo:

| Clase(s) | Familia | Móvil (`<1010px`) | Escritorio (`≥1010px`) |
|---|---|---|---|
| `h1` / `.h1` / `.uss-h1` | Montserrat | 32px / 48px / 600 | 48px / 64px / 600 |
| `h2` / `.h2` / `.uss-h2` | Montserrat | 25px / 40px / 600 | 40px / 56px / 500 |
| `h3` / `.h3` / `.uss-h3` | Montserrat | 20px / 32px / 600 | 32px / 48px / 600 |
| `h4` / `.h4` / `.uss-h4` | Montserrat | 18px / 32px / 500 | 25px / 40px / 600 |
| `h5` / `.h5` / `.uss-h5` | Montserrat | `--font-size-base` (16px) / 28px / 600, `letter-spacing: 0.02em` | 20px / 32px / 600 |
| `h6` / `.h6` / `.uss-h6` | Montserrat | 14px / 24px / 700 | `--font-size-base` (16px) / 28px / 600 |
| `.uss-display` | Montserrat | 36px / 120% / 800, uppercase | 56px / 120% / 800 |
| `.uss-display--sub` | Montserrat | 24px | 32px |
| `.uss-display--content` | Montserrat | 16px / 700, `letter-spacing: 0.8px` | 20px, `letter-spacing: 1px` |
| `.uss-intro` | Montserrat | 14px / 24px / 500, `letter-spacing: 0.56px` | 16px / 28px, `letter-spacing: 0.64px` |
| `p` / `.p` | Karla | 16px / 28px / 400 | (sin cambio) |
| `.p-size--sm` | Karla | 14px / 24px | (sin cambio) |
| `.p-size--lg` | Karla | 18px / 32px | 20px / 32px |
| `blockquote` / `.blockquote` | Montserrat, italic | 18px / 32px / 500 | 20px / 32px |
| `.blockquote-size--xl` | Montserrat, italic | 20px / 32px | 25px / 40px |
| `.overline` | Montserrat | 16px / 28px / 500, `letter-spacing: 0.04em` | (sin cambio) |
| `code` / `.code` | monospace | tamaño heredado, sin escala del Kit | (sin cambio) |

**Nota sobre `h5`/`h6`:** el paso móvil de `h5` y el paso escritorio de `h6` usan literalmente
`var(--font-size-base)` (16px), no un valor fijo.

### Cruce contra los estilos con nombre de Figma — dos desvíos marcados

Cruzado contra `USS Design System Inventory/tokens/typography.json`. La mayoría coincide al pixel. **Dos
desvíos encontrados — se marcan, no se corrigen en silencio** (`decisions/005`, reportados en
`reports/figma-data-quality-issues.md` ítem 10):

| Clase del Kit | Figma (`typography.json`) | Desvío |
|---|---|---|
| `.uss-h4` escritorio: peso `600` | `Títulos/H4` escritorio: Montserrat **Medium (500)** | Peso no coincide en este único nivel de encabezado |
| `.uss-display` escritorio: `--font-size-56` (56px) | `Otros/Display Tittle`: **60px** | El SCSS fuente trae el comentario `// antes era 60` — cambio de código intencional que Figma todavía no capturó |

### Modificadores confirmados en el CSS compilado

| Clase | Efecto |
|---|---|
| `.uss-font-heavier` | Sube el peso del encabezado contenedor. Pares por nivel (móvil→escritorio): h1 `700→700`, h2 `600→700`, h3 `700→700`, h4 `600→700`, h5 `700→700`, h6 `700→800` |
| `.uss-font-lighter` | Baja el peso del encabezado contenedor. Pares por nivel (móvil→escritorio): h1 `500→500`, h2 `400→500`, h3 `500→500`, h4 `400→500`, h5 `500→500`, h6 `500→600` |
| `.uss-font-italic` | `font-style: italic` |
| `.text-color--alt` | Cambia el color de texto a `--text-subtle` (aplica sobre h1-h6, `.uss-display`, `p`, `.overline`, `blockquote`) |
| `.uppercase` / `.lowercase` | `text-transform`. Mismo nombre y mismo valor que las utilidades de Tailwind — no hay colisión real |

### Dónde sigue habiendo flexibilidad (a diferencia de v2)

**No es obligatorio desactivar `fontSize`/`fontWeight`/`fontFamily`/`lineHeight`/`letterSpacing` en
`corePlugins`** de Tailwind — mantenerlos habilitados es válido en esta variante para texto sin equivalente
en el Kit (p. ej. un caption de widget de dashboard). La regla no negociable aquí es más angosta que en v2:
**nunca usar una utilidad de Tailwind para reemplazar una clase semántica del Kit que ya cubre el caso**
(headings, body, blockquote, overline, display, intro) — para esos casos, la clase del Kit es obligatoria;
fuera de esos casos, Tailwind sigue siendo una opción legítima.

### Advertencia de cascada: Preflight de Tailwind puede borrar la tipografía de una etiqueta sin clase

Las reglas de tipografía del Kit **no llevan `!important`**. El orden de carga de este proyecto pone
`@tailwind base` (que incluye Preflight) **después** del CSS del Kit (ver "Orden de carga del CSS" abajo).
Preflight resetea `font-size`/`font-weight` de `h1`-`h6` a `inherit`. Con igual especificidad de selector de
elemento (`h1{...}`) y posición posterior en la cascada, **Preflight gana** sobre la regla del Kit si la
etiqueta no lleva ninguna clase — la tipografía desaparece en silencio.

**La solución es estructural, no de orden de imports:** el selector compuesto del Kit es
`h1,.h1,.uss-h1{...}` — la variante de **clase** (`.uss-h1`, especificidad 0,1,0) siempre gana sobre la
regla de Preflight sobre la etiqueta sola (`h1`, especificidad 0,0,1), sin importar el orden de carga.

**Regla: toda etiqueta de encabezado/párrafo/cita debe llevar su clase del Kit explícita**
(`<h1 className="uss-h1">`, `<p className="p">`, `<blockquote className="blockquote">`) — nunca depender de
la etiqueta sola. Esta regla **no tiene excepción de flexibilidad**: aplica igual que en v2, porque el bug
de cascada es idéntico en ambas variantes.

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
2. **Escalones de ícono** — los tamaños `--14/22/30` que ni `.uss-icon--*` ni `icon-size-*` cubren
   nativamente (ver tabla de íconos arriba; `--48` ya no necesita adaptador, lo cubre `icon-size-xxl`).
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

@tailwind base;                                         /* 3. Preflight resetea h1-h6 a font: inherit —
@tailwind components;                                       por eso toda etiqueta de encabezado/párrafo/cita
@tailwind utilities;                                        DEBE llevar su clase .uss-h*/.p/.blockquote
                                                             explícita (ver "Tipografía" arriba); las
                                                             utilidades de texto de Tailwind siguen
                                                             habilitadas para el resto del contenido */
```

El adaptador se importa **después** del Kit y **antes** de Tailwind: a igual especificidad gana por orden de
cascada, sin necesitar `!important` — salvo en los puntos donde el propio Kit ya usa `!important`, donde hay
que igualarlo para vencerlo. El anillo de foco visible (`:focus-visible`) del bloque `@layer base` es un
requisito de accesibilidad: no se elimina. La tipografía es distinta al espaciado: sus reglas del Kit no
llevan `!important`, así que la protección no viene del orden de imports sino de siempre usar la clase del
Kit junto con la etiqueta (ver advertencia de cascada en "Tipografía").

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
3. **Íconos con `aria-hidden="true"`** y significado en el texto adyacente; antes de crear un modificador de
   tamaño propio, revisar si `icon-size-*` ya lo cubre (ver tabla de íconos arriba).
4. **Espaciado con Tailwind**, nunca con las utilidades de espaciado del Kit directamente.
5. **Colores por token del Kit** (o clase de componente que ya lo incluya), no hexadecimales nuevos ni la
   paleta de stock de Tailwind — salvo las excepciones ya documentadas (`gold`, `ind.*`). `theme.colors` de
   Tailwind debe estar **reemplazado**, no extendido (ver regla no negociable en "Colores").
6. **Tipografía con la clase semántica del Kit** para todo texto con equivalente auditado (encabezados,
   párrafo, blockquote, overline, display, intro) — toda etiqueta correspondiente lleva su clase explícita
   (`className="uss-h1"`, `"p"`, `"blockquote"`), nunca la etiqueta sola. Las utilidades de texto de
   Tailwind (`text-*`/`font-*`/`leading-*`/`tracking-*`) siguen habilitadas y son válidas **solo** para
   contenido sin equivalente en el Kit.
7. El gate automatizado del proyecto cubre lint y tipos, **no** el cumplimiento visual — eso se verifica
   leyendo el diff y comparando contra este archivo.
