
## 2.Oracle

### My Posting
- [오라클Oracle - Window 10 설치 및 IDE 연결 및 접속, DBeaver](https://blog.naver.com/jogilsang/222513229876)

---

## INDEX
### [프로그램 실행(exec)](#exec)
### [Login](#Login)
#### - [sys](#sys)
#### - [user](#user)
### [Nomal](#Nomal)
####  - [쿼리내역조회 - History](#History)
### [System](#System)
####  - [날짜형식 - DateFormat](#DateFormat)
####  - [칼럼명으로 테이블 찾기 - findTableAboutColumn](#findTableAboutColumn)
#### [IDE](#IDE)
####  - [SQL Developer 색상바꾸기](#SQL%20Developer%20색상바꾸기)
### [dummy](#dummy)

---
### exec
```
# window
net start OracleServiceORCL
lsnrctl start
```
### Login
#### sys (초기로그인 또는 아이디, 패스워드 까먹은경우)
```
1. SQL Plus 실행
2. id : sys as sysdba
   pw : 엔터키
3. alter user sys identified by 1234;
4. conn sys/1234 as sysdba;
```
#### user
```
1. SQL Plus 실행 - sys로 로그인
2. create user scott
   identified by tiger;
3. grant dba to scott;
4. connect scott/tiger
5. show user
```

### Nomal
#### - History
```sql
--oracle
  SELECT 
  last_active_time
  ,parsing_schema_name
  ,sql_text 
FROM v$sqlarea
WHERE 
  parsing_schema_name <> 'SYS'
  AND parsing_schema_name <> 'SYSMAN'
  AND parsing_schema_name <> 'DBSNMP'
  AND parsing_schema_name <> 'MDSYS'
  AND parsing_schema_name <> 'EXFSYS'
ORDER BY 
  last_active_time DESC;
```

### - 출력개수
```sql
--mssql
select TOP 10

--oracle
select ... where rownum <= n;
```

---

### System
#### DateFormat
```sql
--oracle
--날짜형식
SELECT * FROM NLS_SESSION_PARAMETERS 
WHERE PARAMETER = 'NLS_DATE_FORMAT'
```
#### findTableAboutColumn
```sql
-- oracle
-- 칼럼찾기
select TABLE_NAME AS "테이블 명", COLUMN_NAME AS "칼럼 명"
from ALL_TAB_COLUMNS
where COLUMN_NAME='칼럼명';
```

### SQL Developer 색상바꾸기
1. `Path : C:\Users\cho_gilsang\AppData\Roaming\SQL Developer\system20.2.0.175.1842\o.ide.12.2.1.5.42.200515.1304\dtcache.xml`
```xml
   <schemeMap>
      <Item>
      <!-- Insert the content of the color scheme xml file here !!! -->
```
2. 복사, 붙여넣기 `https://github.com/dracula/oracle-sql-developer/blob/master/Dracula.xml`
3. 환경설정 - 코드편집기 - PL/SQL 구문 색상 - dracula

### dummy
- [초보자를 위한 SQL 200제(PL/SQL)](http://www.infopub.co.kr/index.asp)

