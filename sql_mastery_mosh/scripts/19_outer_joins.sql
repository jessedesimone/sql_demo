-- OUTER JOIN
-- two types of joins - LEFT and RIGHT

-- inner join
SELECT * 
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;

SELECT 
c.customer_id,
c.first_name,
o.order_id
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- only seeing customers who have placed an order but we may want to see all customers


-- using LEFT JOIN
-- this will return all records from the first table whether or not they have an order or not
SELECT 
c.customer_id,
c.first_name,
o.order_id
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- when we use right join this will return all records from the second table
SELECT 
c.customer_id,
c.first_name,
o.order_id
FROM customers c
RIGHT JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY o.order_id;

-- if we want to see all records from first table on a right join; need to switch the order of the tables
SELECT 
c.customer_id,
c.first_name,
o.order_id
FROM orders o
RIGHT JOIN customers c
    ON c.customer_id = o.customer_id
ORDER BY o.order_id;


/*
EXERCISE
join products with order_items table
show all products whether or not it has actually been orders
return product_id, name, quantity
*/

DESCRIBE products;
DESCRIBE order_items;

SELECT
p.product_id,
p.name,
oi.quantity
FROM products p
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
ORDER BY oi.quantity;

-- OUTER JOIN between multiple tables

-- original query for outer join
SELECT 
c.customer_id,
c.first_name,
o.order_id
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- bow want to join another table (shippers) based on common index with the orders table
SELECT 
c.customer_id,
c.first_name,
o.order_id,
s.shipper_id
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN shippers s
    ON o.shipper_id = s.shipper_id
ORDER BY c.customer_id;

SELECT 
c.customer_id,
c.first_name,
o.order_id,
s.name AS 'shipper'
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
LEFT JOIN shippers s
    ON o.shipper_id = s.shipper_id
ORDER BY c.customer_id;

/*
OUTER JOIN with multiple tables
write a query
return order_date, order_id, first_name, shipper, status
order by status
*/

USE sql_store;
SHOW tables;
DESCRIBE customers;
DESCRIBE orders;
DESCRIBE shippers;

SELECT 
order_date,
order_id,
first_name,
s.name AS 'shipper',
os.name AS 'status'
FROM orders o
-- use inner join as all orders have a customer id
JOIN customers c
    ON o.customer_id = c.customer_id
-- use outer join because not all orders have shipper (i.e., have not been shipped yet)
LEFT JOIN shippers s
    ON o.shipper_id = s.shipper_id
-- use inner join because all orders have a status
JOIN order_statuses os
    ON o.status = os.order_status_id
ORDER BY status, order_id;


-- self OUTER JOIN
-- query to find each employee's manager
USE sql_hr;
-- this query will only return records that have a manager
SELECT
e.employee_id,
e.first_name,
e.last_name,
m.first_name AS 'manager'
FROM employees e
JOIN employees m 
    ON e.reports_to = m.employee_id;

-- this query will return all records
SELECT
e.employee_id,
e.first_name,
e.last_name,
m.first_name AS 'manager'
FROM employees e
LEFT JOIN employees m 
    ON e.reports_to = m.employee_id;