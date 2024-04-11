-- USING clause
USE sql_store;
SELECT 
o.order_id,
c.first_name
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id;

-- if the column name on the join clause is the same for the two tables, can substitute with USING clause
SELECT 
o.order_id,
c.first_name,
o.status AS 'status_id',
os.name AS 'status',
s.name AS 'shipper'
FROM orders o
JOIN customers c
    USING (customer_id)
-- not all orders have a shipper yet so need to use LEFT JOIN
LEFT JOIN shippers s
    USING (shipper_id)
LEFT JOIN order_statuses os
    ON o.status = os.order_status_id
ORDER BY shipper, o.order_id;


-- USING clause when joining with two primary keys
-- long version
SELECT *
FROM order_items oi
JOIN order_item_notes oin
    ON oi.order_id = oin.order_id AND
    oi.product_id = oin_product_id

-- simplified version
SELECT *
FROM order_items oi
JOIN order_item_notes oin
    USING (order_id, product_id);


/*
EXERCISE
write a query
select payments from payments table
return date, client, amount, and method
*/

SELECT 
p.date,
c.name AS 'client',
p.amount,
pm.name AS 'payment method'
FROM payments p
JOIN clients c
    USING (client_id)
LEFT JOIN payment_methods pm
    ON p.payment_method = pm.payment_method_id;
