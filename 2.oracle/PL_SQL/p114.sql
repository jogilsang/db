

-- P114 : SQL로 알고리즘 문제풀기
-- 삼각형 출력

WITH LOOP_TABLE AS (SELECT LEVEL AS num FROM dual CONNECT BY LEVEL <= 8)
SELECT LPAD(' ', 15-num , ' ')|| LPAD('★' , num ,'★' ) FROM LOOP_TABLE