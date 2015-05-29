USE ProyectoIII

--Obtiene el nombre de los componentes del artículo de código C
select c.codigoComponente, a.nbrArticulo from Componentes c, Articulos a
where c.codigoArticulo = 'C' and c.codigoComponente = a.codigoArticulo;

select * from Componentes

--Obtener los artículos de los cuales un artículo dado es componente
select a.nbrArticulo from Componentes c, Articulos a
where c.codigoComponente = '2' and c.codigoArticulo = a.codigoArticulo;



--PRUEBA DE CÓDIGO DE PROCEDIMIENTO
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
		ON t.FK_moneda1 = m.Moneda_ID AND m.nombre LIKE 'Colón'
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







