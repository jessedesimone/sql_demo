
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