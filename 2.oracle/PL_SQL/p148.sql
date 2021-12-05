

-- p148
-- Cursor문 이해하기 (FOR LOOP)

accept p_deptno prompt '부서 번호를 입력하세요 ~'
DECLARE

	CURSOR emp_cursor IS
	SELECT ename,sal,deptno
	FROM emp
	WHERE deptno = &p_deptno;

BEGIN
	FOR emp_record IN emp_cursor LOOP
		dbms_output.put_line(emp_record.ename || ' ' || emp_record.sal || ' ' || emp_record.deptno);
	END LOOP;
END;
/
--
--SQL> @p148
--input your deptno : 10
--KING 5000 10
--CLARK 2450 10
--MILLER 1300 10
--
--PL/SQL procedure successfully completed.