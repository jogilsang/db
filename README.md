# manual-db

### 테스트 안내사항
1. 모든 생성 db 이름은 db다  
2. 모든 생성 table 이름은 auth다  
3. 모든 생성 column은 id, name, email, pw 다.  

### 알아야할것
RDBMS의 경우

1. 포스트 요청을 처리할수있는가 (POST)
3. 데이터를 넣을수있는가 (INSERT)
4. 데이터를 수정할수있는가 (UPDATE)
5. 데이터를 삭제할수있는가 (DELETE)
6. 데이터를 가져올수잇는가 (QUERY)
7. 테이블을 생성할수있는가 (TABLE)


No-SQL의 경우

### WAMP (Window, apache, mysql, php)  
설치과정 참고 :  
https://blog.naver.com/action21c_new/221530228343  

1. php파일 추가할떄 경로(EX : index.php, test.php, get.php), 접속방법은 localhost:test.php  
C:\Bitnami\wampstack-7.1.29-0\apache2\htdocs  

2. test.php
```
<?php
    phpinfo();
?>
```

### MySQL 설치 및 default 메뉴얼

0. DB 만들기
```
create database db DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
```
1. 테이블만들기 (CREATE)
auth 테이블 생성(id와 name(이름), email(이메일), pw(패스워드))
```
create table auth(
     id bigint(20) unsigned not null auto_increment,
     name varchar(255) not null,
     email varchar(255) not null,
     pw varchar(255) not null,
     primary key (id)
)  DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
```
2. 테이블 비우기(TRUNCATE)
```
TRUNCATE auth;
```
3. 데이터 다 가져오기(QUERY)
```
select * from person;
```

4. 데이터넣기 (INSERT)
```
insert into auth(name, email, pw) values('jo', 'jogilsang@naver.com', '1234');
```

### MySQL 개념
속성은 기본속성, 설계속성, 파생속성으로 나뉜다
도메인(Domain) : 속성이 가질수있는 값의 범위 (예 : 성별 -> 남,여 , 색깔 -> 빨,주,노,초,파,남,보)

### SELECT
```ms-sql
SELECT [job_id]   AS '아이디'
      ,[job_desc] AS '내림차순'
      ,[min_lvl]  AS '최소값'
      ,[max_lvl]  AS '최대값'
  FROM [pubs].[dbo].[jobs] a
  WHERE a.max_lvl = 100
```
