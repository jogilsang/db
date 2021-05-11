
# 4.MySQL

## TOC
- [setting](#setting)
    - [WAMP(Window, apache, mysql, php)](#WAMP(Window,-apache,-mysql,-php) )
- [default](#default)
    - [정의](#정의)
    - [프로세스](#프로세스)
- [contents](#contents)
    - [대소문자구분](#대소문자구분)

---

## setting
### WAMP(Window, apache, mysql, php)  
설치과정 참고 : https://blog.naver.com/action21c_new/221530228343  

```php
1. php파일 추가할떄 경로(EX : index.php, test.php, get.php), 접속방법은 localhost:test.php  
C:\Bitnami\wampstack-7.1.29-0\apache2\htdocs  

2. test.php
<?php
    phpinfo();
?>
```

---

## default
### 정의
```
속성은 기본속성, 설계속성, 파생속성으로 나뉜다
도메인(Domain) : 속성이 가질수있는 값의 범위 (예 : 성별 -> 남,여 , 색깔 -> 빨,주,노,초,파,남,보)
```

### 프로세스
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

---

## contents
### 대소문자구분
```mysql
-- 대소문자구분 확인 0 : 구분, 1 : 구분X
show variables like 'lower_case_table_names';
```

