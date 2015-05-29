USE ProyectoIII;

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




--Creación de la tabla de Monedas
CREATE TABLE Monedas
(
	Moneda_ID INT NOT NULL PRIMARY KEY,
	nombre VARCHAR(20) NOT NULL
)

--Creación de la tabla de Tipo De Cambios
CREATE TABLE TipoDeCambio
(
	TipoDeCambio_ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	valor FLOAT(3) NOT NULL,
	fecha DATE NOT NULL,
	esProyectado BIT NOT NULL,
	FK_moneda1 INT NOT NULL FOREIGN KEY REFERENCES Monedas(Moneda_ID),
	FK_moneda2 INT NOT NULL FOREIGN KEY REFERENCES Monedas(Moneda_ID)
)

--Creación de la tabla de listas de precio Y sus detalles
CREATE TABLE ListaDePrecios
(
	codigo VARCHAR(50) NOT NULL PRIMARY KEY,
	descripcion VARCHAR(50) NOT NULL,
	porGastosAdmi FLOAT(5),
	porUtilidad FLOAT(5),
	porOtrosGastos FLOAT(5)
)

CREATE TABLE DetalleLP
(
	codigoListaPrecio VARCHAR(50),
	FK_articulo VARCHAR(20) FOREIGN KEY REFERENCES Articulos(codigoArticulo),

	CONSTRAINT FK_listaPrecio FOREIGN KEY(codigoListaPrecio) REFERENCES ListaDePrecios(codigo),
	PRIMARY KEY(codigoListaPrecio)
)

--Creación de la tabla de proyecciones
CREATE TABLE Proyecciones
(
	ID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	fecha DATE,
	fechaProyeccion DATE,
	montoProyeccion FLOAT(5),

	FK_articulo VARCHAR(20) FOREIGN KEY REFERENCES Articulos(codigoArticulo),
	FK_moneda INT FOREIGN KEY REFERENCES Monedas(Moneda_ID)
)
