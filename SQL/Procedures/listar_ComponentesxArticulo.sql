
 use proyecto;

 
 --drop procedure listar_ComponentesdeArticulo;
 --drop procedure listar
Create Procedure listar_ComponentesdeArticulo (@codArt varchar(20))
AS
Begin
	Select c.idArticulo , a.nbrArticulo from Componentes c
		 
		  INNER JOIN 
	      componentesArticulos ca ON ca.codigoComp = c.codigo  
		 
		  INNER JOIN
		  articulos a ON c.idArticulo = a.codigoArticulo
		  where ca.codigoArt = @codArt;
End
