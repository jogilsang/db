
-- 매개 변수가 1개인 저장 프로시저
CREATE PROCEDURE hello_world
  @CountryRegion NVARCHAR(10)
AS
	SELECT * FROM sample.SalesLT.Address a WHERE a.CountryRegion = @CountryRegion;
GO

EXEC hello_world 'canada';
EXEC hello_world @CountryRegion = 'canada';





































