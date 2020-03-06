# manual-db

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

