------------------------------------------------------
declare @Book varchar(100)

set @Book = (select title from book where BookId = 14)

print @Book

------------------------------------------------------
declare CBOOKS cursor
for
select title, isbn from book

open CBOOKS

print CBOOKS

-------------------------------------------------------
declare @BookId int

set @BookId = (select bookid from book where BookId = 15)

if(@BookId = 14)
	begin
		(select * from persona where idpersona = 1)
	end
else
	begin
		(select * from persona where idpersona = 2)
	end

-------------------------------------------------------
DECLARE @contador int
    SET @contador = 0
    WHILE (@contador < 100)
    BEGIN
     	SET @contador = @contador + 1

    	PRINT 'Iteracion del bucle ' + cast(@contador AS varchar)
    END

-----------------------------------------------------------------
  DECLARE @contador int
    SET @contador = 0
    WHILE (@contador < 100)
    BEGIN
     	SET @contador = @contador + 1
	IF (@contador % 2 = 0)
       	    CONTINUE
    	PRINT 'Iteracion del bucle ' + cast(@contador AS varchar)
    END

-----------------------------------------------------------------
  DECLARE @contador int
    SET @contador = 0
    WHILE (1 = 1)
    BEGIN
     	SET @contador = @contador + 1
	IF (@contador % 50 = 0)
       	    BREAK
    	PRINT 'Iteracion del bucle ' + cast(@contador AS varchar)
    END 

------------------------------------------------------------------
BEGIN TRY

     DECLARE @divisor int , 

     	     @dividendo int, 

             @resultado int
 

     SET @dividendo = 100

     SET @divisor = 0

     -- Esta linea provoca un error de division por 0
     SET @resultado = @dividendo/@divisor
     PRINT 'No hay error'
 END TRY
 BEGIN CATCH
     PRINT ERROR_NUMBER() 
     PRINT ERROR_SEVERITY()    
     PRINT ERROR_STATE()  
     PRINT ERROR_PROCEDURE()   
     PRINT ERROR_LINE()   
     PRINT ERROR_MESSAGE()  
 END CATCH 

 --------------------------------------------------------
 DECLARE @divisor   int , 
 	 @dividendo int , 
   	 @resultado int
 
 SET @dividendo = 100
 SET @divisor = 0
 -- Esta linea provoca un error de division por 0
 DECLARE @divisor   int , 
 	 @dividendo int , 
   	 @resultado int
 
 SET @dividendo = 100
 SET @divisor = 0
 -- Esta linea provoca un error de division por 0
 SET @resultado = @dividendo/@divisor
 
 IF @@ERROR = 0 
     BEGIN
         PRINT 'No hay error'
     END
 ELSE
     BEGIN         
      PRINT 'Hay error'   
     END

------------------------------------------------------------
SELECT * FROM Book WHERE BookId BETWEEN (14,20)

select * from book

select * from persona