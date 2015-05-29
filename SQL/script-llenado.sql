
USE ProyectoIII;

--Insertar usuarios
INSERT INTO Usuarios VALUES('JOS', 'jonaranjo', '123');

--Insertar familias
INSERT INTO Familias VALUES('DEFAULT', 'Articulos varios')

--Insertar art�culos
insert into articulos values('1','Articulo 1', null, null, null, null, 2, null, null, 'JOS', 'DEFAULT');
insert into articulos values('A','Articulo A', null, null, null, null, 2, null, null, 'JOS', 'DEFAULT');
insert into articulos values('B','Articulo B', null, null, null, null, 2, null, null, 'JOS', 'DEFAULT');
insert into articulos values('C','Articulo C', null, null, null, null, 2, null, null, 'JOS', 'DEFAULT');
insert into articulos values('2','Articulo 2', null, null, null, null, 2, null, null, 'JOS', 'DEFAULT');
insert into articulos values('D','Articulo D', null, null, null, null, 2, null, null, 'JOS', 'DEFAULT');
insert into articulos values('E','Articulo E', null, null, null, null, 2, null, null, 'JOS', 'DEFAULT');

--Insertar componentes a los art�culos
insert into componentes values('1', 'A', 1);
insert into componentes values('1', 'B', 1);
insert into componentes values('1', 'C', 1);
insert into componentes values('2', 'D', 1);
insert into componentes values('2', 'E', 1);
insert into componentes values('2', 'C', 1);


--Insertar monedas
INSERT INTO Monedas VALUES(1, 'Col�n');
INSERT INTO Monedas VALUES(2, 'Dolar');
INSERT INTO Monedas VALUES(3, 'Euro');

--Insertar tipos de cambio
INSERT INTO TipoDeCambio VALUES (525.94, (SELECT DATEADD(month, -12, '2015-05-01')), 0, 1, 2);
INSERT INTO TipoDeCambio VALUES (526.27, (SELECT DATEADD(month, -11, '2015-05-01')), 0, 1, 2);
INSERT INTO TipoDeCambio VALUES (526.31, (SELECT DATEADD(month, -10, '2015-05-01')), 0, 1, 2);
INSERT INTO TipoDeCambio VALUES (526.27, (SELECT DATEADD(month, -9, '2015-05-01')), 0, 1, 2);
INSERT INTO TipoDeCambio VALUES (526.23, (SELECT DATEADD(month, -8, '2015-05-01')), 0, 1, 2);
INSERT INTO TipoDeCambio VALUES (526.24, (SELECT DATEADD(month, -7, '2015-05-01')), 0, 1, 2);
INSERT INTO TipoDeCambio VALUES (526.65, (SELECT DATEADD(month, -6, '2015-05-01')), 0, 1, 2);
INSERT INTO TipoDeCambio VALUES (526.76, (SELECT DATEADD(month, -5, '2015-05-01')), 0, 1, 2);
INSERT INTO TipoDeCambio VALUES (526.80, (SELECT DATEADD(month, -4, '2015-05-01')), 0, 1, 2);
INSERT INTO TipoDeCambio VALUES (526.84, (SELECT DATEADD(month, -3, '2015-05-01')), 0, 1, 2);
INSERT INTO TipoDeCambio VALUES (526.76, (SELECT DATEADD(month, -2, '2015-05-01')), 0, 1, 2);
INSERT INTO TipoDeCambio VALUES (526.75, (SELECT DATEADD(month, -1, '2015-05-01')), 0, 1, 2);
INSERT INTO TipoDeCambio VALUES (526.80, (SELECT DATEADD(month, -0, '2015-05-01')), 0, 1, 2);

--Proyectar un tipo de cambio
exec sp_ProyectarTipoCambio 1, 'Col�n', 'Dolar';





--PRUEBA DE C�DIGO DE PROCEDIMIENTO
DECLARE @valor FLOAT,
		@tipoCambioAnt FLOAT,
		@tipoCambioAct FLOAT,
		@total FLOAT,
		@n INT
set @total = 0.0;
SET @n = 0;

DECLARE tiposDeCambio CURSOR STATIC LOCAL FOR
		SELECT t.valor FROM 
		TipoDeCambio t INNER JOIN Monedas m
		ON t.FK_moneda1 = m.Moneda_ID AND m.nombre LIKE 'Col�n'
		INNER JOIN Monedas m1
		ON t.FK_moneda2 = m1.Moneda_ID AND m1.nombre LIKE 'Dolar'

OPEN tiposDeCambio;
	FETCH NEXT FROM tiposDeCambio INTO @tipoCambioAnt;
	WHILE @@FETCH_STATUS = 0
	BEGIN
		FETCH NEXT FROM tiposDeCambio INTO @tipoCambioAct;
		--PRINT @tipoCambioAct
		--PRINT @tipoCambioAnt
		--PRINT ' '
		SET @total = @total + (@tipoCambioAct - @tipoCambioAnt); 
		SET @tipoCambioAnt = @tipoCambioAct;
		SET @n = @n + 1;
	END

CLOSE tiposDeCambio;
print @tipoCambioAct + (@total / @n) * 1;
DEALLOCATE tiposDeCambio;







