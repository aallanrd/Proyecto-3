
-- ================================================
--Procedimiento para generar una proyección del tipo de cambio
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Mario Naranjo Leiva
-- Create date: 26/05/2015
-- Description:	generar una proyección del tipo de cambio
-- =============================================
CREATE PROCEDURE sp_ProyectarTipoCambio
	@cantMeses INT,
	@nbrMoneda1 VARCHAR(20),
	@nbrMoneda2 VARCHAR(20)
AS
BEGIN
	
	SET NOCOUNT ON;
	/*Declaración de variables que usará este procedimiento*/
	DECLARE @tipoCambioAnt FLOAT,
			@tipoCambioAct FLOAT,
			@totalProyectado FLOAT,
			@ultFecha DATE,
			@n INT ,--Contador para la iteración
			@moneda1 INT,
			@moneda2 INT
	SET @totalProyectado = 0.0;
	SET @n = 0;

	/*Cursor para acceder los tipos de cambio
	que corresponde a las monedas dadas en los parámetros*/
	DECLARE tiposDeCambio CURSOR STATIC LOCAL FOR
		SELECT t.valor FROM 
		TipoDeCambio t INNER JOIN Monedas m
		ON t.FK_moneda1 = m.Moneda_ID AND m.nombre LIKE @nbrMoneda1
		INNER JOIN Monedas m1
		ON t.FK_moneda2 = m1.Moneda_ID AND m1.nombre LIKE @nbrMoneda2

	--Seleccionamos el identificador de las monedas
	SELECT @moneda1 = m.Moneda_ID FROM Monedas m WHERE m.nombre = @nbrMoneda1;
	SELECT @moneda2 = m.Moneda_ID FROM Monedas m WHERE m.nombre = @nbrMoneda2;

	--Obtenemos la fecha para el último tipo de cambio registrado
	SELECT @ultFecha = MAX(T.fecha)
	FROM TipoDeCambio t
	WHERE t.esProyectado = 0 AND t.FK_moneda1 = @moneda1 AND t.FK_moneda2 = @moneda2
	
	--INICIO DEL PROCESO DE PROYECCIÓN----------
	OPEN tiposDeCambio;
	FETCH NEXT FROM tiposDeCambio INTO @tipoCambioAnt;
	WHILE @@FETCH_STATUS = 0
	BEGIN
		FETCH NEXT FROM tiposDeCambio INTO @tipoCambioAct;
		SET @totalProyectado = @totalProyectado + (@tipoCambioAct - @tipoCambioAnt); 
		SET @tipoCambioAnt = @tipoCambioAct;
		SET @n = @n + 1;
	END
	CLOSE tiposDeCambio;


	--Insertamos los datos de la proyección
	INSERT INTO TipoDeCambio 
	VALUES (@tipoCambioAct + (@totalProyectado / @n) * @cantMeses, --Cálculo de la proyección real del tipo de cambio
			DATEADD(MONTH, @cantMeses, @ultFecha),	--Se agrega la fecha de la proyección del tipo de cambio
			1, @moneda1, @moneda2);

END
GO
