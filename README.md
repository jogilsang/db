# manual-db

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

3. 테이블만들기
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