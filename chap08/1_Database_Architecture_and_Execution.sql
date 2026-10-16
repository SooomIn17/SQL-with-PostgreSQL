--public에 bank라는 신규 테이블 생성
CREATE TABLE IF NOT EXISTS public.bank
(
	client_no integer NOT NULL,
	age smallint,
	gender character(1),
	edu character varying(13),
	marital character varying(8),
	card_type character varying(8),
	CONSTRAINT bank_pkey PRIMARY KEY (client_no)
);

--index.csv 파일 import시킨 bank 테이블
SELECT * FROM public.bank;

--전체 테이블 조회하는 SELECT문의 실행 계획(EXPLAIN)
EXPLAIN SELECT * FROM public.bank;
--동일한 쿼리(EXPLAIIN ANALYZE)
EXPLAIN ANALYZE SELECT * FROM public.bank;

--SELECT문에 WHERE 조건으로 client_no의 범위 지정
EXPLAIN ANALYZE SELECT * FROM public.bank WHERE client_no BETWEEN '850' AND '855';

/*성별과 나이의 열 2개를 기준으로 오름차순 정렬한 인덱스를 생성해 
  기존 bank 테이블에서 조회하는 것과 비교해 시간이 얼마나 줄어드는지 확인*/
EXPLAIN ANALYZE SELECT * FROM public.bank WHERE gender='F' AND age BETWEEN 66 AND 67;

--FORMAT JSON 옵션 추가해 EXPLAIN 결과를 보기 좋게 그래픽 형태로 출력
EXPLAIN (ANALYZE, FORMAT JSON)
SELECT * FROM public.bank WHERE gender='F' AND age BETWEEN 66 AND 67;

--EXPLAIN ANALYZE로 조인(해시 조인)
EXPLAIN ANALYZE
SELECT a.chick_no, a.pass_fail, a.raw_weight, b.order_no, b.customer
FROM fms.prod_result a
INNER JOIN fms.ship_result b
ON a.chick_no=b.chick_no;

--FORMAT JSON 옵션 추가
EXPLAIN (ANALYZE, FORMAT JSON)
SELECT a.chick_no, a.pass_fail, a.raw_weight, b.order_no, b.customer
FROM fms.prod_result a
INNER JOIN fms.ship_result b
ON a.chick_no=b.chick_no;