-- Business Question: Which products generate the most revenue?
-- Table: orders (one row per order line item)

SELECT
    product_name,
    category,
    sub_category,
    ROUND(SUM(sales), 2)      AS total_revenue,
    ROUND(SUM(profit), 2)     AS total_profit,
    SUM(quantity)             AS units_sold,
    COUNT(DISTINCT order_id)  AS num_orders
FROM orders
GROUP BY product_id, product_name, category, sub_category
ORDER BY total_revenue DESC
LIMIT 20;
