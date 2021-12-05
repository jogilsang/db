
-- p 146
-- 이중 loop문

prompt 구구단 전체를 출력합니다 -- 화면에 문장을 출력
BEGIN
	FOR i IN 2 .. 9 LOOP
		FOR j IN 1 .. 9 LOOP
			dbms_output.put_line(i || ' x ' || j || ' = ' || i * j);
		END LOOP;
	END LOOP;
END;
/