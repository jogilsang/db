
--SQL> @p151.sql
--Function created.
--SQL> select ename, get_loc(deptno) as loc from emp where job='SALESMAN';

CREATE OR REPLACE FUNCTION get_loc
(p_deptno IN dept.deptno%TYPE)
RETURN dept.loc%TYPE
IS 
	v_loc 		dept.loc%TYPE;
BEGIN 
	SELECT loc INTO v_loc
		FROM dept
		WHERE deptno = p_deptno;
	RETURN v_loc;
END;
/

--
--ENAME
----------------------
--LOC
----------------------------------------------------------------------------------
--MARTIN
--CHICAGO
--
--ALLEN
--CHICAGO
--
--TURNER
--CHICAGO
--
--
--ENAME
----------------------
--LOC
----------------------------------------------------------------------------------
--WARD
--CHICAGO

