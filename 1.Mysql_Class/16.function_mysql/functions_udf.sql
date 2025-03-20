drop database if exists UDF;
create database UDF;
Use UDF;

CREATE TABLE employees (
  id INT,
  name VARCHAR(50),
  department VARCHAR(50),
  salary DECIMAL(10,2)
);

INSERT INTO employees (id, name, department, salary) VALUES
(1, 'Alice', 'HR', 5000),
(2, 'Bob', 'HR', 6000),
(3, 'Charlie', 'Engineering', 7000),
(4, 'David', 'Engineering', 8000),
(5, 'Eve', 'HR', 5500);

select * from employees;
-- lets create functiopn
DELIMITER //

CREATE FUNCTION calculate_bonus(salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE bonus DECIMAL(10,2);
    SET bonus = salary * 0.10; -- 10% bonus calculation
    RETURN bonus;
END;
//
DELIMITER ;

-- see all function 
SHOW FUNCTION STATUS;

-- see particular function 

SHOW FUNCTION STATUS WHERE Name = 'calculate_bonus';

-- lets try above function
SELECT 
    name, 
    department, 
    salary, 
    calculate_bonus(salary) AS bonus
FROM employees;




-- lets create another function with two arguement

DELIMITER //
CREATE FUNCTION calculate_tax(price DECIMAL(10,2), tax_rate DECIMAL(5,2)) -- will take two arguement 1. price 2. tax_rate
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE result DECIMAL(10,2);
    SET result = price * tax_rate / 100;
    RETURN result;
END;
//

DELIMITER ;
-- show function
SHOW FUNCTION STATUS WHERE Name = 'calculate_tax';

-- try function we just created

SELECT calculate_tax(1000, 10) AS tax_amount;

SELECT calculate_tax(495, 10) AS tax_amount;







