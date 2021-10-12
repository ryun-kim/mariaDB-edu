CREATE TABLE t_student (
	pk INT unsigned PRIMARY KEY auto_increment,
	nm VARCHAR(5) NOT null,
	ph CHAR(13),
	addr VARCHAR(40),
	gender CHAR(1) NOT NULL DEFAULT('남') CHECK(gender IN ('남' ,'여')) ,
	rdt DATETIME DEFAULT NOW()
);

INSERT INTO t_student
(nm, ph, gender)
VALUES
('나', '010-0000-0002', '여');

-- transaction (트랜잭션) commit, rollback

DROP TABLE t_student;

-- SQL RDB 표준어
-- CRUD, DML
/*
	C: Create - insert
	R: Read   - select
	U: Update - update
	D: Delete - delete
*/

INSERT INTO t_studentt_student
(nm, ph, addr)
VALUES
('가', '010-0000-0000', '상인동');

INSERT INTO t_student
(nm, ph, addr)
VALUES
('나', '010-0000-0001', '대명동'),
('다', '010-0000-0002', '범어동'),
('라', '010-0000-0003', '산격동');

SELECT * FROM t_student;
SELECT nm FROM t_student;
SELECT nm,ph FROM t_student;

SELECT nm, ph, addr FROM t_student
WHERE nm = '가' OR addr = '산격동';

SELECT nm, ph, addr FROM t_student
WHERE nm = '가' AND addr = '상인동';

UPDATE t_student
SET addr = '범어동'
, ph = '010-2222-2333'
WHERE nm = '다';

DELETE FROM t_student WHERE nm = '가';
