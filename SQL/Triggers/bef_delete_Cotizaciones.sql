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
		 @observaciones int,
		 @listaPrecios int,
		 @moneda float,
		 @estado varchar(55),
		 @codCliente varchar(55),
		 @codUsuario varchar(55);
		
--select @art_id=i.precio from inserted i;
select @codigo	=		deleted.codigo from deleted ;
select @fecha	=		i.fecha from deleted i;
select @condicionesPago	=		i.condicionesPago from inserted i;
select @condicionesEntrega	=		i.condicionesEntrega from inserted i;
select @vigencia		=	i.vigencia from inserted i;
select @observaciones	=	i.observaciones from inserted i;
select @listaPrecios		=	i.listaPrecios from inserted i;
select @moneda		=		i.moneda from inserted i;
select @estado	=  i.estado from inserted i;
select @codCliente	=	i.codCliente from inserted i;
select @codUsuario		=	    i.codUsuario from inserted i;


--SELECT @art_id=codigoArticulo FROM Articulos WHERE nbrArticulo = @art_name ;

BEGIN 
 BEGIN TRAN
 SET NOCOUNT ON
 if(@art_id is not NULL)
   begin Update Articulos SET precioDolares = i.precio from inserted i where codigoArticulo = @art_id; 
    end
 
 else 
   begin Insert into Articulos  values (@art_new_id,@art_name,@art_marca,@art_modelo,@art_cantMin,@art_cantMax,@art_precio,@art_fechaRegistro,@art_fechaRegistro,@art_usuario,'Default'); 
   
   COMMIT;
   PRINT 'Record Inserted -- Instead Of Insert Trigger.'
 end
 insert into FacturaCompra values (  @art_name, @art_marca,@art_modelo,@art_cantMin,@art_cantMax,@art_precio,@art_fechaRegistro,@art_proveedor,@art_usuario,@art_unidad);
  
END