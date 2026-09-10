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