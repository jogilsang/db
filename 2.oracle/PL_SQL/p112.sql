
-- Feedback
-- WITH절로 여러개 만들수있음
-- TO_CHAR 함수가 있음
-- 구구단 1단 ~ 9단 출력
 
WITH LOOP_TABLE AS( 
			SELECT LEVEL AS NUM FROM DUAL CONNECT BY LEVEL <= 9
		) ,
		GUGU_TABLE AS(
			SELECT LEVEL + 1 AS NUM FROM dual CONNECT BY LEVEL <= 8
		)
SELECT TO_CHAR(l.NUM) || ' x ' || TO_CHAR(g.NUM) || ' = ' || TO_CHAR(l.NUM * g.NUM) AS 구구단
FROM LOOP_TABLE l, GUGU_TABLE g

--구구단
--1 X 2 = 2
--1 X 3 = 3
--1 X 4 = 4
--1 X 5 = 5
--1 X 6 = 6
--1 X 7 = 7
--1 X 8 = 8
--1 X 9 = 9
--2 X 2 = 4
--2 X 3 = 6
--2 X 4 = 8
--2 X 5 = 10
--2 X 6 = 12
--2 X 7 = 14
--2 X 8 = 16
--2 X 9 = 18
--3 X 2 = 6
--3 X 3 = 9
--3 X 4 = 12
--3 X 5 = 15
--3 X 6 = 18
--3 X 7 = 21
--3 X 8 = 24
--3 X 9 = 27
--4 X 2 = 8
--4 X 3 = 12
--4 X 4 = 16
--4 X 5 = 20
--4 X 6 = 24
--4 X 7 = 28
--4 X 8 = 32
--4 X 9 = 36
--5 X 2 = 10
--5 X 3 = 15
--5 X 4 = 20
--5 X 5 = 25
--5 X 6 = 30
--5 X 7 = 35
--5 X 8 = 40
--5 X 9 = 45
--6 X 2 = 12
--6 X 3 = 18
--6 X 4 = 24
--6 X 5 = 30
--6 X 6 = 36
--6 X 7 = 42
--6 X 8 = 48
--6 X 9 = 54
--7 X 2 = 14
--7 X 3 = 21
--7 X 4 = 28
--7 X 5 = 35
--7 X 6 = 42
--7 X 7 = 49
--7 X 8 = 56
--7 X 9 = 63
--8 X 2 = 16
--8 X 3 = 24
--8 X 4 = 32
--8 X 5 = 40
--8 X 6 = 48
--8 X 7 = 56
--8 X 8 = 64
--8 X 9 = 72
--9 X 2 = 18
--9 X 3 = 27
--9 X 4 = 36
--9 X 5 = 45
--9 X 6 = 54
--9 X 7 = 63
--9 X 8 = 72
--9 X 9 = 81
--
