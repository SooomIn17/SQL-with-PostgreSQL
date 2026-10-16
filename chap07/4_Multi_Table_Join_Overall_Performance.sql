--여러 테이블의 데이터 연결해 종합실적 조회하기
--1.종합적인 실적을 한번에 보기 위해 여러 테이블 JOIN
SELECT a.chick_no, a.breeds, a.egg_weight, b.body_temp, b.breath_rate, 
		c.size_stand, c.pass_fail, d.order_no, d.customer, d.arrival_date, d.destination
FROM fms.chick_info a
LEFT OUTER JOIN fms.health_cond b ON a.chick_no=b.chick_no
LEFT OUTER JOIN fms.prod_result c ON a.chick_no=c.chick_no
LEFT OUTER JOIN fms.ship_result d ON a.chick_no=d.chick_no
WHERE b.check_date='2023-01-30';

--2.열 이름을 한글로 변환하고 코드의 의미나 단위를 마스터코드와 단위 테이블에서 가져오는 서브쿼리 작성
SELECT 
a.chick_no AS 육계번호,
(
	SELECT m.code_desc AS 품종
	FROM fms.master_code m
	WHERE m.column_nm='breeds' AND m.code=a.breeds
)
,a.egg_weight ||
(
	SELECT u.unit
	FROM fms.unit u
	WHERE u.column_nm='egg_weight'
) AS 종란무게
,b.body_temp ||
(
	SELECT u.unit
	FROM fms.unit u
	WHERE u.column_nm='body_temp'
) AS 체온
,b.breath_rate ||
(
	SELECT u.unit
	FROM fms.unit u
	WHERE u.column_nm='breath_rate'
)
AS 호흡수
,(
	SELECT m.code_desc AS 호수
	FROM fms.master_code m
	WHERE m.column_nm='size_stand' AND TO_NUMBER(m.code,'99')=c.size_stand
)
,(
	SELECT m.code_desc AS 부적합여부
	FROM fms.master_code m
	WHERE m.column_nm='pass_fail' AND m.code=c.pass_fail
)
,d.order_no AS 주문번호, d.customer AS 고객사, d.arrival_date AS 도착일, d.destination AS 도착지
FROM fms.chick_info a
LEFT OUTER JOIN fms.health_cond b ON a.chick_no=b.chick_no
LEFT OUTER JOIN fms.prod_result c ON a.chick_no=c.chick_no
LEFT OUTER JOIN fms.ship_result d ON a.chick_no=d.chick_no
WHERE b.check_date='2023-01-30';