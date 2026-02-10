-- 12-aggr-func.SQL

SELECT * FROM sales;


-- COUNT
SELECT 
	count(id) as 매출건수
from sales;

-- 고유값 DISTINCT
SELECT 
	count(*) as 총주문건수,
	count(distinct customer_id) as 고객수,
	count(distinct product_name) as 상품수
from sales;

-- sum
SELECT 
	sum(total_amount) as 총매출액,
	sum(quantity) as 총판매수량,
	TO_CHAR(SUM(total_amount),'FM999,999,999') || '원' as 총매출
from sales;

SELECT 
	sum(total_amount) as 총매출액,
	COUNT(*) AS 주문건수
from sales
where region='서울'

-- AVG(평균)
SELECT
    AVG(total_amount) AS 회당평균주문액,
    AVG(quantity) AS 평균구매수량,
    ROUND(AVG(unit_price)) AS 평균단가
FROM sales;

-- MIN/MAX
SELECT
    MIN(total_amount) AS 최소매출액,
    MAX(total_amount) AS 최대매출액,
    MIN(order_date) AS 첫주문일,
    MAX(order_date) AS 마지막주문일
FROM sales;

-- 매출 대시보드
SELECT
    COUNT(*) AS 주문건수,
    SUM(total_amount) AS 총매출,
    ROUND(AVG(total_amount)) AS 평균매출,
    MIN(total_amount) AS 최소매출액,
    MAX(total_amount) AS 최대매출액,
    ROUND(AVG(quantity), 2) AS 평균수량 -- ROUND(x, 1) -> 소숫점 1자리 반올림
FROM sales

