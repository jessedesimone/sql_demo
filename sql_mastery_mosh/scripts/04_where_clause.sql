-- WHERE clause for filtering data

-- different operators
/*
>       greater than
>=      greater than or equality
<       less than
<=      less than or equality
=       equality
!=      non equality
<>      non equality
*/

-- select customer records with points > 3000
SELECT * FROM customers
WHERE points > 3000
ORDER BY points ASC;

-- comparison operators with strings
SELECT * FROM customers
WHERE state = 'VA' OR state = 'MA';

SELECT * FROM customers
WHERE state != 'VA';

SELECT * FROM customers
WHERE state != 'VA';

-- comparison operators with dates
-- dates are enclosed in quotes in SQL
SELECT last_name, first_name
FROM customers
WHERE birth_date > '1990-01-01';

-- EXERCISE
/*
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