# ModUSS Planner — Hallazgos de la revisión de interfaz del 2026-08-27 (para tickets)

**Preparado:** 2026-08-31 · **Audiencia:** Javier Teillier y el equipo de desarrollo de ModUSS Planner.
**Propósito:** documento listo para desglosar en tickets, con los hallazgos de la sesión de recorrido de
interfaz de 1 h 01 min del 2026-08-27 (Javier Teillier compartiendo pantalla, Joalfran Pérez observando por
el área de diseño).

**Fuente y salvedad:** transcripción automática de la llamada. Es de doble canal, con cada intervención
duplicada y atribuida a ambos participantes, así que **la atribución de quién dijo qué no es confiable**;
todo lo de abajo se reconstruyó por contenido y marca de tiempo, no por etiqueta de hablante. Si algún ítem
no corresponde a lo que recuerdas de la llamada, esa es la causa más probable. Los defectos marcados como
"observado en vivo" ocurrieron en pantalla durante la sesión, no son hipótesis.

Trazabilidad interna del análisis: `decisions/018`, `logs/016`.

---



## Cómo usar las marcas de video

Cada hallazgo trae una ventana de reproducción sobre la grabación de la llamada, para poder revisarlo con la
evidencia en pantalla en vez de solo leer la descripción.

**Las marcas son enlaces**: al hacer clic abren la grabación en el reproductor de Stream directamente en ese
segundo. Si tu visor de Markdown no renderiza enlaces, las definiciones están al final del archivo.

- `mm:ss–mm:ss` es la ventana a reproducir. **No empieza en el comentario, empieza antes**: en el momento
en que la acción arranca en pantalla, normalmente cuando Javier anuncia lo que va a hacer ("voy a importar",
"déjame ver"). Si se salta directo al comentario ya pasó lo que había que ver. **El enlace del inicio de
ventana es el que conviene usar para revisar**; es el único que garantiza ver el hallazgo completo.
- `clave mm:ss` es el instante en que el hallazgo se hace evidente o se verbaliza. Es la referencia para
citar en un ticket, y su enlace sirve para ir al punto exacto cuando ya se conoce el contexto.
- `+ mm:ss` son reapariciones del mismo problema más adelante en la llamada, útiles cuando la primera vez
no quedó claro. D4 reaparece cuatro veces porque Javier volvió a intentarlo.
- `(hablado)` significa que **no hay evidencia visual**, solo el argumento en audio. Aplica a casi todas
las recomendaciones de diseño y a D14. Donde el problema de fondo sí se ve en otro punto de la llamada, se
indica en qué defecto está.
- `(aprox.)` significa que no hubo un anuncio de acción del cual anclar el inicio, así que el margen de
entrada es estimado.

**Margen de precisión:** ±5 segundos. La transcripción es de doble canal y cada intervención aparece dos veces
con marcas ligeramente distintas; la convención usada aquí es tomar siempre la primera aparición.

**Verificación de que estas marcas corresponden a tu copia del video.** Las marcas son relativas al inicio de
la grabación, y solo sirven si la grabación es la original sin recortar. Comprobación de 10 segundos: la
grabación indexada dura **1 h 01 min 31 s**, su primera intervención está en **0:05** y la última en
**1:01:27**. Si la duración de tu archivo no coincide, las marcas están desplazadas en bloque y no hay que
confiar en ellas.

**Sobre los enlaces:** apuntan al enlace de compartición de la grabación en OneDrive y siguen exigiendo
autenticación con cuenta USS, así que quien no tenga acceso a la grabación tampoco lo tendrá por este
documento. El parámetro de tiempo (`nav`) **no está documentado oficialmente por Microsoft**: funciona hoy al
abrir el reproductor directamente, no funciona en vistas embebidas, y Microsoft puede cambiarlo sin avisar. Si
algún día dejan de posicionarse solos, las marcas en `mm:ss` siguen siendo válidas para buscar a mano.

---



## Priorización sugerida

**P0 — antes de ampliar el piloto.** D1, D2, D3 (integridad de datos en la importación) y D5 con D4 (acceso
por año de planificación). La importación es el primer contacto real de cada director con el sistema y hoy
puede dejar datos silenciosamente mal categorizados; el acceso al plan de otro director es funcionalidad
central del rol director académico y actualmente no funciona.

