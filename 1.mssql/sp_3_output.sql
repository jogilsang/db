CREATE PROCEDURE usp_users4
	@txtValue NCHAR(10),
	@outValue INT OUTPUT
AS
	INSERT INTO textTbl VALUES(@txtValue);
	SELECT @outValue = IDENT_CURRENT('textTbl');
GO

CREATE TABLE textTbl (id INT IDENTITY, txt NCHAR(10));
GO

--저장 프로시저 생성
DECLARE @myValue INT;
EXEC usp_users4 '테스트 값1', @myValue OUTPUT;
PRINT '현재 입력된 ID값 ===>' + CONVERT(CHAR(5), @myValue) -- 결과 출력(IDENTITY 값 출력)