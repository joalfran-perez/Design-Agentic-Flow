---
inclusion: always
---

# Norma visual — Kit Digital USS (DDDI-112) — v2 (Bootstrap nativo para espaciado y grid)

Todo código de UI nuevo o modificado **debe usar el Kit Digital** (`@ussebastian/kitdigital`, distribución
CSS). Nunca se usan emojis en la interfaz.

> **Procedencia:** generado por ModUSS (repo de auditoría del design system USS) el 2026-08-31, sintetizando
> `context/canonical-tokens.md` y `context/code-design-mapping.md` (sección "Kit Digital native
> architecture") de ese repo. A diferencia de `deliverables/kitdigital-v1.md`, esta variante **no pelea**
> contra las utilidades nativas del Kit — las adopta directamente, porque son Bootstrap 5 real (no una
> imitación). El objetivo es cero capa adaptadora para espaciado/grid y cero dependencia adicional de
> código donde el Kit ya cubre la necesidad de forma nativa. Es una **fotografía puntual** — todos los
> valores citados aquí (clases, escalas, `!important`) fueron verificados contra el **CSS compilado real**
> (`dist/css/main.css` de `@ussebastian/kitdigital`), no solo contra el SCSS fuente, que puede incluir código
> muerto (ver nota en "Espaciado y grid" más abajo). Si algo aquí diverge del código en `develop`, repórtalo
> de vuelta a ModUSS — puede ser una decisión de diseño nueva que ModUSS todavía no capturó.
> `decisions/015`.

## La regla de fondo: dos autoridades separadas

La maqueta funcional es la **fuente de verdad funcional** — manda en qué hace cada pantalla. **No es la
referencia visual.** La identidad visual la manda el **Kit Digital**. Si la maqueta usa un emoji para
representar un concepto (📎, 🎯, ⬇, ✅...), se sustituye por el ícono Remix equivalente (ver mapeo abajo) o
por texto plano — nunca se preserva el emoji, aunque la maqueta lo muestre.

## Espaciado y grid — usar las utilidades nativas del Kit, no Tailwind

El Kit Digital **es Bootstrap 5 real** (no una imitación de nombres): `@ussebastian/kitdigital` importa
`bootstrap/scss/{utilities,grid,containers,reboot}` con un mapa de espaciadores propio. Esas utilidades **sí
llegan al CSS compilado** que se importa en la app — confirmado leyendo `dist/css/main.css` directamente,
no solo el SCSS fuente:

- **Espaciado**: `.p-*`, `.px-*`, `.py-*`, `.pt/pb/ps/pe-*`, `.m-*` (mismos sufijos), `.gap-*` — todas con
  `!important` en el CSS compilado (`.p-4{padding:.25rem!important}`, `.gap-24{gap:1.5rem!important}`).
  Escala disponible (px, vía rem): **`0, 4, 8, 12, 16, 20, 24, 28, 32, 40, 44, 48, 56, 64, 80, 96, 128, 160`**.
- **Grid estructural**: `.row` / `.col-{1-12}` (12 columnas, gutters variables por breakpoint vía
  `--bs-gutter-x`). Breakpoints reales: `md: 1010px`, `lg: 1296px` (mismo corte que usa `.uss-table` en su
  modo responsive — no es coincidencia, es el mismo sistema).
- **Ancho/alto**: `.w-*` / `.h-*` — **son porcentaje, no píxeles**: `.w-10{width:10%!important}`,
  `.w-100{width:100%!important}`. Valores disponibles: `10, 25, 30, 40, 50, 60, 75, 80, 90, 100, auto`.
- **Flexbox — dos familias distintas, no una sola**:
  - *Display* (`.flex`, `.grid`, `.hidden`, `.block`, `.inline-block`, `.inline-flex`...): nombrado igual
    que Tailwind, **sin** `!important` (de `_utilities.scss`).
  - *Propiedades de flex* (dirección/alineación/wrap/grow/shrink): nombrado **de Bootstrap**, no de
    Tailwind — `.align-items-center`, `.justify-content-between`, `.flex-column` (no `.flex-col`),
    `.flex-wrap`, `.flex-fill`, `.flex-grow-1` — y **sí llevan `!important`**. `.flex-row` es la única
    excepción que coincide con el nombre de Tailwind (mismo valor, sin riesgo). Si el proyecto tenía código
    escrito con nombres de Tailwind para estas propiedades (`items-center`, `justify-between`), **hay que
    reescribirlo** a los nombres de Bootstrap — no es una colisión de valores, es que la clase de Tailwind
    con ese nombre simplemente nunca llega a existir en el Kit.
- **No existen en el Kit** (removidos deliberadamente vía `_bootstrap_remove.scss`, confirmado ausente en
  el CSS compilado): utilidades de `opacity-*`, `border-*`, `rounded-*`, `text-{color}`/`bg-{color}`,
  `fst-*`/`ff-*`. Esto es intencional — color/borde/radio/opacidad se resuelven siempre por el sistema de
  tokens/componentes del Kit (ver sección de colores abajo), nunca por una utilidad Bootstrap cruda.
- **No existe grid CSS real** (`display:grid` + `grid-template-columns` arbitrario) en el Kit — solo el
  grid Bootstrap de 12 columnas basado en flexbox. Para necesidades de grid genuinas que no calcen en un
  `.row`/`.col-*` (p. ej. una cuadrícula de tarjetas con `grid-template-columns: repeat(auto-fit, ...)`),
  es aceptable mantener las utilidades de grid CSS de Tailwind habilitadas — no colisionan con nada nativo,
  porque el Kit no define ese concepto.

**Regla:** usar las clases nativas del Kit para espaciado (`p-*`/`m-*`/`gap-*`), ancho/alto porcentual
(`w-*`/`h-*`) y estructura de página (`.row`/`.col-*`). Desactivar los core plugins correspondientes de
Tailwind (`padding`, `margin`, `gap`, `width`, `height`) en `tailwind.config.js` para que sea **imposible**
generar una clase Tailwind con ese mismo nombre y un valor distinto — la garantía la da la configuración,
no una convención de equipo ni una capa adaptadora que las pise después:

```js
// tailwind.config.js
module.exports = {
  corePlugins: {
    padding: false,
    margin: false,
    gap: false,
    width: false,
    height: false,
    // display, flexbox (excepto las 4 propiedades listadas arriba), gridTemplateColumns, etc. quedan
    // habilitados: no colisionan con nada nativo del Kit.
  },
  // ...
};
```

Con esto, `@import '@ussebastian/kitdigital/dist/css/main.css';` seguido de Tailwind ya no necesita una
capa adaptadora para espaciado/ancho/alto — la colisión queda eliminada en la configuración, no parcheada
después del hecho.

### Pasos de la escala Figma sin equivalente nativo — no crear una excepción, redondear

La escala canónica de Figma (`context/canonical-tokens.md`) tiene 4 pasos que el Kit **no** tiene de forma
nativa. Política: **redondear siempre al paso nativo disponible más cercano** (nunca inventar una clase
nueva ni un valor fijo para cubrir el hueco); en empate, redondear hacia el paso mayor:

| Paso Figma (sin nativo) | Redondea a | Clase nativa a usar |
|---|---|---|
| Espaciado `36px` | `40px` (empate 32/40, se redondea hacia arriba) | `p-40` / `gap-40` / etc. |
| Espaciado `112px` | `128px` (empate 96/128, se redondea hacia arriba) | `p-128` / `gap-128` / etc. |
| Espaciado `216px` | `160px` (único paso disponible, es el tope de la escala nativa) | `p-160` / `gap-160` / etc. — la diferencia (56px) es grande; si un diseño insiste en 216px exactos, es una señal para revisar el diseño contra la escala nativa, no para crear una clase nueva |
| Radio `2px` | `0px` (`--border-radius-none`, más cercano: 2 vs. 6) | clase de componente del Kit que use `--border-radius-none` |
| Radio `4px` | `8px` (`--border-radius-s`, empate 4/4, se redondea hacia arriba) | idem con `--border-radius-s` |
| Radio `12px` | `16px` (`--border-radius-m`, empate 4/4, se redondea hacia arriba) | idem con `--border-radius-m` |

No hay una cuarta excepción de radio: `--border-radius-full` (`9999px`) ya cubre el caso circular/pill sin
ambigüedad.

## Íconos

- **Remix Icons** exclusivamente. `lucide-react` no se importa.
- Convención de 3 partes: `<i className="uss-icon uss-icon--{tamaño} ri-{nombre}-line" aria-hidden="true" />`.
  El `aria-hidden="true"` es obligatorio: el ícono es decorativo, el significado va en el texto adyacente.
- **No usar `text-[Npx]` para el tamaño.** El Kit fuerza `font-size: 1.5rem` en `.uss-icon` con
  `!important`; un tamaño arbitrario de Tailwind no lo vence.

  | Necesidad | Clase nativa | Tamaño | Origen |
  |---|---|---|---|
  | Escalón estándar | `uss-icon--xs` | 16 px | Kit (componente) |
  | Escalón estándar | `uss-icon--sm` | 20 px | Kit (componente) |
  | Escalón estándar | (sin modificador) | 24 px | Kit (componente, por omisión) |
  | Escalón estándar | `uss-icon--lg` | 28 px | Kit (componente) |
  | Escalón estándar | `uss-icon--xl` | 32 px | Kit (componente) |
  | Paso intermedio/mayor | `icon-size-xxl` | 48 px | **Utilidad Bootstrap nativa del Kit** — antes de crear
  un modificador de proyecto, revisar si `icon-size-{xs,s,m,l,xl,xxl,xxxl}` (16/20/24/28/32/48/64 px) ya
  cubre el valor. Confirmado compilado con `!important`, así que gana igual que `.uss-icon--*`. |
  | Paso realmente sin cobertura (p. ej. 14, 22, 30 px) | modificador de proyecto propio, con su propio
  `!important` | — | Solo si ni `.uss-icon--*` ni `icon-size-*` lo cubren |
- Color: transferir al `<i>` la clase de color correspondiente (ver bridge de color abajo).
- Animación: `animate-spin` de Tailwind para loaders (`ri-loader-4-line`) — no colisiona con nada nativo.

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

## Colores — usar las variables/clases nativas del Kit, no la paleta de Tailwind

**Regla de fondo:** el color se consume **exclusivamente** de las variables CSS del Kit (o de las clases de
componente del Kit que ya las traen incorporadas) — nunca de la paleta por omisión de Tailwind ni de un
hex nuevo. Verificado leyendo `_colors.scss` completo (bloques `:root/.light` y `.dark`), no solo el
fallback hex de un doc externo.

### Dependencias y método — igual patrón que tipografía: sin API JS, todo es CSS

- **Cero dependencia adicional**: los tokens de color llegan con el mismo `@import
  '@ussebastian/kitdigital/dist/css/main.css';` que ya se necesita para todo lo demás.
- **No existe una API de color/tema en JS.** Se buscó en todo `@ussebastian/kitdigital-react` (`theme`,
  `dark`, `useTheme`, `ThemeProvider`, `colorScheme`) y no aparece ningún resultado. **El cambio claro/oscuro
  es un simple toggle de clase en el DOM** (`.light`/`.dark` en el elemento raíz, normalmente `<html>` o
  `<body>`) — no un hook ni una función del Kit. Si el proyecto necesita alternar tema por código, la única
  "API imperativa" que existe es `document.documentElement.classList.toggle('dark')` (o equivalente) — no
  hay nada más sofisticado que inventar ni que buscar en la librería.
- **Método declarativo:** `var(--token-del-kit, #hexFallback)` en CSS, o el nombre de color de Tailwind
  mapeado 1:1 a esa misma variable vía `theme.colors` (ver regla no negociable abajo) — nunca un hex nuevo
  ni un color de la paleta por omisión de Tailwind.
- **"Custom styles" del Kit = sus propias clases de componente**, que ya traen el token correcto por dentro
  (`.uss-btn--primary`, `.uss-badge--success/warning/error/neutral`, `.uss-tag--primary/secondary`,
  `.uss-form__input--error`, ver tabla "Componentes CSS del Kit" más abajo). Si existe una clase de
  componente para el caso, se prefiere sobre reconstruir `bg-[var(--token)]` a mano.

### Escala nativa — paletas base (7 rampas × 10 pasos, `_colors.scss`)

Idénticas en hex a las tres auditorías de Figma (`context/design.md`: "mismos valores hex de marca donde
son comparables directamente") — sin divergencia, a diferencia de espaciado/radio:

| Rampa | 10 | 20 | 30 | 40 | 50 | 60 | 70 | 80 | 90 | 100 |
|---|---|---|---|---|---|---|---|---|---|---|
| `--neutral-*` | `#ffffff` | `#f6f7f7` | `#dfe0e3` | `#d4d6d9` | `#c3c5ca` | `#888e96` | `#58616e` | `#283341` | `#19222e` | `#0b141f` |
| `--primary-*` | `#f4f5fd` | `#e4e8fc` | `#c5cdf9` | `#93a3f7` | `#5e77f8` | `#274afb` | `#0024db` | `#001eb8` | `#001894` | `#001370` |
| `--secondary-*` | `#f3f8f8` | `#d2e4e4` | `#b1d1d2` | `#8ebfbf` | `#5aa5a5` | `#248c8a` | `#1e767c` | `#185f6c` | `#114252` | `#092430` |
| `--info-*` | `#f2f8fc` | `#e1eef8` | `#bedbee` | `#8abfdd` | `#57a3c9` | `#2386b1` | `#0073a0` | `#00628d` | `#004a6e` | `#002b41` |
| `--success-*` | `#f2fdf8` | `#e1f9ee` | `#bef1da` | `#8ae1ba` | `#57cf98` | `#23b974` | `#00a85c` | `#00945a` | `#007350` | `#004438` |
| `--warning-*` | `#fffef2` | `#ffffe1` | `#ffffbe` | `#fff88a` | `#ffeb57` | `#fcd923` | `#f4cb00` | `#c19a00` | `#836100` | `#452c00` |
| `--error-*` | `#fdf4f2` | `#fae4e1` | `#f4c5be` | `#e7978a` | `#d66a57` | `#c23d23` | `#b22000` | `#9d0000` | `#7a0000` | `#450005` |

**`--neutral-*` tiene 4 pasos intermedios extra** no listados arriba (`73`, `77`, `80`→ya listado como 8,
`82`, `85`) usados solo por elevación/hover de superficies oscuras — no son parte de la escala pública de
10 pasos, no usarlos directamente salvo que se esté extendiendo un semántico ya existente.

**`--secondary-*` es el punto de override por facultad/tenant:** cada paso es
`var(--custom-secondary-NN, <hex-de-arriba>)` — confirmado en el propio origen (`_colors.scss`), no solo
inferido. Sobrescribir `--custom-secondary-10` … `--custom-secondary-100` es el mecanismo soportado para
theming por facultad; no hardcodear un hex nuevo para lograr lo mismo.

### Escala nativa — capa semántica (light + dark, `_colors.scss`)

**No se resuelve a hex aquí a propósito** (evitar duplicar ~140 valores) — cada semántico es una referencia
a la rampa base de arriba; seguir la cadena `var(--token) → var(--rampa-NN) → hex`. Confirmado que **todas**
estas variables llegan al CSS compilado, no solo al SCSS fuente:

| Categoría | Tokens (light → dark, misma variable, valor distinto) |
|---|---|
| Fondo | `--background` (neutral-10 → neutral-100), `--background-2` (neutral-20 → neutral-90) |
| Superficie | `--surface-ghost-default/hover/active`, `--surface-default/hover/active`, `--surface-strong-default/hover/active`, `--surface-disabled` (8 tokens; en light resuelven a `primary-*`, en dark a `neutral-7x/8x`) |
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
| Elevación | `--elevation-1`, `--elevation-2` (transparente en light; `neutral-82`/`neutral-85` en dark — reemplaza sombra) |

**Cruce contra Figma:** esta forma (10 categorías: Background/Surface/Border/Text/Links/Text
interactive/Icons/Feedback/Focus/Buttons) coincide con la agrupación semántica auditada en Figma
(`context/canonical-tokens.md` § "Color — semantic tokens", 66 tokens en USS One). **No se hizo un cruce
token-por-token exhaustivo** (evitar recargar `colors.json` de los 3 sistemas para esta consolidación,
`AGENTS.md` regla 2) — si un agente necesita confirmar un token puntual contra Figma, usar
`context/canonical-tokens.md` o el `colors.json` del sistema correspondiente, no asumir cobertura 1:1 aquí.

### Bridge de ejemplo — nombres de proyecto ya usados por ModUSS Planner

Sigue vigente sin cambios; es un subconjunto de la escala completa de arriba, no la única fuente:

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

**No usar utilidades Bootstrap de color/borde/radio** (`text-*`, `bg-*`, `border-*`, `rounded-*`) — no
existen en el CSS compilado del Kit (removidas deliberadamente); si una se escribe por error, no hace nada
visible y el estilo cae silenciosamente al valor por omisión del navegador.

**Excepciones con hex fijo, sin equivalente en el Kit por diseño** — no intentar mapearlas a un token:
`gold` (acento de actividad propia / compartir) y los colores `ind.*` por indicador del proyecto.

### Regla no negociable: reemplazar la paleta de Tailwind, no extenderla

A diferencia de espaciado/tipografía (donde el arreglo es desactivar un core plugin completo), el plugin
`colors` de Tailwind **debe seguir activo** — es lo que genera las clases `bg-*`/`text-*` que sí se
necesitan, ahora apuntando a los tokens del Kit. El riesgo real es que la **paleta por omisión** de
Tailwind (`blue-500`, `red-600`, etc.) siga disponible en paralelo — nada impide que un agente use un color
de stock de Tailwind en vez de un token del Kit. La solución es **reemplazar `theme.colors`, no extenderlo
con `theme.extend.colors`**, para que la paleta de stock deje de existir como clase:

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
      // ... resto del bridge de ejemplo de arriba, más cualquier semántico nuevo que se necesite
      transparent: 'transparent',
      current: 'currentColor',
    },
  },
  // ...
};
```

Con `theme.colors` reemplazado, `bg-blue-500` deja de existir como clase — el error se ve inmediatamente en
build/lint en vez de renderizar en silencio un color fuera del sistema.

## Tipografía — usar las clases nativas del Kit, no Tailwind

**Regla de fondo (revierte la posición anterior de esta guía):** la tipografía se consume **exclusivamente**
del CSS del Kit. Tailwind ya no es dueño de tamaño/peso/interlineado/tracking — solo de lo que el Kit no
define (ver excepción al final). Verificado contra `dist/css/main.css` compilado, no solo el SCSS fuente.

### Dependencias y método — no hay API imperativa, es intencional

- **Cero dependencia adicional**: la tipografía llega con el mismo `@import
  '@ussebastian/kitdigital/dist/css/main.css';` que ya se necesita para todo lo demás. No hay un paquete,
  hook ni función aparte para tipografía.
- **No existe un componente `Typography`/`Heading`/`Text` en `@ussebastian/kitdigital-react`** — se revisó
  el listado completo de `dist/components/` (Accordion, AlertMessage, Badge, Banner, Breadcrumb, Button,
  Card, Carousel, Divider, Footer, Form, Header, Hero, Icon, Link, LinkedList, Modal, Pagination, Stepper,
  Table, Tabs, Tag, Toast, Tooltip) y no aparece. **No hay método imperativo para tipografía, punto** — no
  es un vacío a llenar con un componente propio, es cómo está diseñado el Kit.
- **Único método declarativo:** una etiqueta HTML semántica (`<h1>`, `<p>`, `<blockquote>`) o una clase
  `.uss-*`/`.p-size--*`/`.blockquote-size--*` — nunca una reconstrucción manual vía `style={{}}` inline ni
  vía utilidades de Tailwind. Esto aplica igual a código declarativo (JSX con `className`) e imperativo
  (cualquier helper que genere el mismo `className` en runtime) — en ambos casos el valor final es siempre
  una clase del Kit, nunca un número inventado.

### Escala nativa (variables CSS, `_variables.scss`)

- **`--font-size-*`** (17 pasos, rem/px): `10, 12, 14, 16(=base), 18, 20, 25, 28, 32, 36, 40, 48, 56, 60, 72,
  80`. Coincide exactamente con la escala tipográfica auditada en Figma
  (`context/canonical-tokens.md` § Typography) — a diferencia del espaciado, aquí **no hay divergencia**.
- **`--font-weight-*`** (8 pasos): `100, 200, 300, 400, 500, 600, 700, 800`.

### Estilos semánticos (responsive en `min-width: 1010px`, confirmado en el CSS compilado)

Mismo corte `md` que ya usan grid y espaciado — no es una escala responsive aparte. Ninguna de estas reglas
lleva `!important` (a diferencia de las utilidades Bootstrap de espaciado/íconos) — ver la advertencia de
cascada más abajo, es la razón por la que esto importa:

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
`var(--font-size-base)` (16px), no un valor fijo — no lo reescribas como `--font-size-16` en código nuevo,
son el mismo token pero `--font-size-base` es el que usa la fuente.

### Cruce contra los estilos con nombre de Figma — coincide casi todo, dos desvíos marcados

Cruzado contra `USS Design System Inventory/tokens/typography.json` (desktop + mobile). La mayoría coincide
al pixel (p. ej. `.uss-h1` escritorio = 48/64/SemiBold = `Títulos/H1` escritorio, literal; `.p-size--sm` =
14/24 = `Contenido/Body S`, literal). **Dos desvíos encontrados — se marcan, no se corrigen en silencio**
(`decisions/005`):

| Clase del Kit | Figma (`typography.json`) | Desvío |
|---|---|---|
| `.uss-h4` escritorio: peso `600` | `Títulos/H4` escritorio: Montserrat **Medium (500)** | Peso no coincide en este único nivel de encabezado |
| `.uss-display` escritorio: `--font-size-56` (56px) | `Otros/Display Tittle`: **60px** | El SCSS fuente trae el comentario `// antes era 60` — cambio de código intencional que Figma todavía no capturó, no un bug de compilación |

