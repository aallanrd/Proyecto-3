
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
			@precio FLOAT(5) --El precio se espera en dolares
	SET @precio = 0.0;
	SET @mesProyectado = MONTH(GETDATE()) + @pCantidadMeses;

	/*Cursor con los artículos contenidos en la lista de precios*/
	
    
END
GO
