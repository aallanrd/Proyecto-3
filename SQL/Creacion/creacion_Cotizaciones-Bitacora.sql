
use proyecto; 

CREATE TABLE Clientes
(
	codigoCliente VARCHAR(10) NOT NULL PRIMARY KEY,
	nbrCliente VARCHAR(15),
	passCliente VARCHAR(15)
)
go
--drop table cotizaciones;

CREATE TABLE Cotizaciones
(
	     codigo             int IDENTITY(1,1) Primary Key ,
         fecha              DATE ,
         condicionesPago    VARCHAR(55),
         condicionesEntrega VARCHAR(55),
         vigencia           VARCHAR(25),
         observaciones      VARCHAR(55),
         listaPrecios       VARCHAR(25),
         moneda             VARCHAR(25),
         estado             VARCHAR(25),
         codigoCliente      VARCHAR(10) NOT NULL FOREIGN KEY REFERENCES Clientes(codigoCliente),
         codigoUsuario      Varchar(10) NOT NULL FOREIGN KEY REFERENCES Usuarios(codigoUsuario)
         
)

--select * from Cotizaciones;


CREATE TABLE Articulos_Cotizados
(
    codigoArtCotizado int identity (1,1) primary key,
	codigoCotizacion int NOT NULL FOREIGN KEY REFERENCES Cotizaciones(codigo),
	codigoArticulo   VARCHAR(20) FOREIGN KEY REFERENCES Articulos(codigoArticulo),
	cantidad int ,
	precioCotizado float
)

CREATE TABLE BCotizaciones
(
	     codigo             int primary key ,
         fecha              DATE ,
         condicionesPago    VARCHAR(55),
         condicionesEntrega VARCHAR(55),
         vigencia           VARCHAR(25),
         observaciones      VARCHAR(55),
         listaPrecios       VARCHAR(25),
         moneda             VARCHAR(25),
         estado             VARCHAR(25),
         codigoCliente      VARCHAR(10) ,
         codigoUsuario      Varchar(10) 
         
)

--select * from Cotizaciones;


CREATE TABLE BArticulos_Cotizados
(
    codigoArtCotizado int primary key ,
	codigoCotizacion int ,
	codigoArticulo   VARCHAR(20) ,
	cantidad int ,
	precioCotizado float
)
