-- Create Database
drop database if exists company_db;
CREATE DATABASE company_db;
USE company_db;

-- Create Departments Table
CREATE TABLE departments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

-- Create Employees Table (with manager_id)
CREATE TABLE employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    salary DECIMAL(10,2),
    department_id INT,
    join_date DATE,
    manager_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id),
    FOREIGN KEY (manager_id) REFERENCES employees(id)
);

-- Insert Data into Departments
INSERT INTO departments (name) VALUES 
('HR'), 
('Sales'), 
('Engineering'), 
('Finance'), 
('Marketing');

-- Insert Data into Employees (with manager_id directly)
-- Note: Managers must be inserted before subordinates
INSERT INTO employees (name, salary, department_id, join_date, manager_id) VALUES
-- HR Department
('Bob', 60000, 1, '2021-03-22', NULL),         -- id = 1 (Manager)
('Alice', 50000, 1, '2020-01-15', 1),          -- id = 2
('Ivan', 40000, 1, '2018-09-03', 1),           -- id = 3

-- Sales Department
('David', 70000, 2, '2020-07-12', NULL),       -- id = 4 (Manager)
('Charlie', 55000, 2, '2019-11-05', 4),        -- id = 5
('John', 50000, 2, '2019-12-11', 4),           -- id = 6
('Ken', 65000, 2, '2021-11-05', 4),            -- id = 7

-- Engineering Department
('Frank', 85000, 3, '2022-04-01', NULL),       -- id = 8 (Manager)
('Eve', 72000, 3, '2021-01-10', 8),            -- id = 9
('Leo', 100000, 3, '2023-01-01', 8),           -- id = 10

-- Finance Department
('Heidi', 95000, 4, '2022-06-30', NULL),       -- id = 11 (Manager)
('Grace', 65000, 4, '2020-08-19', 11);         -- id = 12

select * from employees;
select * from departments;

-- Question 1 Find employees who earn more than the average salary.
-- ----------solution 1
set @avg_salary  = (select avg(salary)from employees);

select * from 
employees
where salary > @avg_salary;

-- ---------solution 2
SELECT name 
FROM employees 
WHERE salary > (SELECT 
               AVG(salary) FROM employees);
               
-- This subquery calculates the average salary of all employees. The main query then returns employees
-- whose salary is greater than that average.


-- Question 2 : List departments that have more than 2 employees.

SELECT name 
FROM departments 
WHERE id IN (
    SELECT department_id 
    FROM employees 
    GROUP BY department_id 
    HAVING COUNT(*) > 2
);

-- The subquery gets department IDs that have more than 5 employees. 
-- The outer query then fetches department names matching those IDs.


-- Question 3 : Find the highest paid employee in the company.

SELECT * 
FROM employees 
WHERE salary = (
    SELECT MAX(salary) 
    FROM employees
);

-- The inner query finds the maximum salary, and the outer query returns the employee(s) with that salary.


-- Question 4 Find employees who work in the same department as 'John'.
set @john_ka_department = (SELECT department_id FROM employees WHERE name = 'John');

SELECT name 
FROM employees 
WHERE department_id = (
    SELECT department_id 
    FROM employees 
    WHERE name = 'John'
);

-- This retrieves the department ID of John and then lists all employees in the same department.

-- Question 5 List employees who joined after the oldest employee in department 1.
SELECT name 
FROM employees 
WHERE join_date > (
    SELECT MIN(join_date) 
    FROM employees 
    WHERE department_id = 1
);

-- Finds the earliest join date in department 1, then lists employees who joined later than that.


-- Question 6 : Get all departments that have no employees.

SELECT name 
FROM departments 
WHERE id NOT IN (
    SELECT DISTINCT department_id 
    FROM employees
);
-- This returns department names whose IDs are not present in the employees table.


-- Question 7 Find the employee(s) with the second highest salary.

SELECT name ,salary
FROM employees 
WHERE salary = (
    SELECT MAX(salary) -- now maximum from those salary ((93000,84440,950000))
    FROM employees 
    WHERE salary < (   -- this will filter records less than 100000 (all employees less than 100000) # example (93000,84440,950000)
        SELECT MAX(salary) -- result  = 100000 (maximum salary)
        FROM employees
    )
);


-- lets understand this code 
-- 1. Innermost query:
      
     


-- A nested subquery: first gets the highest salary, then the second-highest, and finally matches employee(s) with it.

-- Question 8 : Get names of employees who have the same salary as someone else.

SELECT name ,salary
FROM employees 
WHERE salary IN (
    SELECT salary 
    FROM employees 
    GROUP BY salary 
    HAVING COUNT(*) > 1
);



-- This finds salaries that are shared by multiple employees and then fetches all employees with those salaries.

-- Question 9 Show employees whose salary is greater than their department's average salary.

SELECT name ,salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary) 
    FROM employees 
    WHERE department_id = e.department_id
);

-- For each employee, it checks if their salary is greater than the average salary of their department.


-- Question 10 : Find departments where the total salary exceeds 100000.

SELECT name 
FROM departments 
WHERE id IN (
    SELECT department_id 
    FROM employees 
    GROUP BY department_id 
    HAVING SUM(salary) > 100000
);

-- The subquery groups salaries by department and selects those where the total exceeds 100000. The outer query returns department names for those IDs.

-- Question 11 : Employees who earn more than their manager
SELECT 
    e.id AS employee_id,
    e.name AS employee_name,
    e.salary AS employee_salary,
    m.id AS manager_id,
    m.name AS manager_name,
    m.salary AS manager_salary
FROM employees e
JOIN employees m ON e.manager_id = m.id
WHERE e.salary > m.salary;























