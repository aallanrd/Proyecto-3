
use proyecto; 

select * from usuarios;

select * from proveedores;

-- @params Insercion Factura Compra 
-- @ nombre, marca , modelo, cantMin, cantMax , precio , fechaCreacion ,             proveedor  usuario unidad
insert into FacturaCompra values (  'Art1', 'MarcaA', 'ModeloE', 1,5	,1000,getDate(),'ARD',	'ARD',	'UN');
insert into FacturaCompra values (  'Art2', 'MarcaB', 'ModeloF', 5,10	,2000,getDate(),'EFG',	'ARD',	'UN');
insert into FacturaCompra values (  'Art3', 'MarcaC', 'ModeloG', 10,15	,3000,getDate(),'HIJ',	'ARD',	'UN');
insert into FacturaCompra values (  'Art4', 'MarcaD', 'ModeloH', 20,30	,4000,getDate(),'KLM',	'ARD',	'UN');
insert into FacturaCompra values (  'Art5', 'MarcaE', 'ModeloI', 30,40,  5000,getDate(),'ARD',	'ARD',	'UN');

COMMIT;
--truncate table FacturaCompra;
select * from FacturaCompra;

select * from Articulos;

--delete from FacturaCompra where codigo = '2';

--delete from Articulos where codigoArticulo = 'D8B1DDFB'
--truncate table FacturaCompra;

