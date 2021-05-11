
## 5.mariaDB

### MariaDB
0. 환경구축
```
설명 : 
https://javaplant.tistory.com/31

download : 
https://downloads.mariadb.org/mariadb/10.2.14/

Toad IDE :
https://www.toadworld.com/products/downloads?type=Trial&download=toad-edge
```
1. CLI 명령어
```sql
create database my_db;
show databases;
use my_db;

set password for 'root'@'localhost' = password('변경할 비밀번호');
FLUSH PRIVILEGES;

create table rooms (
id int  AUTO_INCREMENT,
name varchar(50),
department varchar(50),
isUsed boolean,
primary key (id)
);

INSERT INTO rooms VALUES ( id, 'test1', 'test', true );

UPDATE pubs.dbo.authors
	SET city = 'contry'
UPDATE reservations SET  title = '연예가중계', userName = '현빈', startTime = '10:00',endTime = '11:00' WHERE id = 10

-- 칼럼추가
ALTER TABLE reservations ADD roomId varchar(50) NOT NULL

-- delete
DELETE FROM [table] WHERE id=5;
Truncate [table]
DELETE FROM reservations WHERE id = ? AND (token = ? OR token = ?)

-- 칼럼 타입 변경
ALTER TABLE reservations MODIFY token varchar(100);

```

2. CLI 한글입력 
```
show variables like 'c%';
cp /etc/mysql/my.cnf /etc/mysql/my.cnf.ori
vi /etc/mysql/my.cnf
```
```
ubuntu 18.04
+----------------------------------+----------------------------+
| Variable_name                    | Value                      |
+----------------------------------+----------------------------+
| character_set_client             | latin1                     |
| character_set_connection         | latin1                     |
| character_set_database           | latin1                     |
| character_set_filesystem         | binary                     |
| character_set_results            | latin1                     |
| character_set_server             | latin1                     |
| character_set_system             | utf8                       |
| character_sets_dir               | /usr/share/mysql/charsets/ |
| check_constraint_checks          | ON                         |
| collation_connection             | latin1_swedish_ci          |
| collation_database               | latin1_swedish_ci          |
| collation_server                 | latin1_swedish_ci          |
| column_compression_threshold     | 100                        |
| column_compression_zlib_level    | 6                          |
| column_compression_zlib_strategy | DEFAULT_STRATEGY           |
| column_compression_zlib_wrap     | OFF                        |
| completion_type                  | NO_CHAIN                   |
| concurrent_insert                | ALWAYS                     |
| connect_timeout                  | 5                          |
| core_file                        | OFF                        |
+----------------------------------+----------------------------+

/etc/mysql/my.cnf 설정파일에서

[client]
default-character-set=utf8

...

[mysql]
default-character-set=utf8

...

[mysqld]
collation-server = utf8_unicode_ci
init-connect='SET NAMES utf8'
character-set-server = utf8

after
+----------------------------------+----------------------------+
| Variable_name                    | Value                      |
+----------------------------------+----------------------------+
| character_set_client             | utf8                       |
| character_set_connection         | utf8                       |
| character_set_database           | utf8                       |
| character_set_filesystem         | binary                     |
| character_set_results            | utf8                       |
| character_set_server             | utf8                       |
| character_set_system             | utf8                       |
| character_sets_dir               | /usr/share/mysql/charsets/ |
| check_constraint_checks          | ON                         |
| collation_connection             | utf8_general_ci            |
| collation_database               | utf8_unicode_ci            |
| collation_server                 | utf8_unicode_ci            |
| column_compression_threshold     | 100                        |
| column_compression_zlib_level    | 6                          |
| column_compression_zlib_strategy | DEFAULT_STRATEGY           |
| column_compression_zlib_wrap     | OFF                        |
| completion_type                  | NO_CHAIN                   |
| concurrent_insert                | ALWAYS                     |
| connect_timeout                  | 5                          |
| core_file                        | OFF                        |
+----------------------------------+----------------------------+

도커 재시작
putty 글씨체 -> Terminal

```