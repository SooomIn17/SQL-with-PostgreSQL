--쿼리 안에 쿼리 넣기
--1.WHERE절에서 서브쿼리 이용
--평균(avg)
SELECT avg(egg_weight) FROM fms.chick_info;
--WHERE절에 조건 추가
SELECT chick_no, egg_weight FROM fms.chick_info WHERE egg_weight>66.75;
--서브쿼리 이용
SELECT chick_no, egg_weight
FROM fms.chick_info
WHERE egg_weight>(SELECT avg(egg_weight) FROM fms.chick_info);
--2.SELECT절에서 서브쿼리 이용
--INNER JOIN 이용
SELECT a.chick_no, a.breeds, b.code_desc "breeds_nm"
FROM fms.chick_info a, fms.master_code b
WHERE a.breeds=b.code AND b.column_nm='breeds';
--SELECT절에서 서브쿼리 이용
SELECT a.chick_no, a.breeds,
(
SELECT m.code_desc "breeds_nm"
FROM fms.master_code m
WHERE m.column_nm='breeds' AND m.code=a.breeds
)
FROM fms.chick_info a;
--3.FROM절에서 서브쿼리 이용
--WHERE절에서 INNER JOIN
SELECT a.chick_no, a.breeds, b.breeds_nm
FROM fms.chick_info a,
(
SELECT code, code_desc "breeds_nm"
FROM fms.master_code
WHERE column_nm='breeds'
) b
WHERE a.breeds=b.code;

--나만의 가상 테이블 만들기(VIEW)
CREATE OR REPLACE VIEW fms.breeds_prod
(
prod_date, breeds_nm, total_sum
)
AS
SELECT a.prod_date,
(
SELECT m.code_desc "breeds_nm"
FROM fms.master_code m
WHERE m.column_nm='breeds' AND m.code=b.breeds
),
sum(a.raw_weight) "total_sum"
FROM fms.prod_result a, fms.chick_info b
WHERE a.chick_no=b.chick_no AND a.pass_fail='P'
GROUP BY a.prod_date, b.breeds;
--뷰 조회
SELECT * FROM fms.breeds_prod;