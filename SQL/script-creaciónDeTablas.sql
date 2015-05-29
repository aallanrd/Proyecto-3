USE Proyecto;

------------------------------------------------------------------
--CREACIÓN DE TABLAS
------------------------------------------------------------------
--Creación de la tabla de usuarios
CREATE TABLE Usuarios
(
	codigoUsuario VARCHAR(10) NOT NULL PRIMARY KEY,
	nbrUsuario VARCHAR(15),
	passUsuario VARCHAR(15)
)
--Creación de la tabla de familias
CREATE TABLE Familias
(
	codigo VARCHAR(10) NOT NULL PRIMARY KEY,
	nombre VARCHAR(25) NOT NULL
)

--Creación de la tabla de artículos
CREATE TABLE Articulos
(
	codigoArticulo VARCHAR(20) NOT NULL PRIMARY KEY,
	nbrArticulo VARCHAR(30) NOT NULL,
	marca VARCHAR(20),
	modelo VARCHAR(20),
	cantMinima INT,
	cantMaxima INT,
	precioDolares FLOAT(5),
	fechaRegistro DATE,
	fechaActuPrecio DATE,

	FK_usuario VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES Usuarios(codigoUsuario),
	FK_familia VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES Familias(codigo)

)

--Creación de la tabla de componentes
CREATE TABLE Componentes
(
	codigoComponente VARCHAR(20),
	codigoArticulo VARCHAR(20) NOT NULL,-- FOREIGN KEY REFERENCES Articulos(codigoArticulo),
	cantidad INT,
	PRIMARY KEY(codigoComponente, codigoArticulo),
	CONSTRAINT FK_comp_art FOREIGN KEY(codigoArticulo) REFERENCES Articulos(codigoArticulo),
	CONSTRAINT FK_comp FOREIGN KEY(codigoComponente) REFERENCES Articulos(codigoArticulo)
)
