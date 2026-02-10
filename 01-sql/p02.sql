-- p02.sql

SELECT * FROM userinfoo;


-- userinfo 에 email 컬럼 추가 40글자 제한, 기본값은 ex@gmail.com

ALTER TABLE userinfoo 
ADD COLUMN email VARCHAR(40) DEFAULT 'ex@gmail.com';


-- nickname 길이제한 100자로 늘리기
ALTER TABLE userinfoo 
ALTER COLUMN nickname Type VARCHAR(100);


-- reg_date 컬럼 삭제
ALTER table userinfoo
DROP COLUMN reg_date;

-- 실제 한명의 email 을 수정하기
UPDATE userinfoo
SET email='b@mail.com' WHERE id=1;



