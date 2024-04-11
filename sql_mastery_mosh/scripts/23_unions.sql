-- unions
-- used to combine rows from multiple tables; i.e. combine results from multiple queries

SELECT * FROM orders;

-- label orders placed this year as active and all older orders as archived
SELECT
    order_id,
    order_date,
    'Active' AS 'status'
FROM orders
WHERE order_date BETWEEN '2019-01-01' AND '2019-12-31';

SELECT
    order_id,
    order_date,
    'Archive' AS 'status'
FROM orders
WHERE order_date <= '2019-01-01';

-- now we can combine using UNION
SELECT
    order_id,
    order_date,
    'Active' AS 'status'
FROM orders
WHERE order_date BETWEEN '2019-01-01' AND '2019-12-31'
UNION
SELECT
    order_id,
    order_date,
    'Archive' AS 'status'
FROM orders
WHERE order_date <= '2019-01-01';

/*
EXERCISE
write a query and return results from customers table
4 columns: customer_id, first_name, points, type
note: type does not exist in customers table
*/

SELECT
    customer_id,
    first_name,
    points,
    'Gold' as 'member_type'
FROM customers
WHERE points > 3000
UNION 
SELECT
    customer_id,
    first_name,
    points,
    'Silver' as 'member_type'
FROM customers
WHERE points BETWEEN 2000 AND 3000
UNION 
SELECT
    customer_id,
    first_name,
    points,
    'Bronze' as 'member_type'
FROM customers
WHERE points < 2000
ORDER BY points DESC, first_name;