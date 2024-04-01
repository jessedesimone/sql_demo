-- IN operator

-- long version of using WHERE clause
SELECT *
FROM customers
WHERE state = 'VA' OR state = 'FL' OR state = 'MA';

-- shorter cleaner version using IN operator
SELECT *
FROM customers
WHERE state IN ('VA','FL', 'MA');

SELECT *
FROM customers
WHERE state NOT IN ('VA','FL', 'MA');

SELECT *
FROM customers
WHERE state NOT IN ('VA','FL', 'MA') AND points > 1000;

/*
EXERCISE
Return products with 
with quantities in stock equal to 49, 38, or 72
*/

describe products;
SELECT *,
    quantity_in_stock * unit_price AS 'market_value'
FROM products
WHERE quantity_in_stock IN (49,38,72);