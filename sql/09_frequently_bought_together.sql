-- Business Question: Which products are frequently bought together?
-- SQL self-join gives a quick pairwise count. A fuller market-basket analysis
-- (with support/confidence/lift via the Apriori algorithm) is done in the Python phase.

SELECT
    a.product_name AS product_a,
    b.product_name AS product_b,
    COUNT(DISTINCT a.order_id) AS times_bought_together
FROM orders a
JOIN orders b
    ON a.order_id = b.order_id
   AND a.product_id < b.product_id   -- avoid duplicate pairs and self-pairs
GROUP BY a.product_name, b.product_name
ORDER BY times_bought_together DESC
LIMIT 20;
