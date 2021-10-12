DROP TABLE t_product;

CREATE TABLE t_product (
	iproduct INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	nm VARCHAR(10) NOT NULL,
	price int(10),
	company VARCHAR(7)
);

INSERT INTO t_product
(nm,price,company)
VALUES
('맥북 프로', 51234567, 'Apple'),
('갤럭시 S21', 1500000, 'Samsung'),
('버즈', 300000, 'Samsung'),
('에어팟', 400000, 'Apple');

SELECT * FROM t_product;


SELECT price
FROM t_product
LIMIT 4;

UPDATE t_product
SET price = 5000000
WHERE iproduct = 1;

UPDATE t_product
SET price = 250000,
nm = '버즈프로'
WHERE iproduct =3;

UPDATE t_product
SET company= '삼성'
WHERE company = 'Samsung';

DELETE FROM t_product
WHERE iproduct =4;

SELECT company, COUNT(nm), SUM(price), AVG(price), MAX(price), MIN(price)
FROM t_product
GROUP BY company;

/* 외부에서 root 계정 접속 가능 체크
	UTF-8 꼭 체크
	비밀번호 koreait
	포트번호 3308
	java, sql, android, JSP -1차목표
	*/
