USE PRUEBA 

GO

CREATE TABLE Usuarios
(
	UsuID int identity(1,1),
	UsuNombre Varchar(50),
	UsuPass Varchar(20)
)

GO

CREATE TABLE Producto
(
	ProID varchar(5),
	ProDesc varchar(50),
	ProValor money
)

GO

CREATE TABLE Pedido
(
	PedID int identity(1,1),
	PedUsu int,
	PedProd int,
	PedVrUnit money,
	PedCant float,
	PedSubTot money,
	PedIVA float,
	PedTotal money
)

GO

-- CREAMOS LOS STORED PROCEDURES DE LOS INSERT DE LAS TABLAS CREADAS ANTERIORMENTE

CREATE PROCEDURE InsUsuarios
@UsuNombre varchar(50),
@UsuPass varchar(20)
AS
INSERT INTO Usuarios (UsuNombre, UsuPass) VALUES (@UsuNombre, @UsuPass)

GO

CREATE PROCEDURE InsProducto
@ProID varchar(5),
@ProDesc varchar(50),
@ProValor money
AS
INSERT INTO Producto (ProID, ProDesc, ProValor) VALUES (@ProID, @ProDesc, @ProValor)

GO

CREATE PROCEDURE InsPedido
@PedUsu int,
@PedProd int,
@PedVrUnit money,
@PedCant float,
@PedSubTot money,
@PedIVA float,
@PedTotal money
AS
INSERT INTO Pedido (PedUsu, PedProd, PedVrUnit, PedCant, PedSubTot, PedIVA, PedTotal)
VALUES (@PedUsu, @PedProd, @PedVrUnit, @PedCant, @PedSubTot, @PedIVA, @PedTotal)

GO

--CREAMOS LOS PROCEDURES DE LAS CONSULTAS EN CADA UNA DE LAS TABLAS CREADAS

CREATE PROCEDURE SelUsuarios
AS
SELECT * FROM Usuarios

GO

CREATE PROCEDURE SelUsuario
@UsuNombre varchar(50)
AS
SELECT * FROM Usuarios WHERE UsuNombre = @UsuNombre

GO

CREATE PROCEDURE SelProductos
AS
SELECT * FROM Producto

GO

CREATE PROCEDURE SelProducto
@ProID varchar(5)
AS
SELECT * FROM Producto WHERE ProID = @ProID

GO

CREATE PROCEDURE SelPedidos
AS
SELECT * FROM Pedido
