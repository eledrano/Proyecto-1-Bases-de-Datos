USUARIOS (id_usuario[PK], nombre, apellido, fecha_registro, activo)
CATEGORIAS (id_categoria[PK], nombre, id_categoria_padre[FK])
EVENTOS (id_evento[PK], titulo, descripcion, fecha_inicio, fecha_fin, id_usuario_propietario[FK], id_categoria[FK], id_ubicacion[FK])
LOG_ACCESOS (id_log[PK], fecha_acceso, id_usuario[FK])
PARTICIPACIONES (id_evento[PK/FK], id_usuario[PK/FK], rol, estado_confirmacion)
UBICACIONES (id_ubicacion[PK], nombre, ciudad, direccion, capacidad)
TAREAS (id_tarea[PK], titulo, descripcion, fecha_limite, prioridad, estado, id_evento[FK], id_usuario[FK])
DISPONIBILIDADES (id_disponibilidad[PK], fecha, hora_inicio, hora_fin, id_usuario[FK], id_tipo[FK])
TIPOS_DISPONIBILIDAD (id_tipo[PK], nombre)
USUARIO_TELEFONOS (id_usuario[PK/FK], telefono[PK])
USUARIO_EMAILS (id_usuario[PK/FK], correo[PK])

Ampliación del Modelo

Se incorporan cuatro nuevas entidades: UBICACIONES, DISPONIBILIDADES, TIPO_DISPONIBILIDADES y TAREAS. Su rol en el proyecto es cubrir
los Modulos de Gestión de Ubicaciones, Tareas Asociadas a Eventos y Disponibilidad de Usuarios y Gestión de Tiempo. Aplicando además
un FK de UBICACIONES a EVENTOS para mejor trazabilidad. 

Ubicaciones: Se hará obligatorio que todo evento este ligado a un reciento físico, esto cumpliento con la RF-09. Además de que un
evento sin ubicación pierde trazabilidad y análisis.

Disponibilidades: Mediante la aplicación de horas de inicio y final se establecen franjas para establecer la realización de un evento
y que de esta manera no se agenden con choques de horario. Con esto se trabaja directamente en evacuar la RF-11 y RF-12.

Tareas: Para cubrir desde la RF-15 a la RF-17 se busca integrar tareas dependientes de cada evento que el usuario tenga registrado y
que el mismo debe ejecutar. Con ello los parametros de prioridad y estados se encargan de dar forma a que se cumplan las tareas como
regla de negocio y se inste al usuario a realizar sus pendientes.