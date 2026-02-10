-- 17-join.SQL

SELECT * FROM sales;
SELECT * FROM customers;

SELECT 
	*,
	(SELECT customer_name FROM customers c WHERE c.customer_id=s.customer_id) as 고객명,
	(SELECT customer_type FROM customers c WHERE c.customer_id=s.customer_id) as 고객등급
FROM sales s;


-- JOIN
SELECT
	 *
FROM customers c
INNER join sales s ON c.customer_id=s.customer_id;

SELECT
	 *
FROM customers c
LEFT join sales s ON c.customer_id=s.customer_id;


-- UNION
SELECT
	 '1. INNER join'  as 구분,
	 count (*) as 줄수,
	 count (DISTINCT c.customer_id) as 고객수
FROM customers c
INNER join sales s ON c.customer_id=s.customer_id
UNION
SELECT
	 '2. LEFT join'  as 구분,
	 count (*) as 줄수,
	 count (DISTINCT c.customer_id) as 고객수
FROM customers c
LEFT join sales s ON c.customer_id=s.customer_id;
