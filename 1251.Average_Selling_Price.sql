SELECT  P.product_id, IFNULL(ROUND( SUM(units * price) / SUM(units), 2), 0) average_price
FROM UnitsSold US
RIGHT JOIN Prices P ON US.product_id = P.product_id AND US.purchase_date BETWEEN P.start_date AND P.end_date
GROUP BY P.product_id
