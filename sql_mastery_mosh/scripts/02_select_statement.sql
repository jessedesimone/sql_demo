-- 02_select_statement

-- select the database
USE sql_store;

-- retrieve all customers
SELECT * FROM customers;

-- retrieve customers with customer_id = 1
SELECT * FROM customers WHERE customer_id=1;

-- retrieve customers and sort
SELECT * FROM customers 
-- ORDER BY first_name;
-- ORDER BY birth_date;
ORDER BY points;

