create database colegioDB;

use colegioDB;

-- Tablas para registtro de usuarios y derivados

CREATE TABLE Usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    tipo_usuario ENUM('Administrador', 'Profesor', 'Alumno') NOT NULL
);

CREATE TABLE Administradores (
    id_admin INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    nivel_acceso VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE
);


CREATE TABLE Profesores (
    id_profesor INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    especialidad VARCHAR(100) NOT NULL,
    departamento VARCHAR(100),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE
);

CREATE TABLE Alumnos (
    id_alumno INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    carrera VARCHAR(100) NOT NULL,
    mora DECIMAL(5,2) DEFAULT 0.00,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE
);

-- Tablas para registro de materiales y derivados
CREATE TABLE Materiales (
    id_material INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100),
    ubicacion VARCHAR(100),
    cantidad_disponible INT NOT NULL,
    tipo ENUM('Libro', 'Revista', 'Tesis', 'CD', 'Documento') NOT NULL
);

CREATE TABLE Libros (
    id_libro INT PRIMARY KEY AUTO_INCREMENT,
    id_material INT UNIQUE,
    genero VARCHAR(100),
    editorial VARCHAR(100),
    año_publicacion INT,
    numero_paginas INT NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    FOREIGN KEY (id_material) REFERENCES Materiales(id_material) ON DELETE CASCADE
);

CREATE TABLE Revistas (
    id_revista INT PRIMARY KEY AUTO_INCREMENT,
    id_material INT UNIQUE,
    volumen INT,
    numero INT,
    mes_publicacion VARCHAR(20),
    FOREIGN KEY (id_material) REFERENCES Materiales(id_material) ON DELETE CASCADE
);

CREATE TABLE Tesis (
    id_tesis INT PRIMARY KEY AUTO_INCREMENT,
    id_material INT UNIQUE,
    universidad VARCHAR(100),
    carrera VARCHAR(100),
    año_publicacion INT,
    FOREIGN KEY (id_material) REFERENCES Materiales(id_material) ON DELETE CASCADE
);

CREATE TABLE CDs (
    id_cd INT PRIMARY KEY AUTO_INCREMENT,
    id_material INT UNIQUE,
    formato VARCHAR(50),
    duracion TIME,
    FOREIGN KEY (id_material) REFERENCES Materiales(id_material) ON DELETE CASCADE
);

CREATE TABLE Documentos (
    id_documento INT PRIMARY KEY AUTO_INCREMENT,
    id_material INT UNIQUE,
    tipo_documento VARCHAR(100),
    fuente VARCHAR(150),
    FOREIGN KEY (id_material) REFERENCES Materiales(id_material) ON DELETE CASCADE
);

-- Tablas para gestion de prestamos y mora
CREATE TABLE Prestamos (
    id_prestamo INT PRIMARY KEY AUTO_INCREMENT,
    id_alumno INT, -- Ahora solo alumnos pueden hacer préstamos
    id_material INT,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE,
    estado ENUM('Prestado', 'Devuelto', 'Retrasado') NOT NULL DEFAULT 'Prestado',
    FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno),
    FOREIGN KEY (id_material) REFERENCES Materiales(id_material)
);

CREATE TABLE Moras (
    id_mora INT PRIMARY KEY AUTO_INCREMENT,
    id_alumno INT,
    id_prestamo INT,
    monto DECIMAL(5,2) NOT NULL,
    fecha_registro DATE NOT NULL,
    estado ENUM('Pendiente', 'Pagado') DEFAULT 'Pendiente',
    FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno),
    FOREIGN KEY (id_prestamo) REFERENCES Prestamos(id_prestamo)
);

-- Tabla configuraciones para la gestion de del sistema, 
-- permite establecer parametros generales sin necesidad de modificar el codigo directamente
CREATE TABLE Configuraciones (
    id_config INT PRIMARY KEY AUTO_INCREMENT,
    max_prestamos INT DEFAULT 3,
    mora_diaria DECIMAL(5,2) DEFAULT 0.50
);

-- Sentencia Update requerida para la tabla moras
UPDATE Moras 
SET monto = (
    DATEDIFF(CURDATE(), fecha_registro) * (SELECT mora_diaria FROM Configuraciones)
)
WHERE estado = 'Pendiente';

-- Desactivacion del modo seguro para ejecutar sentencia Update en la tabla Moras
SELECT @@sql_safe_updates;
SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;

-- REGISTRO DE DATOS MODO PRUEBA -----------------------------------------------------------

-- Tabla Usuarios
INSERT INTO Usuarios (nombre, apellido, correo, contraseña, tipo_usuario) 
VALUES ('Juan', 'Pérez', 'juan.perez@email.com', 'password123', 'Administrador');

INSERT INTO Usuarios (nombre, apellido, correo, contraseña, tipo_usuario) 
VALUES ('Javier', 'Ortiz', 'javier.ortiz@email.com', 'password456', 'Profesor');

INSERT INTO Usuarios (nombre, apellido, correo, contraseña, tipo_usuario) 
VALUES ('Victor', 'Nolasco', 'victor.nolasco@email.com', 'password789', 'Alumno');

