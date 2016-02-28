--CREAMOS LA TABLA
CREATE DATABASE PRUEBA;

--CREAMOS LA TRANSACCION PARA CREAR LAS TABLAS
BEGIN TRANSACTION 

BEGIN TRY
	CREATE TABLE EMPLEADO 
	(
		empId int identity(1,1),
		docEmp int primary key,
		nomEmp varchar(50) not null,
		apeEmp varchar(50) not null,
		emailEmp varchar(100) not null,
		dirEmp varchar(100) not null,
		telEmp varchar(7) not null
	)

	CREATE TABLE USUARIO
	(
		UserId int identity(1,1) primary key,
		nUser varchar(50) not null,
		userPass varchar(11) not null,
		activo int,
		empleadoId int,
		rol int,
		foreign key (empleadoId) references EMPLEADO(empId) ON DELETE CASCADE
	)

	CREATE TABLE SOLICITUD
	(
		IdSolicitud int identity(1,1) primary key,
		solicitud varchar(max),
		estado int,
		idSolicitan int,
		idResponsable int,
		fIni datetime,
		fCierre datetime,
		foreign key (idSolicitan) references USUARIO(UserId)  ON DELETE CASCADE
	)
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
END CATCH

GO
	
--CREAMOS LOS STORED PROCEDURES
CREATE PROCEDURE InsertEmpleadoandUser
@docEmp varchar(15),
@nomEmp varchar(50),
@apeEmp varchar(50),
@emailEmp varchar(100),
@dirEmp varchar(100),
@telEmp varchar(7),
@nUser varchar(11),
@idEmpleado varchar(15),
@Rol int
AS
BEGIN TRANSACTION 
BEGIN TRY
	INSERT INTO EMPLEADO (docEmp, nomEmp, apeEmp, emailEmp, dirEmp, telEmp) VALUES (@docEmp, @nomEmp, @apeEmp, @emailEmp, @dirEmp, @telEmp)
	SET @idEmpleado = (SELECT empId FROM EMPLEADO WHERE docEmp = @docEmp)
	INSERT INTO USUARIO (nUser, userPass, activo, empleadoId, rol) VALUES (@nUser, "Colombia2015", 1, @idEmpleado, @Rol) 
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
END CATCH

GO

CREATE PROCEDURE InsertSolucitud
@Solicitud varchar(max),
@idSolicitan int,
@idResponable int
AS
BEGIN TRANSACTION
BEGIN TRY
	INSERT INTO SOLICITUD (solicitud, estado, idSolicitan, idResponsable, fIni) VALUES (@Solicitud, 1, @idSolicitan, @idResponable, now())
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
END CATCH

GO

CREATE PROCEDURE UpdateEmpleado
@nomEmp varchar(50),
@apeEmp varchar(50),
@emailEmp varchar(100),
@dirEmp varchar(100),
@telEmp varchar(7),
@nUser varchar(11),
@idEmpleado varchar(15),
@Rol int
AS


	
	

	SELECT * FROM USUARIO