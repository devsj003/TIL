-- 04-select.sql

-- 모든 테이블 *
select * from members;

-- 컬럼 지정
select name, email from members;

-- 조건 지정
select * from members where id=3;

-- 이름, 나이 20세 지정
select name, age from members where age=20;