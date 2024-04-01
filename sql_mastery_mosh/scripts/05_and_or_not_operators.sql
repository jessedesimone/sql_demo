-- AND, OR, NOT operators
-- combine multiple search conditions when filtering data


/*
Order of operators
AND
OR

parentheses can be used to adjust the order of operations
*/

SELECT last_name, first_name, city, state, customer_id, points
FROM customers
WHERE birth_date > '1990-01-01' AND points > 1000;

SELECT last_name, first_name, city, state, customer_id, points
FROM customers
WHERE birth_date > '1990-01-01' OR points > 1000;

SELECT last_name, first_name, city, state, customer_id, points
FROM customers
WHERE birth_date > '1990-01-01' OR points > 1000 AND state = 'VA';

SELECT last_name, first_name, city, state, customer_id, points
FROM customers
WHERE birth_date > '1990-01-01' OR points > 1000 AND state = 'VA' OR state = 'MA';

-- adjust the order of operations
SELECT *
FROM customers
WHERE birth_date > '1985-01-01' OR points > 1000 AND state = 'VA';

SELECT *
FROM customers
WHERE birth_date > ('1985-01-01' OR points > 1000) AND state = 'VA';
-- in this example it is running this first:
SELECT *
FROM customers
WHERE birth_date > ('1985-01-01' OR points > 1000)
-- then it is finding those located in 'VA'


-- NOT operator
SELECT *
FROM customers
WHERE birth_date > '1970-01-01' AND points > 1000;
-- return records birth_date after 70 and points > 1000

SELECT *
FROM customers
WHERE NOT birth_date > '1970-01-01' AND points > 1000;
-- return records where birth_date not after 70 and points > 1000
-- NOT operator precedes the AND

SELECT *
FROM customers
WHERE NOT (birth_date > '1970-01-01' AND points > 1000);
-- negate this condition
-- AND OPERATOR precedes the NOT operator

-- this is the same as
SELECT *
FROM customers
WHERE birth_date < '1970-01-01' AND points < 1000;


/*
EXERCISE
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