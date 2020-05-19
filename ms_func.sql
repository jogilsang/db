--ms-sql
--string
--a(97) ~ z(122) , A(65) ~ Z(90)
select ASCII('a') AS ASCII from pubs.dbo.jobs

select CHAR('97') AS CHAR from pubs.dbo.jobs

select SUBSTRING('abcdefg', 0, 4) AS substring from pubs.dbo.jobs

select concat('i' + ' am',' ionman') AS concat from pubs.dbo.jobs

select LOWER('I AM IONMAN') AS LOWER from pubs.dbo.jobs

select UPPER('i am ionman') AS UPPER from pubs.dbo.jobs

select LEN('i am ionman') AS LENGTH from pubs.dbo.jobs

select LTRIM('   i am ionman') AS LTRIM from pubs.dbo.jobs a

select RTRIM('i am ionman   ') AS RTRIM from pubs.dbo.jobs a

select TRIM('    i am ionman   ') AS TRIM from pubs.dbo.jobs a

--time
select GETDATE() AS YEAR from pubs.dbo.jobs a

select YEAR(GETDATE()) AS YEAR from pubs.dbo.jobs a

select MONTH(GETDATE()) AS MONTH from pubs.dbo.jobs a

select DAY(GETDATE()) AS DAY FROM pubs.dbo.jobs a

--math
select ABS(-300) AS ABS from pubs.dbo.jobs a
select ABS(300) AS ABS from pubs.dbo.jobs a

select 300 % 20 AS MOD
select 300 % 7 AS MOD
select 5 % 7 AS MOD

select CEILING(26.5) AS CEIL

select FLOOR(26.5) AS FLOOR

select ROUND(26.5, 0) AS ROUND
select ROUND(26.5, 1) AS ROUND
select ROUND(26.555, 1) AS ROUND

--rownum
select a.job_id, job_desc,
	ROW_NUMBER() over(order by a.job_id) AS ROW_NUM 
	from pubs.dbo.jobs a

-- EQUI JOIN (등가 조인) n x n개
select a.SupplierID, a.Country, b.CustomerID from [Northwind].[dbo].[Suppliers] a, [Northwind].[dbo].[Customers] b
where a.Country = b.Country ORDER BY a.Country

-- INNER JOIN ( = 등가 조인) 
select a.SupplierID, a.Country, b.CustomerID 
from [Northwind].[dbo].[Suppliers] a INNER JOIN [Northwind].[dbo].[Customers] b
ON a.Country = b.Country ORDER BY a.Country

-- INTERSECT 연산 ( 교집합 )
select a.City, a.Country FROM [Northwind].[dbo].[Suppliers] a
INTERSECT
select b.Country, b.City FROM [Northwind].[dbo].[Customers] b

-- Outer JOIN
select a.SupplierID, a.Country, b.CustomerID  
from [Northwind].[dbo].[Suppliers] a LEFT OUTER JOIN [Northwind].[dbo].[Customers] b 
ON a.Country = b.Country ORDER BY a.Country

select a.SupplierID, a.Country, b.CustomerID  
from [Northwind].[dbo].[Suppliers] a RIGHT OUTER JOIN [Northwind].[dbo].[Customers] b 
ON a.Country = b.Country ORDER BY a.Country

-- CROSS JOIN
SELECT a.SupplierID, b.CustomerID 
FROM [Northwind].[dbo].[Suppliers] a CROSS JOIN [Northwind].[dbo].[Customers] b

-- UNION
select a.au_id, a.title_id from pubs.dbo.titleauthor a
union
select b.au_id, b.title_id from pubs.dbo.titleauthor2 b

-- UNION ALL
select a.au_id, a.title_id from pubs.dbo.titleauthor a
union all
select b.au_id, b.title_id from pubs.dbo.titleauthor2 b

-- 테이블 복사해서 새로 생성
-- select * into [새로운 테이블 명] from [복사할 테이블 명]
select * into titleauthor2 from titleauthor

-- IN (subquery) 
-- before
select * from pubs.dbo.jobs a
where min_lvl = 75 

-- after
select * from pubs.dbo.jobs a
where min_lvl = 75 and max_lvl IN ( select max_lvl from pubs.dbo.jobs b where max_lvl > 160)

-- ALL (subquery) 
select * from pubs.dbo.jobs a
where a.min_lvl = 75 and a.max_lvl >= ALL( select max_lvl from pubs.dbo.jobs where max_lvl > 160)

-- EXISTS
select * from pubs.dbo.jobs a
where a.min_lvl = 75 and exists ( select 1 from pubs.dbo.jobs where max_lvl > 150 )

-- 스칼라(Scala) Subquery
select job_id AS 직업,
job_desc AS 직업설명,
min_lvl AS 최소연봉,
max_lvl AS 최대연봉
from pubs.dbo.jobs a
where a.min_lvl = 75

select job_id AS 직업,
job_desc AS 직업설명,
min_lvl AS 최소연봉,
max_lvl AS 최대연봉,
(SELECT max_lvl FROM pubs.dbo.jobs ) AS 평균급여
from pubs.dbo.jobs a
where a.min_lvl = 75

-- 연관(Correlated) Subquery
select Country AS 국가 
from [Northwind].[dbo].[Suppliers] a 
WHERE a.Country = ( 
	SELECT b.Country from [Northwind].[dbo].[Customers] b WHERE b.Country = a.Country)

