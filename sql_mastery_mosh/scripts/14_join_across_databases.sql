-- join tables across multiple databases
-- consider the situtation where there is no products table in sql_store
-- we want to join order items from sql_store with the products table from sql_inventory

USE sql_store;
SELECT * 
FROM order_items oi
INNER JOIN sql_inventory.products p
ON oi.product_id = p.product_id;

-- no need to have product_id and unit_price twice
SELECT order_id, quantity, oi.unit_price, p.product_id, name, quantity_in_stock
FROM order_items oi
INNER JOIN sql_inventory.products p
ON oi.product_id = p.product_id;