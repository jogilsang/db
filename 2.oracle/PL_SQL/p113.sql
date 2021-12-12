

-- SQL로 알고리즘 문제풀기
-- (직각삼각형 출력)

WITH LOOP_TABLE AS ( SELECT LEVEL AS NUM FROM DUAL CONNECT BY LEVEL <= 8 ORDER BY LEVEL DESC)
SELECT LPAD('★' , NUM , '★') FROM LOOP_TABLE

--LPAD('★',NUM,'★')
--★★★★★★★★
--★★★★★★★
--★★★★★★
--★★★★★
--★★★★
--★★★
--★★
--★