# ModUSS Planner — Hallazgos visuales de la revisión Kit Digital (2026-09-02)

**Preparado:** 2026-09-03 · **Audiencia:** Javier Teillier y el equipo de desarrollo de ModUSS Planner,
con Joalfran Pérez (diseño) como observador de la sesión. **Propósito:** documento listo para desglosar en
tickets, con los hallazgos de la sesión grabada de 1 h 07 min 46 s del 2026-09-02 en la que Joalfran recorre
la interfaz **solo** y levanta desviaciones respecto del mandato institucional del Kit Digital USS.

**Grabación:** [ModUSS Recorrido UI (abre en 0:04)][v4] · duración indexada **1 h 07 min 46 s**.

**Fuente y salvedad:** transcripción automática de Teams (`ModUSS _ Recorrido UI.docx`). A diferencia de la
sesión funcional del 2026-08-27, hay **un solo hablante** (Joalfran), así que la atribución es confiable.
El export, en cambio, aplastó toda la sesión en **una sola intervención marcada `0:04`**. No hay marcas
intermedias: **no es posible anclar cada hallazgo a un minuto del video**. El enlace de arriba abre el
inicio del recorrido. El `.docx` no se copia a este repo.

Trazabilidad: `decisions/020`, `logs/018`. Complementa, no reemplaza, `reports/moduss-planner-review-findings.md`
(sesión funcional 2026-08-27).

El producto consume el Kit en el régimen **v1** (Tailwind coexistente, `deliverables/kitdigital-v1.md`,
`decisions/019`). Las clases nativas citadas abajo son las de esa norma.

---

## Qué se vio bien

- **Tabs / pestañas:** Joalfran las da por correctas (estados y lenguaje visual cercanos al Kit). Clases
  esperadas: `.uss-tabs__tablist`, `.uss-tabs__tab`, `.active`.
- **Íconos:** a simple vista parecen los del Kit; solo falta validar en código que no haya `lucide-react` ni
  `text-[Npx]` sobre `.uss-icon` (el Kit fuerza `font-size: 1.5rem !important` — ver
  `reports/kitdigital-v0-to-v2-jira-summary.md`).
- **Layout de Gantt y de Gestión de carrera:** la distribución del contenido no se cuestiona; los hallazgos
  son de componente, no de estructura de página.

---

## Priorización sugerida

**P0 — branding y cromática institucional (se ve en todas las pantallas).** V1–V5 (encabezado: logo USS,
menú claro, avatar, select en positivo, etiqueta de rol) y V7 (títulos en color `strong`, no en primario).
El mandato del Kit empieza por identificarse como USS, no como un producto con chrome propio.

**P1 — componentes que ya existen en el Kit y se están reinventando.** V6 (tags), V11 (select), V15–V19
(KPI y CTAs), V22–V27 (alertas, tablas, modal, botón ícono, feedback de import/export/guardado), V12
(breadcrumb).

**P2 — unificación y exploración.** V14 (login institucional), V16 (diferenciar KPI con tag, no con raya de
color), V20 (tarjetas de gestión), V33 (pedir referencia Figma del calendario), V8 (contraste del texto de
apoyo).

---

## Hallazgos (recorridos en vivo)

Los IDs `V*` son de esta sesión visual. Donde el mismo síntoma ya apareció en la sesión funcional se indica
el `D*` / `U*` correspondiente.

### Encabezado y chrome (todas las pantallas)

| ID | Hallazgo | Qué usar del Kit | Recurre en |
|---|---|---|---|
| V1 | El encabezado lleva el logo de ModUSS Planner. Debe ser el **logo USS**, en la variante de **doble fila**: tope (`top`) + bloque principal de navegación | Header institucional del Kit (no está en las páginas Desktop capturadas de este repo) | Todas |
| V2 | Menú de **alto contraste** (fondo azul oscuro, texto claro). No está definido en el Kit para este producto; hay que pasar a **positivo / light** | Tema light del Kit; no usar las variantes dark del select/botón sobre ese fondo | Todas |
| V3 | El select de cambio de rol está en **negativo** (línea y texto blancos) porque hereda el chrome oscuro. Al pasar el menú a light, el select debe volver a su estado light | `.uss-form__input` en modo claro; no la variante dark | Todas |
| V4 | Avatar del usuario no coincide con el del Kit (iniciales, color de fondo, tipografía, tamaño). El mismo avatar reaparece en breadcrumb | Avatar del Kit | Header + detalle de plan |
| V5 | Etiqueta naranja de rol **Administrador**: paleta nunca usada en proyectos previos ni definida en el Kit; se lee como botón primario naranja. Nombre + rol + select de rol son **redundantes** | Tag del Kit (`.uss-tag--*` / badge warning para acento cálido). Compactar: logo USS → Exportar / Importar (misma jerarquía) → avatar + nombre → rol, con el select **dentro** del rol | Header |
| V6 | Tag en estado por defecto con **borde gris** que el Kit no define; hover distinto; en el modal de metas el tamaño parece fuera de escala | `.uss-tag--primary` / `.uss-tag--secondary` (o badge de estado). Quitar el borde inventado | Header, gestión, tabs de sede, modal, Gantt |
| V7 | Títulos de página en **color primario**, no definido para ese uso. Deben usar el color de texto **strong** (oscuro) | Clase semántica de encabezado del Kit (`uss-h1`…`uss-h4`) + token strong. Encaja con el riesgo Preflight de v1: la etiqueta de heading **sin** clase Kit se ve mal | Todas las pantallas con título |
| V8 | Texto de apoyo bajo el título con **contraste insuficiente** sobre el fondo gris de página. Subir un paso en la rampa del token que se esté usando | Token de texto secundario un paso más oscuro de la rampa semántica | Todas |
| V9 | Emoji usado como indicador de notificación. El Kit tiene badge para eso. Además, v1 prohíbe emojis en JSX renderizado | `.uss-badge--*` | Home / header |
| V12 | Breadcrumb (pantalla de detalle de plan) sin color, tipo ni comportamiento del Kit | Breadcrumb del Kit (solo especificado en Mobile en este repo) | Detalle de indicador / plan |

