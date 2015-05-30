
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		José Mario Naranjo Leiva
-- Create date: 28/05/2015
-- Description:	Proyecta el precio de un artículo y lo almacena en una tabla de proyecciones
-- =============================================
CREATE PROCEDURE sp_proyectarListaPrecio
	-- Parámetros
	@pCodListaPrecio VARCHAR(50),
	@pCantidadMeses INT
	
AS
BEGIN
	
	SET NOCOUNT ON;

	DECLARE @mesProyectado INT,
			@codigoArticulo VARCHAR(20),
			@precio FLOAT(5), --El precio se espera en dolares
			@tipoCambio FLOAT(3)
	SET @precio = 0.0;
	SET @tipoCambio = 0.0;
	SET @mesProyectado = MONTH(GETDATE()) + @pCantidadMeses;

	/*Cursor con los artículos contenidos en la lista de precios*/
	DECLARE articulosListaPrecio CURSOR STATIC LOCAL FOR
		SELECT d.codigoArticulo, d.precio FROM DetalleLP d
		WHERE d.codigoListaPrecio = @pCodListaPrecio

	/*Seleccionar el tipo de cambio para el mes al que se desea hacer la proyección*/
	SELECT @tipoCambio = t.valor FROM TipoDeCambio t
	WHERE MONTH(t.fecha) = @mesProyectado AND t.esProyectado = 0 AND t.FK_moneda1 = 1 AND t.FK_moneda2 = 2

	OPEN articulosListaPrecio
	WHILE @@FETCH_STATUS = 0
	BEGIN
		FETCH NEXT FROM articuloListaPrecio INTO @codigoArticulo, @precio
		INSERT INTO Proyecciones VALUES(GETDATE(), DATEADD(MONTH, @pCantidadMeses), @precio * @tipoCambio, @codigoArticulo, 1)
	END
    
END
GO
