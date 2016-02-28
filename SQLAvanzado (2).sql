create database Compras

go

use Compras

go

create table Clientes
(
	idCliente int primary key identity(1,1),
	nomCliente varchar(50),
)

go

create table Facturas
(
	idFactura int primary key identity(1,1),
	idCliente int,
	fecFactura datetime,
	foreign key ("idCliente") references Clientes("idCliente") 
)

go

create table DetalleFactura
(
	idDetalle int identity(1,1) primary key,
	idFactura int,
	item varchar(250),
	cantidad int,
	valUnitario float,
	foreign key ("idFactura") references Facturas("idFactura")
)

go

insert into Clientes (nomCliente) values ('Pablo Milanes');
insert into Clientes (nomCliente) values ('Carlos Zabala');
insert into Clientes (nomCliente) values ('Mark Antony');
insert into Clientes (nomCliente) values ('Shakira');
insert into Clientes (nomCliente) values ('Axel Rose');
insert into Clientes (nomCliente) values ('Nicky Jam');

go

insert into Facturas (idCliente, fecFactura) values (1, '2015/01/15');
insert into Facturas (idCliente, fecFactura) values (1, '2015/08/08');
insert into Facturas (idCliente, fecFactura) values (2, '2015/01/23');
insert into Facturas (idCliente, fecFactura) values (2, '2015/06/05');
insert into Facturas (idCliente, fecFactura) values (3, '2015/04/28');
insert into Facturas (idCliente, fecFactura) values (3, '2015/05/05');
insert into Facturas (idCliente, fecFactura) values (4, '2015/01/19');
insert into Facturas (idCliente, fecFactura) values (4, '2015/06/29');
insert into Facturas (idCliente, fecFactura) values (4, '2015/12/17');

go

insert into DetalleFactura(idFactura, item, cantidad, valUnitario) values (1, 'TV Sony 32 pulgadas', 1, 790);
insert into DetalleFactura(idFactura, item, cantidad, valUnitario) values (1, 'Base para TV 32 Pulgadas', 1, 59);
insert into DetalleFactura(idFactura, item, cantidad, valUnitario) values (2, 'XBOX One', 1, 1200);
insert into DetalleFactura(idFactura, item, cantidad, valUnitario) values (2, 'Juego Fifa 2016', 2, 159);
insert into DetalleFactura(idFactura, item, cantidad, valUnitario) values (3, 'Controles XBOX One', 4, 250);
insert into DetalleFactura(idFactura, item, cantidad, valUnitario) values (4, 'Computador Lenovo ThinkPad', 4, 2300);
insert into DetalleFactura(idFactura, item, cantidad, valUnitario) values (5, 'Telefono Samsung J1', 1, 369);
insert into DetalleFactura(idFactura, item, cantidad, valUnitario) values (5, 'Manos Libres', 3, 29);
insert into DetalleFactura(idFactura, item, cantidad, valUnitario) values (6, 'Telefono Inalambrico', 3, 69);
insert into DetalleFactura(idFactura, item, cantidad, valUnitario) values (6, 'Pilas AA', 6, 2);
insert into DetalleFactura(idFactura, item, cantidad, valUnitario) values (7, 'SmartTV 52 Pulgadas Sony', 1, 5999);
insert into DetalleFactura(idFactura, item, cantidad, valUnitario) values (8, 'Play Station 4', 1, 1200);
insert into DetalleFactura(idFactura, item, cantidad, valUnitario) values (8, 'Juego God of War III', 1, 229);
insert into DetalleFactura(idFactura, item, cantidad, valUnitario) values (9, 'XBOX One', 1, 120);
insert into DetalleFactura(idFactura, item, cantidad, valUnitario) values (9, 'TV Samsung LED 32 Pulgadas', 1, 899);
insert into DetalleFactura(idFactura, item, cantidad, valUnitario) values (2, 'Control Inalambrico XBOX', 1, 250);
insert into DetalleFactura(idFactura, item, cantidad, valUnitario) values (9, 'Pilas AA', 10, 2);



select * from clientes
select * from Facturas
select * from DetalleFactura


select detallefactura.idfactura, DetalleFactura.cantidad * DetalleFactura.valUnitario as totalFactura from facturas 
inner join Clientes on Facturas.idCliente = clientes.idCliente inner join DetalleFactura on facturas.idFactura = DetalleFactura.idFactura
group by DetalleFactura.idFactura


select * from DetalleFactura

select detallefactura.idFactura, 
(select nomCliente from Clientes where idCliente = (select idcliente from facturas where idFactura = DetalleFactura.idFactura) ) as ClienteFactura,
(select fecFactura from facturas where idFactura = detallefactura.idFactura ) as fecha, 
sum(detallefactura.cantidad * detallefactura.valUnitario) as totalFactura
from DetalleFactura
group by idFactura


select * from facturas

select * from clientes