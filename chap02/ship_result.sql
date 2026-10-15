-- Table: fms.ship_result

-- DROP TABLE IF EXISTS fms.ship_result;

CREATE TABLE IF NOT EXISTS fms.ship_result
(
    chick_no character(8) COLLATE pg_catalog."default" NOT NULL,
    order_no character(4) COLLATE pg_catalog."default" NOT NULL,
    customer character varying(20) COLLATE pg_catalog."default" NOT NULL,
    due_date date NOT NULL,
    arrival_date date,
    destination character varying(10) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT ship_result_chick_no_fkey FOREIGN KEY (chick_no)
        REFERENCES fms.chick_info (chick_no) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS fms.ship_result
    OWNER to postgres;

COMMENT ON TABLE fms.ship_result
    IS '출하실적';
COMMENT ON TABLE fms.ship_result.chick_no IS '육계번호';
COMMENT ON TABLE fms.ship_result.order_no IS '주문번호';
COMMENT ON TABLE fms.ship_result.customer IS '고객사';
COMMENT ON TABLE fms.ship_result.due_date IS '납품기한일';
COMMENT ON TABLE fms.ship_result.arrival_date IS '도착일';
COMMENT ON TABLE fms.ship_result.destination IS '도착지';