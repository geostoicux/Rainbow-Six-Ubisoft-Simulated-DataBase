/*This code describes a clasification based on Spending Behaviour: 
we will consider "High Spender" a player with a spending above 1,000 dollars; 
"Occasional Buyer" if the player spends any amount of money, 
and if the player is not making purchases, but his status is still paying_user, we consider him/her an "Active Non-Spender", 
else he/she is "Dormant". */

SELECT 
    p.player_id,
    p.username,
    p.email,
    p.ranking,
    p.leveling,
    p.active_user,
    p.last_active,
    p.country,
    COALESCE(SUM(t.amount), 0) AS total_spent,

    CASE 
        WHEN COALESCE(SUM(t.amount), 0) >= 1000 THEN 'High Spender'
        WHEN COALESCE(SUM(t.amount), 0) > 0 THEN 'Occasional Buyer'
        WHEN p.active_user = 1 THEN 'Active Non-Spender'
        ELSE 'Dormant User'
    END AS user_segment

FROM 
    players p
LEFT JOIN 
    transactions t ON p.player_id = t.player_id
GROUP BY 
    p.player_id, p.username, p.email, p.ranking, p.leveling, p.active_user, p.last_active, p.country
ORDER BY 
    total_spent DESC;