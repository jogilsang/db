



-- 배치작업 에러 2 해결
-- Agent Xps 사용하기
SP_CONFIGURE 'show advanced options', 1;
GO

RECONFIGURE
GO

SP_CONFIGURE 'Agent XPs', 1;
go

RECONFIGURE
GO

commit