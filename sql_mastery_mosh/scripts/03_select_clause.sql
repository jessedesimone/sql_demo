-- 03_select_clause

-- select the database
USE sql_store;

-- explicity specify columns for return
SELECT last_name, first_name, points FROM customers 
-- ORDER BY first_name;
-- ORDER BY birth_date;
ORDER BY points;

-- combine with mathematical formula
-- in this example we use points to determine air miles points
-- math statements determined by order of operations (BEDMAS)
SELECT last_name, first_name, points, points * 50 FROM customers 
ORDER BY points;

SELECT last_name, first_name, points, points * 10 + 50 FROM customers 
ORDER BY points;

SELECT last_name, 
    first_name, 
    points, 
    (points + 10) * 50 FROM customers 
ORDER BY points;

-- give new column an alias
SELECT last_name, 
    first_name, 
    (points + 10) * 50 AS 'air miles'
FROM customers 
ORDER BY points;

SELECT *, 
    (points + 10) * 50 AS 'air miles'
FROM customers 
ORDER BY points;

-- change order by ascending or descending
SELECT last_name, 
    first_name, 
    (points + 10) * 50 AS 'air miles'
FROM customers 
ORDER BY points AS ASC;

SELECT last_name, 
    first_name, 
    (points + 10) * 50 AS 'air miles'
FROM customers 
ORDER BY points AS DESC;

-- select distinct values from column
SELECT DISTINCT state FROM customers;

/*
EXERCISE
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
