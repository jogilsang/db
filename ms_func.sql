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
	ROW_NUMBER() over(order by a.job_desc DESC) AS Row_ID 
	from pubs.dbo.jobs a

--with
WITH T AS (
	SELECT top 2 au_id FROM pubs.dbo.authors
)
SELECT * FROM pubs.dbo.jobs a, T

--GRANT
GRANT SELECT, INSERT, UPDATE, DELETE ON pubs.dbo.authors TO jogilsang

--UPDATE
BEGIN tran test1
UPDATE pubs.dbo.authors
	SET city = 'test1'
SAVE tran step1

BEGIN tran test2
UPDATE pubs.dbo.authors
	SET city = 'test2'
SAVE tran step2

rollback tran step1
rollback tran
