
-- ���ν��� ��
CREATE PROCEDURE hello_world
AS
-- SQL ��
	SELECT TOP (5) * from [sample].[SalesLT].[Product]
	SELECT TOP (5) * from [sample].[SalesLT].[Customer]
GO

SELECT DB_NAME() AS ThisDB;

-- ���ν��� ����
EXEC hello_world;

-- ���ν��� ����
DROP PROCEDURE hello_world



