-- Business Question: Which categories have the highest profit margins?
-- Margin = total profit / total revenue for that category

SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2)                              AS total_revenue,
    ROUND(SUM(profit), 2)                             AS total_profit,
    ROUND(100.0 * SUM(profit) / NULLIF(SUM(sales),0),2) AS profit_margin_pct
FROM orders
GROUP BY category, sub_category
ORDER BY profit_margin_pct DESC;
