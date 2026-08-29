-- Business Question: Where are sales/profit declining?
-- Compares each category's most recent year vs the prior year to flag decline.
-- (Run 03_monthly_sales_trend.sql first/alongside this to see the shape of the decline.)

WITH yearly AS (
    SELECT
        category,
        CAST(strftime('%Y', order_date) AS INTEGER) AS yr,
        SUM(sales)  AS revenue,
        SUM(profit) AS profit
    FROM orders
    GROUP BY category, yr
),
ranked AS (
    SELECT
        category, yr, revenue, profit,
        LAG(revenue) OVER (PARTITION BY category ORDER BY yr) AS prev_revenue,
        LAG(profit)  OVER (PARTITION BY category ORDER BY yr) AS prev_profit
    FROM yearly
)
SELECT
    category,
    yr,
    ROUND(revenue, 2)      AS revenue,
    ROUND(prev_revenue, 2) AS prev_year_revenue,
    ROUND(100.0 * (revenue - prev_revenue) / NULLIF(prev_revenue,0), 2) AS revenue_yoy_change_pct,
    ROUND(profit, 2)       AS profit,
    ROUND(prev_profit, 2)  AS prev_year_profit,
    ROUND(100.0 * (profit - prev_profit) / NULLIF(prev_profit,0), 2)   AS profit_yoy_change_pct
FROM ranked
WHERE prev_revenue IS NOT NULL
ORDER BY category, yr;
