-- limit the number of returned items from queries
-- limit clause should always come last in the query

-- get all customers
SELECT *
FROM customers;

-- return only first 3
SELECT *
FROM customers
LIMIT 3;

-- optionally apply offset for pagination
-- skip the first # records, select the second # records
SELECT *
FROM customers
LIMIT 6, 3;


/*
EXERCISE
select top 3 loyal customers based on points
*/

SELECT *, 'loyal' AS 'loyalty'
FROM customers
ORDER BY points DESC
LIMIT 3;