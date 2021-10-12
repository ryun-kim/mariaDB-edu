/*************************************************************
  LEFT, INNER JOIN 차이 
*************************************************************/

CREATE TABLE t_temp_1 (
 id INT UNSIGNED PRIMARY KEY,
 nm VARCHAR(5) NOT null
);

CREATE TABLE t_temp_2 (
 id INT UNSIGNED PRIMARY KEY,
 tid INT UNSIGNED,
 nm VARCHAR(5) NOT null
);

INSERT INTO t_temp_1 (id, nm)
VALUES (1, '가'), (2, '나'), (3, '다');

INSERT INTO t_temp_2 (id, tid, nm)
VALUES (1, 1, 'A'), (2, 1, 'B'), (3, 3, 'C'), (4, 4, 'D');

SELECT * FROM t_temp_1;
SELECT * FROM t_temp_2;

SELECT 
A.id AS id2, A.tid AS tid, A.nm AS nm2
, B.id AS id1, B.nm AS nm1
FROM t_temp_2 A
INNER JOIN t_temp_1 B
ON A.tid = B.id;

SELECT
A.*, B.tid, B.nm
FROM t_temp_1 A LEFT JOIN t_temp_2 B
ON A.id = B.tid
ORDER BY A.id;

SELECT
A.*
, ifnull(B.id, 0) AS id
, ifnull(B.nm, '값없음') AS nm
FROM t_temp_2 A LEFT JOIN t_temp_1 B
ON A.tid = B.id
ORDER BY A.tid;

-- 서브쿼리, like문, between, 주로 쓰는 함수, UNION (ALL), IF문, CASE문, ERD
-- 안드로이드 
-- back-end (JSP) + DB 
-- 안드로이드 + JSP + DB -> 서비스 완성 