**P1 — deuda funcional visible al usuario.** D6, D7, D8, D10, D13, D14 más las recomendaciones U2 y U3, que
son la contraparte de diseño de los defectos de importación y de guardado.

**P2 — consistencia y pulido.** D9, D11, D12, D15 y el resto de las recomendaciones de diseño.

---



## Defectos observados en vivo


| ID  | Video                                                       | Defecto                                                                                                                                                                                                                                                                                          | Área                       | Severidad | Estado previo                     |
| --- | ----------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------- | --------- | --------------------------------- |
| D1  | `31:59`–33:45 · clave `32:13`                               | Una fila cuyo nombre de indicador no coincide con ningún indicador existente **se importa igual** y queda como actividad de Gestión de carrera **sin categoría asignada**. En la llamada: "acá lo dejó como gestión... no queda asociado a ninguna categoría"                                    | Importación                | Alta      | Nuevo — "eso tengo que revisarlo" |
| D2  | `33:55`–34:33 · clave `34:02`                               | Una fila **sin fecha válida se importa** en lugar de rechazarse. En la llamada: "debería haberla omitido y arrojado un error, y no ingresarla"                                                                                                                                                   | Importación                | Alta      | Nuevo                             |
| D3  | `30:44`–31:59 · clave `31:36`                               | Los contadores del resultado de importación **no cuadran** con lo que realmente aparece en pantalla; se reportó "importadas 2 / omitidas 64" y una de las filas no apareció donde correspondía. En la llamada: "el mensaje quedó raro"                                                           | Importación                | Media     | Nuevo                             |
| D4  | `40:17`–40:49 · clave `40:30` · + `42:33`, `43:37`, `48:26` | Como director académico **no se abre el plan de otro director**: la fila se pinta como si hubiera plan pero el enlace no se activa. En la llamada: "reconoce como si tuviese plan pero no te lo quiere mostrar"                                                                                  | Vistas por sede / global   | Alta      | Nuevo                             |
| D5  | `43:31`–44:05 · clave `43:38`                               | Se pueden tener **dos años de planificación "en curso" simultáneamente**, sin restricción. Autodiagnóstico en la llamada: es la causa probable de D4, "no está distinguiendo el plan por el año"                                                                                                 | Administración de años     | Alta      | Nuevo                             |
| D6  | `19:08`–19:56 · clave `19:43`                               | El formulario de avance **no limpia el campo de observación** después de guardar, y lo arrastra a la siguiente entrada del historial                                                                                                                                                             | Seguimiento                | Media     | Nuevo                             |
| D7  | `58:04`–59:11 · clave `58:41`                               | Modal de asignación de roles: al editar los inputs finales **se sobreescriben o vacían los primeros**                                                                                                                                                                                            | Administración de usuarios | Media     | Ya anotado como deuda técnica     |
| D8  | `59:11`–1:01:04 · clave `59:18` · + `1:00:09`, `1:01:01`    | Los selectores en cascada no cascadean: elegir carrera **no carga ni bloquea** sede, facultad ni modalidad; las facultades **no se filtran por sede**; cambiar sede **borra** la carrera ya elegida. Consecuencia funcional: se puede asignar un director de una carrera de una sede a otra sede | Administración de usuarios | Alta      | Parcialmente conocido             |
| D9  | `20:53`–21:12 · clave `21:00`                               | Vocabulario de estados inconsistente: **"progreso" y "en curso"** nombran el mismo estado en pantallas distintas                                                                                                                                                                                 | Transversal                | Baja      | Nuevo                             |
| D10 | `55:44`–57:56 · clave `56:47`                               | Al cambiar el estado de una tarea, la fila **salta de grupo de filtro y desaparece** de la vista sin ningún aviso. Es el comportamiento que en una sesión anterior se había interpretado como "los inputs de abajo afectan a los de arriba"                                                      | Seguimiento                | Media     | Ya anotado como deuda técnica     |
| D11 | `49:29`–50:39 · clave `50:38`                               | **"Vacantes" es una métrica muerta**: el número viene de la maqueta, sin lógica ni navegación detrás                                                                                                                                                                                             | Vista global               | Media     | Conocido (artefacto de maqueta)   |
| D12 | `46:21`–47:32 · clave `47:12` · + `51:14`                   | **No hay buscador** en Auditoría (paginada con un tamaño de página muy alto) ni en Estructura académica, que trae todas las carreras desde Banner                                                                                                                                                | Administración             | Media     | Ya anotado como deuda técnica     |
| D13 | `53:30`–54:34 · clave `53:42`                               | Los usuarios desactivados **no se pueden reactivar**, y no hay marca visual ni filtro por estado de actividad. La desactivación reemplazó al borrado de la maqueta justamente para conservar historial, pero el camino de vuelta no existe                                                       | Administración de usuarios | Media     | Nuevo — proceso sin definir       |
| D14 | `13:22`–14:22 · clave `13:59` · **(hablado, aprox.)**       | **Sin validación de rango de fechas**: se creó una meta con inicio 2026 y término 2029 cuando las metas son anuales                                                                                                                                                                              | Plan MODUSS                | Media     | Nuevo                             |
| D15 | `37:44`–38:56 · clave `38:41`                               | Los títulos de sección de los listados por sede y global (decano, director académico, director de facultad, director de escuela) tienen **tan poco peso visual que pasan desapercibidos**, y las etiquetas mismas podrían estar mal asignadas                                                    | Vistas por sede / global   | Baja      | Nuevo                             |




