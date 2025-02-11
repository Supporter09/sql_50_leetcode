SELECT customer_id, COUNT(*) AS count_no_trans
FROM Visits V
WHERE NOT EXISTS (SELECT customer_id FROM Transactions T2 WHERE V.visit_id = T2.visit_id)
GROUP BY customer_id;
