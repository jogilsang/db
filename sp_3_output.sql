CREATE PROCEDURE usp_users4
	@txtValue NCHAR(10),
	@outValue INT OUTPUT
AS
	INSERT INTO textTbl VALUES(@txtValue);
	SELECT @outValue = IDENT_CURRENT('textTbl');
GO

CREATE TABLE textTbl (id INT IDENTITY, txt NCHAR(10));
GO

--���� ���ν��� ����
DECLARE @myValue INT;
EXEC usp_users4 '�׽�Ʈ ��1', @myValue OUTPUT;
PRINT '���� �Էµ� ID�� ===>' + CONVERT(CHAR(5), @myValue) -- ��� ���(IDENTITY �� ���)