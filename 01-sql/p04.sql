-- p04.sql

SELECT * FROM userinfoo;

ALTER TABLE userinfoo ADD COLUMN age INT DEFAULT 20;
UPDATE userinfoo SET age=30 WHERE id BETWEEN 1 and 5;

-- 이름 오름차순 상위 3명
SELECT * FROM userinfoo
order by name limit 3;

-- email gmail 인 사람들 나이순으로 정렬
SELECT * FROM userinfoo
WHERE email like '%gmail.com'
order by age desc;


-- 나이 많은사람들 중에 핸드폰 번호 오름차순 3명의 이름, 폰번, 나이만 확인.

SELECT name, phone, age FROM userinfoo
ORDER by age DESC, phone ASC
limit 3;


-- 이름 오름차순 인데 가장 이름이 빠른사람 1명은 제외하고 3명만 조회. -> 페이지네이션
SELECT * FROM userinfoo
order by name DESC
limit 3 OFFSET 1;

