WITH cf_count AS (
    SELECT S.user_id, COUNT(C.user_id) cf_times
    FROM Signups S
    LEFT JOIN Confirmations C ON S.user_id = C.user_id 
    WHERE C.action = 'confirmed'
    GROUP BY C.action, S.user_id
)

SELECT S.user_id,
CASE
    WHEN cf_times / COUNT(C.user_id) IS NULL THEN 0
    WHEN cf_times / COUNT(C.user_id) IS NOT NULL THEN ROUND(cf_times / COUNT(C.user_id), 2)
END AS confirmation_rate
FROM Signups S
LEFT JOIN Confirmations C ON S.user_id = C.user_id
LEFT JOIN cf_count cf ON S.user_id = cf.user_id
GROUP BY S.user_id
