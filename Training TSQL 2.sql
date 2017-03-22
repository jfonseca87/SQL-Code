
select * from Purchasing.PurchaseOrderHeader
select * from Purchasing.PurchaseOrderDetail


select EmployeeID, count(TotalDue), month(OrderDate)  
from purchasing.PurchaseOrderHeader 
where EmployeeID = 258 and YEAR(OrderDate) = 2006 and month(orderdate) = 2
group by orderdate, EmployeeID

select employeeid, totaldue, orderdate 
from Purchasing.PurchaseOrderHeader 
where EmployeeID = 258 and year(orderdate) = 2006 and MONTH(orderdate) = 2 
order by TotalDue


select employeeid, sum(totaldue) as totsales 
from purchasing.PurchaseOrderHeader 
where EmployeeID = 258 and YEAR(orderdate) = 2006 and MONTH(orderdate) = 2 
group by EmployeeID

set language 'spanish'

begin try
	select datename(month,orderdate) as sa, sum(totaldue) as salesmonth
	from purchasing.PurchaseOrderHeader 
	where year(orderdate) = 2006 and EmployeeID = 258
	group by datename(month,orderdate)
	having sum(totaldue) > 10000
	order by salesmonth
	for xml auto
end try
begin catch
	print 'mensaje de error!!!'
end catch

begin try
	select datename(month,orderdate) as sa, sum(totaldue) as salesmonth
	from purchasing.PurchaseOrderHeader 
	where year(orderdate) = 2006 and EmployeeID = 258
	group by datename(month,orderdate)
	order by salesmonth
	for xml auto
end try
begin catch
	print 'mensaje de error!!!'
end catch


select employeeid, totaldue, orderdate 
from Purchasing.PurchaseOrderHeader 
where EmployeeID = 258 and year(orderdate) = 2006


select max(PurchaseOrderID) from Purchasing.PurchaseOrderHeader

select * from sales.CreditCard

create procedure sp_CardNumber 
@CreditCardId int,
@CardNumber nvarchar(100) output
as
begin
	select @CardNumber = cardnumber
	from sales.CreditCard
	where CreditCardID = @CreditCardId 
end 

declare @cardnumber nvarchar(100)
exec sp_CardNumber 1, @cardnumber output
print 'Tarjeta No ' + @cardnumber

create procedure sp_CardNumber1 
@CreditCardId int,
@CardNumber nvarchar(100) output
as
begin
	set @CardNumber = (select cardnumber
	from sales.CreditCard
	where CreditCardID = @CreditCardId) 
end 

declare @cardnumber nvarchar(100)
exec sp_CardNumber1 2, @cardnumber output
print 'Tarjeta No ' + @cardnumber