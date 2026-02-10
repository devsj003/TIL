-- 13-groupby.sql

SELECT
    region,
    category,
    COUNT(*) AS 주문건수,
    ROUND(AVG(total_amount), 2) AS 평균매출
FROM sales
GROUP BY region, category
ORDER BY 평균매출 DESC
LIMIT 3;


SELECT
    category AS 카테고리,
    COUNT(*) AS 주문건수,
    SUM(total_amount) AS 총매출,
    AVG(total_amount) AS 평균매출
FROM sales
GROUP BY category
ORDER BY 총매출 DESC;

SELECT * FROM sales;

SELECT
    region AS 지역,
    COUNT(*) AS 주문건수,
    SUM(total_amount) AS 총매출,
    COUNT(DISTINCT customer_id) AS 고객수,
    ROUND(
        COUNT(*)::DECIMAL / COUNT(DISTINCT customer_id), 2
    ) AS 고객당평균주문수,
    SUM(total_amount)::FLOAT / COUNT(DISTINCT customer_id) AS 고객당평균매출
FROM sales
GROUP BY region
ORDER BY 고객당평균매출 DESC;


SELECT
    sales_rep AS 영업사원,
    region AS 지역,
    COUNT(*) AS 주문건수,
    SUM(total_amount) AS 총매출액
FROM sales
GROUP BY sales_rep, region
ORDER BY 총매출액 DESC;


SELECT
    TO_CHAR(order_date, 'YYYY-MM') AS 월,
    sales_rep AS 사원,
    COUNT(*) AS 주문건수,
    SUM(total_amount) AS 월매출액,
    ROUND(AVG(total_amount), 2) AS 평균매출액
FROM sales
GROUP BY
    sales_rep,
    TO_CHAR(order_date, 'YYYY-MM')
ORDER BY 월, 월매출액 DESC;


SELECT
    TO_CHAR(order_date, 'YYYY-MM') AS 월,
    COUNT(*) AS 주문건수,
    SUM(total_amount) AS 월매출액,
    COUNT(DISTINCT customer_id) AS mau
FROM sales
GROUP BY TO_CHAR(order_date, 'YYYY-MM')
ORDER BY 월;


SELECT
    TO_CHAR(order_date, 'Day') AS 요일,
    EXTRACT(DOW FROM order_date) AS 요일번호,
    COUNT(*) AS 주문건수,
    SUM(total_amount) AS 총매출액,
    ROUND(AVG(total_amount), 2) AS 평균매출액
FROM sales
GROUP BY
    TO_CHAR(order_date, 'Day'),
    EXTRACT(DOW FROM order_date)
ORDER BY 총매출액 DESC;