### Modificadores confirmados en el CSS compilado

| Clase | Efecto |
|---|---|
| `.uss-font-heavier` | Sube el peso del encabezado contenedor. Pares por nivel (móvil→escritorio): h1 `700→700`, h2 `600→700`, h3 `700→700`, h4 `600→700`, h5 `700→700`, h6 `700→800` |
| `.uss-font-lighter` | Baja el peso del encabezado contenedor. Pares por nivel (móvil→escritorio): h1 `500→500`, h2 `400→500`, h3 `500→500`, h4 `400→500`, h5 `500→500`, h6 `500→600` |
| `.uss-font-italic` | `font-style: italic` |
| `.text-color--alt` | Cambia el color de texto a `--text-subtle` (aplica sobre h1-h6, `.uss-display`, `p`, `.overline`, `blockquote`) |
| `.uppercase` / `.lowercase` | `text-transform`. **Mismo nombre y mismo valor que las utilidades de Tailwind** — no hay colisión real, mismo caso ya documentado para `.flex-row` en espaciado |

### Regla no negociable: nada de utilidades de texto de Tailwind donde el Kit ya cubre el caso

**Nunca usar** `text-{size}`, `font-{weight}`, `font-{family}`, `leading-*`, `tracking-*` de Tailwind para
encabezados, cuerpo, display, intro, blockquote, overline o code — todos esos casos ya están cubiertos por
la tabla de arriba. Desactivar los core plugins correspondientes en `tailwind.config.js`, extendiendo el
mismo bloque ya usado para espaciado:

