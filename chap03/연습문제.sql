--3.출하실적 테이블에서 쿼리 이용해 고객사가 몇 곳인지 조회
SELECT DISTINCT(customer) FROM fms.ship_result;

/*4.생산실적 테이블에서 육계번호, 생산일자, 생닭중량, 질병유무 열만 조회하되,
	질병에 걸리지 않은 대상만 필터링해 생닭중량이 가장 무거운 5마리만 추출해내는 쿼리 작성*/
SELECT chick_no, prod_date, raw_weight, disease_yn
FROM fms.prod_result
WHERE disease_yn='N'
ORDER BY raw_weight DESC LIMIT 5;

/*생산실적 테이블에서 호수별 생닭중량 평균과 합계를 조회하되, 평균은 소수 셋째자리에서 반올림해 표시하고,
  생산일자가 2월인 대상만 필터링한 후 호수 기준 오름차순으로 집계 결과를 정렬해 그림과 같이 나타내는 쿼리 작성*/
SELECT size_stand, round(avg(raw_weight),2), sum(raw_weight)
FROM fms.prod_result
WHERE TO_CHAR(prod_date,'MM')='02'
GROUP BY size_stand
ORDER BY size_stand;