
 use proyecto;

 
 drop procedure listar;
 --drop procedure listar
Create Procedure listar (@codArt varchar(20))
AS
Begin
	Select c.idArticulo , a.nbrArticulo from Componentes c
		 
		  INNER JOIN 
	      componentesArticulos ca ON ca.codigoComp = c.codigo  
		 
		  INNER JOIN
		  articulos a ON ca.codigoArt = a.codigoArticulo
		  where ca.codigoArt = @codArt;
End
