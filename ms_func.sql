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
