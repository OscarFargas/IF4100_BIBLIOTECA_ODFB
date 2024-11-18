	--CREATE DATABASE IF4000_BIBLIOTECA_LAB5

	--CREATE SCHEMA BIBLIOTECA 

	USE IF4000_BIBLIOTECA_LAB5


	----Creacion de las tablas de usuarios

	--CREATE TABLE BIBLIOTECA.AUTOR(
	--	CODIGO INT PRIMARY KEY NOT NULL
	--,	NOMBRE VARCHAR(30) NOT NULL
	--	)
	--	--LIBRO : CODIGO LIBRO,TITULO,ISBN,PAGINAS,EDITORIAL
	--CREATE TABLE BIBLIOTECA.LIBRO
	--(
	-- CODIGO_LIBRO INT PRIMARY KEY NOT NULL
	--,TITULO VARCHAR(50) NOT NULL
	--,ISBN VARCHAR(15) NOT NULL
	--,PAGINAS INT
	--,EDITORIAL VARCHAR(35)

	--)
	----**



	-----LOCALIZACION: ID LOCAL,RECINTO
	--CREATE TABLE BIBLIOTECA.LOCALIZACION
	--(
	-- ID_LOCALIZACION INT PRIMARY KEY NOT NULL
	--,RECINTO VARCHAR(25) NOT NULL
	--)


	-----EJEMPLAR:CODIGO EJEMPLAR, LOCALIZACION

	--CREATE TABLE BIBLIOTECA.EJEMPLAR
	--(
	-- CODIGO_EJEMPLAR INT PRIMARY KEY NOT NULL
	--,LOCALIZACION INT ,
	--FOREIGN KEY (LOCALIZACION) REFERENCES BIBLIOTECA.LOCALIZACION(ID_LOCALIZACION)
	--)



	--USUARIO:CODIGO USUARIO,NOMRBRE,APELLIDO,TELEFOONO,DIR,CARRERA,LOZALIZACION
	
	--CREATE TABLE BIBLIOTECA.USUARIO
	--(
	--CODIGO_USUARIO INT PRIMARY KEY NOT NULL,
	--NOMBRE VARCHAR(15)NOT NULL,
	--APELLIDO VARCHAR(20)NOT NULL,
	--TELEFONO VARCHAR(20)NULL,
	--DIRECCION VARCHAR(100)NOT NULL,
	--CARRERA VARCHAR(40) NOT NULL,
	--LOCALIZACION INT NOT NULL

	--FOREIGN KEY (LOCALIZACION) REFERENCES BIBLIOTECA.LOCALIZACION(ID_LOCALIZACION)
	--)

	
--	CREATE TABLE BIBLIOTECA.AUTOR_LIBRO
--	(
--	 CODIGO_AUTOR INT NOT NULL,
--	 CODIGO_LIBRO INT NOT NULL,
--	 PRIMARY KEY(CODIGO_AUTOR,CODIGO_LIBRO),
--	 FOREIGN KEY (CODIGO_AUTOR) REFERENCES BIBLIOTECA.AUTOR(CODIGO),
--	 FOREIGN KEY (CODIGO_LIBRO) REFERENCES BIBLIOTECA.LIBRO(CODIGO_LIBRO)
--	)

--	CREATE TABLE BIBLIOTECA.LIBRO_EJEMPLAR
--(
-- CODIGO_LIBRO    INT NOT NULL
--,CODIGO_EJEMPLAR INT NOT NULL
--,CONSTRAINT PK_LIBRO_EJEMPLAR PRIMARY KEY (CODIGO_LIBRO,CODIGO_EJEMPLAR)
--,FOREIGN KEY (CODIGO_LIBRO) REFERENCES BIBLIOTECA.LIBRO(CODIGO_LIBRO)
--,FOREIGN KEY (CODIGO_EJEMPLAR) REFERENCES BIBLIOTECA.EJEMPLAR(CODIGO_EJEMPLAR)
--)


