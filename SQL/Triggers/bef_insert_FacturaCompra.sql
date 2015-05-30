-- Trigger Before Insert On Factura Compra

use proyecto;
go 
select * from FacturaCompra;
go

drop trigger trgInsteadOfInsertFacturaCompra;
go
CREATE  TRIGGER trgInsteadOfInsertFacturaCompra ON dbo.FacturaCompra
INSTEAD OF Insert
AS
declare  @art_id varchar(55),@art_new_id varchar(55),@art_name varchar(55),@art_marca varchar(55),
		 @art_modelo varchar(55),@art_cantMin int,@art_cantMax int,@art_precio float,
		 @art_proveedor varchar(55),@art_usuario varchar(55),@art_unidad varchar(55),@art_fechaRegistro date,
		 @codigoUsuario decimal(10,2), @audit_action varchar(100),@randomString varchar(55);
--select @art_id=i.precio from inserted i;
select @art_new_id=		i.codigo from inserted i;select @art_name=		i.nombre from inserted i;
select @art_marca=		i.marca from inserted i;select @art_modelo=		i.modelo from inserted i;
select @art_cantMin=	i.cantMin from inserted i;select @art_fechaRegistro=	i.fechaRegistro from inserted i;
select @art_cantMax=	i.cantMax from inserted i;select @art_precio=		i.precio from inserted i;
select @art_proveedor=  i.proveedor from inserted i;select @art_usuario=	i.usuario from inserted i;
select @art_unidad=	    i.unidad from inserted i;SELECT @art_new_id = SUBSTRING(CONVERT(varchar(40), NEWID()),0,9)

SELECT @art_id=codigoArticulo FROM Articulos WHERE nbrArticulo = @art_name ;
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
--///////////////////////////////////////////////////////////////////////////////////
select * from usuarios;
select * from proveedores;
insert into FacturaCompra values (  'Art4', 'MarcaN', 'ModeloN', 3,5,18500,getDate(),'ARD','ARD','UN');

select * from FacturaCompra;
select * from Articulos;


delete from FacturaCompra where codigo = '2';

delete from Articulos where codigoArticulo = 'D8B1DDFB'
truncate table FacturaCompra;

use proyecto