INSERT INTO Usuarios (nombre, apellido, correo, contraseña, tipo_usuario) 
VALUES ('Usuario', 'Prueba', 'usuario.prueba@email.com', 'password789', 'Alumno');

-- delete from Usuarios where id_usuario = 5;
select *from Usuarios;

-- Tabla Administradores
INSERT INTO Administradores (id_usuario, nivel_acceso) 
VALUES (1, 'Super Administrador');

INSERT INTO Administradores (id_usuario, nivel_acceso) 
VALUES (1, 'Encargado de Biblioteca');

INSERT INTO Administradores (id_usuario, nivel_acceso) 
VALUES (1, 'Soporte Tecnico');

select *from Administradores;

-- Tabla Profesores
INSERT INTO Profesores (id_usuario, especialidad, departamento) 
VALUES (2, 'Matemáticas', 'Ciencias Exactas');

select *from Profesores;

-- Tabla Alumnos
INSERT INTO Alumnos (id_usuario, carrera, mora) 
VALUES (3, 'Ingeniería en Sistemas', 0.00);

INSERT INTO Alumnos (id_usuario, carrera, mora) 
VALUES (3, 'Ingenieria Civi', 0.00);

INSERT INTO Alumnos (id_usuario, carrera, mora) 
VALUES (3, 'Licenciatura en Diseño Grafico', 0.00);

select *from Alumnos;
select usuarios.id_usuario, usuarios.nombre, usuarios.apellido, alumnos.id_alumno,alumnos.carrera 
from Usuarios inner join Alumnos on Usuarios.id_usuario = Alumnos.id_usuario;

-- Tabla Materiales
INSERT INTO Materiales (titulo, autor, ubicacion, cantidad_disponible, tipo) 
VALUES ('El arte de la programación', 'Donald Knuth', 'Estante 3B', 5, 'Libro');

INSERT INTO Materiales (titulo, autor, ubicacion, cantidad_disponible, tipo) 
VALUES ('Revista de Ciencia', 'Varios Autores', 'Estante 2A', 10, 'Revista');

INSERT INTO Materiales (titulo, autor, ubicacion, cantidad_disponible, tipo) 
VALUES ('Tesis sobre Inteligencia Artificial', 'María López', 'Estante 4C', 2, 'Tesis');

INSERT INTO Materiales (titulo, autor, ubicacion, cantidad_disponible, tipo) 
VALUES ('Aprendiendo Java', 'Curso Online', 'Archivo Digital', 8, 'CD');

INSERT INTO Materiales (titulo, autor, ubicacion, cantidad_disponible, tipo) 
VALUES ('Informe de Tecnologías Emergentes', 'Instituto de Tecnología', 'Estante 5D', 3, 'Documento');

select *from Materiales;

-- Sub tablas de Materiales
-- Libros
INSERT INTO Libros (id_material, genero, editorial, año_publicacion, numero_paginas, isbn) 
VALUES (1, 'Informática', 'MIT Press', 2005, 700, '978-0262033848');

select * from Libros;

-- Revistas
INSERT INTO Revistas (id_material, volumen, numero, mes_publicacion) 
VALUES (2, 45, 7, 'Julio');
select * from Revistas;

-- Tesis
INSERT INTO Tesis (id_material, universidad, carrera, año_publicacion) 
VALUES (3, 'Universidad Nacional', 'Física Aplicada', 2021);

select * from Tesis;

-- CDs
INSERT INTO CDs (id_material, formato, duracion) 
VALUES (4, 'MP3', '01:15:00');

select * from CDs;

-- Documentos
INSERT INTO Documentos (id_material, tipo_documento, fuente) 
VALUES (5, 'Informe Técnico', 'Ministerio de Educación');

select *from Documentos;

-- Registro en Prestamo y Moras
INSERT INTO Prestamos (id_alumno, id_material, fecha_prestamo, fecha_devolucion, estado) 
VALUES (1, 5, '2025-05-01', '2025-05-10', 'Prestado');

INSERT INTO Prestamos (id_alumno, id_material, fecha_prestamo, fecha_devolucion, estado) 
VALUES (2, 3, '2025-04-20', '2025-04-30', 'Devuelto');

INSERT INTO Prestamos (id_alumno, id_material, fecha_prestamo, fecha_devolucion, estado) 
VALUES (3, 4, '2025-05-01', '2025-05-08', 'Retrasado');

select *from Prestamos;


INSERT INTO Configuraciones (max_prestamos, mora_diaria) 
VALUES (3, 0.50);

-- UPDATE Configuraciones SET mora_diaria = 0.75 WHERE id_config = 1;

select *from Configuraciones;

INSERT INTO Moras (id_alumno, id_prestamo, monto, fecha_registro, estado) 
VALUES (3, 3, (DATEDIFF('2025-05-15', '2025-05-10') * (SELECT mora_diaria FROM Configuraciones)), '2025-05-15', 'Pendiente');


select *from Moras;