```js
// tailwind.config.js
module.exports = {
  corePlugins: {
    padding: false,
    margin: false,
    gap: false,
    width: false,
    height: false,
    fontSize: false,
    fontWeight: false,
    fontFamily: false,
    lineHeight: false,
    letterSpacing: false,
  },
  // ...
};
```

Esto convierte la colisión en imposible por configuración — igual que con espaciado, no es una convención
de equipo.

### Advertencia de cascada: Preflight de Tailwind puede borrar la tipografía de una etiqueta sin clase

Las reglas de tipografía del Kit **no llevan `!important`**. El orden de carga de este proyecto pone
`@tailwind base` (que incluye Preflight) **después** del CSS del Kit (ver "Orden de carga del CSS" abajo).
Preflight resetea `font-size`/`font-weight` de `h1`-`h6` a `inherit`. Con igual especificidad de selector
de elemento (`h1{...}`) y posición posterior en la cascada, **Preflight gana** sobre la regla del Kit si la
etiqueta no lleva ninguna clase — la tipografía desaparece en silencio.

**La solución es estructural, no de orden de imports:** el selector compuesto del Kit es
`h1,.h1,.uss-h1{...}` — la variante de **clase** (`.uss-h1`, especificidad 0,1,0) siempre gana sobre la
regla de Preflight sobre la etiqueta sola (`h1`, especificidad 0,0,1), sin importar el orden de carga.

