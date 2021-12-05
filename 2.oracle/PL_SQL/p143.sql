

-- p143
-- Basic Loop 이해하기
DECLARE
	v_count number(10) := 0 ;
BEGIN
	LOOP
		v_count  := v_count + 1;
		dbms_output.put_line('2 x ' || v_count || ' = ' || 2*v_count);
		EXIT WHEN v_count = 9;
	END LOOP;	
END;
/

--SQL> @p143
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