
-- p118
-- 1부터 10까지 숫자의 곱

SELECT ROUND(EXP(SUM(LN(LEVEL)))) 곱
FROM DUAL CONNECT BY LEVEL <= 10;

SELECT EXP(SUM(LN(LEVEL))) 곱
FROM DUAL CONNECT BY LEVEL <= 10;

SELECT EXP(SUM(LN(LEVEL))) 곱
FROM DUAL CONNECT BY LEVEL <= 10;