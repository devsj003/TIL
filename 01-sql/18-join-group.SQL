-- 18-join-group.SQL

SELECT * FROM sales;
SELECT * FROM customers;

-- VIP고객의 구매 내역 조회
SELECT
	 *
FROM customers c
INNER join sales s ON c.customer_id=s.customer_id
WHERE c.customer_type='VIP'
;

-- 각 등급별 구매액 평균 확인
SELECT
	 c.customer_type as 등급,
	 count(*) as 고객수,
	 round(avg(s.total_amount)) as 평균구매액
FROM customers c
INNER join sales s ON c.customer_id=s.customer_id
GROUP by c.customer_type;


-- 모든 고객의 고객 별 구매 현황 분석
select
	c.customer_id,
	c.customer_name,
	c.customer_type as 등급,
	count(s.id) as 주문횟수,
	COALESCE(SUM(s.total_amount), 0) AS 총구매액,
	COALESCE(avg(s.total_amount),0.0) as 평균구매액,
	COALESCE(
		TO_CHAR(MAX(s.order_date),'YYYY-MM-DD'),'주문없음'
		) as 최근주문일,
		CASE
			when count(s.id) = 0 then '잠재고객'
			when count(s.id) >= 5 then '충성고객'
			when count(s.id) >= 2 then '일반고객'
			else '신규고객'
		END AS 고객분류
from customers c
LEFT join sales s ON c.customer_id=s.customer_id
GROUP by c.customer_id, c.customer_name, c.customer_type;


-- COALESCE(1, 0) -> A가 NULL이 아니면 A. A가 NULL이면 B
SELECT
    COALESCE(100, 0),  -- 100 (앞에 값이 NULL 이 아님)
    COALESCE(NULL, 0);  -- 0 (앞에 값이 NULL 임)



select
    DISTINCT product_id,
    product_name,
    category
from sales