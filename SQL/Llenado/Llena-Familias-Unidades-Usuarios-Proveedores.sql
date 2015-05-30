use proyecto

--// Insertando en la tabla , FAMILIAS
insert into Familias values ( 'Default','Familia Default');
insert into Familias values ( 'CP','Familia Computadoras');
insert into Familias values ( 'PL','Familia Pantallas');
insert into Familias values ( 'PR','Familia Procesadores');
insert into Familias values ( 'TM','Familia Tarjetas Madre');
--// Insertando en la tabla , UNIDADES
insert into Unidades values ( 'Default','Unidad Default');
insert into Unidades values ( 'UN','Unidad');
insert into Unidades values ( 'PE','Peso');
insert into Unidades values ( 'HT','HorasTrabajador');
insert into Unidades values ( 'TM','Tiempo Muerto');

select * from Unidades
--// Insertando en la tabla Usuarios
insert into Usuarios values ( 'ARD','aallanrd','1234');
insert into Usuarios values ( 'EFG','efredfgd','1234');
insert into Usuarios values ( 'HIJ','hazzimjr','1234');
insert into Usuarios values ( 'KLM','kalabdlm','1234');

select * from usuarios;
--//Insertando en la tabla proveedores
insert into Proveedores values ( 'AAA','Intel','1234');
insert into Proveedores values ( 'BBB','Samsung','1234');
insert into Proveedores values ( 'CCC','AOL','1234');
insert into Proveedores values ( 'DDD','Toshiba','1234');

select * from Proveedores;

GO
CREATE PROCEDURE getrowID 
(@codigo nvarchar(25))
AS
   SELECT ROW_NUMBER() OVER(ORDER BY Codigo DESC) AS Row 
FROM Unidades
WHERE codigo = @codigo;
GO

exec getrowID  'Default' ;











