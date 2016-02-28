--CREAMOS LA TABLA
CREATE DATABASE PRUEBA;

--CREAMOS LA TRANSACCION PARA CREAR LAS TABLAS
BEGIN TRANSACTION 

BEGIN TRY
	CREATE TABLE USUARIO
	(
		userId int identity(1,1) primary key,
		nomUser varchar(50) not null,
		apeUser varchar(50) not null,
		dirUser varchar(100),
		telUser varchar(7),
		nUser varchar(15),
		passUser varchar(50),
		activo int
	)
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
END CATCH

GO
	
--CREAMOS LOS PROCEDURES PARA LA TABLA USUARIO
CREATE PROCEDURE InsertUsuario
@nomUser varchar(50),
@apeUser varchar(50),
@dirUser varchar(100),
@telUser varchar(7),
@nUser varchar(15),
@passUser varchar(50)
AS
BEGIN TRANSACTION 
BEGIN TRY
	INSERT INTO USUARIO (nomUser, apeUser, dirUser, telUser, nUser, passUser, activo) VALUES (@nomUser, @apeUser, @dirUser, @telUser, @nUser, @passUser, 1)
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
END CATCH


GO

CREATE PROCEDURE UpdateUser 
@nomUser varchar(50),
@apeUser varchar(50),
@dirUser varchar(100),
@telUser varchar(7),
@nUser varchar(15),
@passUser varchar(50)
AS
BEGIN TRANSACTION 
BEGIN TRY
	UPDATE USUARIO SET nomUser = @nomUser, apeUser = @apeUser, dirUser = @dirUser, telUser = @telUser, passUser = @passUser
	WHERE nUser = @nUser
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
END CATCH

GO

CREATE PROCEDURE DeactivateUser
@nuser varchar(15)
AS
BEGIN TRANSACTION 
BEGIN TRY
	UPDATE USUARIO SET activo = 0 WHERE nUser = @nuser
	COMMIT TRANSACTION;
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
END CATCH

GO

CREATE PROCEDURE SelectUsers
AS
SELECT nomUser +' '+ apeUser as Nombres, nUser FROM USUARIO

GO

CREATE PROCEDURE SelectUser
@nUser varchar(15)
AS
SELECT nomUser, apeUser, dirUser, telUser, apeUser FROM USUARIO WHERE nUser = @nUser 
