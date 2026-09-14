# Proyecto 1 – Bases de Datos

Estudiante: Luis Orlando Medrano González
Carné: 2024174076

---

## Descripción

Extender la base de datos existente de la agenda "Tres Patitos" e implementar la lógica necesaria para que el sistema funcione correctamente

## Módulos seleccionados

| Módulo | Requerimientos | Descripción |
|---|---|---|
| Gestión de Ubicaciones | RF-08 a RF-10 | Administra recintos físicos, salas y auditorios vinculados a los eventos mediante claves foráneas, habilitando análisis de ocupación y prevención de traslapes espaciales. |
| Disponibilidad de Usuarios y Gestión de Tiempos | RF-11 y RF-12 | Introduce registros de disponibilidad temporal por usuario para resolver consultas de concurrencia e intervalos horarios.  |
| Tareas Asociadas a Eventos | RF-15 a RF-17 | Incorpora subtareas operativas con responsables, prioridades, ciclos de vida y reportes de plazos vencidos.  |


## Estructura del repositorio

\docs: Almacena la documentación del proyecto, matriz de trazabilidad, el modelo conceptual y modelo lógico.
\sql: Almacena el script base y el script ampliado.
\app: Almacena el archivo .py de la agenda con la interfaz.
