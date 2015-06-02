
use proyecto;
go


insert into Cotizaciones values ( GETDATE(), 'Stradi','Stradi','Stradi','Stradi','LisPrec2','Dolares','EMITIDA','ADB','ARD');

select * from cotizaciones; --COTIZACIONES 

select * from bcotizaciones; -- BITACORA COTIZACIONES

select * from articulos_cotizados; -- ARTICULOS COTIZADOS

select * from articulos order by nbrArticulo; -- ARTICULOS 

insert into articulos_cotizados values ( 7 , '1F417857',2,0);
insert into articulos_cotizados values ( 7 , 'A1CA90A9',1,1);
insert into articulos_cotizados values ( 7 , '20EC0C06',1,1);
insert into articulos_cotizados values ( 7 , '9D1DAD53',1,1);


select * from articulos_cotizados; -- ARTICULOS COTIZADOS


--------------------ELIMINAR COTIZACION ---------------------------

delete from Cotizaciones where codigo = '7';

-- Comprobar Triggers
select * from Cotizaciones;
select * from BCotizaciones; -- BITACORA COTIZACIONES
select * from Articulos_Cotizados; -- ARTICULOS COTIZADOS
select * from BArticulos_Cotizados;

--truncate table barticulos_cotizados;