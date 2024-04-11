-- implicit join syntax

-- basic way of writing this join statement
SELECT * 
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id;

-- implicit join sytax
SELECT * 
FROM orders o, customers c
WHERE o.customer_id = c.customer_id;

-- if you forget to use the WHERE statment will end up with a joint cross