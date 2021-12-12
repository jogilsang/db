

-- DUAL? : Oracle 기본 테이블
-- 임시로 사용
-- 테이블 생성없이 결과 return가능

-- CONNECT BY LEVEL : 연속된 숫자를 조회할 때 사용

WITH LOOP_TABLE AS (
	SELECT LEVEL AS NUM
	FROM DUAL
	CONNECT BY LEVEL <= 9 )
SELECT '2' || ' x ' || NUM || ' = ' || 2 * NUM AS "2단"
FROM LOOP_TABLE;

--'2'||'X'||NUM||'='||NUM*2
--2 x 1 = 2
--2 x 2 = 4
--2 x 3 = 6
--2 x 4 = 8
--2 x 5 = 10
--2 x 6 = 12
--2 x 7 = 14
--2 x 8 = 16
--2 x 9 = 18
--2 x 10 = 20
