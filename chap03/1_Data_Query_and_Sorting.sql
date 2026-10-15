--전체 데이터 조회하기
SELECT * FROM fms.chick_info;

--전체 데이터 개수 출력하기(count)
SELECT count(*) FROM fms.chick_info;

--원하는 열만 조회하기
SELECT chick_no, hatchday, egg_weight FROM fms.chick_info;

--열 이름 바꿔 조회하기
SELECT chick_no as cn, hatchday "부화일자" FROM fms.chick_info;

--데이터 정렬하기(ORDER BY/기본: 오름차순)
SELECT chick_no, hatchday, egg_weight FROM fms.chick_info ORDER BY egg_weight;
--내림차순: DESC
SELECT chick_no, hatchday, egg_weight FROM fms.chick_info ORDER BY egg_weight DESC;
--열이 여러 개 인 경우
SELECT chick_no, hatchday, egg_weight FROM fms.chick_info ORDER BY egg_weight DESC, hatchday ASC, chick_no ASC;

--원하는 개수의 데이터만 조회하기(LIMIT, OFFSET)
SELECT chick_no, hatchday, egg_weight FROM fms.chick_info ORDER BY egg_weight DESC, hatchday ASC, chick_no ASC LIMIT 5;
--몇번째에서 몇번째까지 지정
SELECT chick_no, hatchday, egg_weight FROM fms.chick_info ORDER BY egg_weight DESC, hatchday ASC, chick_no ASC LIMIT 4 OFFSET 1;

--중복된 결과 제거하기(DISTINCT)
SELECT DISTINCT(hatchday) FROM fms.chick_info;

--원하는 조건의 데이터만 조회하기(WHERE)
--1.육계정보 테이블에서 성별이 M인 대상 조회
SELECT * FROM fms.chick_info WHERE gender='M';
--2.육계정보 테이블에서 종란무게가 70g 이상인 대상 조회
SELECT * FROM fms.chick_info WHERE egg_weight>=70;
--3.육계정보 테이블에서 부화일자가 2023-01-01~01-02인 대상 조회
SELECT * FROM fms.chick_info WHERE hatchday BETWEEN '2023-01-01' AND '2023-01-02';
--4.육계정보 테이블에서 종란무게가 69g보다 크거나 62g보다 작거나 같은 대상 조회
SELECT * FROM fms.chick_info WHERE egg_weight>69 OR egg_weight<=62;
--5.육계정보 테이블에서 품종이 D로 시작하는 대상 조회
SELECT * FROM fms.chick_info WHERE breeds LIKE 'D%';
--6.출하실적 테이블에서 도착지가 부산, 울산인 대상 조회
SELECT * FROM fms.ship_result WHERE destination IN ('부산','울산');
--7.사육환경 테이블에서 습도가 측정되지 않은 날짜 조회
SELECT * FROM fms.env_cond WHERE humid IS NULL;
--8.건강상태 테이블에서 노트가 입력된 대상 조회
SELECT * FROM fms.health_cond WHERE note IS NOT NULL;

--원하는 문자만 가져오기(SUBSTRING)
SELECT chick_no, LEFT(chick_no, 1), SUBSTRING(chick_no,2,3), RIGHT(chick_no,4) FROM fms.chick_info LIMIT 5;

--기타 문자열 함수
--1.육계정보 테이블에서 육계번호의 글자 수 확인하기(LENGTH)
SELECT LENGTH(chick_no) FROM fms.chick_info LIMIT 5;
--2.육계정보 테이블에서 농장, 성별, 품종 열의 데이터를 하나로 합치기(||)
SELECT farm||gender||breeds AS fgb FROM fms.chick_info LIMIT 5;
--3.육계정보 테이블에서 성별을 소문자로 변환하기(LOWER)
SELECT LOWER(gender) FROM fms.chick_info LIMIT 5;
--4.육계정보 테이블에서 성별 M을 Male로 변환하기(REPLACE)
SELECT REPLACE(gender,'M','Male') FROM fms.chick_info LIMIT 5;