-- 인덱스 생성 / 제거 
CREATE INDEX idx_student_age
ON t_student2 (age);

DROP INDEX idx_student_age
ON t_student2;

-- 인덱스 확인 
SHOW INDEX FROM t_student2;

-- primary key는  
-- unique
-- not null
-- index
-- 를 포함한다.
-- 시험에 나온다.