--CREATE TABLE BIBLIOTECA.USUARIO_EJEMPLAR
--(
-- CODIGO_USUARIO   INT NOT NULL
--,CODIGO_EJEMPLAR  INT NOT NULL
--,FECHA_PRESTAMO   DATETIME NOT NULL
--,FECHA_DEVOLUCION DATE NOT NULL
--,CONSTRAINT PK_USUARIO_EJEMPLAR PRIMARY KEY (CODIGO_USUARIO,CODIGO_EJEMPLAR)
--,FOREIGN KEY (CODIGO_EJEMPLAR) REFERENCES BIBLIOTECA.EJEMPLAR(CODIGO_EJEMPLAR)
--,FOREIGN KEY (CODIGO_USUARIO) REFERENCES BIBLIOTECA.USUARIO(CODIGO_USUARIO)
--)


----INSERCION DE DEATOS



--INSERT INTO BIBLIOTECA.LOCALIZACION(
--ID_LOCALIZACION,RECINTO
--)
--VALUES
--(1,'Turrialba')
--,(2,'Paraiso')
--,(3,'Guapiles')
--,(4,'San Ramon')
--,(5,'San Pedro')
--,(6, 'Grecia')
--,(7,'Liberia')
--,(8,'Limon')

---***************En este momento tuve que alterar el valor asignado debido a que me afectababa en la insercion de los datos*****************
ALTER TABLE BIBLIOTECA.LIBRO
ALTER COLUMN ISBN VARCHAR(20)
ALTER TABLE BIBLIOTECA.LIBRO
ALTER COLUMN EDITORIAL VARCHAR(50)
ALTER TABLE BIBLIOTECA.USUARIO_EJEMPLAR
ALTER COLUMN FECHA_DEVOLUCION DATE  NULL

