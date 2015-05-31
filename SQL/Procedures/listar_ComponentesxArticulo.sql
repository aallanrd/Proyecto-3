
 use proyecto;

 

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
