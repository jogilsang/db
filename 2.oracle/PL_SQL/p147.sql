

-- p147
-- Cursor 문 이해하기
-- Cursor ? 처리할 데이터를 저장할 메모리 영역

DECLARE 
	v_ename emp.ename%TYPE;
	v_sal emp.sal%TYPE;
	v_deptno emp.deptno%TYPE;
	
	CURSOR emp_cursor IS
		SELECT ename, sal, deptno
		FROM emp
		WHERE deptno = &p_deptno;
BEGIN
	OPEN emp_cursor;
	LOOP
		FETCH emp_cursor INTO v_ename, v_sal, v_deptno;
		EXIT WHEN emp_cursor%notfound;
		dbms_output.put_line(v_ename || ' ' || v_sal || ' ' || v_deptno);
	END LOOP;
	CLOSE emp_cursor;
END;
/

--SQL> @p147
--Enter value for p_deptno: 10
--KING 5000 10
--CLARK 2450 10
--MILLER 1300 10
--
--PL/SQL procedure successfully completed.

