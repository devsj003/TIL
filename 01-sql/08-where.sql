-- 08-where.sql
CREATE TABLE students(
id	 int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
name varchar(10),
age int
);


SELECT * FROM students;

INSERT INTO students (name, age) VALUES
('정 민수', 50),
('서 지훈', 30),
('윤 하늘', 20),
('최 도윤', 25),
('강 수빈', 33),
('문 태오', 18),
('백 현우', 45),
('한 유진', 10),
('임 주원', 88),
('송 민재', 67);

INSERT INTO students (name) VALUES
('박 수민');

-- 특정 컬럼과 
-- 같음
SELECT * FROM students WHERE name='송 민재';
-- 아님
SELECT * FROM students WHERE id!=1;
-- 이상
SELECT * FROM students WHERE age >= 20;
-- 초과 
SELECT * FROM students WHERE age > 20;
-- 범위(이상-이하) 
SELECT * FROM students WHERE age BETWEEN 20 AND 40;
-- 다중 선택
SELECT * FROM students WHERE id=1 or age=30 or id=5;
SELECT * FROM students WHERE id in (1,3,5);

-- 문자열 패턴 찾기()
SELECT * FROM students WHERE name LIKE '최%';
-- 앞이든 뒤든 다 들어가는 문자열
SELECT * FROM students WHERE name LIKE '%민%';
SELECT * FROM students WHERE name LIKE '%훈';
SELECT * FROM students WHERE name LIKE '박 __';

