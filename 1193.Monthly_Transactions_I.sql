WITH approved_trans AS
(
    SELECT DATE_FORMAT(trans_date, "%Y-%m") month, country, COUNT(*) approved_count, SUM(amount) approved_total_amount 
    FROM Transactions T
    WHERE state = "approved"
    GROUP BY DATE_FORMAT(trans_date, "%Y-%m"), country
)

SELECT 
    DATE_FORMAT(trans_date, "%Y-%m") month
    ,T.country
    ,COUNT(trans_date) trans_count
    ,IFNULL(approved_count, 0) approved_count
    ,sum(amount) trans_total_amount
    ,IFNULL(approved_total_amount, 0) approved_total_amount
FROM Transactions T LEFT JOIN approved_trans at ON (T.country = at.country OR (T.country IS NULL AND at.country IS NULL)) AND DATE_FORMAT(T.trans_date, "%Y-%m") = at.month
GROUP BY DATE_FORMAT(trans_date, "%Y-%m"), country

