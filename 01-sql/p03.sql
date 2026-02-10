-- p03.sql

DROP TABLE userinfoo;

CREATE TABLE userinfoo (
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(100),
	phone VARCHAR(11) UNIQUE,
    email VARCHAR(40)
);

INSERT INTO userinfoo (name, phone, email) VALUES
('김철수', '01112345378', 'kim@test.com'),
('이영희', NULL, 'lee@gmail.com'),
('정수민', '01012345637', 'chong@gmail.com'),
('박민수', '01612345637', NULL),
('최영수', '01745367894', 'choi@naver.com');

SELECT * FROM userinfoo;

-- id 가 3 이상
SELECT * FROM userinfoo
WHERE id >=3;

-- email 이 gmail.com 이거나 naver.com 특정 도메인으로 끝나는 사용자들
SELECT * FROM userinfoo
WHERE email LIKE '%gmail.com' or email LIKE '%naver.com';


-- 이름이 김철수, 박민수 2명 뽑기
SELECT * FROM userinfoo
WHERE name in ('김철수', '박민수')
;

-- 이메일이 비어있는(NULL) 사람들
SELECT * FROM userinfoo
WHERE email is null;


-- 이름에 수 글자가 들어간 사람들
SELECT * FROM userinfoo
WHERE name LIKE '%수%';

-- 핸드폰 번호 010으로 시작하는 사람들
SELECT * FROM userinfoo
WHERE phone like '010%';

-- 이름에 '수' 가 있고, 폰번호 010, gmail 쓰는 사람
SELECT * FROM userinfoo
WHERE name LIKE '%수%' and
phone like '010%' and
email like '%gmail.com'
;

-- 성이 김/이 둘중 하난데 gmail 씀
SELECT * FROM userinfoo
WHERE (name LIKE '김%' or name LIKE '이%')
AND email like '%gmail.com'
;
