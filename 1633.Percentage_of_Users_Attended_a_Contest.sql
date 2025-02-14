SELECT contest_id, ROUND(COUNT(contest_id) / (SELECT COUNT(*) FROM Users) * 100, 2) percentage
FROM Register R
GROUP BY contest_id 
ORDER BY percentage DESC, contest_id ASC
