USE ProyectoIII

--Obtiene el nombre de los componentes del artículo de código C
select c.codigoComponente, a.nbrArticulo from Componentes c, Articulos a
where c.codigoArticulo = 'C' and c.codigoComponente = a.codigoArticulo;

select * from Componentes

--Obtener los artículos de los cuales un artículo dado es componente
select a.nbrArticulo from Componentes c, Articulos a
where c.codigoComponente = '2' and c.codigoArticulo = a.codigoArticulo;