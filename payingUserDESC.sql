/*This is a simulating segment for of all the paying users displayed descendent, ready to be analyzed for future purchases campaigns. */
SELECT 
    t.player_id,
    p.username,
    p.email,
    SUM(t.amount) AS total_spent,
    COUNT(t.transaction_id) AS number_of_purchases
FROM transactions t
JOIN Players p ON t.player_id = p.player_id
GROUP BY t.player_id
ORDER BY total_spent DESC;