### Por qué D1, D2 y D3 son un solo problema

Los tres son la misma decisión de diseño vista tres veces: **la importación prioriza no perder filas sobre
mantener la integridad del dato**. Una fila con indicador inexistente se degrada a actividad de gestión sin
categoría, una fila sin fecha entra igual, y el contador no refleja ninguna de las dos cosas. El resultado
neto es que el director puede quedar con datos mal categorizados sin enterarse, en el módulo que define
justamente su migración desde Excel. Recomendación de la sesión: rechazar en vez de degradar, y hacer
visible cada omisión con su motivo (ver U3).

---



## Brechas de experiencia levantadas por diseño

Estas son recomendaciones, no defectos, así que la mayoría están marcadas `(hablado)`: la marca recupera el
argumento, no una pantalla. Donde el problema que motiva la recomendación **sí** se ve, se indica en qué
defecto está la evidencia visual.


| ID  | Video                                                                      | Brecha                                                                                                                                                                                                                                                                              | Recomendación concreta                                                                                                                                                                                      |
| --- | -------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| U1  | `7:08`–10:14 · clave `9:35` · **(hablado)**                                | **No hay onboarding ni ayuda dentro del producto.** Los usuarios llegan desde planillas Excel gigantes y el flujo institucional no está descrito en ninguna parte de la interfaz. La respuesta en la llamada fue "vamos a tener que entregar un manual", o sea un documento externo | Definir si el conocimiento del proceso se entrega dentro del producto (onboarding + sección de ayuda) o fuera (manual). Es una decisión de producto, no de implementación, y requiere al director académico |
| U2  | `19:58`–20:53 · clave `20:41` · **(hablado**; evidencia visual en D6**)**  | **Guardar es una escritura silenciosa**: el cambio de porcentaje y el comentario del historial son dos acciones desacopladas, y hoy no es intuitivo asociarlas                                                                                                                      | Paso de confirmación explícito al guardar que **exija el comentario**, acoplando avance y comentario en una sola acción. Resuelve además la mitad de D6                                                     |
| U3  | `34:33`–35:06 · **(hablado**; evidencia visual en D1, D2, D3**)**          | **La importación absorbe datos anómalos sin mostrarlos** (raíz común de D1, D2 y D3)                                                                                                                                                                                                | Segundo paso de previsualización antes de escribir: qué se va a crear, qué se va a omitir y **por qué**, con la opción de aceptar o rechazar por fila anómala                                               |
| U4  | `4:19`–5:13 · clave `4:44` · **(hablado)**                                 | El estado **"convenido"** de las metas no tiene etiqueta visible, aunque la documentación del producto sí lo especifica                                                                                                                                                             | Badge de estado sobre la meta                                                                                                                                                                               |
| U5  | `39:25`–39:48 · clave `39:27` · + `47:47`, `48:06`                         | **Los estados vacíos se pintan como filas accionables**: "no ha creado el plan" se ve igual que una fila con plan, lo que hace indistinguible D4 de un caso legítimo sin plan                                                                                                       | Empty state real, más deshabilitar la acción cuando no hay plan                                                                                                                                             |
| U6  | `53:54`–54:34 · clave `54:23` · **(hablado**; evidencia visual en D13**)** | Un usuario inactivo **no se distingue** de uno activo después de desactivarlo                                                                                                                                                                                                       | Marca visual persistente más filtro por estado de actividad (contraparte de D13)                                                                                                                            |
| U7  | `49:29`–50:39 · clave `50:19` · **(hablado**; evidencia visual en D11**)** | **"Vacantes" informa un número sin salida**                                                                                                                                                                                                                                         | Navegación desde la métrica al listado de carreras sin director asignado (contraparte de D11)                                                                                                               |
| U8  | `37:44`–38:56 · clave `38:41` · **(hablado**; evidencia visual en D15**)** | Jerarquía tipográfica insuficiente en los listados de roles                                                                                                                                                                                                                         | Reforzar el peso de los títulos de sección (contraparte de D15)                                                                                                                                             |
| U9  | `1:01:05`–1:01:26 · **(hablado**; evidencia visual en D8**)**              | El formulario de administración de usuarios **muestra todos los niveles a la vez**, sin relación visible entre ellos                                                                                                                                                                | Divulgación progresiva: revelar los inputs de subnivel a medida que se eligen los niveles superiores. Es el patrón que hace innecesario buena parte de D8                                                   |
| U10 | `41:13`–42:27 · clave `41:14` · **(hablado)**                              | **No hay canal de soporte ni de reporte dentro del producto**: en el piloto los usuarios escriben directo al desarrollador                                                                                                                                                          | Definir el canal de soporte y de reporte de incidencias antes de ampliar el piloto                                                                                                                          |