**Regla: toda etiqueta de encabezado/párrafo/cita debe llevar su clase del Kit explícita**
(`<h1 className="uss-h1">`, `<p className="p">`, `<blockquote className="blockquote">`) — nunca depender de
la etiqueta sola.

## Geometría de componentes — sigue siendo necesaria, es independiente de la elección de espaciado

El Kit está pensado para páginas institucionales anchas; un dashboard denso todavía necesita algunos ajustes
de **geometría de componente** (nunca de color/tipografía). Esto **no cambia** entre v1 y v2 — no depende de
si el espaciado viene de Tailwind o de Bootstrap nativo, así que la lista se mantiene idéntica y se resuelve
con una capa adaptadora mínima, mucho más chica que en v1 (ya no incluye la restauración de escala de
espaciado ni de `w-*`/`h-*`, que en v2 ya no hace falta parchear):

- Modal (`.uss-modal__body`): el Kit lo dispone en fila; forzar columna con padding de dashboard salvo que
  el componente pida layout en fila con ícono de estado (variante `--with-icon`).
- Formularios (`.uss-form__input`): el Kit usa padding de 1rem, `min-width` 250px y esquinas rectas; ajustar
  a un formulario denso con esquinas redondeadas; corregir checkboxes/radios (el Kit los trata como inputs
  de texto).
