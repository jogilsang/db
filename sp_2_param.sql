
-- �Ű� ������ 1���� ���� ���ν���
CREATE PROCEDURE hello_world
  @CountryRegion NVARCHAR(10)
AS
	SELECT * FROM sample.SalesLT.Address a WHERE a.CountryRegion = @CountryRegion;
GO

EXEC hello_world 'canada';
EXEC hello_world @CountryRegion = 'canada';





































