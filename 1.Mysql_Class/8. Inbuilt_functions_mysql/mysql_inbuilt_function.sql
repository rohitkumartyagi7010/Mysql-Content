CREATE DATABASE all_functions;
Use all_functions;
CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    HireDate DATE,
    Salary DECIMAL(10, 2),
    DepartmentID INT
);

-- Insert some sample data into the table
INSERT INTO Employees (FirstName, LastName, BirthDate, HireDate, Salary, DepartmentID)
VALUES
('Ajay', 'Kumar', '1998-01-15', '2010-06-01', 60000.00, 1),
('Ashish', 'Tyagi', '1985-02-20', '2012-09-15', 75000.00, 2),
('Sachin', 'Diskshit', '1979-03-10', '2011-04-20', 80000.00, 1),
('Richa', 'Mittal', '1990-07-12', '2015-01-05', 70000.00, 3),
('Aditi', 'Bhardwaz', '1988-11-30', '2013-10-10', 68000.00, 2);

-- 1. String Function
-- Concatenate FirstName and LastName
SELECT CONCAT(FirstName, ' ', LastName) AS FullName FROM Employees;

-- Convert FirstName to uppercase
SELECT UPPER(FirstName) AS FirstNameUpper FROM Employees;

-- Convert LastName to lowercase
SELECT LOWER(LastName) AS LastNameLower FROM Employees;

-- Get the length of FirstName
SELECT LENGTH(FirstName) AS FirstNameLength FROM Employees;

-- Substring of FirstName
SELECT SUBSTRING(FirstName, 1, 3) AS FirstNameSub FROM Employees;

-- Replace characters in LastName
SELECT REPLACE(LastName, 'i', 'o') AS LastNameReplaced FROM Employees;

-- 2. Numeric Functions
-- Round Salary to the nearest integer
SELECT ROUND(Salary) AS SalaryRounded FROM Employees;

-- Ceiling of Salary
-- CEILING: Rounds a number up to the nearest integer.
SELECT CEIL(Salary) AS SalaryCeiling FROM Employees;

-- Floor of Salary
-- FLOOR: Rounds a number down to the nearest integer.
SELECT FLOOR(Salary) AS SalaryFloor FROM Employees;

-- Absolute value of a number
-- ABS (Absolute): Returns the absolute (positive) value of a number.
SELECT ABS(Salary) AS SalaryAbsolute FROM Employees;

-- Modulus of Salary
-- MOD (Modulus): Returns the remainder of a division operation between two numbers.
SELECT MOD(Salary, 5000) AS SalaryModulus FROM Employees;


-- 3.Date functions
-- Current date and time
SELECT NOW() AS CurrentDateTime;
-- Current date and time with muliteples data selection

SELECT FirstName ,salary,NOW() AS CurrentDateTime from employees;

-- Current date
SELECT CURDATE() AS CurrentDate;

-- Current time
SELECT CURTIME() AS CurrentTime;

-- Extract year from HireDate
SELECT YEAR(HireDate) AS HireYear FROM Employees;
SELECT firstname , salary, YEAR(HireDate) AS HireYear FROM Employees;

-- Extract month from BirthDate
SELECT MONTH(BirthDate) AS BirthMonth FROM Employees;

-- Add 1 year to HireDate
SELECT DATE_ADD(HireDate, INTERVAL 1 YEAR) AS HireDatePlusOneYear FROM Employees;

-- Calculate age of employees
SELECT TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) AS Age FROM Employees;

SELECT firstname, salary, TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) AS Age FROM Employees;



-- 4. Aggregate Function
-- Count number of employees
SELECT COUNT(*) AS EmployeeCount FROM Employees;

-- Count number of employees where salary is greater than 70k
SELECT COUNT(*) AS EmployeeCount
FROM Employees
where salary > 70000;

-- If you want to count only non-NULL values in a specific column, you can use COUNT(column_name) instead:
SELECT COUNT(firstname) AS NonNullCount FROM Employees;

-- Sum of salaries
SELECT SUM(Salary) AS TotalSalary FROM Employees;

-- Average salary
SELECT AVG(Salary) AS AverageSalary FROM Employees;

-- Minimum salary
SELECT MIN(Salary) AS MinimumSalary FROM Employees;

-- Maximum salary
SELECT MAX(Salary) AS MaximumSalary FROM Employees;





-- 5. Control Flow Functions
-- IF function to check if salary is above 70000
SELECT FirstName, Salary, IF(Salary > 70000, 'High', 'Low') AS SalaryLevel FROM Employees;

-- CASE function to categorize salary
SELECT FirstName, Salary,
CASE
    WHEN Salary >= 75000 THEN 'Very High'
    WHEN Salary >= 70000 THEN 'High'
    ELSE 'Average'
END AS SalaryLevel
FROM Employees;


















