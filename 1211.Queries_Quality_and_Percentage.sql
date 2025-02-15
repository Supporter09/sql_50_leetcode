SELECT query_name, ROUND(AVG(rating/position), 2) quality, ROUND((
    SELECT COUNT(*) FROM Queries Q2 WHERE Q2.query_name = Q.query_name AND Q2.rating < 3 
) / COUNT(query_name) * 100, 2) poor_query_percentage 
FROM Queries Q
GROUP BY query_name

