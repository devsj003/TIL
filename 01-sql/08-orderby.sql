-- 09-orderby.sql
-- 특정 컬럼을 정렬한다.

SELECT * FROM students;

SELECT * FROM students order by name;
SELECT * FROM students order by name ASC;  --오름차순 기본값
SELECT * FROM students order by name DESC; --내림차순

SELECT * FROM students order by id DESC;  --id가 12까지
ALTER TABLE students ADD COLUMN grade VARCHAR(1) DEFAULT 'B';
UPDATE students SET grade='A' WHERE ID BETWEEN 1 AND 7;

-- 다중 컬럼 정렬
SELECT * FROM students 
order by grade DESC, age ASC;  -- 우선정렬한 것 먼저, ASC는 기본값이라 안써도 됌

SELECT * FROM students 
order by age ASC, grade DESC;


SELECT * FROM students 
ORDER BY id LIMIT 5;

-- 나이가 40 미만이면서 
-- 학점이 가장 높은 사람 중 나이 많은 순으로
-- 상위 5명 뽑기

SELECT name FROM students 
WHERE age < 40
ORDER BY grade ASC, age DESC
LIMIT 5;

