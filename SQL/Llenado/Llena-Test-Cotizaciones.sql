
use proyecto;
go


insert into Cotizaciones values ( GETDATE(), 'Stradi','Stradi','Stradi','Stradi','LisPrec2','Dolares','EMITIDA','ADB','ARD');

select * from cotizaciones; --COTIZACIONES 

select * from cotizaciones; -- BITACORA COTIZACIONES

select * from articulos_cotizados; -- ARTICULOS COTIZADOS

select * from articulos -- ARTICULOS 

<<<<<<< HEAD
insert into articulos_cotizados values ( 7 , '1F417857',2,0);
insert into articulos_cotizados values ( 7 , 'A1CA90A9',1,1);
insert into articulos_cotizados values ( 7 , '20EC0C06',1,1);
insert into articulos_cotizados values ( 7 , '9D1DAD53',1,1);
=======
insert into articulos_cotizados values ( 4 , '5A4FA876',2,0);

insert into articulos_cotizados values ( 4 , '9BE91CBF',1,1);
insert into articulos_cotizados values ( 5 , '20EC0C06',1,1);
insert into articulos_cotizados values ( 6 , '9D1DAD53',1,1);
insert into articulos_cotizados values ( 6 , '20EC0C06',1,1);
insert into articulos_cotizados values ( 6 , 'A1CA90A9',1,1);
>>>>>>> origin/tec


--------------------ELIMINAR COTIZACION ---------------------------
<<<<<<< HEAD

delete from Cotizaciones where codigo = '7';
=======
delete from Cotizaciones where codigo = 4;
>>>>>>> origin/tec

-- Comprobar Triggers
select * from Cotizaciones;
select * from BCotizaciones; -- BITACORA COTIZACIONES
select * from Articulos_Cotizados; -- ARTICULOS COTIZADOS
select * from BArticulos_Cotizados;

--truncate table barticulos_cotizados;
--truncate table bcotizaciones;
