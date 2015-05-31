 use proyecto;

 
 --drop procedure listar_EsComponenteDe;
 --drop procedure listar
Create Procedure listar_EsComponenteDe (@codArt varchar(20))
AS
Begin
	select ca.codigoArt, a.nbrArticulo from componentesArticulos ca 
	Inner Join Componentes c
     on ca.codigoComp = c.codigo 
	Inner Join Articulos a 
	ON ca.codigoArt = a.codigoArticulo 
	 where c.idArticulo = @codArt;
End;
