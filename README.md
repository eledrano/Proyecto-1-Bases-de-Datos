# Proyecto 1 – Bases de Datos

**Intervención sobre una Base de Datos Existente — Agenda Digital "Tres Patitos"**

Estudiante: _(completar)_
Curso: _(completar)_
Fecha de entrega: 15/09/2026

---

## Descripción

Ampliación de la base de datos y de la aplicación de escritorio de la Agenda Digital "Tres Patitos". El proyecto parte de un esquema preexistente (`prototipo` dentro de la base `agenda`) y de una interfaz funcional en Python con CustomTkinter, sobre los cuales se implementan tres módulos adicionales.

## Módulos seleccionados

| Módulo | Requerimientos | Descripción |
|---|---|---|
| Gestión de Ubicaciones | RF-08 a RF-10 | Recintos, salas y auditorios vinculados a los eventos, con análisis de ocupación y prevención de traslapes espaciales. |
| Disponibilidad de Usuarios y Gestión de Tiempos | RF-11 y RF-12 | Registros de disponibilidad temporal por usuario para resolver consultas de concurrencia e intervalos horarios. |
| Tareas Asociadas a Eventos | RF-15 a RF-17 | Subtareas operativas con responsables, prioridades, ciclo de vida y reporte de plazos vencidos. |

**Módulo no seleccionado:** Eventos Recurrentes (RF-13 y RF-14).

## Estructura del repositorio

```
.
├── app/        Aplicación de escritorio en Python (CustomTkinter + psycopg2)
├── capturas/   Evidencias visuales de la interfaz gráfica
├── docs/       Informe, modelos y matriz de trazabilidad
├── sql/        Script base y script de ampliación
└── README.md
```

## Requisitos

- PostgreSQL 18 o superior
- Python 3.10 o superior
- Paquetes de Python: `customtkinter`, `psycopg2-binary`, `tkcalendar`

```bash
pip install customtkinter psycopg2-binary tkcalendar
```

## Instalación

1. Crear la base de datos `agenda` en la instancia local de PostgreSQL.
2. Ejecutar `sql/script_base.sql` para levantar el esquema `prototipo` original.
3. Ejecutar `sql/script_ampliado.sql` para crear las tablas, restricciones y vistas de los tres módulos.
4. Ajustar el diccionario `conn_params` en `app/agenda.py` con el host, puerto, usuario y contraseña de la instalación local.
5. Ejecutar `python app/agenda.py`.

### Verificación de la restauración

```sql
SELECT table_name, table_type
FROM information_schema.tables
WHERE table_schema = 'prototipo'
ORDER BY table_type, table_name;
```

## Estructuras nuevas (borrador)

Diseño preliminar sujeto a ajuste durante las fases conceptual y lógica.

**UBICACIONES** (`id_ubicacion` [PK], `nombre`, `direccion`, `capacidad`)
Se agrega `id_ubicacion` [FK] a la tabla `eventos` para vincular cada actividad con su recinto.

**DISPONIBILIDAD_USUARIOS** (`id_disponibilidad` [PK], `id_usuario` [FK], `dia_semana`, `hora_inicio`, `hora_fin`)
Bloques horarios en que cada usuario está disponible, con restricción de coherencia entre hora de inicio y de fin.

**TAREAS** (`id_tarea` [PK], `id_evento` [FK], `id_responsable` [FK], `titulo`, `descripcion`, `prioridad`, `estado`, `fecha_limite`)
Dependiente del evento con borrado en cascada; el responsable apunta a `usuarios`.

## Estado del proyecto

El detalle por requerimiento y fase se mantiene en `docs/matriz_trazabilidad.md`.