---



## Reglas de negocio a derivar (no las puede cerrar el equipo de desarrollo)

Cuatro preguntas quedaron sin respuesta en la llamada y no son de implementación. La causa está dicha
explícitamente: "fue más una inducción del sistema que del negocio". Corresponden al director académico que
patrocina el sistema.

1. **¿En qué momento del año se confirma el convenio de metas?** Hoy no hay ningún disparador, recordatorio
  ni validación temporal asociada, porque nadie sabe cuándo debería ocurrir.
   Video `12:38`–13:22 · clave `12:42`
2. **¿Cuál es el objetivo de las categorías de Gestión de carrera?** Qué tiene que lograr el director ahí, y
  contra qué se evalúa. En la llamada: "ahí la verdad, ni idea".
   Video `11:21`–12:00 · clave `11:38`
3. **¿El flujo institucional está documentado en algún lado, y cómo lo aprende un director recién nombrado?**
  Es el insumo que falta para poder decidir U1.
   Video `7:08`–7:33 · clave `7:33`
4. **¿Qué debe calcular y mostrar el módulo de analítica?** Existe y hace cálculos, pero "no está refinado", y
  la función de tendencia está apagada esperando definición.
   Video `45:56`–46:37 · clave `46:21`

---



## Nota sobre componentes: antes de construir estos patrones desde cero

Este repositorio audita el sistema de diseño USS del que ModUSS Planner ya consume tokens (ver
`decisions/013`). Cruzamos cada patrón que la revisión pide contra lo inventariado, y el resultado es
relevante para estimar:

- **Ya existen especificados** (en los archivos Mobile de las librerías locales USS One y Extension Library):
Toast, Modal, Alert message, Stepper, Select, Select date range, Dropdown con búsqueda, Tooltip y Tabs.
Es decir, el toast de U2, el modal de confirmación de U2/U3, el stepper de la previsualización de
importación y los selects de D8 **no hay que inventarlos**, hay que adaptarlos.
- **Existen pero sin promover**: Empty state (U5) y Table siguen en páginas de staging "Testing" de las
librerías locales. Modal está en core en Extension Library pero todavía en Testing en USS One.
- **Advertencia de alcance**: ModUSS Planner es una aplicación **desktop**, y de estos 12 patrones **solo el
badge de estado** (U4, U6) tiene especificación en un archivo Desktop capturado. Todo el resto está
especificado únicamente para Mobile. Al implementar habrá que adaptar de Mobile a Desktop sin una
referencia canónica, lo cual conviene tener presente al estimar y al decidir si vale la pena pedirle al
equipo dueño del sistema de diseño que especifique la variante Desktop.

Salvedad honesta: las capturas Desktop de este repositorio son conocidamente estrechas
(`decisions/009`), así que lo correcto es leer "ausente de las páginas Desktop capturadas", no "no existe en
Figma". Vale la pena confirmarlo con el equipo del sistema de diseño antes de asumir que hay que crear algo.

---

