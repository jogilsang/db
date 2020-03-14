# manual-db

### 샘플 db sample db
https://archive.codeplex.com/?p=msftdbprodsamples

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

-- 칼럼추가
ALTER TABLE reservations ADD roomId varchar(50) NOT NULL

-- delete
DELETE FROM [table] WHERE id=5;
Truncate [table]
DELETE FROM reservations WHERE id = ? AND (token = ? OR token = ?)
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

### MS-SQL
1. DOC
```
https://docs.microsoft.com/ko-kr/sql/t-sql/functions/year-transact-sql?view=sql-server-ver15
```
2. 단축키
``'
alt + t(도구) +o(옵션) : 옵션 
```

### RDBMS
1. 포스트 요청을 처리할수있는가 (POST)
3. 데이터를 넣을수있는가 (INSERT)
4. 데이터를 수정할수있는가 (UPDATE)
5. 데이터를 삭제할수있는가 (DELETE)
6. 데이터를 가져올수잇는가 (QUERY)
7. 테이블을 생성할수있는가 (TABLE)


### No-SQL

### WAMP (Window, apache, mysql, php)  
```
설치과정 참고 :  
https://blog.naver.com/action21c_new/221530228343  

```php
1. php파일 추가할떄 경로(EX : index.php, test.php, get.php), 접속방법은 localhost:test.php  
C:\Bitnami\wampstack-7.1.29-0\apache2\htdocs  

2. test.php
<?php
    phpinfo();
?>
```

### MySQL

1. 개념
```
속성은 기본속성, 설계속성, 파생속성으로 나뉜다
도메인(Domain) : 속성이 가질수있는 값의 범위 (예 : 성별 -> 남,여 , 색깔 -> 빨,주,노,초,파,남,보)
```

2. 명령어
```sql
0. DB 생성
create database db DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

1. 테이블만들기 (CREATE)
auth 테이블 생성(id와 name(이름), email(이메일), pw(패스워드))
create table auth(
     id bigint(20) unsigned not null auto_increment,
     name varchar(255) not null,
     email varchar(255) not null,
     pw varchar(255) not null,
     primary key (id)
)  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

2. 테이블 비우기(TRUNCATE)
TRUNCATE auth;

3. 데이터 다 가져오기(QUERY)
select * from person;

4. 데이터넣기 (INSERT)
insert into auth(name, email, pw) values('jo', 'jogilsang@naver.com', '1234');
```

