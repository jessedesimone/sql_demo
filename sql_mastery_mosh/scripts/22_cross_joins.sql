-- cross joins
-- used to join every record in the first table with every record in the second table
-- only want to use this if you want to look at every combination of outcomes
SELECT 
    c.first_name AS 'customer',
    p.name AS 'product'
FROM customers c
CROSS JOIN products p
ORDER BY product, customer;

-- implicit synatax for cross joins
SELECT 
    c.first_name AS 'customer',
    p.name AS 'product'
FROM customers c, products p
ORDER BY product, customer;

/*
EXERCISE
write a query
cross join between shippers and products
return shipper name and product
using implicit syntax
then using explicit syntax
*/

SELECT
    s.name,
    p.name
FROM shippers s, products p
ORDER BY s.name, p.name;

SELECT
    s.name,
    p.name
FROM shippers s
CROSS JOIN products p
ORDER BY s.name, p.name;
