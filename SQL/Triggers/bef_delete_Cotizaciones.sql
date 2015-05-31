use proyecto;
go 

--drop trigger trgInsteadOfDeleteCotizaciones;
go
CREATE  TRIGGER trgInsteadOfDeleteCotizaciones ON Cotizaciones
Instead Of DELETE
AS
declare  @codigo int,
		 @fecha date,
		 @condicionesPago varchar(55),
		 @condicionesEntrega varchar(55),
		 @vigencia varchar(55),
		 @observaciones varchar(55),
		 @listaPrecios varchar(55),
		 @moneda varchar(55),
		 @estado varchar(55),
		 @codCliente varchar(55),
		 @codUsuario varchar(55);

		
		
--select @art_id=i.precio from inserted i;
select @codigo				=	i.codigo from deleted i ;
select @fecha				=	i.fecha from deleted i;
select @condicionesPago		=   i.condicionesPago from deleted i;
select @condicionesEntrega	=	i.condicionesEntrega from deleted i;
select @vigencia			=	i.vigencia from deleted i;
select @observaciones		=	i.observaciones from deleted i;
select @listaPrecios		=	i.listaPrecios from deleted i;
select @moneda				=	i.moneda from deleted i;
select @estado				=   i.estado from deleted i;
select @codCliente			=	i.codigoCliente from deleted i;
select @codUsuario			=	i.codigoUsuario from deleted i;

BEGIN 
 BEGIN TRAN
 SET NOCOUNT ON
 if(@estado = 'EMITIDA')
   begin 
      PRINT 'Borrando EMITIDA' 
	   ---------------------------- Lineas de Cotizacion ---------------------
	  execute saveToBitacora @codigo; 
	   ---------------------------- Inserta en Bitacora ---------------------
	  insert into BCotizaciones values (@codigo, GETDATE(), @condicionesPago,@condicionesEntrega,@vigencia,@observaciones,@listaPrecios,@moneda,@estado,@codCliente,@codUsuario);
       ---------------------------- Borra Cotizacion ---------------------
	  delete from Cotizaciones where codigo = @codigo;
	
	end
  
END

