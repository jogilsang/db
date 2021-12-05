
-- p141.sql
-- IF-ELSE 이해하기
--SQL> @p141
--Please input your num ~ 50
--it is even
--
--PL/SQL procedure successfully completed.

SET serveroutput ON 
SET verify off -- 코드실행 시, 변수의 값이 변화하는 과정을 보여주지않는다
accept p_num prompt 'Please input your num ~ '

BEGIN 
	IF  mod(&p_num, 2) = 0 THEN 
		dbms_output.put_line('it is even');
	ELSE 
		dbms_output.put_line('it is odd');
	END IF;	
END;
/