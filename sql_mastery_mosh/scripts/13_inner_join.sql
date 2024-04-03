-- inner joins

-- orders table
SELECT *
FROM orders;

-- join with customer_id 
SELECT * 
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id;

-- join with customer_id show order, customer, first, last
-- since customer_id is common to both tables, need to specify which table to pull from
SELECT order_id, customers.customer_id, first_name, last_name
FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id;

-- we can get rid of repetition using aliases
SELECT order_id, c.customer_id, first_name, last_name
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;


/*
EXERCISE
join order_items table with products table
return product id, product name, quantity, unit price (at time of placing order)
note: order_items in unit_price reflects cost at time of placing order; 
order_items in products reflects up to date pricing
*/
SELECT * FROM order_items;
SELECT * FROM products;
SELECT oi.order_id, name, oi.product_id, quantity, oi.unit_price
FROM order_items oi
INNER JOIN products p
ON oi.product_id = p.product_id;
