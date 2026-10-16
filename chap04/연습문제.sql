--1.육계정보와 마스터코드 테이블 join해 육계번호, 성별, 성별설명이 출력되도록 쿼리 작성
SELECT a.chick_no, a.gender, b.code_desc AS gender_nm
FROM fms.chick_info a
INNER JOIN fms.master_code b
ON a.gender=b.code
WHERE b.column_nm='gender';

--2.육계정보와 마스터코드 테이블 이용해 육계번호, 성별, 성별설명, 예방접종1, 예방접종1이 출력되도록 쿼리 작성
SELECT a.chick_no, a.gender,
(
	SELECT m.code_desc "gender_nm"
	FROM fms.master_code m
	WHERE m.column_nm='gender' AND m.code=a.gender
),
a.vaccination1,
(
	SELECT m.code_desc "vac1_yn"
	FROM fms.master_code m
	WHERE m.column_nm='vaccination1' AND TO_NUMBER(m.code, '9')=a.vaccination1
)
FROM fms.chick_info a;

--3.생산실적 테이블에서 생산일자별(행), 호수별(열) 마릿수 합계를 나타내는 집계 테이블을 쿼리로 작성
SELECT 
a.prod_date,
sum(CASE WHEN a.size_stand=10 THEN a.cnt ELSE 0 END) "10",
sum(CASE WHEN a.size_stand=11 THEN a.cnt ELSE 0 END) "11",
sum(CASE WHEN a.size_stand=12 THEN a.cnt ELSE 0 END) "12"
FROM
(
	SELECT prod_date, size_stand, count(chick_no) AS cnt
	FROM fms.prod_result
	GROUP BY prod_date, size_stand
	ORDER BY prod_date, size_stand
) a
GROUP BY a.prod_date;