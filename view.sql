

use pubs
select * from pubs..sales

-- C : view�� �����Ѵ�.
create view temp
as
	select * from pubs..sales
go
-- R : view�� �д´�
select * from temp

-- U : view�� �����Ѵ�
update temp SET qty = 10 where stor_id=6380

-- D : view�� �����Ѵ�
drop view temp

-- View�� ���̺����� ���� �� �� �ִ�.
sp_help temp
-- View�� �������� �� �� �ִ�.
sp_helpindex temp
-- View�� ���, �����ͻ�����, index ���� Ȯ�� �� �� �ִ�.
sp_spaceused temp