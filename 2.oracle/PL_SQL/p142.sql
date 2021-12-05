
-- p142 
-- IF ~ ELSIF ~ ELSE

--SQL> @p142
--Please input your emp name :  ~ scott
--get the high value
--
--PL/SQL procedure successfully completed.

SET serveroutput ON 
SET verify off
accept p_ename prompt 'Please input your emp name :  ~ '

DECLARE 
	v_ename emp.ename%TYPE  := upper('&p_ename'); -- emp테이블의 ename의 데이터 아입으로 설정
	v_sal emp.sal%TYPE;
BEGIN 
	SELECT sal INTO v_sal
		FROM emp
		WHERE ename = v_ename;
	
	IF v_sal >= 3000 THEN
		dbms_output.put_line('get the high value');
	ELSIF v_sal >= 2000 THEN 
		dbms_output.put_line('get the middle value');
	ELSE
		dbms_output.put_line('get the low value');
	END IF;
	
END;
/