### Login

| ID | Hallazgo | Qué usar del Kit |
|---|---|---|
| V14 | Unificar con el **patrón de login institucional** (layout centrado ya similar). Presentar logo USS. Títulos en strong, igual que V7 | Layout de login ya usado en otros desarrollos USS + V1/V7 |

### Plan MODUSS — tarjetas KPI y actividades

| ID | Hallazgo | Qué usar del Kit |
|---|---|---|
| V15 | Las tarjetas KPI se ven bien, pero el Kit ya tiene el patrón. En el Kit la línea decorativa es **un solo color**, no una paleta por tarjeta; el ícono y la línea comparten color; el KPI debe ser **strong / heavy** | Componente de tarjeta KPI del Kit |
| V16 | Si hace falta diferenciar tarjetas, **explorar** un tag/badge de color por nombre de indicador en lugar de teñir la raya. Es una hipótesis: hay que probar carga cognitiva | `.uss-badge--*` / `.uss-tag--*` sobre la tarjeta kit |
| V17 | CTA principal de la tarjeta se lee como **botón secundario**. Al volver de prácticas, el mismo botón pasa a **verde** — verificar que sea el verde del Kit, no uno de Tailwind | `.uss-btn--primary`; verde solo de la rampa success/primary del Kit |
| V18 | “Agregar práctica / actividad” es un botón **rectangular a ancho completo** que no está en el Kit | Botón **full width** del Kit (ícono + texto, bordes redondos) |
| V19 | Botones de edición bajo KPI y en Gantt: fondo blanco / borde gris o tema Tailwind | `.uss-btn--icon` (contenedor circular, estados definidos) |

### Gestión de carrera

| ID | Hallazgo | Qué usar del Kit |
|---|---|---|
| V20 | Tarjetas de categoría (ícono + título) no están mal; hay que **explorar** la tarjeta single del Kit o el botón full-width sutil para no inventar un tercer patrón | Tarjeta single o full-width del Kit |
| V21 | Mismos V6/V7/V1–V5. Un botón de agregar actividad usa **tema Tailwind por defecto** | `.uss-btn--*` en el tamaño del Kit (small/medium), no clases default de Tailwind |

### Vicerrectoría — global, por sede, modal de metas

| ID | Hallazgo | Qué usar del Kit | Cruce con sesión 08-27 |
|---|---|---|---|
| V22 | Alerta en la tarjeta **Vacantes** no sigue código de color ni tamaño del Kit | Alert / badge del Kit | D11 (métrica muerta) + U7 |
| V23 | Tabla cebra con **encabezados en mayúsculas**, no definidos en el Kit. Validar tamaño y peso del cuerpo | `.uss-table`, `.uss-table--stripes`, `.uss-table__row`, `.uss-table__cell` — sin `text-transform: uppercase` inventado | — |
| V24 | Botón de sliders / configuración: blanco con borde gris | `.uss-btn--icon` | El mismo control que no abre el plan (D4) |
| V25 | Modal de metas: título y bajada desalineados; sin **caja de acción** (separador + footer); lista interior sin cebra ni divisores; posible checkbox/ícono sin renderizar (cuadrado diminuto); tags de estado fuera de escala | `.uss-modal`, `.uss-modal__body`, `.uss-modal__footer`; lista → tabla kit o divisores; V6 para tags | — |
| V26 | Hover de badges/tags en el modal distinto al Kit | Estados hover del componente tag/badge | — |
| V27 | Guardado de seguimiento, export e import **sin alerta de éxito/error** visible. El resultado de importación es un **segundo modal superpuesto** (“65 importadas / 0 omitidas”) con un solo botón Aceptar | Alert success/error del Kit; **eliminar el modal apilado** | U2 (guardado silencioso), U3 / D1–D3 (importación) |

