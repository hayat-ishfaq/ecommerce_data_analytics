-- Business Question: What is the average order value?
-- IMPORTANT: an "order" can span multiple line items (multiple rows sharing order_id),
-- so we must first collapse to order-level totals before averaging.

WITH order_totals AS (
    SELECT
        order_id,
        SUM(sales) AS order_value
    FROM orders
    GROUP BY order_id
)
SELECT
    ROUND(AVG(order_value), 2) AS average_order_value,
    COUNT(*)                   AS total_orders,
    ROUND(SUM(order_value), 2) AS total_revenue
FROM order_totals;
