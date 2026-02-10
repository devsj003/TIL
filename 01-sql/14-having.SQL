-- 14-having.SQL

-- (그룹 결과에 조건 걸기)
-- WHERE로 “원본 데이터”를 먼저 제한한 뒤 그룹핑
SELECT
    category,
    COUNT(*) AS 주문건수,
    SUM(total_amount) AS 총매출액
FROM sales
WHERE total_amount >= 1000000
GROUP BY category;


-- HAVING으로 “총매출액이 큰 그룹만” 남기기
SELECT
    category,
    COUNT(*) AS 주문건수,
    SUM(total_amount) AS 총매출액
FROM sales
GROUP BY category
HAVING SUM(total_amount) >= POWER(10, 7);


-- 활성 지역 찾기(고객수와 주문건수 동시 기준)
SELECT
SELECT
	region AS 지역,
	COUNT(*) AS 주문건수,
	COUNT(DISTINCT customer_id) AS 고객수,
    SUM(total_amount) AS 총매출액,
    AVG(total_amount) AS 평균주문액
FROM sales
GROUP BY region
HAVING
    COUNT(DISTINCT customer_id) >= 15 AND
    COUNT(*) >= 20;


