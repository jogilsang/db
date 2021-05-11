
-- 프로시저 명
CREATE PROCEDURE hello_world
AS
-- SQL 문
	SELECT TOP (5) * from [sample].[SalesLT].[Product]
	SELECT TOP (5) * from [sample].[SalesLT].[Customer]
GO

SELECT DB_NAME() AS ThisDB;

-- 프로시저 실행
EXEC hello_world;

-- 프로시저 삭제
DROP PROCEDURE hello_world



