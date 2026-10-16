--건강상태가 나빠진 원인 찾기
--1.사육환경 테이블의 데이터 전체 보기
SELECT * FROM fms.env_cond;

--2.사육환경 테이블의 데이터 기준으로 육계번호 B2300009의 건강상태 데이터 일부만 JOIN
SELECT a.*, b.*
FROM
(
	SELECT date, temp, humid
	FROM fms.env_cond
	WHERE farm='B'
) a
LEFT OUTER JOIN
(
	SELECT chick_no, check_date, weight, body_temp, feed_intake
	FROM fms.health_cond
	WHERE chick_no='B2300009'
) b
ON a.date=b.check_date;