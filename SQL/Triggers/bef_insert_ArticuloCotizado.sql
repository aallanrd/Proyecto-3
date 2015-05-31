use proyecto;
select * from articulos_Cotizados;
select * from cotizaciones;
select * from Articulos

insert into Articulos_Cotizados values ( 4,'ABBE8388',2,0);
truncate table articulos_cotizados;
go;

drop trigger tgrBeforeInsertArtCotiz;
go 
Create trigger tgrBeforeInsertArtCotiz on Articulos_Cotizados
Instead of Insert
As Declare 
		 @codigoArtCotizado int,
		 @codigoCotizacion int,
		 @codigoArticulo varchar(20),
		 @cantidad int,
		 @precioCotizado float,
		 @precioArticulo float;

		 

select @codigoArtCotizado	=	i.codigoArtCotizado from inserted i ;
select @codigoCotizacion	=	i.codigoCotizacion from inserted i ;
select @codigoArticulo		=	i.codigoArticulo from inserted i ;
select @cantidad			=	i.cantidad	 from inserted i ;
Set @precioArticulo = (Select precioDolares from Articulos where codigoArticulo = @codigoArticulo)

SET @precioCotizado		=	(SELECT (@precioArticulo * @cantidad) from inserted ) ;

BEGIN 
 BEGIN TRAN
 SET NOCOUNT ON

 insert into Articulos_Cotizados values ( @codigoCotizacion,@codigoArticulo,@cantidad,@precioCotizado);

END