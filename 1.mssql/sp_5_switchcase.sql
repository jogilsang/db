--ifelse
CREATE PROC ifElse
	@FirstName NVARCHAR(10)
AS
	DECLARE @CustomerID INT --CustomerID ����
	SELECT @CustomerID = CustomerID FROM sample.SalesLT.Customer
		WHERE FirstName = @FirstName;
	if(@CustomerID >= 10)
		BEGIN
			PRINT N'������ 10��ȿ� ���ԵǼ̽��ϴ�.';
		END
	ELSE
		BEGIN
			PRINT N'������ 10�� ���̽ʴϴ�.';
		END
GO

EXEC ifElse 'Gee';
EXEC ifElse 'Janet';
EXEC ifElse 'Lucy';

select TOP (10) * from sample.SalesLT.address