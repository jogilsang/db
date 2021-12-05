
-- p140.sql
-- PL/SQL 변수 이해하기 - 2

SET serveroutput ON 
accept p_empno prompt '사원번호를 입력하세요 ~ '

DECLARE 
	v_sal number(10);
BEGIN 
	 SELECT sal INTO v_sal
	 FROM emp
	 WHERE empno = &p_empno;
	
	
	dbms_output.put_line('해당 사원의 월급은 ' || v_sal);
	
END;
/