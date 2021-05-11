
## 1.MS-SQL

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


