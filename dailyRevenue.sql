/*This is an example of a report containing the daily revenue numbers and the total of transactions made in that specific day. */
SELECT 
    DATE(transaction_date) AS transaction_day,
    COUNT(*) AS total_transactions,
    SUM(amount) AS daily_revenue
FROM transactions
GROUP BY transaction_day
ORDER BY transaction_day DESC;