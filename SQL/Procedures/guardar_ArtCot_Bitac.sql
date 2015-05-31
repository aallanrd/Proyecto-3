--falta arreglar que sea el codigo y no el autoincrement
-- truncate table - drop table - recreate table 

use proyecto;

drop procedure saveToBitacora
go

create procedure saveToBitacora (@idCot int )
As
BEGIN
   
 
 Set NOCount ON
  DECLARE 
     @codCot int , @codArt varchar(20),@cant int,@precioCot float;
    DECLARE contact_cursor CURSOR FOR
    Select codigoCotizacion,codigoArticulo,cantidad,precioCotizado from 
	Articulos_Cotizados where codigoCotizacion = @idCot ;

	OPEN contact_cursor;
	FETCH NEXT FROM contact_cursor INTO @codCot,@codArt,@cant,@precioCot;
	WHILE @@FETCH_STATUS = 0
		BEGIN
		insert into BArticulos_Cotizados values (111,@codCot,@codArt,@cant,@precioCot);
		
		Print  'Found Something' ;
		-- This is executed as long as the previous fetch succeeds.
		FETCH NEXT FROM contact_cursor INTO @codCot,@codArt,@cant,@precioCot;
		END
    delete from articulos_cotizados where  codigoCotizacion = @codCot;
	CLOSE contact_cursor;
    DEALLOCATE contact_cursor;

END;


