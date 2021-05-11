--ifelse
CREATE PROC ifElse
	@FirstName NVARCHAR(10)
AS
	DECLARE @CustomerID INT --CustomerID 저장
	SELECT @CustomerID = CustomerID FROM sample.SalesLT.Customer
		WHERE FirstName = @FirstName;
	if(@CustomerID >= 10)
		BEGIN
			PRINT N'선착순 10등안에 포함되셨습니다.';
		END
	ELSE
		BEGIN
			PRINT N'선착순 10등 밖이십니다.';
		END
GO

EXEC ifElse 'Gee';
EXEC ifElse 'Janet';
EXEC ifElse 'Lucy';

select TOP (10) * from sample.SalesLT.address