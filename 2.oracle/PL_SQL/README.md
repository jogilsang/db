
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
