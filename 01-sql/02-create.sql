-- 02-create table.sql
CREATE TABLE members(
	id			INT,  -- 정수
	name		varchar(30),  -- 30글자 이하
	email		varchar(100),
	join_date	DATE  -- 날짜
);

DROP TABLE members;

-- member table 생성
CREATE TABLE members(
	id			INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,  -- 자동으로 1씩 올라가고 해당 테이블의 PK -- SQL마다 다름
	name		varchar(30) NOT NULL,	-- 비어있지 않게
	email		varchar(100) UNIQUE, 	-- 중복 허용하지 않게
	age			INT DEFAULT 20,			-- 기본값 20
	join_date	DATE DEFAULT CURRENT_DATE -- 자동으로 오늘 날짜
);