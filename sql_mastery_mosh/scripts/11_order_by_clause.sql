-- how to sort data from queries

-- default order (based on customer_id as PRIMARY_KEY)
SELECT*
FROM customers

-- order by new column
SELECT*
FROM customers
ORDER BY first_name;

-- reverse the sort order
SELECT*
FROM customers
ORDER BY first_name DESC;


-- sort each customer by state then first name
SELECT *
FROM customers
ORDER BY state, first_name;

SELECT *
FROM customers
ORDER BY state, first_name ASC;

SELECT *
FROM customers
ORDER BY state DESC, first_name ASC;

SELECT first_name, last_name, 10 AS points
FROM customers
ORDER BY birth_date;



/*
EXERCISE
SELECT items from order_id =2 sorted by total price for each item
sort by total price in desc order
*/

show tables;
describe order_items;

SELECT *, quantity * unit_price AS 'total_price'
FROM order_items
WHERE order_id = 2
ORDER BY total_price DESC;