-- p05.sql
SELECT * FROM sales;
SELECT * FROM customers;

-- 주문 금액이 가장 높은 상위 10건 조회
-- 전체 주문(sales) 중에서 주문 금액이 가장 큰 10건을 조회하시오.
-- 각 주문에 대해 고객명, 상품명, 주문금액을 표시하고, 주문금액이 큰 순서대로 정렬하시오.
 
SELECT 
	c.customer_name,
	s.product_name,
	s.total_amount
FROM customers c
INNER join sales s ON c.customer_id=s.customer_id
ORDER by total_amount DESC
LIMIT 10;

-- 2. 고객 유형별 주문 성과
-- 구매 이력이 있는 고객만을 대상으로, 
-- 고객 유형별로 주문 건수와 평균 주문금액을 계산하고
-- 평균 주문금액이 높은 순으로 정렬하시오.
SELECT 
	c.customer_type,
	COUNT(s.id) AS 주문건수,
	round(avg(s.total_amount)) as 평균주문금액
FROM customers c
INNER join sales s ON c.customer_id=s.customer_id
group by c.customer_type
ORDER by 평균주문금액 DESC;

--3. 모든 고객과 구매 상품 조회
--모든 고객을 대상으로
--각 고객이 구매한 상품명을 조회하시오.
--구매 이력이 없는 고객의 경우 '없음'으로 표시하시오.
SELECT 
    c.customer_id,
    COALESCE(s.product_name, '없음') AS 상품명,
    COALESCE(TO_CHAR(s.order_date, 'YYYY-MM-DD'), '주문없음') AS 주문일
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id;

-- 4. 고객 + 주문 상세 조회
-- 구매 이력이 있는 모든 고객에 대해
-- 고객 정보와 주문 정보를 함께 조회하시오.
-- 결과는 최근 주문일 순으로 정렬하시오
SELECT 
    c.*,
	s.*
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.order_date desc;

-- 5. VIP 고객 구매 내역
-- 고객 유형이 'VIP' 인 고객들의
-- 구매 상품, 주문 금액, 주문일을 조회하고
-- 주문금액이 큰 순서로 정렬하시오.
SELECT 
	c.customer_type,
	s.product_id,
	s.total_amount,
	s.order_date
FROM customers c
INNER join sales s ON c.customer_id=s.customer_id
WHERE c.customer_type='VIP'
ORDER BY s.total_amount desc;


-- 6. 2024년 하반기 전자제품 구매
-- 2024년 7월~12월 사이에
-- 카테고리가 '전자제품' 인 주문 내역만 조회하시오.
SELECT 
*
FROM customers c
INNER join sales s ON c.customer_id=s.customer_id
WHERE s.category='전자제품'
and s.order_date BETWEEN '2024-07-01' and '2024-12-31';

-- 7.고객별 구매 요약 (구매한 고객만)
-- 구매 이력이 있는 고객을 대상으로
-- 고객별 고객명, 등급, 주문횟수, 총구매금액, 평균구매금액, 최근주문일을 계산하고
-- 평균구매금액이 높은 순으로 정렬하시오.
SELECT 
	c.customer_name,
	c.customer_type,
	COUNT(s.id) AS 주문횟수,
	SUM(s.total_amount) AS 총구매금액,
	ROUND(AVG(s.total_amount)) AS 평균구매금액,
	max(s.order_date) as 최근주문일
FROM customers c
INNER join sales s ON c.customer_id=s.customer_id
group by c.customer_name, c.customer_type
ORDER BY 평균구매금액 DESC;


-- 8. 모든 고객 구매 통계 (주문 없는 고객 포함)
-- 모든 고객에 대해
-- 주문횟수, 총구매금액, 평균구매금액, 최대구매금액을 계산하시오.
-- 구매가 없는 경우 0으로 처리하시오.
SELECT 
	c.customer_id,
	count (s.id),
	sum (s.total_amount),
	ROUND(AVG(s.total_amount)),
	max(s.total_amount)
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
GROUP by c.customer_id;
;


-- 9. 고객 유형 × 상품 카테고리 분석
-- 고객 유형과 상품 카테고리별로
-- 주문건수와 총매출액을 분석하시오.
SELECT 
	c.customer_type,
	s.category,
	count (s.id),
	sum (s.total_amount)
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
GROUP by c.customer_type, s.category;


-- 10. 고객 등급 분류 (활동 + 구매)
-- 각 고객을 대상으로
-- 구매횟수와 총구매금액을 기준으로
-- 활동등급과 구매등급을 분류하시오.
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]

SELECT 
	c.customer_id,
	count (s.id),
	sum (s.total_amount),
-- 1. 활동등급 분류 (큰 숫자부터 작성해야 정확해요!)
    CASE 
        WHEN COUNT(s.id) >= 10 THEN '플래티넘'
        WHEN COUNT(s.id) >= 5  THEN '골드'
        WHEN COUNT(s.id) >= 3  THEN '실버'
        WHEN COUNT(s.id) > 0   THEN '브론즈'
        ELSE '잠재고객'
    END AS 활동등급,
    -- 2. 구매등급 분류
    CASE 
        WHEN SUM(s.total_amount) >= 500000 THEN '로얄'
        WHEN SUM(s.total_amount) >= 200000 THEN '최우수'
        WHEN SUM(s.total_amount) >= 100000 THEN '우수'
        WHEN SUM(s.total_amount) > 0      THEN '일반'
        ELSE '신규'
    END AS 구매등급
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
GROUP by c.customer_id;