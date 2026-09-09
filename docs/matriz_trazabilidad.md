# Matriz de Trazabilidad y Estado de Implementación

**Proyecto 1 – Intervención sobre una Base de Datos Existente**
Agenda Digital "Tres Patitos"

**Módulos seleccionados:** Gestión de Ubicaciones · Disponibilidad de Usuarios y Gestión de Tiempos · Tareas Asociadas a Eventos

**Módulo no seleccionado:** Eventos Recurrentes (RF-13 y RF-14).

**Estados posibles:** Pendiente · En progreso · Completado

---

## Módulo de Gestión de Ubicaciones

| Req. | Fase | Tarea | Estado |
|---|---|---|---|
| RF-08 | 1. Modelo Conceptual | Definir la entidad `ubicaciones` y sus atributos obligatorios: id_ubicacion (PK), nombre, direccion, ciudad y capacidad. | Pendiente |
| | 2. Modelo Lógico | Estructurar la tabla relacional `ubicaciones` con tipos de datos y clave primaria. | Pendiente |
| | 3. Modelo Físico | Codificar el CREATE TABLE en PostgreSQL con restricciones de nulidad y tipos óptimos. | Pendiente |
| | 4. Interfaz Gráfica | Desarrollar la pestaña, tabla y formulario CRUD de recintos. | Pendiente |
| RF-09 | 1. Modelo Conceptual | Establecer la relación y cardinalidad entre `eventos` y `ubicaciones`. | Pendiente |
| | 2. Modelo Lógico | Incorporar `id_ubicacion` como clave foránea en el esquema de eventos. | Pendiente |
| | 3. Modelo Físico | Ejecutar el ALTER TABLE de la relación referencial y soportar la detección de eventos simultáneos en un mismo recinto. | Pendiente |
| | 4. Interfaz Gráfica | Integrar el selector de ubicación y las consultas de histórico y conflictos de espacio. | Pendiente |
| RF-10 | 3. Modelo Físico | Diseñar la consulta del ranking de recintos más solicitados por volumen de eventos. | Pendiente |
| | 4. Interfaz Gráfica | Implementar el panel de reportes de solo lectura con la tasa de uso de los espacios. | Pendiente |

---

## Módulo de Disponibilidad de Usuarios y Gestión de Tiempos

| Req. | Fase | Tarea | Estado |
|---|---|---|---|
| RF-11 | 1. Modelo Conceptual | Definir la entidad `disponibilidades` vinculada al usuario y el catálogo `tipos_disponibilidad`, con fecha, hora de inicio y hora de fin. | Pendiente |
| | 2. Modelo Lógico | Estructurar ambas tablas y la clave foránea hacia `usuarios`. | Pendiente |
| | 3. Modelo Físico | Codificar la creación de tablas y catálogo asegurando la integridad de las franjas temporales. | Pendiente |
| | 4. Interfaz Gráfica | Desarrollar el CRUD de periodos libres u ocupados por usuario. | Pendiente |
| RF-12 | 3. Modelo Físico | Estructurar las consultas de detección de cruces o traslapes entre eventos y disponibilidades. | Pendiente |
| | 4. Interfaz Gráfica | Integrar la consulta de usuarios libres en un rango horario específico. | Pendiente |

---

## Módulo de Tareas Asociadas a Eventos

| Req. | Fase | Tarea | Estado |
|---|---|---|---|
| RF-15 | 1. Modelo Conceptual | Definir la entidad `tareas` vinculada a eventos, con título, descripción, prioridad, fecha límite, responsable y estados. | Pendiente |
| | 2. Modelo Lógico | Establecer las claves foráneas hacia el evento y el usuario responsable. | Pendiente |
| | 3. Modelo Físico | Crear la tabla en PostgreSQL con la restricción CHECK de los estados predefinidos. | Pendiente |
| | 4. Interfaz Gráfica | Habilitar el CRUD completo, incluida la actualización de estados. | Pendiente |
| RF-16 | 3. Modelo Físico | Desarrollar las consultas de tareas pendientes por usuario y eventos con tareas vencidas. | Pendiente |
| | 4. Interfaz Gráfica | Desplegar estas métricas operativas en las pantallas de la aplicación. | Pendiente |
| RF-17 | 3. Modelo Físico | Estructurar la consulta del reporte cuantitativo de tareas activas por estado y plazos vencidos. | Pendiente |
| | 4. Interfaz Gráfica | Integrar el reporte de seguimiento para detectar sobrecargas de trabajo. | Pendiente |
