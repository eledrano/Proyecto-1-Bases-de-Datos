SET search_path TO prototipo, public;

CREATE TABLE tipos_disponibilidad (
    id_tipo SERIAL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE ubicaciones (
    id_ubicacion SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    capacidad INT NOT NULL CHECK (capacidad > 0)
);

INSERT INTO tipos_disponibilidad (nombre) VALUES
    ('Disponible'), ('Ocupado'), ('No disponible');

INSERT INTO ubicaciones (nombre, direccion, ciudad, capacidad) VALUES
    ('Auditorio Principal', 'Edificio A, primer piso', 'San José', 200),
    ('Sala de Conferencias B', 'Edificio B, segundo piso', 'Cartago', 40),
    ('Sala de Reuniones 1', 'Edificio A, tercer piso', 'San José', 12);

ALTER TABLE eventos ADD COLUMN id_ubicacion INT;

UPDATE eventos SET id_ubicacion = 1 WHERE id_ubicacion IS NULL;

ALTER TABLE eventos
    ALTER COLUMN id_ubicacion SET NOT NULL,
    ADD CONSTRAINT fk_evento_ubicacion
        FOREIGN KEY (id_ubicacion) REFERENCES ubicaciones(id_ubicacion)
        ON DELETE RESTRICT;

CREATE TABLE disponibilidades (
    id_disponibilidad SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_tipo INT NOT NULL,
    fecha DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    CONSTRAINT chk_horas CHECK (hora_fin > hora_inicio),
    CONSTRAINT fk_disponibilidades_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    CONSTRAINT fk_disponibilidades_tipo FOREIGN KEY (id_tipo)
        REFERENCES tipos_disponibilidad(id_tipo) ON DELETE RESTRICT
);

CREATE TABLE tareas (
    id_tarea SERIAL PRIMARY KEY,
    id_evento INT NOT NULL,
    id_usuario INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT,
    prioridad VARCHAR(10) NOT NULL DEFAULT 'Media',
    estado VARCHAR(15) NOT NULL DEFAULT 'Pendiente',
    fecha_limite DATE,
    CONSTRAINT fk_tareas_evento FOREIGN KEY (id_evento)
        REFERENCES eventos(id_evento) ON DELETE CASCADE,
    CONSTRAINT fk_tareas_usuario FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario) ON DELETE RESTRICT,
    CONSTRAINT chk_tareas_prioridad CHECK (prioridad IN ('Alta','Media','Baja')),
    CONSTRAINT chk_tareas_estado CHECK (estado IN ('Pendiente','En progreso','Completada','Cancelada'))
);

INSERT INTO usuarios (nombre, apellido) VALUES
    ('Ana', 'Rojas'), ('Luis', 'Mora'), ('Carla', 'Vega');

INSERT INTO categorias (nombre, id_categoria_padre) VALUES
    ('Trabajo', NULL), ('Personal', NULL);
INSERT INTO categorias (nombre, id_categoria_padre) VALUES
    ('Reuniones', 1), ('Capacitaciones', 1);

insert into eventos (id_usuario_propietario, id_categoria, id_ubicacion, titulo, descripcion, fecha_inicio, fecha_fin) values
	('2', '2', '3', 'Anniversario', null, '2026-10-14 14:00', '2026-10-14 17:00'),	
	('1', '2', '1', 'Cumpleaños', null, '2027-03-29 11:00', '2027-03-29 15:00'),
	('1', '1', '1', 'Lanzamiento App', null, '2026-10-31 9:00', '2026-10-31 11:00'),
	('3', '4', '2', 'Inducción', null, '2026-09-18 8:00', '2026-09-18 17:00'),
	('2', '3', '3', 'Proyecto VMax', null, '2026-10-13 10:00', '2026-10-14 15:00');

-- Consulta RF-10
create view vista_ranking_ubicaciones as
	select u.nombre, count(e.id_evento ) as total_eventos
	from ubicaciones u
	left join eventos e on u.id_ubicacion = e.id_ubicacion
	group by u.nombre order by total_eventos  desc 

-- Consulta RF-09

create view vista_eventos_simultaneos as
	select e1.titulo as evento_1, e1.fecha_inicio as inicio_1, e1.fecha_fin as fin_1,
	       e2.titulo as evento_2, e2.fecha_inicio as inicio_2, e2.fecha_fin as fin_2, e1.id_ubicacion 
	from eventos e1 join eventos e2 on e1.id_ubicacion = e2.id_ubicacion 
	where e1.id_evento < e2.id_evento 
	and e1.fecha_fin < e2.fecha_fin and e2.fecha_inicio < e1.fecha_fin 

-- Consulta RF-12

create view vista_usuarios_ocupados as
select u.id_usuario, u.nombre, u.apellido,
       e.fecha_inicio as ocupado_desde, e.fecha_fin as ocupado_hasta,
       e.titulo as motivo
from usuarios u
join eventos e on e.id_usuario_propietario = u.id_usuario
where u.activo = true 
union all
select u.id_usuario, u.nombre, u.apellido,
       (d.fecha + d.hora_inicio), (d.fecha + d.hora_fin), td.nombre
from usuarios u
join disponibilidades d on d.id_usuario = u.id_usuario
join tipos_disponibilidad td on td.id_tipo = d.id_tipo
where td.nombre in ('Ocupado', 'No disponible') and u.activo = true;

create view vista_franjas_disponibles as
	select u.id_usuario, u.nombre, u.apellido,
		(d.fecha + d.hora_inicio) as disponible_desde,
       	(d.fecha + d.hora_fin) as disponible_hasta,
       	td.nombre as tipo
	from usuarios u
	join disponibilidades d on d.id_usuario = u.id_usuario
	join tipos_disponibilidad td on td.id_tipo = d.id_tipo
	where td.nombre = 'Disponible' and u.activo = true;

insert into tareas (id_evento, id_usuario, titulo, descripcion, fecha_limite) values
	('4', '2', 'Documentar funciones', null, '2026-09-30'),
	('1', '2', 'Comprar pastel', null, '2027-03-28'),
	('3', '3', 'Diseñar guías', null, '2026-09-09');

-- Consultas RF-16

create view vista_tareas_pendientes_usuario as
select u.id_usuario, u.nombre, u.apellido,
       count(t.id_tarea) as total_pendientes
from usuarios u
left join tareas t on t.id_usuario = u.id_usuario
                   and t.estado in ('Pendiente', 'En progreso')
where u.activo = true
group by u.id_usuario, u.nombre, u.apellido
order by total_pendientes desc;

create view vista_eventos_tareas_vencidas as
select e.id_evento, e.titulo, e.fecha_inicio,
       count(t.id_tarea) as tareas_vencidas
from eventos e
join tareas t on t.id_evento = e.id_evento
where t.fecha_limite < current_date
  and t.estado in ('Pendiente', 'En progreso')
group by e.id_evento, e.titulo, e.fecha_inicio
order by tareas_vencidas desc;
