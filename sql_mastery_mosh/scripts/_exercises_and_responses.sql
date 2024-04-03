
-- EXERCISES & RESPONSES
/*
SELECT clause
return all the the products from database
include the following
-name
-unit price
-new price (unit price with 10% increase)
*/

SELECT 
    name,
    unit_price,
    unit_price * 1.1 AS 'inflation_cost'
FROM products;

/*
WHERE clause
Get the orders placed this year
*/

show tables;
describe orders;
SELECT * FROM orders;       -- to see which dates are applicable
-- using 2019 as the current year
SELECT order_id,
    customer_id,
    status
FROM orders
WHERE order_date >= '2019-01-01';

/*
AND OR NOT operators
From the order_items table
get the items for order #6
where the total price is greater than 30
*/
show tables;
describe order_items;

-- take a look at data
SELECT * FROM order_items;

-- simplest version but without total price column
SELECT * FROM order_items
WHERE order_id = 6 AND (quantity * unit_price > 30);

-- better version that lists the total price
SELECT order_id,
    quantity * unit_price AS 'total_price'
FROM order_items
WHERE order_id = 6 AND (quantity * unit_price > 30);

-- different return
SELECT order_id,
    quantity * unit_price AS 'total_price'
FROM order_items
WHERE order_id = 6 OR (quantity * unit_price > 30);

/*
IN operator
Return products with 
with quantities in stock equal to 49, 38, or 72
*/

describe products;
SELECT *,
    quantity_in_stock * unit_price AS 'market_value'
FROM products
WHERE quantity_in_stock IN (49,38,72);

/*
BETWEEEN operator
Return customers born between
1/1/1990 and 1/1/2000
*/

describe customers;
SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

/*
EXERCISE
Get the customers whose
addresses contain TRAIL or AVENUE
then customers whose phone ends in 9
then customers whose phone does not end in 9 AND born after 1985
*/

SELECT *
FROM customers
WHERE address LIKE '%trail%' OR 
    address LIKE '%avenue%';

SELECT * 
FROM customers
WHERE phone LIKE '%9';

SELECT * 
FROM customers
WHERE NOT phone LIKE '%9' AND birth_date > '1984-12-31';



/*
REGEX operator
Get the customers whose
-first names are ELKA or AMBUR
-last names end with EY or ON
-last names start with MY or contain SE
-last names contain B followed by R or U
*/

SELECT *
FROM customers
WHERE first_name REGEXP 'Elka|AMBUR';

SELECT *
FROM customers
WHERE last_name REGEXP 'EY$|ON$';

SELECT * 
FROM customers
WHERE last_name REGEXP '^MY|SE';

SELECT * 
FROM customers 
WHERE last_name REGEXP 'B[R|U]';


/*
NULL operator
Get the orders that are not shipped
*/

show tables;
describe orders;
SELECT *
FROM sql_store.orders
WHERE shipped_date IS NULL;


/*
ORDER BY clause
SELECT items from order_id =2 sorted by total price for each item
sort by total price in desc order
*/

show tables;
describe order_items;

SELECT *, quantity * unit_price AS 'total_price'
FROM order_items
WHERE order_id = 2
ORDER BY total_price DESC;


/*
LIMIT clause
select top 3 loyal customers based on points
*/

SELECT *, 'loyal' AS 'loyalty'
FROM customers
ORDER BY points DESC
LIMIT 3;

/*
INNER JOIN
join order_items table with products table
return product id, product name, quantity, unit price (at time of placing order)
note: order_items in unit_price reflects cost at time of placing order; 
order_items in products reflects up to date pricing
*/

SELECT * FROM order_items;
SELECT * FROM products;
SELECT oi.order_id, name, oi.product_id, quantity, oi.unit_price
FROM order_items oi
INNER JOIN products p
ON oi.product_id = p.product_id;