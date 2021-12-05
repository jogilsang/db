
-- 1. exec sqlplus
-- 2. edit p139.sql
-- 3. @ p139

-- PL/SQL 변수 이해하기 - 1

SET serveroutput ON 
accept p_num1 prompt '첫 번째 숫자를 입력하세요 ~ ' 
accept p_num2 prompt '두 번째 숫자를 입력하세요 ~ '

DECLARE 
	v_sum number(10);
BEGIN 
	v_sum := &p_num1 + &p_num2 ;

	dbms_output.put_line('총합은 :  ' || v_sum);
END;
/
