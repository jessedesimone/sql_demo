-- natural joins
-- using natural join will do a join based on the common columns
-- not reccommended

USE sql_store;
SELECT 
    o.order_id, 
    c.first_name
FROM orders o
NATURAL JOIN customers c;