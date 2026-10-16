--품종별 가장 무거운 닭 Top 3 고르기
--1.두 테이블을 JOIN시켜 원하는 열 출력하는 쿼리
SELECT a.chick_no, a.breeds, b.raw_weight
FROM fms.chick_info a, fms.prod_result b
WHERE a.chick_no=b.chick_no;

--2.품종별 생닭중량을 내림차순 정렬해 무거운 순서대로 3마리씩만 출력
SELECT a.chick_no, a.breeds, b.raw_weight
FROM fms.chick_info a, fms.prod_result b
WHERE a.chick_no=b.chick_no AND a.breeds='B1'
ORDER BY b.raw_weight DESC LIMIT 3;

--3.그룹별 순서 지정[ROW_NUMBER() OVER()]
SELECT x.*
FROM
(
	SELECT a.chick_no, a.breeds, b.raw_weight, 
		ROW_NUMBER() OVER(PARTITION BY a.breeds ORDER BY b.raw_weight DESC) "rn"
	FROM fms.chick_info a, fms.prod_result b
	WHERE a.chick_no=b.chick_no
) x
WHERE x.rn<=3;