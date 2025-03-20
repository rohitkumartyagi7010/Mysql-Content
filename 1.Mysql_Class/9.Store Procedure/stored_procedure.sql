-- delimiter $$
delimiter //
drop database if exists rohit_new //
create database rohit_new //

use rohit_new //

CREATE PROCEDURE rohit_new_table_creater()
BEGIN
CREATE TABLE IF NOT EXISTS rexgalaxy_users(
employee_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(100),
last_name VARCHAR(100),
city VARCHAR(100)
);
INSERT INTO rexgalaxy_users(first_name, last_name, city) VALUES ('Rohit', 'Tyagi', 'Vasundhra');
INSERT INTO rexgalaxy_users(first_name, last_name, city) VALUES ('Rahul', 'Sharma', 'Noida');
INSERT INTO rexgalaxy_users(first_name, last_name, city) VALUES ('Vishal', 'Josi', 'Indirapuram');
INSERT INTO rexgalaxy_users(first_name, last_name, city) VALUES ('Sachin', 'Kothari', 'Delhi');
SELECT * FROM rexgalaxy_users;
END //


delimiter ;            # changing back ;


CALL rohit_new_table_creater(); 






Drop database if exists EmployeeDB;
CREATE DATABASE EmployeeDB;
USE EmployeeDB;
CREATE TABLE employees (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
salary DECIMAL(10, 2) NOT NULL
);

INSERT INTO employees (name, salary) VALUES ('Alice Johnson', 60000.00);
INSERT INTO employees (name, salary) VALUES ('Bob Smith', 75000.00);
INSERT INTO employees (name, salary) VALUES ('Charlie Brown', 50000.00);


DELIMITER //

CREATE PROCEDURE GetEmployeeDetails(
IN empID INT,
OUT empName VARCHAR(100),
OUT empSalary DECIMAL(10, 2)
)
BEGIN
#Fetch employee name and salary from the employees table based on the provided empID
SELECT name, salary INTO empName, empSalary
FROM employees
WHERE id = empID;
END //

DELIMITER ;

-- Declare variables to hold the output values
SET @name = '';
SET @salary = 0.00;

-- Call the stored procedure with an input value and output variables
CALL GetEmployeeDetails(2, @name, @salary);

-- Select the output variables to see the result
SELECT @name AS EmployeeName, @salary AS EmployeeSalary;



-- see information about store procedure
SELECT ROUTINE_NAME, ROUTINE_TYPE 
FROM INFORMATION_SCHEMA.ROUTINES 
WHERE ROUTINE_SCHEMA = 'EmployeeDB' -- Replace 'EmployeeDB' with your database name
AND ROUTINE_NAME = 'GetEmployeeDetails'; -- Replace with the procedure name

-- Explanation:
-- INFORMATION_SCHEMA.ROUTINES: This table contains metadata for both stored procedures and functions.
-- ROUTINE_SCHEMA: The database in which the procedure exists (replace 'EmployeeDB' with the actual database name).
-- ROUTINE_NAME: The name of the stored procedure you are checking for (replace 'GetEmployeeDetails' with the actual procedure name).
-- ROUTINE_TYPE: This can be either 'PROCEDURE' or 'FUNCTION'.
-- If the procedure exists, this query will return its name and type. If it doesn’t exist, the query will return no results.


-- see how existed store procedure taken in and out parameter
SELECT PARAMETER_NAME, PARAMETER_MODE, DATA_TYPE
FROM INFORMATION_SCHEMA.PARAMETERS
WHERE SPECIFIC_SCHEMA = 'EmployeeDB'   -- Replace 'EmployeeDB' with your database name
AND SPECIFIC_NAME = 'GetEmployeeDetails';  -- Replace with your stored procedure name


-- INFORMATION_SCHEMA.PARAMETERS: Contains details about parameters in stored procedures and functions.
-- SPECIFIC_SCHEMA: The name of the database where the stored procedure resides (replace 'EmployeeDB' with your database name).
-- SPECIFIC_NAME: The name of the stored procedure (replace 'GetEmployeeDetails' with the actual procedure name).
-- PARAMETER_NAME: The name of the parameter (e.g., empID, empName).
-- PARAMETER_MODE: Indicates whether the parameter is IN, OUT, or INOUT.
-- DATA_TYPE: The data type of the parameter (e.g., INT, VARCHAR).


-- Understanding the Results:
-- empID is an IN parameter of type INT. It is passed into the stored procedure.
-- empName is an OUT parameter of type VARCHAR. It is an output from the stored procedure.
-- empSalary is an OUT parameter of type DECIMAL. It is also an output from the procedure.
