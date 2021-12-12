

## PL/SQL
- p111 : 구구단 2단 출력
- p112 : 구구단 1단~9단 출력
- p113
- p114
- p115
- p116
- p117
- p118
- p119
- p120
- p121
- p122
- p123
- p124
- p125

## INDEX
### [date시간](#date)

---

## date
  ```sql
  -- 시간단위로 추출한다.
  TO_CHAR(DATETIME, 'HH24')
  
  -- 9시~19:59까지 count 하기
  SELECT HOUR, count(*) as COUNT 
  FROM ( SELECT TO_CHAR(DATETIME, 'HH24') AS HOUR FROM ANIMAL_OUTS)
  where HOUR >= 9 and HOUR < 20
  group by HOUR
  order by HOUR
  ```