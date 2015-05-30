
 use proyecto;

 Select * from Articulos;
 go
 Select * from Componentes;
 go
 Delete from   componentes where codigo = 'Abc';
 go
 go
 Insert into   componentes values ('ABBE8388');
--/////////////////////////////////////////////////////////////////////////

 Insert into  componentesArticulos values ('8ABB17C7',2);

 select * from componentesArticulos;

 --drop procedure listar
Create Procedure listar (@codArt varchar(20))
AS
Begin
SELECT Componentes.idArticulo, ComponentesArticulos.codigoArt as idComp,Articulos.nbrArticulo as NombreArticulo 
FROM Componentes
INNER JOIN ComponentesArticulos
ON Componentes.codigo=ComponentesArticulos.codigoComp

INNER JOIN Articulos
ON Articulos.codigoArticulo = ComponentesArticulos.codigoArt

where idArticulo = @codArt;
End

exec listar '8ABB17C7'