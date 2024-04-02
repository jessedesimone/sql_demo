-- REGEXP operators
-- carrot (^) beginning of string
-- dollar sign ($) end of string
-- pipe (|) logical OR
-- square brackets [abcd] or [a-z] match any single characters listed

-- using LIKE operator
SELECT *
FROM customers
WHERE last_name LIKE '%field%';

-- using above with REGEXP
-- do not have to use %
SELECT *
FROM customers
WHERE last_name REGEXP 'field';

-- we can use carrot symbol with REGEXP
-- '^string' returns anythin that starts with string
SELECT *
FROM customers
WHERE city REGEXP '^C';

SELECT *
FROM customers
WHERE last_name REGEXP 'field$';



-- search for multiple strings
SELECT *
FROM customers
WHERE last_name REGEXP 'field|mac';

SELECT *
FROM customers
WHERE last_name REGEXP 'field|mac|rows';

SELECT *
FROM customers
WHERE last_name REGEXP '^field|mac|rows';

SELECT *
FROM customers
WHERE last_name REGEXP 'field$|^mac|rows';


-- using with options
SELECT *
FROM customers
WHERE last_name REGEXP '[gim]e';

SELECT *
FROM customers
WHERE last_name REGEXP 'e[lmq]';

SELECT *
FROM customers
WHERE last_name REGEXP '[a-h]e';



/*
EXERCISE
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