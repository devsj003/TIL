-- 05-update.sql


-- 테이블 모든 데이터 확인
SELECT * FROM members;

-- 데이터 익명 추가
INSERT INTO members (name)
VALUES ('익명');

-- 데이터 업데이트
UPDATE members 
SET name='차길동'
WHERE name='익명';

-- 마지막 사람의 email과 나이 수정
UPDATE members
SET email='last@mail.com', age='30'
WHERE id=6;

-- 나이 한살 더 먹기
UPDATE members
SET age=21
WHERE age =20;