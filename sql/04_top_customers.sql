-- Business Question: Which customers are most valuable?
-- Ranked by total revenue; profit and order count included for context
-- (a high-revenue, low-profit customer is a different story than a high-margin one).

SELECT
    customer_id,
    customer_name,
    segment,
    ROUND(SUM(sales), 2)                AS total_revenue,
    ROUND(SUM(profit), 2)               AS total_profit,
    COUNT(DISTINCT order_id)            AS num_orders,
    ROUND(SUM(sales) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM orders
GROUP BY customer_id, customer_name, segment
ORDER BY total_revenue DESC
LIMIT 20;
