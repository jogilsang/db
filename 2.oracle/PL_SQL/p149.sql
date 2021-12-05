

-- p149
-- Cursor문 이해하기 (FOR LOOP)
-- Cursor 안쓰기

accept p_deptno prompt 'please input your deptno : '

BEGIN
	FOR emp_record IN (SELECT ename, sal, deptno
									FROM emp
									WHERE deptno = &p_deptno) LOOP 
									
			dbms_output.put_line(emp_record.ename || ' ' ||
										emp_record.sal || ' ' ||
										emp_record.deptno);
			
				END LOOP;
END;
/
--
--SQL> @p149
--please input your deptno : 10
--KING 5000 10
--CLARK 2450 10
--MILLER 1300 10
--
--PL/SQL procedure successfully completed.