INSERT INTO BIBLIOTECA.USUARIO
(
 [CODIGO_USUARIO]
, [NOMBRE]
, [APELLIDO]
, [TELEFONO]
, [DIRECCION]
, [CARRERA]
, [LOCALIZACION]
)
VALUES
(10000,'Aracely','Soto','84848484','Cartago, Turrialba','Informatica',1)
,(10001,'Fabricio','Castillo','25529696','San Jose,San Pedro, Calle 2','Direccion Empresas',5)
,(10002,'Michelle','Molina','85658565','Cartago, Central, Oriental','Turismo',2)
,(10003,'Yareth','Fernandez','25547896','Siquirres, Calle 23','Inform􀀀tica',8),
(10004, 'Carlos', 'Ramírez', '88887777', 'San José, Escazú', 'Administración de Empresas', 1),
(10005, 'Lucía', 'González', '89996666', 'Alajuela, Atenas', 'Derecho', 2),
(10006, 'Esteban', 'Pérez', '87778888', 'Heredia, Santo Domingo', 'Ingeniería Civil', 3),
(10007, 'María', 'Fernández', '86665555', 'Cartago, Turrialba', 'Biología', 1),
(10008, 'Juan', 'Martínez', '85554444', 'Guanacaste, Liberia', 'Arquitectura', 4),
(10009, 'Sofía', 'López', '84443333', 'San José, San Pedro', 'Psicología', 2),
(10010, 'Andrés', 'Hernández', '83332222', 'Alajuela, San Carlos', 'Ciencias de la Computación', 3),
(10011, 'Valentina', 'Mora', '82221111', 'Heredia, Barva', 'Ingeniería Industrial', 4),
(10012, 'Pedro', 'Salas', '81110000', 'Cartago, Paraíso', 'Educación', 1),
(10013, 'Camila', 'Vargas', '80008888', 'Guanacaste, Nicoya', 'Trabajo Social', 2),
(10014, 'Gabriela', 'Sánchez', '76665555', 'Alajuela, Grecia', 'Ciencias Ambientales', 2),
(10015, 'Diego', 'Rojas', '75554444', 'Cartago, La Unión', 'Matemáticas', 3),
(10016, 'Paola', 'Méndez', '74443333', 'Heredia, San Pablo', 'Biotecnología', 4),
(10017, 'Nicolás', 'Cordero', '73332222', 'Guanacaste, Cañas', 'Contabilidad', 1),
(10018, 'Claudia', 'Castro', '72221111', 'San José, Desamparados', 'Historia', 2),
(10019, 'Samuel', 'Paniagua', '71110000', 'Alajuela, San Ramón', 'Física', 3),
(10020, 'Valeria', 'Jiménez', '70008888', 'Cartago, Turrialba', 'Lingüística', 4),
(10021, 'Fernando', 'Quintana', '68887777', 'Heredia, Santo Domingo', 'Química', 1),
(10022, 'Sabrina', 'Acuña', '67776666', 'San José, Tibás', 'Nutrición', 2),
(10023, 'Javier', 'Solís', '66665555', 'Alajuela, Palmares', 'Odontología', 3),
(10024, 'Inés', 'Cruz', '65554444', 'Cartago, Paraíso', 'Diseño Gráfico', 4),
(10025, 'Cristian', 'Mora', '64443333', 'Guanacaste, Santa Cruz', 'Publicidad', 1),
(10026, 'Mariana', 'Soto', '63332222', 'Heredia, Belén', 'Sociología', 2),
(10027, 'Marco', 'Vargas', '62221111', 'San José, San Miguel', 'Ingeniería de Sistemas', 3),
(10028, 'Marta', 'Zamora', '61110000', 'Alajuela, Alajuela', 'Educación Física', 4),
(10029, 'Felipe', 'Córdoba', '60008888', 'Cartago, Turrialba', 'Turismo', 1),
(10030, 'Luciana', 'Núñez', '58887777', 'Heredia, Flores', 'Teología', 2),
(10031, 'Oscar', 'Hidalgo', '57776666', 'San José, Aserrí', 'Ingeniería Mecánica', 3),
(10032, 'Teresa', 'Ríos', '56665555', 'Alajuela, San Carlos', 'Artes Visuales', 4),
(10033, 'Rafael', 'Jiménez', '55554444', 'Cartago, Paraíso', 'Ciencias Políticas', 1),
(10034, 'Vanessa', 'Sierra', '54443333', 'Guanacaste, Nicoya', 'Criminología', 2),
(10035, 'Rodrigo', 'Mora', '53332222', 'Heredia, San Isidro', 'Gerencia', 3),
(10036, 'Isabel', 'Marín', '52221111', 'San José, San José', 'Estadística', 4),
(10037, 'Gonzalo', 'Castillo', '51110000', 'Alajuela, San Ramón', 'Filología', 1),
(10038, 'Natalia', 'Alvarado', '50008888', 'Cartago, Pérez Zeledón', 'Derecho Internacional', 2),
(10039, 'Pablo', 'Morales', '48887777', 'Guanacaste, Liberia', 'Antropología', 3),
(10040, 'Silvia', 'González', '47776666', 'Heredia, Barva', 'Arte Dramático', 4)
INSERT INTO BIBLIOTECA.AUTOR
([CODIGO], [NOMBRE])
VALUES
(10041, 'Fernando'),
(10042, 'Carla'),
(10043, 'Jorge'),
(10044, 'Rosa'),
(10045, 'Esteban'),
(10046, 'María'),
(10047, 'Antonio'),
(10048, 'Lucía'),
(10049, 'Diego'),
(10050, 'Valentina')
INSERT INTO BIBLIOTECA.LIBRO ([CODIGO_LIBRO], [TITULO], [ISBN], [PAGINAS], [EDITORIAL])
VALUES
(20001, 'El Quijote', '978-3-16-14841-0', 864, 'Editorial Planeta'),
(20002, 'Cien años de soledad', '978-3-16-148410-1', 417, 'Editorial HarperCollins'),
(20003, '1984', '978-3-16-148410-2', 328, 'Editorial Penguin'),
(20004, 'Orgullo y prejuicio', '978-3-16-148410-3', 279, 'Editorial Oxford'),
(20005, 'El amor en los tiempos del cólera', '978-3-16-148410-4', 348, 'Editorial Alfaguara'),
(20006, 'Crónica de una muerte anunciada', '978-3-16-148410-5', 120, 'Editorial Random House'),
(20007, 'Los miserables', '978-3-16-148410-6', 1232, 'Editorial Seix Barral'),
(20008, 'El gran Gatsby', '978-3-16-148410-7', 180, 'Editorial Scribner'),
(20009, 'El Principito', '978-3-16-148410-8', 96, 'Editorial Gallimard'),
(20010, 'Moby Dick', '978-3-16-148410-9', 720, 'Editorial Harper & Brothers'),
(20011, 'En busca del tiempo perdido', '978-3-16-148411-0', 3000, 'Editorial Gallimard'),
(20012, 'Fahrenheit 451', '978-3-16-148411-1', 158, 'Editorial Ray Bradbury'),
(20013, 'El Hobbit', '978-3-16-148411-2', 310, 'Editorial Houghton Mifflin'),
(20014, 'La Odisea', '978-3-16-148411-3', 560, 'Editorial Penguin Classics'),
(20015, 'La sombra del viento', '978-3-16-148411-4', 576, 'Editorial Planeta'),
(20016, 'Los viajes de Gulliver', '978-3-16-148411-5', 300, 'Editorial Oxford'),
(20017, 'Harry Potter y la piedra filosofal', '978-3-16-148411-6', 223, 'Editorial Bloomsbury'),
(20018, 'Cien años de soledad', '978-3-16-148411-7', 417, 'Editorial HarperCollins'),
(20019, 'La casa de los espíritus', '978-3-16-148411-8', 500, 'Editorial Plaza & Janés'),
(20020, 'El túnel', '978-3-16-148411-9', 180, 'Editorial Seix Barral'),
(20021, 'La metamorfosis', '978-3-16-148412-0', 120, 'Editorial Siglo XXI'),
(20022, 'Mujer en punto cero', '978-3-16-148412-1', 192, 'Editorial Virago Press'),
(20023, 'El viejo y el mar', '978-3-16-148412-2', 128, 'Editorial Scribner'),
(20024, 'El retrato de Dorian Gray', '978-3-16-148412-3', 272, 'Editorial Oxford'),
(20025, 'Rayuela', '978-3-16-148412-4', 620, 'Editorial Alfaguara'),
(20026, 'Los ojos de mi princesa', '978-3-16-148412-5', 288, 'Editorial Planeta'),
(20027, 'El alquimista', '978-3-16-148412-6', 208, 'Editorial HarperCollins'),
(20028, 'Un mundo feliz', '978-3-16-148412-7', 311, 'Editorial Vintage'),
(20029, 'La lluvia de fuego', '978-3-16-148412-8', 256, 'Editorial Grijalbo'),
(20030, 'Siddhartha', '978-3-16-148412-9', 152, 'Editorial Penguin Classics'),
(20031, 'El amor en los tiempos del cólera', '978-3-16-148413-0', 348, 'Editorial Alfaguara'),
(20032, 'Las uvas de la ira', '978-3-16-148413-1', 464, 'Editorial Viking'),
(20033, 'Mujer en punto cero', '978-3-16-148413-2', 192, 'Editorial Virago Press'),
(20034, 'El proceso', '978-3-16-148413-3', 256, 'Editorial Schocken'),
(20035, 'El corazón de las tinieblas', '978-3-16-148413-4', 160, 'Editorial Penguin Classics'),
(20036, 'La guerra de los mundos', '978-3-16-148413-5', 224, 'Editorial Penguin Classics'),
(20037, 'El guardián entre el centeno', '978-3-16-148413-6', 224, 'Editorial Little, Brown and Company'),
(20038, 'El ladrón de bicicletas', '978-3-16-148413-7', 104, 'Editorial Einaudi'),
(20039, 'La historia interminable', '978-3-16-148413-8', 444, 'Editorial Thienemann'),
(20040, 'El nombre de la rosa', '978-3-16-148413-9', 500, 'Editorial Bompiani'),
(20041, 'El curioso incidente del perro a medianoche', '978-3-16-148414-0', 226, 'Editorial Salamadra'),
(20042, 'La sombra del viento', '978-3-16-148414-1', 576, 'Editorial Planeta'),
(20043, 'Una breve historia de casi todo', '978-3-16-148414-2', 500, 'Editorial Planeta'),
(20044, 'La isla del tesoro', '978-3-16-148414-3', 240, 'Editorial Oxford'),
(20045, 'La bella durmiente', '978-3-16-148414-4', 128, 'Editorial Cuento de Luz'),
(20046, 'Peter Pan', '978-3-16-148414-5', 192, 'Editorial Alianza'),
(20047, 'Cuentos de la selva', '978-3-16-148414-6', 128, 'Editorial Losada'),
(20048, 'Crónicas de una muerte anunciada', '978-3-16-148414-7', 120, 'Editorial Alfaguara'),
(20049, 'El diario de Ana Frank', '978-3-16-148414-8', 283, 'Editorial Siglo XXI'),
(20050, 'La cabaña del tío Tom', '978-3-16-148414-9', 480, 'Editorial Signet Classics')

