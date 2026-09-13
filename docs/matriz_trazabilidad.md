## Matriz de Trazabilidad y Estado de Implementación

Proyecto 1 – Intervención sobre una Base de Datos Existente
Agenda Digital "Tres Patitos"

Módulos seleccionados: Gestión de Ubicaciones · Disponibilidad de Usuarios y Gestión de Tiempos · Tareas Asociadas a Eventos

---

## Módulo de Gestión de Ubicaciones

| Req. | Fase | Tarea | Estado |
|---|---|---|---|
| RF-08 | 1. Modelo Conceptual | Definir la entidad `ubicaciones` y sus atributos obligatorios: id_ubicacion (PK), nombre, direccion, ciudad y capacidad. | Completado |
| | 2. Modelo Lógico | Estructurar la tabla relacional `ubicaciones` especificando tipos de datos y su clave primaria. | Completado |
| | 3. Modelo Físico | Codificar el comando CREATE TABLE en PostgreSQL asegurando restricciones de nulidad y tipos óptimos. | Completado |
| | 4. Interfaz Gráfica (GUI) | Desarrollar la pestaña y tabla de ubicaciones junto al formulario de entradas para registrar, consultar, actualizar y eliminar recintos | Completado |
| RF-09 | 1. Modelo Conceptual | Establecer la relación de cardinalidad entre la entidad Eventos y la entidad ubicaciones mediante la clave foránea id_ubicacion.  | Completado |
| | 2. Modelo Lógico | Incorporar el atributo id_ubicacion como Clave Foránea (FK) en el esquema relacional de eventos para estructurar consultas complejas.  | Completado |
| | 3. Modelo Físico | Ejecutar la sentencia en PostgreSQL para añadir la relación referencial y soportar la detección de eventos simultáneos en un mismo recinto.  | Completado |
| | 4. Interfaz Gráfica (GUI) | Integrar consultas y selectores en la interfaz para consultar el histórico por ubicación y prevenir conflictos de espacio temporal. | Pendiente |
| RF-10 | 3. Modelo Físico | Diseñar y escribir las consultas para calcular el ranking de recintos más solicitados y con mayor volumen de eventos.  | Completado |
| | 4. Interfaz Gráfica (GUI) | Implementar un panel de reportes de solo lectura en la GUI para mostrar la tasa de uso de los espacios y la demanda operativa. | Pendiente |

---

## Módulo de Disponibilidad de Usuarios y Gestión de Tiempos

| Req. | Fase | Tarea | Estado |
|---|---|---|---|
| RF-11 | 1. Modelo Conceptual | Definir la entidad disponibilidades vinculada al perfil del usuario y el catálogo tipos_disponibilidad con sus atributos obligatorios de fecha y horas. | Completado |
| | 2. Modelo Lógico | Estructurar las tablas relacionales para el control de disponibilidades y su clave foranea hacia usuarios.  | Completado |
| | 3. Modelo Físico | Codificar la creación de tablas y catálogos en PostgreSQL asegurando la integridad de las franjas temporales.  | Completado |
| | 4. Interfaz Gráfica (GUI) | Desarrollar el módulo en la interfaz para que los usuarios administren sus periodos libres u ocupados mediante operaciones CRUD completas.  | Pendiente |
| RF-12 | 3. Modelo Físico | Estructurar las consultas analíticas en el motor de base de datos para la detección de cruces o traslapes temporales entre eventos y disponibilidades.  | Completado |
| | 4. Interfaz Gráfica (GUI) | Integrar las salidas analíticas en la GUI para determinar automáticamente usuarios libres y disponibles en un rango horario específico.  | Pendiente |

---

## Módulo de Tareas Asociadas a Eventos

| Req. | Fase | Tarea | Estado |
|---|---|---|---|
| RF-15 | 1. Modelo Conceptual | Definir la entidad tareas vinculada a eventos con atributos de título, descripción, prioridad, fecha límite, responsable y estados. | Completado |
| | 2. Modelo Lógico | Establecer las claves foráneas que relacionan cada tarea con su evento y usuario responsable. | Completado |
| | 3. Modelo Físico | Ejecutar la creación de la tabla tareas en PostgreSQL con restricciones para los estados predefinidos. | Completado |
| | 4. Interfaz Gráfica (GUI) | Habilitar formularios de control para que cada usuario realice un CRUD completo (crear, leer, actualizar estados y eliminar) desde la interfaz. | Completado |
| RF-16 | 3. Modelo Físico | Desarrollar las consultas orientadas a medir el rendimiento, tareas pendientes por usuario y detección de pendientes vencidos fuera de plazo.  | Completado |
| | 4. Interfaz Gráfica (GUI) | Configurar el despliegue de estas métricas operativas directamente en las pantallas de la aplicación.  | Pendiente |
| RF-17 | 3. Modelo Físico | Estructurar la consulta del reporte analítico cuantitativo para filtrar tareas activas por estado y plazos vencidos. | Completado |
| | 4. Interfaz Gráfica (GUI) | Integrar el reporte de seguimiento dentro de la interfaz del módulo de tareas para la detección temprana de sobrecargas de trabajo.  | Pendiente |
