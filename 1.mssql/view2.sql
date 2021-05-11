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
