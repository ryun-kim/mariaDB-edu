SELECT *
FROM t_student2
WHERE addr = '부산';


-- 스칼라 값 (컬럼도 1개, 레코드 1개) 
SELECT addr FROM t_student2
WHERE sno = 6;


SELECT *
FROM t_student2
WHERE addr = (SELECT addr FROM t_student2 WHERE sno =6);

-- sno가 6,7번과addr이  같은 사람들 전부 뽑아내기 
SELECT *
FROM t_student2
WHERE addr IN ('부산','서울');
-- WHERE addr ='부산' OR addr = '서울';


SELECT *
FROM t_student2
WHERE addr IN (SELECT addr FROM t_student2 WHERE sno IN(6, 7));


-- 셀프 조인으로 해결 

SELECT A.*
FROM t_student2 A
INNER JOIN t_student2 B
ON A.addr = B.addr
WHERE B.sno IN(6,7);


-- 자주 쓰이는 함수 

-- 숫자함수 
SELECT -10,10, ABS(-10), ABS(10); -- 절대값 

SELECT CEIL(10.0),CEIL(10.1), CEIL(10.5), CEIL(10.9); -- 올림, 페이징처리에 사용, 정수 
SELECT CEILING(10.01), CEILING(10.5), CEILING(10.9);
SELECT ROUND(10.1), ROUND(10.5), ROUND(10.9); -- 반올림 
SELECT FLOOR(10.1), FLOOR(10.5), FLOOR(10.9); -- 내림 ,정수 

SELECT ROUND(10.44, 1), ROUND(10.45, 1),truncate(10.44, 1), truncate(10.45, 1);

-- TRUNCATE TABLE 테이블명; 데이터를 전체 날림, 트랜젝션 안걸림 
-- DELETE FROM 테이블명; 부분 데이터를 날림 

SELECT *, LEAST(sno, hno)
FROM t_studenthobby;

SELECT INTERVAL(9,1,2,5,8,12);

-- 문자함수 

SELECT CONCAT('안녕','하세요','누구누구','입니다')AS a;
SELECT CONCAT('10000','원');

SELECT INSERT('ABCDEFG', 3,1, '가나');
SELECT INSERT('ABCDEFG', 3,2, '가나');
SELECT INSERT('ABCDEFG', 3,0, '가나');

SELECT REPLACE('ABCDEFG', 'D', '디');
SELECT LEFT('ABCDEFG', 4); -- 왼쪽에서부터 4개만 잘라서 사용 
SELECT RIGHT('ABCDEFG', 3); -- 오른쪽에서 3개 잘라서 사용 
SELECT MID(TRIM(' ABCDEFG'), 3, 4), SUBSTRING('ABCDEFG',3,4); -- 세번째에서부터 길이(4) 
-- trim은 양쪽의 빈칸을 지운다 
SELECT LCASE('abCdEfG'), UCASE('AbCdEfG'); -- 소문자, 대문자로 변환 
SELECT REVERSE('AbCdEfG'), REVERSE(ucase('AbCdEfG')); -- 계속 붙일수 있으나 가독성이 떨어질 수 있다.


-- 날짜 

SELECT NOW(), SYSDATE(), CURRENT_TIMESTAMP();
SELECT DATE_FORMAT(NOW(), '%y년%m월 %d일 %H:%i');
SELECT WEEKDAY(NOW());

-- WEEKDAY(), NOW(), CASE문을 활용하여 
-- 0 > 월요일 
-- 1 > 화요일 
-- 2 > 수요일 

SELECT 
CONCAT(
CASE WEEKDAY(NOW())
	WHEN  0 THEN '월'
	WHEN  1 THEN '화'
	when  2 THEN '수'
	when  3 then '목'
	when  4 then '금'
	when  5 then '토'
	when  6 then '일'
	END, '요일')
	AS weekday;

SELECT DATEDIFF(DATE('2021-10-30'), NOW()) AS dday;

-- 형변환 
SELECT concat(FORMAT(10000000000, 0), '원');
SELECT Concat(cast(10000 AS CHAR), '원'), CONVERT(10000, CHAR);


SELECT pk, nm, addr FROM t_student
UNION
SELECT sno, nm, addr FROM t_student2; -- 위에있는 컬럼명을 기준으로 정렬된다. 

-- UNION 중복제거 union ALL 중복제거 안함 


-- distinct 중복 제거 
SELECT * FROM t_student2;

SELECT addr FROM t_student2;
SELECT DISTINCT addr FROM t_student2;

-- insert + select 문 

INSERT INTO t_student2
(nm, age, addr)
SELECT '김구', 32, '원주'; -- 기존에 있는 값을 활용하면서 

INSERT INTO t_student2
(nm, age, addr)
SELECT '이순신', 34, addr
FROM t_student2
WHERE sno = 5;

SELECT * FROM t_student2;