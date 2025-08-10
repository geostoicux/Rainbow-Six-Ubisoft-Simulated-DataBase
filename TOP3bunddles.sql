/*This is an example of report that could help generating future Campaigns with a more focus in promoting "Pro Pack", "Gun Skin", 
and "Operator Pack" and even offering special offers for specific players based on further segmentations or simply engagement rate. */

SELECT 
    item_purchased,
    COUNT(*) AS times_purchased,
    SUM(amount) AS total_revenue
FROM transactions
GROUP BY item_purchased
ORDER BY total_revenue DESC;