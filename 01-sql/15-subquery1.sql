-- 15-subquery1.sql

-- 평균 주문금액보다 큰 주문 찾기(하드코딩 제거)
SELECT * FROM sales
WHERE total_amount >= (SELECT AVG(total_amount) FROM sales);


-- 평균 대비 차이를 컬럼으로 함께 출력
SELECT
    product_name AS 이름,
    total_amount AS 판매액,
    total_amount - (SELECT AVG(total_amount) FROM sales) AS 평균차이
FROM sales
WHERE total_amount >= (SELECT AVG(total_amount) FROM sales);

-- 최대 주문금액 주문 찾기(Top 1 vs MAX)
SELECT * FROM sales WHERE total_amount=(SELECT MAX(total_amount) FROM sales);


-- 평균과 가장 비슷한 주문 5개(거리 개념)
SELECT
    id,
    order_date,
    total_amount,
    ABS((SELECT AVG(total_amount) FROM sales) - total_amount) AS 평균차이
FROM sales
ORDER BY 평균차이
LIMIT 5;



