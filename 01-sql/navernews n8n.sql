-- navernews n8n.sql

CREATE TABLE naver_news (
    id      INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title   VARCHAR(300) NOT NULL DEFAULT '',
    content TEXT NOT NULL DEFAULT '',
    section VARCHAR(10) NOT NULL DEFAULT ''
);

Insert INTO naver_news (title, content, section)
values ('테스트기사','테스트 테스트','테스트');

SELECT * FROM naver_news;

DELETE FROM naver_news
WHERE id > 1;