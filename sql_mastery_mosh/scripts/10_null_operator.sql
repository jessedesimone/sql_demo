-- NULL operator
-- look for records missing (or not missing) an attribute

SELECT * FROM customers;

SELECT *
FROM customers
WHERE phone IS NULL;

SELECT *
FROM customers
WHERE phone IS NOT NULL;

/*
EXERCISE
Get the orders that are not shipped
*/

show tables;
describe orders;
SELECT *
FROM sql_store.orders
WHERE shipped_date IS NULL;