
-- p141.sql
-- IF-ELSE �����ϱ�
--SQL> @p141
--Please input your num ~ 50
--it is even
--
--PL/SQL procedure successfully completed.

SET serveroutput ON 
SET verify off -- �ڵ���� ��, ������ ���� ��ȭ�ϴ� ������ ���������ʴ´�
accept p_num prompt 'Please input your num ~ '

BEGIN 
	IF  mod(&p_num, 2) = 0 THEN 
		dbms_output.put_line('it is even');
	ELSE 
		dbms_output.put_line('it is odd');
	END IF;	
END;
/