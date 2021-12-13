
## 2.Oracle

### My Posting
- [오라클Oracle - Window 10 설치 및 IDE 연결 및 접속, DBeaver](https://blog.naver.com/jogilsang/222513229876)
- []
---

## INDEX
### [프로그램 실행(exec)](#exec)
### [한글패치](#한글패치)
### [Login](#Login)
#### - [sys](#sys)
#### - [user](#user)

### [METHOD](#method)
- ### [UPPDER,LOWER,INITCAP](uppder,lower,initcap)

### [PL/SQL](#pl\/sql)

### [Query](#query)
#### - [쿼리내역조회 - History](#History)
#### - [출력개수 - rownum](#rownum)
#### - [칼럼명으로 테이블 찾기 - findTableAboutColumn](#findTableAboutColumn)
#### - [equi join](#equi%20join)
#### - [non equi join](non%20equi%20join)
#### - [outer join](outer%20join)
#### - [COMMIT 후 ROLLBACK](#commit%20후%20rollback)
#### - [UNPIVOT](https://gent.tistory.com/382)

### [System](#System)
####  - [날짜형식 - DateFormat](#DateFormat)

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

### 한글패치
```
1.1 regedit 실행
1.2 컴퓨터\HKEY_LOCAL_MACHINE\SOFTWARE\ORACLE\KEY_OraDB19Home1
1.3 AMERICAN_AMERICA.KO16KSC5601 

2.1 [시스템 속성] - [환경 변수] - [시스템 변수 새로만들기] 
2.2 변수이름 : NLS_LANG
2.3 값 : AMERICAN_AMERICA.KO16KSC5601

3.1.sqlplus 실행
3.2.
update sys.props$ set value$='UTF8' where name='NLS_CHARACTERSET';
update sys.props$ set value$='UTF8' where name='NLS_NCHAR_CHARACTERSET';
update sys.props$ set value$='KOREAN_KOREA.UTF8' where name='NLS_LANGUAGE';
shutdown immediate;
startup;

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

### pl/sql

### query
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

### rownum
```sql
--oracle
-- 출력개수
select ... where rownum <= n;

-- top n-query
-- 1. 4개 행으로 제한해서 출력
FETCH 4 ROWS ONLY;

-- 2. 4개 출력하는대, 출력되는 값과 겹치는게 있다면 추가로 같이출력
FETCH 4 ROWS WITH TIES;

-- 3. 상위 20%의 행을 가져온다
FETCH FIRST 20 PERCENT ROWS ONLY;

-- 4. 출력이 시작되는 위치 지정가능
OFFSET 9 ROWS;
```

#### findTableAboutColumn
```sql
-- oracle
-- 칼럼찾기
select TABLE_NAME AS "테이블 명", COLUMN_NAME AS "칼럼 명"
from ALL_TAB_COLUMNS
where COLUMN_NAME='칼럼명';
```

#### equi join
```sql
select ename, loc
from emp, dept
where emp.deptno = dept.deptno ;

select e.ename, d.loc, e.job
from emp e, dept d
where e.deptno = d.deptno and e.job = 'ANLYST';
```

#### non equi join
```sql
select e.name, e.sal, s.grade
from emp e, salgrade s
where e.sal between s.losal and s.hisal;
```

#### outer join
```sql
-- 사원 테이블과 부서 테이블을 조인했을 때, 결과가 덜 나오는 쪽에 (+)를 붙여줍니다.
-- RIGHT OUTER JOIN
-- 
select e.ename, d.loc
from emp e, dept d
where e.deptno (+) = d.deptno;

-- LEFT OUTER JOIN
select e.ename, d.loc
from emp e, dept d
where e.deptno = (+) d.deptno;
```

---

### commit 후 rollback
```sql
COMMIT 후 ROLLBACK 해야하는경우
테이블 안의 모든 데이터를 삭제 후,
새로 입력하는 방법

SELECT *
FROM 테이블명
AS OF TIMESTAMP(SYSTIMESTAMP - INTERVAL '원하는시간' MINUTE);

INSERT INTO 테이블명
SELECT * FROM 테이블명 
AS OF TIMESTAMP(SYSTIMESTAMP - INTERVAL '원하는시간' MINUTE);
```


### System
#### DateFormat
```sql
--oracle
--날짜형식
SELECT * FROM NLS_SESSION_PARAMETERS 
WHERE PARAMETER = 'NLS_DATE_FORMAT'
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

