--두 테이블의 데이터 열로 합치기(JOIN)
SELECT a.chick_no, a.pass_fail, a.raw_weight, b.order_no, b.customer
FROM fms.prod_result a
INNER JOIN fms.ship_result b
ON a.chick_no=b.chick_no;
--같은 결과 다른 쿼리
SELECT a.chick_no, a.pass_fail, a.raw_weight, b.order_no, b.customer
FROM fms.prod_result a, fms.ship_result b
WHERE a.chick_no=b.chick_no;

--LEFT OUTER JOIN
SELECT a.chick_no, a.pass_fail, a.raw_weight, b.order_no, b.customer
FROM fms.prod_result a
LEFT OUTER JOIN fms.ship_result b
ON a.chick_no=b.chick_no;

--RIGHT OUTER JOIN
SELECT a.chick_no, a.pass_fail, a.raw_weight, b.order_no, b.customer
FROM fms.prod_result a
RIGHT OUTER JOIN fms.ship_result b
ON a.chick_no=b.chick_no;

--FULL OUTER JOIN
SELECT a.chick_no, a.pass_fail, a.raw_weight, b.order_no, b.customer
FROM fms.prod_result a
FULL OUTER JOIN fms.ship_result b
ON a.chick_no=b.chick_no;

--두 테이블의 데이터 행으로 합치기(UNION)
SELECT chick_no, gender, hatchday
FROM fms.chick_info
WHERE farm='A' AND gender='F' AND hatchday='2023-01-03';
--위 아래 테이블 구분 위해 괄호 붙이기
(
SELECT chick_no, gender, hatchday
FROM fms.chick_info
WHERE farm='A' AND gender='F' AND hatchday='2023-01-03'
)
UNION
(
SELECT 'A2300021', 'F', '2023-01-05'
);
