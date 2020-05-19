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

-- EQUI JOIN (� ����) n x n��
select a.SupplierID, a.Country, b.CustomerID from [Northwind].[dbo].[Suppliers] a, [Northwind].[dbo].[Customers] b
where a.Country = b.Country ORDER BY a.Country

-- INNER JOIN ( = � ����) 
select a.SupplierID, a.Country, b.CustomerID 
from [Northwind].[dbo].[Suppliers] a INNER JOIN [Northwind].[dbo].[Customers] b
ON a.Country = b.Country ORDER BY a.Country

-- INTERSECT ���� ( ������ )
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

-- ���̺� �����ؼ� ���� ����
-- select * into [���ο� ���̺� ��] from [������ ���̺� ��]
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

-- ��Į��(Scala) Subquery
select job_id AS ����,
job_desc AS ��������,
min_lvl AS �ּҿ���,
max_lvl AS �ִ뿬��
from pubs.dbo.jobs a
where a.min_lvl = 75

select job_id AS ����,
job_desc AS ��������,
min_lvl AS �ּҿ���,
max_lvl AS �ִ뿬��,
(SELECT max_lvl FROM pubs.dbo.jobs ) AS ��ձ޿�
from pubs.dbo.jobs a
where a.min_lvl = 75

-- ����(Correlated) Subquery
select Country AS ���� 
from [Northwind].[dbo].[Suppliers] a 
WHERE a.Country = ( 
	SELECT b.Country from [Northwind].[dbo].[Customers] b WHERE b.Country = a.Country)

-- ROLLUP (GROUP BY�� SUBTOTAL)
select * from [Northwind].[dbo].[Suppliers] a group by a.SupplierID


-- ��� â���̴�
-- ������ ���������ʴ´�
use pubs
select * from pubs..sales

-- C : view�� �����Ѵ�.
create view temp
as
	select * from pubs..sales
go
-- R : view�� �д´�
select * from temp

-- U : view�� �����Ѵ�
-- ���� ���̺�, �� ��� �ݿ��ȴ�.
update temp SET qty = 10 where stor_id=6380

-- D : view�� �����Ѵ�
drop view temp

-- View�� ���̺����� ���� �� �� �ִ�.
sp_help temp
-- View�� �������� �� �� �ִ�.
sp_helpindex temp
-- View�� ���, �����ͻ�����, index ���� Ȯ�� �� �� �ִ�.
sp_spaceused temp

--��� �並 ���ڴ�
select table_name, view_definition
from INFORMATION_SCHEMA.VIEWS
WHERE TABLE_SCHEMA ='dbo'
and table_name not like 'sys%'


-- raw
/****** SSMS�� SelectTopNRows ��� ��ũ��Ʈ ******/
SELECT 
	stor_id, qty, year(ord_date)
  FROM [pubs].[dbo].[sales]

-- 94�� �����͸� ��Ÿ����
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

-- NULLIF (2,3) 2 ����
-- NULLIF (3,3) NULL ����

-- null�� �ƴ� ù��° ��
--select COALESCE(1 ,NULL,3)

with emp as (
	select
)
select * emp

with CarPartsCTE(SubPart, Qty)
AS
	-- ��Ŀ �ɹ�
	-- CarPartsCTE �ڽ��� �������� �ʴ� SELECT ����
	SELECT SubPart, Qty
	FROM CarParts
	WHERE Part = 'Body'

	UNION ALL

	-- ��͸ɹ�( Recursive Member)
	-- CTE (CarPartsCTE ) �ڱ� �ڽ��� �����ϴ� SELECT ����
	SELECT CarParts, SubPart , CarPartsCTE.Qty =CarParts.QTY
	FROM CarPartsCTE INNER JOIN CarParts
		ON CarPartsCTE SubPart = CarParts Part
	WHERE CarParts CarID = 1
)

-- �������
-- SELECT * FROM CarPartsCTE order by subPart
SELECT SubPart , SUM(Qty) as q



--��� â���̴�
--������ ���������ʴ´�
-- order by�� �����ʴ´�
-- ������ ������


-- 1
create VIEW viewTitles
AS
SELECT title_id, price FROM pubs..titles
go

create VIEW viewTitles2 ([���̵�], [����])
AS
SELECT title_id, price FROM pubs..titles
go

create VIEW viewTitles3 
AS
SELECT title_id AS [���̵�], price AS [����] FROM pubs..titles
go

--��ȣȭ �ϴ°��, ������ �����ؾ���
alter VIEW viewTitles4
with encryption
AS
SELECT title_id AS [���̵�], price AS [����] FROM pubs..titles
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


--View���� delete �� ���� ���̺� ������ ����
-- View���� Insert ��, null�� ����ϰų�, default�� �ְų�, timestamp�ų� identity�ų� ���������� �ȵ�

select * from sysobjects
select * from sys.sysobjects
where xType = 'V'

--V = View, P + procedure , T = table

select * from information_schema.views

exec sp_helptext 'information_schema.views'
use pubs
select * from INFORMATION_SCHEMA.CHECK_CONSTRAINTS

--��� �並 ���ڴ�
select table_name, view_definition
from INFORMATION_SCHEMA.VIEWS
WHERE TABLE_SCHEMA ='dbo'
and table_name not like 'sys%'

�� �Ѥ̤��̤ѤǤ�6,

select * from sysobjects where type ='u'

--���� Į���� �ε����� �߰��ϸ�, ���̺� ũ�Ⱑ �þ�� Ȯ���̰���
--���� Į������ ���ɼ��ְ�, where,groupby���� index�� ����Ǳ⶧����, ��밡��
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

--row�� ���������� ��������
sp_spaceused tmpod


set statistics io on
