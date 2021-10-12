SELECT
B.nm, B.age, B.addr, D.nm AS hnm
FROM t_studenthobby A
INNER JOIN t_student2 B
ON A.sno = B.sno
INNER JOIN t_hobby D
ON A.hno = D.hno

-- WHERE B.age >= 22 and B.age <= 24
-- WHERE B.age BETWEEN 22 AND 24
-- WHERE B.age IN (22, 24)
-- WHERE B.age =22 OR B.age =24

ORDER BY B.nm;