-- ROLLUP (GROUP BY의 SUBTOTAL)
select * from [Northwind].[dbo].[Suppliers] a group by a.SupplierID


-- 뷰는 창문이다
-- 실제로 존재하지않는다
use pubs
select * from pubs..sales

-- C : view를 생성한다.
create view temp
as
	select * from pubs..sales
go
-- R : view를 읽는다
select * from temp

-- U : view를 수정한다
-- 실제 테이블, 뷰 모두 반영된다.
update temp SET qty = 10 where stor_id=6380

-- D : view를 삭제한다
drop view temp

-- View의 테이블정보 등을 볼 수 있다.
sp_help temp
-- View의 쿼리문을 볼 수 있다.
sp_helpindex temp
-- View의 행수, 데이터사이즈, index 등을 확인 할 수 있다.
sp_spaceused temp

--모든 뷰를 보겠다
select table_name, view_definition
from INFORMATION_SCHEMA.VIEWS
WHERE TABLE_SCHEMA ='dbo'
and table_name not like 'sys%'


-- raw
/****** SSMS의 SelectTopNRows 명령 스크립트 ******/
SELECT 
	stor_id, qty, year(ord_date)
  FROM [pubs].[dbo].[sales]

-- 94년 데이터만 나타내자
SELECT 
stor_id
, SUM(case year(ord_date) when 1992 then qty else 0 end) as y92
, SUM(case year(ord_date) when 1993 then qty else 0 end) as y93
, SUM(case year(ord_date) when 1994 then qty else 0 end) as y94
FROM [pubs].[dbo].[sales]
GROUP BY stor_id

--select stor_id, isnull([1992], 0) as [1992], [1993], [1994]
select stor_id, [1992], [1993], [1994]
  from (
	select stor_id, year(ord_date) as yy, qty
	from [pubs].[dbo].[sales]
  ) s
	pivot (
		sum(qty) for yy in ([1992], [1993], [1994])
	) pS

-- NULLIF (2,3) 2 리턴
-- NULLIF (3,3) NULL 리턴

-- null이 아닌 첫번째 것
--select COALESCE(1 ,NULL,3)

with emp as (
	select
)
select * emp

with CarPartsCTE(SubPart, Qty)
AS
	-- 엥커 맴버
	-- CarPartsCTE 자신을 참조하지 않는 SELECT 쿼리
	SELECT SubPart, Qty
	FROM CarParts
	WHERE Part = 'Body'

	UNION ALL

	-- 재귀맴버( Recursive Member)
	-- CTE (CarPartsCTE ) 자기 자신을 참조하는 SELECT 쿼리
	SELECT CarParts, SubPart , CarPartsCTE.Qty =CarParts.QTY
	FROM CarPartsCTE INNER JOIN CarParts
		ON CarPartsCTE SubPart = CarParts Part
	WHERE CarParts CarID = 1
)

-- 출력쿼리
-- SELECT * FROM CarPartsCTE order by subPart
SELECT SubPart , SUM(Qty) as q



--뷰는 창문이다
--실제로 존재하지않는다
-- order by를 쓰지않는다
-- 성능이 엉망임


-- 1
create VIEW viewTitles
AS
SELECT title_id, price FROM pubs..titles
go

create VIEW viewTitles2 ([아이디], [가격])
AS
SELECT title_id, price FROM pubs..titles
go

create VIEW viewTitles3 
AS
SELECT title_id AS [아이디], price AS [가격] FROM pubs..titles
go

--암호화 하는경우, 원본은 보관해야함
alter VIEW viewTitles4
with encryption
AS
SELECT title_id AS [아이디], price AS [가격] FROM pubs..titles
go

select * from viewTitles4 order by 2

-- 2
SELECT title_id, price FROM pubs..titles

sp_helptext viewTitles4
sp_help viewTitles4
sp_depends viewTitles4

create view vA
as
select title_id, price * 1.1 as VAT from pubs..titles
go
select * from vA


--View에서 delete 시 원래 테이블도 영향을 받음
-- View에서 Insert 시, null을 허용하거나, default가 있거나, timestamp거나 identity거나 하지않으면 안됨

select * from sysobjects
select * from sys.sysobjects
where xType = 'V'

--V = View, P + procedure , T = table

select * from information_schema.views

exec sp_helptext 'information_schema.views'
use pubs
select * from INFORMATION_SCHEMA.CHECK_CONSTRAINTS

--모든 뷰를 보겠다
select table_name, view_definition
from INFORMATION_SCHEMA.VIEWS
WHERE TABLE_SCHEMA ='dbo'
and table_name not like 'sys%'

ㅡ ㅡㅜㅏㅜㅡㅗㅛ6,

select * from sysobjects where type ='u'

--계산된 칼럼에 인덱스를 추가하면, 테이블 크기가 늘어나서 확인이가능
--실제 칼럼으로 사용될수있고, where,groupby에서 index가 적용되기때문에, 사용가능
use Northwind
go
select orderID, productID, UnitPrice, Quantity
into tmpOd
from [Order Details]
go

ALTER TABLE tmpOd
add Amt as UnitPrice * Quantity
go

select * from tmpOd

alter table tmpOd
add constraint PK_tmpOD PRIMARY KEY
NONCLUSTERED (orderID, productID)
go

sp_helpindex tmpOd

CREATE CLUSTERED INDEX idxAmt ON tmpOD (amt)
go

--row와 데이터정보 볼수있음
sp_spaceused tmpod


set statistics io on
