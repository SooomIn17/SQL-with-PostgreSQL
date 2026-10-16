--행을 열로 바꾸기(PIVOT)
--1.부화일자, 성별 기준 마릿수 집계
SELECT hatchday, gender, count(chick_no)::int AS cnt
FROM fms.chick_info
GROUP BY hatchday, gender
ORDER BY hatchday, gender;
--2.부화일자 기준 성별을 열로 변경
SELECT a.hatchday,
CASE WHEN a.gender='M' THEN a.cnt ELSE 0 END "Male",
CASE WHEN a.gender='F' THEN a.cnt ELSE 0 END "Female"
FROM
(
SELECT hatchday, gender, count(chick_no)::int AS cnt
FROM fms.chick_info
GROUP BY hatchday, gender
ORDER BY hatchday, gender
) a;
--3.부화일자 기준 마릿수 합계
SELECT a.hatchday,
SUM(CASE WHEN a.gender='M' THEN a.cnt ELSE 0 END) "Male",
SUM(CASE WHEN a.gender='F' THEN a.cnt ELSE 0 END) "Female"
FROM
(
SELECT hatchday, gender, count(chick_no)::int AS cnt
FROM fms.chick_info
GROUP BY hatchday, gender
ORDER BY hatchday, gender
) a
GROUP BY a.hatchday;

--테이블 함수 기능 확장
--CREATE EXTENSION tablefunc;
--crosstab() 함수
SELECT *
FROM crosstab
(
'SELECT hatchday, gender, count(chick_no)::int AS cnt
 FROM fms.chick_info
 GROUP BY hatchday, gender
 ORDER BY hatchday, gender DESC'
)
AS pivot_r(hatchday date, "Male" int, "Female" int);

--열을 행으로 바꾸기(UNPIVOT)
--1.UNION절 이용해 위/아래로 테이블 합치는 방법
SELECT chick_no, body_temp, breath_rate, feed_intake
FROM fms.health_cond
WHERE check_date='2023-01-20' AND chick_no LIKE 'A%';
--2.열을 행으로 변환
SELECT a.chick_no, a.health, a.cond
FROM
(
	SELECT chick_no, 'body_temp' AS health, body_temp AS cond
	FROM fms.health_cond
	WHERE check_date='2023-01-20' AND chick_no LIKE 'A%'
	UNION
	SELECT chick_no, 'breath_rate' AS health, breath_rate AS cond
	FROM fms.health_cond
	WHERE check_date='2023-01-20' AND chick_no LIKE 'A%'
	UNION
	SELECT chick_no, 'feed_intake' AS health, feed_intake AS cond
	FROM fms.health_cond
	WHERE check_date='2023-01-20' AND chick_no LIKE 'A%'
)a
ORDER BY a.chick_no, a.health;

--unnest() 이용해 열을 행으로 변환
SELECT chick_no,
unnest(array['body_temp', 'breath_rate', 'feed_intake']) AS health,
unnest(array[body_temp, breath_rate, feed_intake]) AS cond
FROM fms.health_cond
WHERE check_date='2023-01-20' AND chick_no LIKE 'A%'
ORDER BY chick_no, health;