INSERT INTO BIBLIOTECA.EJEMPLAR (CODIGO_EJEMPLAR, LOCALIZACION)
VALUES
(1,1),
(2,2),
(3,3),
(4,1),
(5,2),
(6,3),
(7,1),
(8, 1),
(9, 2),
(10, 3),
(11, 1),
(12, 2),
(13, 3),
(14, 1),
(15, 2),
(16, 3),
(17, 1),
(18, 2),
(19, 3),
(20, 1),
(21, 2),
(22, 3),
(23, 1),
(24, 2),
(25, 3),
(26, 1),
(27, 2),
(28, 3),
(29, 1),
(30, 2),
(31, 3),
(32, 1),
(33, 2),
(34, 3),
(35, 1),
(36, 2),
(37, 3),
(38, 1),
(39, 2),
(40, 3),
(41, 1),
(42, 2),
(43, 3),
(44, 1),
(45, 2),
(46, 3),
(47, 1),
(48, 2),
(49, 3),
(50, 1),
(51, 2),
(52, 3),
(53, 1),
(54, 2),
(55, 3),
(56, 1),
(57, 2),
(58, 3),
(59, 1),
(60, 2),
(61, 3),
(62, 1),
(63, 2),
(64, 3),
(65, 1),
(66, 2),
(67, 3),
(68, 1),
(69, 2),
(70, 3),
(71, 1),
(72, 2),
(73, 3),
(74, 1),
(75, 2),
(76, 3),
(77, 1),
(78, 2),
(79, 3),
(80, 1),
(81, 2),
(82, 3),
(83, 1),
(84, 2),
(85, 3),
(86, 1),
(87, 2),
(88, 3),
(89, 1),
(90, 2),
(91, 3),
(92, 1),
(93, 2),
(94, 3),
(95, 1),
(96, 2),
(97, 3),
(98, 1),
(99, 2),
(100, 3),
(101, 1),
(102, 2),
(103, 3),
(104, 1),
(105, 2),
(106, 3),
(107, 1),
(108, 2),
(109, 3),
(110, 1),
(111, 2),
(112, 3),
(113, 1),
(114, 2),
(115, 3),
(116, 1),
(117, 2),
(118, 3),
(119, 1),
(120, 2),
(121, 3),
(122, 1),
(123, 2),
(124, 3),
(125, 1),
(126, 2),
(127, 3),
(128, 1),
(129, 2),
(130, 3),
(131, 1),
(132, 2),
(133, 3),
(134, 1),
(135, 2),
(136, 3),
(137, 1),
(138, 2),
(139, 3),
(140, 1),
(141, 2),
(142, 3),
(143, 1),
(144, 2),
(145, 3),
(146, 1),
(147, 2),
(148, 3),
(149, 1),
(150, 2),
(151, 3)
INSERT INTO BIBLIOTECA.USUARIO_EJEMPLAR (CODIGO_USUARIO, CODIGO_EJEMPLAR, FECHA_PRESTAMO, FECHA_DEVOLUCION)
VALUES
(10000, 1, '2024-09-01', '2024-09-15'),
(10001, 2, '2024-09-02', '2024-09-16'),
(10002, 3, '2024-09-03', '2024-09-17'),
(10003, 4, '2024-09-04', '2024-09-18'),
(10004, 5, '2024-09-05', '2024-09-19'),
(10000, 6, '2024-09-06', '2024-09-20'),
(10001, 7, '2024-09-07', '2024-09-21'),
(10002, 8, '2024-09-08', '2024-09-22'),
(10003, 9, '2024-09-09', '2024-09-23'),
(10004, 10, '2024-09-10', '2024-09-24'),
(10000, 11, '2024-09-11', '2024-09-25'),
(10001, 12, '2024-09-12', '2024-09-26'),
(10002, 13, '2024-09-13', '2024-09-27'),
(10003, 14, '2024-09-14', '2024-09-28'),
(10004, 15, '2024-09-15', '2024-09-29')

USE IF4000_BIBLIOTECA_LAB5
SELECT* FROM BIBLIOTECA.USUARIO

ALTER TABLE BIBLIOTECA.AUTOR
ALTER COLUMN NOMBRE VARCHAR(100)



EXEC RegistrarPrestamo @CODIGO_USUARIO = 10004, @CODIGO_EJEMPLAR =17
EXEC BuscarLibro @Titulo='El'
EXEC ActualizarAutor @Codigo = 10041, @NombreAutor= 'Fernando'
EXEC EliminarEstudiante @CodigoEstudiante=10040


