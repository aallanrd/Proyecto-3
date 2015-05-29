use proyecto;

CREATE TABLE Usuarios
(
	codigoUsuario VARCHAR(10) NOT NULL PRIMARY KEY,
	nbrUsuario VARCHAR(15),
	passUsuario VARCHAR(15)
)

CREATE TABLE Proveedores
(
	codigoProveedor VARCHAR(10) NOT NULL PRIMARY KEY,
	nbrProveedor VARCHAR(15),
	passProveedor VARCHAR(15)
)

CREATE TABLE Unidades
(
	codigo VARCHAR(10) NOT NULL PRIMARY KEY,
	descripcion VARCHAR(15),
	
)


-- drop table FacturaCompra
CREATE TABLE FacturaCompra
(
	codigo   int  IDENTITY(1,1) PRIMARY KEY ,
    nombre     VARCHAR (50) ,
    marca      VARCHAR (20) ,
    modelo     VARCHAR (20) ,
    cantMin INT  ,
    cantMax INT  ,
    precio FLOAT ,
    fechaRegistro   DATE ,
    proveedor Varchar(10) NOT NULL FOREIGN KEY REFERENCES Usuarios(codigoUsuario),
    usuario Varchar(10) NOT NULL FOREIGN KEY REFERENCES Usuarios(codigoUsuario),
    unidad Varchar(10) NOT NULL FOREIGN KEY REFERENCES Unidades(codigo)

)

--/////////////////////////////////////////////////////////////////

--////////////////////////////////////////////////////////////////
--Creación de la tabla de familias
CREATE TABLE Familias
(
	codigo VARCHAR(10) NOT NULL PRIMARY KEY,
	nombre VARCHAR(25) NOT NULL
)

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

