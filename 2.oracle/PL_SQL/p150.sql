

-- exec pro_ename_sal('SCOTT');

CREATE OR REPLACE PROCEDURE pro_ename_sal 
(p_ename IN emp.ename%TYPE )
IS 
	v_sal emp.sal%TYPE;
BEGIN 	
		SELECT sal INTO v_sal
		FROM emp
		WHERE ename = &p_ename
		dbms_output.put_line(v_sal || '입니다');
END;
/

