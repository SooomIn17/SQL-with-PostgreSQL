--데이터 한 건 추가하기(INSERT)
INSERT INTO fms.master_code(column_nm, type, code, code_desc) VALUES ('breeds', 'txt', 'R1', 'Ross');
--추가되었는지 조회
SELECT * FROM fms.master_code WHERE column_nm='breeds';

--데이터 여러 건 추가하기
INSERT INTO fms.master_code(column_nm, type, code, code_desc) 
VALUES ('breeds', 'txt', 'N1', 'New Hampshire Red'),
	   ('breeds', 'txt', 'R2', 'Rhode Island Red'),
	   ('breeds', 'txt', 'A1', 'Australorp');