

-- p145
-- PL/SQL 의 for loop 문으로 구구단 2단 출력 
BEGIN 
	FOR i IN 1 .. 9 LOOP
		dbms_output.put_line('3 x ' || i || ' = ' || 3 * i);
	END LOOP;
END;
/

--SQL> @p145
--2 x 1 = 2
--2 x 2 = 4
--2 x 3 = 6
--2 x 4 = 8
--2 x 5 = 10
--2 x 6 = 12
--2 x 7 = 14
--2 x 8 = 16
--2 x 9 = 18
--
--PL/SQL procedure successfully completed.