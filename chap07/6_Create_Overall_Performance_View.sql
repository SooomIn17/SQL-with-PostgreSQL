-- View: fms.total_result

-- DROP VIEW fms.total_result;
--종합실적을 뷰 테이블로 만들기

CREATE OR REPLACE VIEW fms.total_result
 AS
 SELECT a.chick_no AS "육계번호",
    ( SELECT m.code_desc AS "품종"
           FROM fms.master_code m
          WHERE m.column_nm::text = 'breeds'::text AND m.code::bpchar = a.breeds) AS "품종",
    a.egg_weight || ((( SELECT u.unit
           FROM fms.unit u
          WHERE u.column_nm::text = 'egg_weight'::text))::text) AS "종란무게",
    b.body_temp || ((( SELECT u.unit
           FROM fms.unit u
          WHERE u.column_nm::text = 'body_temp'::text))::text) AS "체온",
    b.breath_rate || ((( SELECT u.unit
           FROM fms.unit u
          WHERE u.column_nm::text = 'breath_rate'::text))::text) AS "호흡수",
    ( SELECT m.code_desc AS "호수"
           FROM fms.master_code m
          WHERE m.column_nm::text = 'size_stand'::text AND to_number(m.code::text, '99'::text) = c.size_stand::numeric) AS "호수",
    ( SELECT m.code_desc AS "부적합여부"
           FROM fms.master_code m
          WHERE m.column_nm::text = 'pass_fail'::text AND m.code::bpchar = c.pass_fail) AS "부적합여부",
    d.order_no AS "주문번호",
    d.customer AS "고객사",
    d.arrival_date AS "도착일",
    d.destination AS "도착지"
   FROM fms.chick_info a
     LEFT JOIN fms.health_cond b ON a.chick_no = b.chick_no
     LEFT JOIN fms.prod_result c ON a.chick_no = c.chick_no
     LEFT JOIN fms.ship_result d ON a.chick_no = d.chick_no
  WHERE b.check_date = '2023-01-30'::date;

ALTER TABLE fms.total_result
    OWNER TO postgres;
COMMENT ON VIEW fms.total_result
    IS '종합실적';

