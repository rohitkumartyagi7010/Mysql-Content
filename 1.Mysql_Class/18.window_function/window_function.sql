-- We call them "window functions" because they operate on a "window" of rows within the result set.
-- Unlike standard aggregate functions (like SUM(), AVG()), which collapse rows into a single result, window functions can calculate values
-- across a subset of rows (the window) while still preserving individual 
-- row data in the result set.

drop database if exists window_function;
create database window_function;
use window_function;
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    department VARCHAR(100),
    salary DECIMAL(10, 2),
    hire_date DATE
);

INSERT INTO employees (department, salary, hire_date) VALUES
('Sales', 50000, '2019-01-10'),
('Sales', 60000, '2020-03-15'),
('HR', 45000, '2018-05-01'),
('HR', 55000, '2020-07-20'),
('IT', 70000, '2017-11-30'),
('IT', 75000, '2021-06-15'),
('Marketing', 40000, '2019-10-22'),
('Marketing', 50000, '2020-12-05');


-- Without window function, SQL will reduce the no of records.
select department, max(salary) from employees
group by department;

-- By using MAX as an window function, SQL will not reduce records but the result will be shown corresponding to each record.
select e.*,
max(salary) over(partition by department) as max_salary
from employees e;

-- Window Function

-- 1. ROW_NUMBER(): 
-- Assigns a unique sequential integer to rows within a partition of a result set.
-- Example: Get a unique row number for each employee ordered by salary:
-- This query will assign a row number based on the salary in ascending order.

SELECT id, department, salary,
       ROW_NUMBER() OVER (ORDER BY salary) AS row_num
FROM employees;

SELECT id, department, salary,
       ROW_NUMBER() OVER (partition by salary) AS row_num
FROM employees;

-- 2. RANK(): 
-- Similar to ROW_NUMBER(), but it gives the same rank to rows with identical values.
-- Example: Rank employees based on salary:
-- Employees with the same salary will share the same rank, but the next rank will skip ahead (e.g., if two employees share rank 1, the next will be ranked 

SELECT id, department, salary,
       RANK() OVER (ORDER BY salary) AS rank1
FROM employees;



-- 3. DENSE_RANK(): 
-- Works like RANK(), but without gaps in ranking numbers.
-- Example: Dense rank employees based on salary: 
-- Here, even if two employees have the same salary, the next employee will have the immediate next rank.
SELECT id, department, salary,
       DENSE_RANK() OVER (ORDER BY salary) AS dense_rank1
FROM employees;

-- 4. NTILE(): 
-- Divides rows into a specified number of equal buckets. The rows are ranked within each bucket.
-- Example: Divide employees into 3 buckets based on salary:
-- This divides the employees into three groups based on their salaries. The lowest salaries will be in bucket 1, and the highest will be in bucket 3.

SELECT id, department, salary,
       NTILE(5) OVER (ORDER BY salary) AS bucket
FROM employees;

-- 5. LEAD(): 
-- Provides access to a row at a specified physical offset that follows the current row, allowing you to look ahead.
-- Example: Get the salary of the next employee in the list:
-- This will show the salary of the next employee in the order of their salaries. If there is no next employee, NULL will be returned.

SELECT id, department, salary,
       LEAD(salary, 1) OVER (ORDER BY salary) AS next_salary
FROM employees;

-- 6. LAG(): 
-- Similar to LEAD(), but looks behind the current row.
-- Example: Get the salary of the previous employee in the list:
-- This will return the salary of the employee just before the current one. If there is no previous employee, NULL will be returned.
SELECT id, department, salary,
       LAG(salary, 1) OVER (ORDER BY salary) AS previous_salary
FROM employees;

-- 7. FIRST_VALUE(): 
-- Returns the first value in a set of values based on the specified order.
-- Example: Get the first salary in the salary ranking:
-- This will return the lowest salary for every row based on the ordering by salary.

SELECT id, department, salary,
       FIRST_VALUE(salary) OVER (ORDER BY salary) AS first_salary
FROM employees;

-- 8. LAST_VALUE(): 
-- Returns the last value in a set of values based on the specified order.
-- Example: Get the last salary in the salary ranking:
-- This will return the highest salary for each row. The RANGE clause ensures the function looks at the entire window.

SELECT id, department, salary,
       LAST_VALUE(salary) OVER (ORDER BY salary RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_salary
FROM employees;

-- 9. CUME_DIST(): 
-- Calculates the cumulative distribution of a value in a set, expressed as a number between 0 and 1.
-- Example: Calculate the cumulative distribution of employee salaries:

SELECT id, department, salary,
       CUME_DIST() OVER (ORDER BY salary) AS cume_dist1
FROM employees;

-- This will return the percentage of rows with a salary less than or equal to the current row's salary.

-- 10. PERCENT_RANK(): 
-- Similar to CUME_DIST(), but it calculates the relative rank of a row within a partition.
-- Example: Calculate the percent rank of employees based on salary:

SELECT id, department, salary,
       PERCENT_RANK() OVER (ORDER BY salary) AS percent_rank1
FROM employees;

















