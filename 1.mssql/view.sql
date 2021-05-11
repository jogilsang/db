

use pubs
select * from pubs..sales

-- C : view를 생성한다.
create view temp
as
	select * from pubs..sales
go
-- R : view를 읽는다
select * from temp

-- U : view를 수정한다
update temp SET qty = 10 where stor_id=6380

-- D : view를 삭제한다
drop view temp

-- View의 테이블정보 등을 볼 수 있다.
sp_help temp
-- View의 쿼리문을 볼 수 있다.
sp_helpindex temp
-- View의 행수, 데이터사이즈, index 등을 확인 할 수 있다.
sp_spaceused temp