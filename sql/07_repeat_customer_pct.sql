-- Business Question: What percentage of customers are repeat customers?
-- A repeat customer = placed more than 1 distinct order.

WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS num_orders
    FROM orders
    GROUP BY customer_id
)
SELECT
    COUNT(*)                                                    AS total_customers,
    SUM(CASE WHEN num_orders > 1 THEN 1 ELSE 0 END)             AS repeat_customers,
    ROUND(100.0 * SUM(CASE WHEN num_orders > 1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS repeat_customer_pct
FROM customer_orders;
