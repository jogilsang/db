
-- bak ���� Ȯ��
restore filelistonly from disk = 'C:\Users\user\Downloads\AdventureWorksLT2017.bak'

-- bak ���� ����
restore database sample
from disk='C:\Users\user\Downloads\AdventureWorksLT2017.bak'
with
move 'AdventureWorksLT2012_Data' to 'C:\mssql\sample\sample.mdf',
move 'AdventureWorksLT2012_Log' to 'C:\mssql\sample\sample.ldf', replace;