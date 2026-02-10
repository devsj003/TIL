-- 03-insert.sql

INSERT INTO members (id, name, email, join_date)
VALUES (1,'이름','100@mail.com','2026-01-12');

-- 테이블 모든 데이터 확인
SELECT * FROM members;

INSERT INTO members (id, name, email, join_date)
VALUES (2,'이름','200@mail.com','2026-01-09');

INSERT INTO members (id, name)
VALUES (3,'김길동'), (4,'홍길동');


INSERT INTO members (name, age, email, join_date)
VALUES ('강길동',20,'100@mail.com','2026-01-12');


INSERT INTO members (email) VALUES ('a@mail.com');

INSERT INTO members (name) VALUES ('박길동');

INSERT INTO members (name, email)
VALUES ('김길동','b@mail.com'), ('홍길동','c@mail.com');
