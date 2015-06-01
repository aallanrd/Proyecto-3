use proyecto;
go

	Select * from Articulos order by nbrArticulo;

	Select * from Componentes;

-- Insertando Componentes;
    Insert into   componentes values ('28B1A09F');
	Insert into   componentes values ('610E8658');
	Insert into   componentes values ('746A4043');

	Select * from Componentes;

--Insertanto Componentes x Articulos
    Select * from Articulos order by nbrArticulo;
	Insert into  componentesArticulos values ('CED0A64A',3);
	Insert into  componentesArticulos values ('CED0A64A',4);
	Insert into  componentesArticulos values ('CED0A64A',5);
	Insert into  componentesArticulos values ('1F417857',1);
    Insert into  componentesArticulos values ('1F417857',2);

	Select * from componentesArticulos;

	

  --Delete from   componentes where codigo = 'Abc';
   execute listar_ComponentesdeArticulo '1F417857'
   execute listar_EsComponenteDe        '20EC0C06';