--조류독감이 의심되는 닭 찾기
--1. 체온 기준 내림차순 정렬해 데이터 살펴보기
SELECT * FROM fms.health_cond ORDER BY body_temp DESC;

--2. 다양한 조건으로 필터링 가능한 쿼리
SELECT b.*, a.vaccination1, a.vaccination2
FROM fms.chick_info a, fms.health_cond b
WHERE a.chick_no=b.chick_no AND b.check_date='2023-01-30' AND (b.body_temp>41.7 OR b.breath_rate>70 OR b.feed_intake<100);