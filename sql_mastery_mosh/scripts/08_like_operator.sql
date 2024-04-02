-- LIKE operator

-- find rows that match a specific string pattern
-- need to add string after the operator
-- case of string does not matter
-- 'string%' returns records that start with the string, % represents any amount of characters
-- '%string' returns records that end with the string, % represents any amount of characters
-- '%string%' returns records that contain the string, % represents any amount of characters
--'_string' is used to match a single character, each underscore represents a single character


SELECT * 
FROM customers
WHERE last_name LIKE 'b%'; 

SELECT * 
FROM customers
WHERE last_name LIKE 'brush%';

SELECT * 
FROM customers
WHERE last_name LIKE '%b%';     

SELECT * 
FROM customers
WHERE last_name LIKE '%y';

SELECT * 
FROM customers
WHERE last_name LIKE '_y';

SELECT * 
FROM customers
WHERE last_name LIKE '_____y';

SELECT * FROM customers
WHERE last_name LIKE '_a%';

SELECT * 
FROM customers
WHERE last_name LIKE 'b____y';

SELECT * 
FROM customers
WHERE last_name LIKE 'b%y';


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
