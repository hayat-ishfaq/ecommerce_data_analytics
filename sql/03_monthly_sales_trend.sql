-- Business Question: Which months have the highest sales?
-- Groups by calendar month across all years, and also by year-month for a true trend line.

-- (a) By year-month (for the trend chart)
SELECT
    strftime('%Y-%m', order_date) AS year_month,
    ROUND(SUM(sales), 2)          AS total_revenue,
    ROUND(SUM(profit), 2)         AS total_profit,
    COUNT(DISTINCT order_id)      AS num_orders
FROM orders
GROUP BY year_month
ORDER BY year_month;

-- (b) By calendar month only (to spot seasonality regardless of year)
SELECT
    strftime('%m', order_date) AS month_num,
    CASE strftime('%m', order_date)
        WHEN '01' THEN 'Jan' WHEN '02' THEN 'Feb' WHEN '03' THEN 'Mar'
        WHEN '04' THEN 'Apr' WHEN '05' THEN 'May' WHEN '06' THEN 'Jun'
        WHEN '07' THEN 'Jul' WHEN '08' THEN 'Aug' WHEN '09' THEN 'Sep'
        WHEN '10' THEN 'Oct' WHEN '11' THEN 'Nov' WHEN '12' THEN 'Dec'
    END AS month_name,
    ROUND(SUM(sales), 2) AS total_revenue
FROM orders
GROUP BY month_num
ORDER BY total_revenue DESC;
