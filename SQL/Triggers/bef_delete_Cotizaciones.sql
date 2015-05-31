use proyecto;
go 
select * from dbo.Cotizaciones;
go
select * from Cotizaciones;
--drop trigger trgInsteadOfDeleteCotizaciones;
go
CREATE  TRIGGER trgInsteadOfDeleteCotizaciones ON Cotizaciones
Instead Of DELETE
AS
declare  @codigo varchar(55),
		 @fecha date,
		 @condicionesPago varchar(55),
		 @condicionesEntrega varchar(55),
		 @vigencia varchar(55),
		 @observaciones varchar(55),
		 @listaPrecios varchar(55),
		 @moneda varchar(55),
		 @estado varchar(55),
		 @codCliente varchar(55),
		 @codUsuario varchar(55),

		 @codCot int , 
		 @codArt varchar(20),
		 @cant int,
		 @precioCot float;
		 
		
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


--SELECT @art_id=codigoArticulo FROM Articulos WHERE nbrArticulo = @art_name ;

BEGIN 
 BEGIN TRAN
 SET NOCOUNT ON
 if(@estado = 'EMITIDA')
   begin 
      PRINT 'Borrando EMITIDA' 
	  insert into BCotizaciones values ( GETDATE(), @condicionesPago,@condicionesEntrega,@vigencia,@observaciones,@listaPrecios,@moneda,@estado,@codCliente,@codUsuario);
      delete from Cotizaciones where codigo = @codigo;
	
	  ---------------------------- Lineas de Cotizacion ---------------------
	  execute saveToBitacora @codigo; 
	
	end
 
 
 --insert into FacturaCompra values (  @art_name, @art_marca,@art_modelo,@art_cantMin,@art_cantMax,@art_precio,@art_fechaRegistro,@art_proveedor,@art_usuario,@art_unidad);
  
END


select * from cotizaciones;
select * from articulos_cotizados;
delete from cotizaciones where codigo = 1;
select * from clientes;

insert into clientes values ( 'ADB','Antuan','1234');






insert into Cotizaciones values ( GETDATE(), 'CondPag','CondEnt','Vig','Obs','LisPrec','Dolares','EMITIDA','ARD','ARD');