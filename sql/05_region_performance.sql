-- Business Question: Which regions perform best?

SELECT
    region,
    ROUND(SUM(sales), 2)                                AS total_revenue,
    ROUND(SUM(profit), 2)                                AS total_profit,
    ROUND(100.0 * SUM(profit) / NULLIF(SUM(sales),0), 2) AS profit_margin_pct,
    COUNT(DISTINCT order_id)                             AS num_orders,
    COUNT(DISTINCT customer_id)                          AS num_customers
FROM orders
GROUP BY region
ORDER BY total_revenue DESC;
