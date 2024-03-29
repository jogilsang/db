
## 1.MS-SQL

- ## MY Posting
    - setting
        - [AWS RDS 자습서 - MSSQL 설치해보기](https://blog.naver.com/jogilsang/221395181062)
        - [MSSQL - Sample DB사용, bak 파일형식의 DB복원하기](https://blog.naver.com/jogilsang/221855270476)
        - [MSSQL - 사용자 정의 테이블 형식, 타입](https://blog.naver.com/jogilsang/221861178626)
    - syntax
        - [MSSQL - SELECT](https://blog.naver.com/jogilsang/221823007090)
        - [MSSQL - UPDATE, COMMIT, ROLLBACK, SAVE](https://blog.naver.com/jogilsang/221832202579)
        - [MSSQL - CASE, IF, ELSE, WITH](https://blog.naver.com/jogilsang/221826719183)
        - [MSSQL - JOIN, SUBQUERY](https://blog.naver.com/jogilsang/221839429376)
        - [MSSQL - Function](https://blog.naver.com/jogilsang/221826663647)
        - [MSSQL - 저장 프로시저(stored procedure, SP)](https://blog.naver.com/jogilsang/221857532307)
    - util
        - [MSSQL - SSMS 테마 어둡게 사용하기, Dark Theme](https://blog.naver.com/jogilsang/221873071604)

## TOC
- [setting](#setting)
    - [restore](#restore)
- default
    - [define](#MSSQL-???)
    - [process](#process)
    - [function](#MSSQL-function)
- util
    - [doc](#doc)
    - [keymap](#keymap)
- query
    - [JOBLIST](#joblist)
- where
    - [date](#date)

---

## setting
### install
`설치 : ` https://dev.mysql.com/downloads/file/?id=492434  

### restore
```
-- bak 파일 확인
restore filelistonly from disk = 'C:\Users\user\Downloads\AdventureWorksLT2017.bak'

-- bak 파일 복구
restore database sample
from disk='C:\Users\user\Downloads\AdventureWorksLT2017.bak'
with
move 'AdventureWorksLT2012_Data' to 'C:\mssql\sample\sample.mdf',
move 'AdventureWorksLT2012_Log' to 'C:\mssql\sample\sample.ldf', replace;
```
** 샘플 db sample db : https://archive.codeplex.com/?p=msftdbprodsamples

---
## default
### process
```
저장 프로시저
SQL문이 두 개 이상이면 일괄처리

WITH(NOLOCK)
트랜잭션이 롤백이되어 잘못된 데이터를 읽더라도,
난 트랜잭션 중인 데이터를 읽겠다.

Batch Requests/sec 
배치가 수행된 수
값이 3이라면, 세 개의 SP가 동시에 실행

```
### function
```
Ascii()
Char()
Charindex()
Difference(a,b) 
LEFT('abced', 3)
Len()
SELECT Lower('ABCED')
SELECT Ltrim('ABCED');
SELECT NChar(20)
```

---
## util
### doc
```
https://docs.microsoft.com/ko-kr/sql/t-sql/functions/year-transact-sql?view=sql-server-ver15
```
### keymap
```
alt + t(도구) +o(옵션) : 옵션 
```

## where
### date
```sql
Convert(CHAR(8), InDate,112) between '20210101' and '20210131'
```

## joblist
```sql
SELECT
	A.job_id, A.name, A.enabled , description, A.date_created, A.date_modified , 
	D.step_id, D.step_name, D.subsystem, D.command 
FROM msdb.dbo.sysjobs A 
	INNER JOIN msdb.dbo.sysjobschedules B ON A.job_id = B.job_id 
	INNER JOIN msdb.dbo.sysschedules C ON B.schedule_id = C.schedule_id 
	INNER JOIN msdb.dbo.sysjobsteps D ON A.job_id = D.job_id 
ORDER BY A.name
```


