
-- 1. Factorial function

CREATE FUNCTION fnFactorial (@num int)

RETURNS int AS
Begin
DECLARE @fact INT =1;
    while (@num>0) 
	Begin
	  set @fact=@fact*@num
	  set @num=@num-1;
	  End;
    RETURN @fact
END

Select dbo.fnFactorial(6) As factorial


--2. an SQL statement to create a function with name fnGetCustomersByAge 
--which should take Age as parameter and returns the records from Customer 
--table where age is greater than or equal to the Age parameter.

Create function fnGetCustomersByAge (@Age int)
returns table
as

  return(select* from Customer where Age>=@Age)


--3. Write an SQL statement to create a function with name fnGetOldestCustomer 
--which should return the record of the oldest customer by age

Create function fnGetOldestCustomer()
returns table
as

  return(select*from Customer where Age=(select(MAX(Age)) from Customer) )

  select* from dbo.fnGetOldestCustomer()


  -- 4. Write an SQL statement to alter a function fnGetCustomersByAge 
  --which should take Age as parameter and returns only the CustomerName

  alter function fnGetCustomersByAge (@Age int)
returns table
as

  return(select CustomerName from Customer where Age>=@Age)




-- 5.  an SQL statement to delete a function fnFactorial

drop function fnFactorial
