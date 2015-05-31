use proyecto;
go

	Select * from Articulos order by nbrArticulo;

	Select * from Componentes;

-- Insertando Componentes;
    Insert into   componentes values ('A1CA90A9');
	Insert into   componentes values ('20EC0C06');
	Insert into   componentes values ('9D1DAD53');

	Select * from Componentes;

--Insertanto Componentes x Articulos
    Select * from Articulos order by nbrArticulo;
	Insert into  componentesArticulos values ('8AE07531',1);
	Insert into  componentesArticulos values ('8AE07531',2);
	Insert into  componentesArticulos values ('8AE07531',3);
	Insert into  componentesArticulos values ('1F417857',1);
    Insert into  componentesArticulos values ('1F417857',2);

	Select * from componentesArticulos;

	

  --Delete from   componentes where codigo = 'Abc';
   execute listar_ComponentesdeArticulo '1F417857'
   execute listar_EsComponenteDe        '20EC0C06';