- Tablas hechas con `<div>` (`div.uss-table`): el modo responsive del Kit (`display:block`,
  `max-width:fit-content`, `white-space:nowrap` bajo 1010px) solo tiene sentido para un `<table>` real —
  anularlo para el caso `div`.
- Striping de tablas `<div>`: la fila de cabecera participa del conteo `:nth-child` (en un `<table>` real el
  `<thead>` queda fuera) — corregir empezando el rayado en la primera fila de datos.
- Tabs (`.uss-tabs__tablist`/`.uss-tabs__tab`): la altura fija de 68px del Kit recorta contenido en una
  navegación secundaria — reducir el padding vertical.
- `html, body`: `overflow-x: hidden` — ningún ancho de viewport debe producir scroll horizontal de página;
  cuando se necesite scroll horizontal real (tablas anchas), encapsularlo en un contenedor propio
  (`.table-scroll`).

## Orden de carga del CSS

```css
@import '@ussebastian/kitdigital/dist/css/main.css';   /* 1. Kit — trae ya su Bootstrap nativo */
@import './kit-adapter.css';                            /* 2. Adaptador (solo geometría de componente) */

@tailwind base;                                         /* 3. Preflight resetea h1-h6 a font: inherit —
@tailwind components;                                       por eso toda etiqueta de encabezado/párrafo
@tailwind utilities;                                        DEBE llevar su clase .uss-h*/.p/.blockquote
                                                             explícita (ver "Tipografía" arriba); corePlugins
                                                             de espaciado/ancho/alto/tipografía desactivados */
```

