-- Trigger Before Insert On Factura Compra

use proyecto;
go ;
select * from FacturaCompra;

CREATE TRIGGER bef_Insert_FacturaCompra
ON FacturaCompra
INSTEAD OF INSERT
AS
BEGIN
        
  DECLARE @art_id varchar(25) , @art_new_id VARCHAR(25),@codigoUsuario VARCHAR(20);

  INSERT INTO super (subtype_discriminator)
  OUTPUT INSERTED.super_id INTO @new_super (super_id)
  SELECT 'SUB1' FROM INSERTED;

  INSERT INTO sub (super_id)
  SELECT super_id FROM @new_super;
END;