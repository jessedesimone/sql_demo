-- there are times where a single column cannot be used to uniqely identify columns in a given table
-- example
-- in order_items table, the order_id and product_id have duplicate values so we cannot use these alone
-- this table has a **composite** primary key (two primary keys, one for each)
-- the combination of order_id and product_id represent an order item

USE sql_store;
DESCRIBE order_items;
SELECT * FROM order_items;

-- in this circumstance, we need to match based on two conditions using AND
SELECT * 
FROM order_items oi
JOIN order_item_notes oin
ON oi.order_id = oin.order_id
AND oi.product_id = oin.product_id;
