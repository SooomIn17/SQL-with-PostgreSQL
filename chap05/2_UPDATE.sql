--데이터 수정하기
UPDATE fms.master_code
SET code_desc='암컷'
WHERE column_nm='gender' AND code='F';
--조회
SELECT * FROM fms.master_code WHERE column_nm='gender';
--복구
UPDATE fms.master_code
SET code_desc='Female'
WHERE column_nm='gender' AND code='F';

SELECT * FROM fms.master_code WHERE column_nm='gender';
