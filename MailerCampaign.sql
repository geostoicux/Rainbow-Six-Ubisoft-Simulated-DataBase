/*A simulation of a player segment, eligible for sending a promotional mailer with targeted offers 
and coupons applied for the Top 3 most purchased items filtered in the "TOP3bunddles file". */

SELECT 
    p.username,
    p.email,
    p.country,
    SUM(t.amount) AS total_spent
FROM players p
JOIN transactions t ON p.player_id = t.player_id
WHERE p.active_user = TRUE
GROUP BY p.player_id
HAVING total_spent > 1000
ORDER BY total_spent DESC;