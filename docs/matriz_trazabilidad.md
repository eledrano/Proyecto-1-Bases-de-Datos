# Matriz de Trazabilidad y Estado de Implementación

**Proyecto 1 – Intervención sobre una Base de Datos Existente**
Agenda Digital "Tres Patitos"

**Módulos seleccionados:** Gestión de Ubicaciones · Disponibilidad de Usuarios y Gestión de Tiempos · Tareas Asociadas a Eventos

**Módulo no seleccionado:** Eventos Recurrentes (RF-13 y RF-14), conforme al requisito de implementar tres de los cuatro módulos disponibles.

**Estados posibles:** Pendiente · En progreso · Completado

---

## Módulo 1 — Gestión de Ubicaciones

| Req. | Fase | Tarea | Estado |
|---|---|---|---|
| RF-08 | 1. Modelo Conceptual | Definir la entidad `ubicaciones` con sus atributos obligatorios (id_ubicacion, nombre, direccion, capacidad). | Pendiente |
| | 2. Modelo Lógico | Estructurar la tabla relacional especificando tipos de datos y clave primaria. | Pendiente |
| | 3. Modelo Físico | Especificar tipos optimizados en PostgreSQL y restricción CHECK sobre capacidad. | Pendiente |
| | 4. Implementación (SQL) | Crear la tabla en el esquema `prototipo` y cargar datos de prueba. | Pendiente |
| | 5. Interfaz Gráfica | Construir el CRUD de ubicaciones en la aplicación de escritorio. | Pendiente |
| RF-09 | 1. Modelo Conceptual | Definir la relación entre EVENTOS y UBICACIONES con su cardinalidad. | Pendiente |
| | 2. Modelo Lógico | Declarar la clave foránea `id_ubicacion` en la tabla de eventos. | Pendiente |
| | 3. Modelo Físico | Definir la regla de borrado/actualización de la clave foránea. | Pendiente |
| | 4. Implementación (SQL) | Alterar la tabla `eventos` para incorporar la clave foránea. | Pendiente |
| | 5. Interfaz Gráfica | Agregar el selector desplegable de ubicación en el formulario de eventos. | Pendiente |
| RF-10 | 1. Modelo Conceptual | Identificar la necesidad analítica de ocupación y traslape espacial. | Pendiente |
| | 2. Modelo Lógico | Definir la consulta de ocupación sobre eventos y ubicaciones. | Pendiente |
| | 3. Modelo Físico | Diseñar la vista de ocupación y la detección de traslapes por ubicación. | Pendiente |
| | 4. Implementación (SQL) | Crear la vista y validar los resultados con datos de prueba. | Pendiente |
| | 5. Interfaz Gráfica | Mostrar el reporte de ocupación en el panel correspondiente. | Pendiente |

---

## Módulo 2 — Disponibilidad de Usuarios y Gestión de Tiempos

| Req. | Fase | Tarea | Estado |
|---|---|---|---|
| RF-11 | 1. Modelo Conceptual | Definir la entidad de disponibilidad y su relación con USUARIOS. | Pendiente |
| | 2. Modelo Lógico | Estructurar la tabla con clave primaria y clave foránea al usuario. | Pendiente |
| | 3. Modelo Físico | Definir tipos temporales y restricción CHECK de coherencia de horas. | Pendiente |
| | 4. Implementación (SQL) | Crear la tabla y cargar bloques de disponibilidad de prueba. | Pendiente |
| | 5. Interfaz Gráfica | Construir el CRUD de disponibilidad por usuario. | Pendiente |
| RF-12 | 1. Modelo Conceptual | Identificar la necesidad de resolver concurrencia e intervalos horarios. | Pendiente |
| | 2. Modelo Lógico | Definir la consulta que cruza disponibilidad con eventos programados. | Pendiente |
| | 3. Modelo Físico | Diseñar la vista o consulta de intervalos libres y choques de horario. | Pendiente |
| | 4. Implementación (SQL) | Crear la vista y validar los casos de traslape. | Pendiente |
| | 5. Interfaz Gráfica | Mostrar la consulta de disponibilidad en el panel correspondiente. | Pendiente |

---

## Módulo 3 — Tareas Asociadas a Eventos

| Req. | Fase | Tarea | Estado |
|---|---|---|---|
| RF-15 | 1. Modelo Conceptual | Definir la entidad `tareas` y su dependencia respecto a EVENTOS y al responsable. | Pendiente |
| | 2. Modelo Lógico | Estructurar la tabla con claves foráneas a evento y a usuario responsable. | Pendiente |
| | 3. Modelo Físico | Definir tipos de datos, prioridad y regla de borrado en cascada desde el evento. | Pendiente |
| | 4. Implementación (SQL) | Crear la tabla y cargar tareas de prueba. | Pendiente |
| | 5. Interfaz Gráfica | Construir el CRUD de tareas asociado al evento seleccionado. | Pendiente |
| RF-16 | 1. Modelo Conceptual | Definir el ciclo de vida de la tarea y sus estados válidos. | Pendiente |
| | 2. Modelo Lógico | Incorporar el atributo de estado al modelo relacional. | Pendiente |
| | 3. Modelo Físico | Restringir los valores admitidos mediante CHECK y definir el valor por defecto. | Pendiente |
| | 4. Implementación (SQL) | Implementar la restricción y probar transiciones de estado. | Pendiente |
| | 5. Interfaz Gráfica | Permitir el cambio de estado desde el formulario de tareas. | Pendiente |
| RF-17 | 1. Modelo Conceptual | Identificar la necesidad del reporte de plazos vencidos. | Pendiente |
| | 2. Modelo Lógico | Definir la consulta de tareas con fecha límite superada y estado no cerrado. | Pendiente |
| | 3. Modelo Físico | Diseñar la vista de tareas vencidas con cálculo dinámico del atraso. | Pendiente |
| | 4. Implementación (SQL) | Crear la vista y validar los resultados con datos de prueba. | Pendiente |
| | 5. Interfaz Gráfica | Mostrar el reporte de tareas vencidas en el panel correspondiente. | Pendiente |
