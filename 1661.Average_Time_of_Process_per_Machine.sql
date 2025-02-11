WITH avg_time AS 
(
    SELECT A1.machine_id, A1.process_id, A2.timestamp  - A1.timestamp AS time_taken
    FROM Activity A1, Activity A2
    WHERE A1.machine_id = A2.machine_id AND A1.process_id = A2.process_id AND A1.activity_type  = 'start' AND A2.activity_type = 'end'
)

SELECT machine_id, ROUND(AVG(time_taken),3) AS processing_time
FROM avg_time
GROUP BY machine_id;
