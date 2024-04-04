-- joining multiple tables
USE sql_store;

SELECT * FROM order_statuses;
SELECT * from orders;
SELECT * from customers;

DESCRIBE order_statuses;
DESCRIBE orders;
DESCRIBE customers;

-- create query to select order_id order_date first_name last_name status
SELECT 
order_id, 
order_date, 
c.first_name, 
c.last_name, 
status, 
os.name
FROM orders o
INNER JOIN customers c 
ON o.customer_id = c.customer_id
INNER JOIN order_statuses os
ON o.status = os.order_status_id;


/*
EXERCISE
in sql_invoicing database
join payments table with payment_methods and clients table
inlcude name of client and payment method in the return
*/

DESCRIBE payments;
DESCRIBE payment_methods;
DESCRIBE clients;

SELECT 
date,
payment_id, 
p.client_id, 
c.name, 
invoice_id, 
amount, 
pm.name as 'pay_method'
FROM payments p
INNER JOIN payment_methods pm
ON p.payment_method = pm.payment_method_id
INNER JOIN clients c
ON p.client_id = c.client_id;