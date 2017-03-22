--Tabla temporal
create table #tempBooks
(
	title varchar(150),
	isbn varchar(15)
)

--Uso de Cursores
declare 
@title varchar(100),
@isbn varchar(15),
@mensaje varchar(1000)

declare cBooks cursor
for
select title, isbn from Book

open cBooks

fetch cBooks into @title, @isbn

while (@@FETCH_STATUS = 0)
begin
	insert into #tempBooks(title, isbn) values (@title, @isbn)

	fetch cBooks into @title, @isbn
end

close cBooks

deallocate cBooks

select * from #tempBooks

select * from empleado

go

--Uso de consultas recursivas
with empCTE (nroempleado, nombre, apellido, cargo, nrojefe)
as
(
	select nroempleado, nombre, apellido, cargo, NroJefe
	from Empleado
	where NroEmpleado = 2
	union all
	select e.NroEmpleado, e.nombre, e.apellido, e.cargo, e.NroJefe
	from Empleado as e join empCTE as m
	on e.NroEmpleado = m.NroJefe
)

select * from empCTE

go

WITH manager_cte AS

(

     SELECT nroempleado, nombre, apellido, cargo, 1 AS LEVEL
     FROM empleado
     where nrojefe is null
     UNION ALL
     SELECT Emp.NroEmpleado, Emp.nombre, Emp.apellido, Emp.cargo, mng.LEVEL + 1 AS LEVEL
     FROM Empleado Emp
     INNER JOIN manager_cte mng
     ON mng.NroEmpleado = Emp.NroJefe
)

SELECT * FROM manager_cte ORDER BY LEVEL