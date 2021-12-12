# manual-db

## dbeaver
> [DBeaver 세팅]
- 상단 '윈도우' 메뉴 > 설정 > 필터 텍스트에 '작업공간' - 텍스트파일 인코딩(UTF-8), 새 텍스트 파일 행 분리문자(Unix 설정)
- 상단 '윈도우' 메뉴 > 설정 > 필터 텍스트에 'SQL 포맷' > Keyword case를 Default에서 Upper로 변경
- 상단 '윈도우' 메뉴 > 설정 > 필터 텍스트에 '글꼴' > '기본' - '텍스트 글꼴' 선택 후 편집에서 글꼴 및 사이즈 변경
- 상단 '윈도우' 메뉴 > 설정 > 필터 텍스트에 '문서 편집기' > '행 번호 표시' 체크
- 윈도우 > 설정 > 연결 > 연결 유형 에 들어가보면 기본적으로 Development/Test/Production 세 가지설정이 되어있는 것을 볼 수 있다.
- Edit Connection - General - Connection Type 설정 - (운영/QA/개발 분리)
- 윈도우 > 설정 > User Interface > 모양 > 테마(T) > 원하는 테마를 선택 (EX : Dark)
- 상단 '윈도우' 메뉴 > 설정 > Convert 검색 -> convert keyword case (Auto Format)
- 상단 '윈도우' 메뉴 > 설정 > Convert 검색 -> Auto close (Single Quotes, Double Quotes, Brackets) 체크해제
- 상단 '윈도우' 메뉴 > 설정 > encoding 검색 > UTF-8 을 선택 후 적용완료
- 상단 '윈도우' 메뉴 > 설정 > autosave 검색 > Enable autosave for dirty editors
- 수동커밋 자동커밋 해제 - 데이터베이스 - 트랜잭션 모드 - Manual Commit (Read committed) 
- 상단 '윈도우' 메뉴 > 설정 > 편집기 > SQL 편집기 > SQL 실행
Blank line is statement delimiter 체크 해제 (줄바꿈을 다른 쿼리로 인식한다 체크해제)
- 상단 '윈도우' 메뉴 > 설정 > 편집기 > 데이터 편집기 > ResultSet fetch size (출력결과 200개에서 늘리거나 없애기)

> [DBeaver Shortcut](https://dbeaver.com/docs/wiki/Shortcuts/)
> preference - General - key
```
alt + shift + a : 열 선택모드

ctrl + shift + F : beautify, pretty format 기능
alt + 위아래 :
ctrl + shift + 위아래 :

ctrl + enter : 쿼리 한줄실행
alx + x : 쿼리 여러줄 실행 (스크립트 실행)

ctrl + shift + e : 실행계획 보기
ctrl + altr + shift + c : count 표기

ctrl + shift + x : 대문자
ctrl + shift + y : 소문자

ctrl + shift + c : 칼럼포함 복사
ctrl + shift + v : 칼럼포함 복붙

F3  : 신규 편집창 열기
ctrl + 9 : database 선택
ctrl + 0 : scheme 선택

CTRL+2 : Toggle sorting by current column

; 기재하고 ALT + X : 다중쿼리 실행
ctrl + shift + [ : 세로분할
ctrl + shit + - : 가로분할
```

## Template
```
dp : dbms_output.put_line('');
cbl = CONNECT BY LEVEL
```

## TroubleShooting
- [MSSQL - 서버 USER에서 서비스 SQLSERVERAGENT을(를) 시작할 수 없습니다. (mscorlib)](https://blog.naver.com/jogilsang/221993309350)