### Importación — layout del modal

| ID | Hallazgo | Qué usar del Kit |
|---|---|---|
| V32 | Tres acciones en el footer (Cancelar, Elegir archivo, Descargar plantilla) en **tres tamaños distintos**. Cancelar no coincide con secundario del Kit. Propuesta de la sesión: Cancelar = secundario, Elegir archivo = **primario**, Descargar plantilla = terciario, **mismo tamaño**. Tres acciones no existen como receta del Kit; se aceptan por contexto si se unifican | `.uss-btn--secondary` / `--primary` / `--tertiary` + `.uss-modal__footer` |

### Gantt y dashboard de usuarios

| ID | Hallazgo | Qué usar del Kit |
|---|---|---|
| V28 | Barra de meses en azul de alto contraste. Sobraría el acento: ya está arriba. Usar estilo de **encabezado de tabla** del Kit | Header de `.uss-table` |
| V29 | Tags de estado agrandados; botones de edición → `.uss-btn--icon` (igual V19) | Tag kit + button icon |
| V30 | Avatares de roles en el dashboard inconsistentes en tamaño y estilo (igual V4) | Avatar kit |
| V31 | Estado “activo” como texto verde + ícono check. Debe ser el **tag/badge de estado** usado en el resto de la app | `.uss-badge--success` / tag de estado |

### Select, calendario, formularios (recorren varias pantallas)

| ID | Hallazgo | Qué usar del Kit |
|---|---|---|
| V11 | Ícono dropdown del select **roza el borde derecho** del campo. Recurre en header y en el modal de agregar práctica | Ajuste de padding del `.uss-form__input`; no un ícono Tailwind a pelo |
| V13 | Lista desplegada: hover azul **distinto** al del dropdown del Kit | Estados del item de dropdown kit |
| V33 | Calendario de fecha inicio/fin: **pedir a diseño** la referencia Figma de un calendario ya implementado con el Kit en otro proyecto. No hay especificación Desktop de date picker en los inventarios de este repo | Select date (solo Mobile capturado) |

---

## Relación con la sesión funcional (2026-08-27)

Varios síntomas visuales son la cara de hallazgos ya ticketizados:

| Esta sesión | Sesión 08-27 | Lectura conjunta |
|---|---|---|
| V27 modal de resultado de importación apilado | D3 (contadores raros), U3 (sin preview) | El mensaje existe, pero como modal encima de modal, no como alerta ni como paso 2 |
| V27 sin alerta de guardado | U2, D6 | El historial se escribe en silencio y además no hay toast/alert de Kit |
| V22 alerta de Vacantes | D11, U7 | El número está mal *y* el componente de alerta no es el del Kit |
| V24 botón configuración | D4 (el control junto a Ver plan) | Mismo control, ahora también mal dibujado |
| V9 emoji | Checklist v1 ítem 1 | Ya era regla escrita; ahora está observado en producción |
| V21 / V18 botones Tailwind default | Norma v1 “colores por token, no paleta stock” | Confirmado en pantalla |

---

## Implicancia para el sistema de diseño (este repo)

La sesión **nombra** componentes que este repo ya había marcado como ausentes de las capturas Desktop
(`decisions/018`): Header, Avatar, Breadcrumb, Modal, Alert, Select, Dropdown, Table, Tabs (estos últimos
sí se vieron bien), Tag, Badge, Button icon, Button full-width, KPI card, Date picker.

No cambia el inventario Figma: sigue siendo “ausente de las páginas Desktop **capturadas**”. Lo que cambia es
el **volumen de evidencia de un consumidor real pidiendo esas piezas en desktop**. Tabs es el único bloque
que esta sesión da por alineado.

La norma aplicable al arreglo en código es `deliverables/kitdigital-v1.md`, no v2: ModUSS Planner sigue en
el régimen Tailwind-coexistente.

---

## Nota sobre el video

No hay marcas por hallazgo. Si Teams regenera una transcripción con marcas por frase, se pueden aplicar las
mismas convenciones de `decisions/018` (ventana desde el anuncio de la acción, `clave`, `(hablado)` /
`(aprox.)`, enlaces `nav` con `playbackOptions`). Hasta entonces, la evidencia visual se revisa recorriendo
la grabación completa.

[v4]: https://correouss-my.sharepoint.com/:v:/g/personal/ext_joalfran_perez_uss_cl/IQDtliO-iSKeRKSy6F6NOtkjARC-xxNUGNqwP-942DpIz6E?nav=%7B%22playbackOptions%22%3A%7B%22startTimeInSeconds%22%3A4%7D%7D "0:04"