El adaptador ya no necesita reglas de espaciado ni de `w-*`/`h-*` — esa clase de bug queda eliminada por la
configuración de `tailwind.config.js`, no por una regla CSS que gane la batalla de cascada después. El
anillo de foco visible (`:focus-visible`) del bloque `@layer base` sigue siendo un requisito de
accesibilidad: no se elimina. La tipografía es distinta: sus reglas no llevan `!important`, así que la
protección no viene del orden de imports sino de siempre usar la clase del Kit junto con la etiqueta (ver
advertencia de cascada en "Tipografía").

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
| Grid estructural | `.row`, `.col-{1-12}`, `.col-md-*`, `.col-lg-*` |

## Checklist antes de dar por terminada una tarea de UI

1. **Sin emojis en JSX renderizado** — buscar emojis en el código de interfaz; si aparece uno fuera de
   comentarios/tests, es un defecto.
2. **Sin `lucide-react`** — ninguna importación, no debe estar en las dependencias.
3. **Íconos con `aria-hidden="true"`** y significado en el texto adyacente; antes de crear un modificador de
   tamaño propio, revisar si `icon-size-*` ya lo cubre.
4. **Espaciado, ancho/alto y grid estructural con las clases nativas del Kit** (`p-*`/`m-*`/`gap-*`/`w-*`/
   `h-*`/`.row`/`.col-*`), nunca con las utilidades equivalentes de Tailwind — deben estar desactivadas en
   `tailwind.config.js` (`corePlugins`).
5. **Ningún paso fuera de la escala nativa** — si un valor de Figma no tiene equivalente nativo, redondear
   según la tabla de esta guía, no inventar una clase ni un valor fijo.
6. **Colores por variable del Kit (o clase de componente que ya la incluya)**, no hexadecimales nuevos ni
   utilidades Bootstrap de color/borde/radio (no existen en el Kit) — salvo las excepciones ya documentadas
   (`gold`, `ind.*`). `theme.colors` de Tailwind debe estar **reemplazado**, no extendido, para que la
   paleta de stock (`blue-500`, etc.) no exista como clase.
7. **Tipografía con las clases del Kit, no utilidades de texto de Tailwind** (`text-*`/`font-*`/`leading-*`/
   `tracking-*` deben estar desactivadas en `tailwind.config.js`) — y toda etiqueta de encabezado/párrafo/
   cita lleva su clase explícita (`className="uss-h1"`, `"p"`, `"blockquote"`), nunca la etiqueta sola.
8. El gate automatizado del proyecto cubre lint y tipos, **no** el cumplimiento visual — eso se verifica
   leyendo el diff y comparando contra este archivo.
