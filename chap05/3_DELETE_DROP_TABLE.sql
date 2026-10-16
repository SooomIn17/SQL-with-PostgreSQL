--모든 데이터 삭제하기
DELETE FROM fms.master_code;

--모두 복구
ROLLBACK;

--특정 조건의 데이터 삭제하기
DELETE FROM fms.master_code
WHERE column_nm='size_stand' AND TO_NUMBER(code, '99')<10;

--테이블 삭제하기(DROP TABLE);
DROP TABLE fms.master_code;