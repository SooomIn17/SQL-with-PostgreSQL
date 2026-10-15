--데이터 집계하기(GROUP BY)
--1.생산실적 테이블에서 생산일자별 생닭중량 합계 조회
SELECT prod_date, sum(raw_weight) AS prod FROM fms.prod_result GROUP BY prod_date;
--2.출하실적 테이블에서 고객사별 출하 마릿수 조회하기
SELECT customer, count(chick_no) AS cnt FROM fms.ship_result GROUP BY customer;

--원하는 조건으로 데이터 집계하기(HAVING)
SELECT customer, count(chick_no) AS cnt FROM fms.ship_result GROUP BY customer HAVING count(chick_no)>=10;