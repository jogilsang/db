# manual-db

## dbeaver
> [DBeaver 세팅]
- Edit Connection - General - Connection Type 설정 > (운영/QA/개발 분리, Development/Test/Production 세 가지설정이 되어있는 것)
- 상단 '데이터베이스' 메뉴 > 트랜잭션 모드 > Manual Commit (Read committed) (수동커밋 변경(자동커밋 해제))
- 상단 '데이터베이스' 메뉴 > 트랜잭션 모드 > SmartCommit 체크
- 상단 '데이터베이스' 메뉴 > 트랜잭션 모드 > Serializable / Read Uncommited 둘중에 택 1

- 상단 '윈도우' 메뉴 > 설정 > 필터 텍스트에 '작업공간' - 텍스트파일 인코딩(UTF-8), 새 텍스트 파일 행 분리문자(Unix 설정)
- 상단 '윈도우' 메뉴 > 설정 > 필터 텍스트에 'SQL 포맷' > Keyword case를 Default에서 Upper로 변경
- 상단 '윈도우' 메뉴 > 설정 > 필터 텍스트에 'SQL 포맷' > Formatter - External formatter (자동정렬 양식변경)
- 상단 '윈도우' 메뉴 > 설정 > 필터 텍스트에 '글꼴' > '기본' - '텍스트 글꼴' 선택 후 편집에서 글꼴 및 사이즈 변경
- 상단 '윈도우' 메뉴 > 설정 > 필터 텍스트에 '문서 편집기' > '행 번호 표시' 체크
- 윈도우 > 설정 > 연결 > 연결 유형 > Auto-commit by default 해제
- 윈도우 > 설정 > User Interface > 모양 > 테마(T) > 원하는 테마를 선택 (EX : Dark)
- 상단 '윈도우' 메뉴 > 설정 > Convert 검색 -> convert keyword case (Auto Format)
- 상단 '윈도우' 메뉴 > 설정 > Convert 검색 -> Auto close (Single Quotes, Double Quotes, Brackets) 체크해제
- 상단 '윈도우' 메뉴 > 설정 > 필터 텍스트에 'SQL 자동완성' > Auto-insert proposal 체크해제 (힌트 끄기)
- 상단 '윈도우' 메뉴 > 설정 > encoding 검색 > UTF-8 을 선택 후 적용완료
- 상단 '윈도우' 메뉴 > 설정 > autosave 검색 > Enable autosave for dirty editors
- 상단 '윈도우' 메뉴 > 설정 > 편집기 > SQL 편집기 > SQL 실행 Blank line is statement delimiter 체크 해제 (줄바꿈을 다른 쿼리로 인식한다 체크해제)
- 상단 '윈도우' 메뉴 > 설정 > 편집기 > 데이터 편집기 > ResultSet fetch size (출력결과 200개에서 늘리거나 없애기)
- 상단 '윈도우' 메뉴 > 설정 > 편집기 > SQL 편집기 > SQL 자동완성 > Insert table aliases (in FROM clause) 체크해제 (테이블 alias 자동생성제거)

> [DBeaver Shortcut](https://dbeaver.com/docs/wiki/Shortcuts/)
> preference - General - key
```
alt + shift + a : 열 선택모드

ctrl + shift + F : beautify, pretty format 기능
alt + up : 앞에쿼리 (공백기준)
alt + down : 뒤에쿼리 (공백기준)

ctrl + enter : 쿼리 한줄실행
alx + x : 쿼리 여러줄 실행 (스크립트 실행)
ctrl + shift + [ : 화면 세로분할 OF,OFF
ctrl + shit + - : 화면 가로분할 OF,OFF

ctrl + shift + e : 실행계획 보기
ctrl + altr + shift + c : count 표기

ctrl + shift + x : 대문자
ctrl + shift + y : 소문자

ctrl + shift + c : 칼럼포함 복사
ctrl + shift + v : 칼럼포함 복붙

F4  : 테이블 구조보기
F3  : 신규 편집창 열기
ctrl + 9 : database 선택
ctrl + 0 : scheme 선택

CTRL+2 : Toggle sorting by current column
```

## Template
```
dp : dbms_output.put_line('');
cbl = CONNECT BY LEVEL
```

## TroubleShooting
- [MSSQL - 서버 USER에서 서비스 SQLSERVERAGENT을(를) 시작할 수 없습니다. (mscorlib)](https://blog.naver.com/jogilsang/221993309350)


