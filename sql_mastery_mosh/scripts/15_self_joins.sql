-- self joins
-- joining a table with itself

USE sql_hr;
SELECT * FROM employees;

-- reports_to is the employee ID of the manager each employee reports to
-- lets get the name of the manager for each employee

SELECT *
FROM employees e
JOIN employees m
ON e.reports_to = m.employee_id;

SELECT 
e.employee_id,
e.first_name,
e.last_name,
m.first_name as 'manager'
FROM employees e
JOIN employees m
ON e.reports_to = m.employee_id;

