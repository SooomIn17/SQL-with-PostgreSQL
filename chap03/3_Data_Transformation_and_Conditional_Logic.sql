--데이터 타입 변환하기(TO_CHAR)
SELECT hatchday, TO_CHAR(hatchday, 'Mon') 
FROM fms.chick_info 
LIMIT 5;

--NULL 변환(COALESCE, NULLIF)
--1.NULL-> 특정값[COALESCE(열 이름, 반환값)]
SELECT farm, date, humid, COALESCE(humid, 60) 
FROM fms.env_cond 
WHERE date 
BETWEEN '2023-01-23' AND '2023-01-27' AND farm='A';
--2.특정값->NULL[NULLIF(열 이름, 특정값)]
SELECT farm, date, humid, NULLIF(humid, 60)
FROM fms.env_cond
WHERE date
BETWEEN '2023-01-23' AND '2023-01-27' AND farm='A';

--원하는 조건으로 항목 추가하기(CASE)
SELECT chick_no, egg_weight,
CASE WHEN egg_weight>69 THEN 'H' WHEN egg_weight>65 THEN 'M' ELSE 'L'
END "w_grade"
FROM fms.chick_info LIMIT 10;