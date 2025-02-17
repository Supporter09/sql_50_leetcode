WITH logged_again AS (
    SELECT player_id, DATE_ADD(MIN(event_date), INTERVAL 1 DAY) IN (SELECT event_date FROM Activity A1 WHERE A.player_id = A1.player_id) logged_again
    FROM Activity A
    GROUP BY player_id
)

SELECT ROUND(AVG(logged_again = TRUE), 2) fraction
FROM logged_again

