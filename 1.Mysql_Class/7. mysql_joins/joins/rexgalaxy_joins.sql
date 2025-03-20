Drop database if exists join_database;
CREATE DATABASE join_database;
USE join_database;

-- create two tables table1 and table2

CREATE TABLE table1 (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50),
    phone_number VARCHAR(15)
);

CREATE TABLE table2 (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50),
    salary DECIMAL(10, 2),
    address VARCHAR(100)
);

-- Insert Data into the Tables

-- Insert data into table1
INSERT INTO table1 (id, first_name, last_name, city, phone_number) VALUES
(1, 'Rahul', 'Sharma', 'Delhi', '9876543210'),
(2, 'Priya', 'Verma', 'Mumbai', '8765432109'),
(3, 'Amit', 'Patel', 'Ahmedabad', '7654321098'),
(4, 'Anjali', 'Singh', 'Kolkata', '6543210987'),
(5, 'Vijay', 'Kumar', 'Bangalore', '5432109876');

-- Insert data into table2
INSERT INTO table2 (id, first_name, last_name, city, salary, address) VALUES
(3, 'Amit', 'Patel', 'Ahmedabad', 75000.00, 'Street 21, Ahmedabad, Gujarat'),
(4, 'Anjali', 'Singh', 'Kolkata', 82000.00, 'Park Street, Kolkata, West Bengal'),
(5, 'Vijay', 'Kumar', 'Bangalore', 92000.00, 'MG Road, Bangalore, Karnataka'),
(6, 'Sanjay', 'Reddy', 'Hyderabad', 70000.00, 'Banjara Hills, Hyderabad, Telangana'),
(7, 'Megha', 'Iyer', 'Chennai', 88000.00, 'Anna Nagar, Chennai, Tamil Nadu');


-- 1. Inner Join
-- Returns only the records that have matching values in both tables.

SELECT table1.id, table1.first_name, table1.last_name, table1.city, table1.phone_number, 
       table2.salary, table2.address
FROM table1
INNER JOIN table2 
ON table1.id = table2.id;

-- 2. Left Join (or Left Outer Join)
-- Returns all records from the left table (table1), and the matched records from the right table (table2). 
-- The result is NULL from the right side if there is no match.

SELECT table1.id, table1.first_name, table1.last_name, table1.city, table1.phone_number, 
       table2.salary, table2.address
FROM table1
LEFT JOIN table2 
ON table1.id = table2.id;

-- 3. Right Join (or Right Outer Join)
-- Returns all records from the right table (table2), and the matched records from the left table (table1).
-- The result is NULL from the left side if there is no match.

SELECT table2.*,
	   table1.*
FROM table1
RIGHT JOIN table2
ON table1.id = table2.id;

-- 4. Full Join (or Full Outer Join)
-- Returns all records when there is a match in either left (table1) or right (table2) table records. 
-- MySQL doesn't directly support FULL JOIN, so you can use a UNION of LEFT JOIN and RIGHT JOIN to achieve this.

SELECT table1.id,table1.first_name
FROM table1
LEFT JOIN table2 ON table1.id = table2.id

UNION 

SELECT table2.id,table2.first_name
FROM table1
RIGHT JOIN table2
ON table1.id = table2.id;

-- union all means (It will incluse duplicate data as well)

SELECT table1.id,table1.first_name
FROM table1
LEFT JOIN table2 ON table1.id = table2.id

UNION 

SELECT table2.id,table2.first_name
FROM table1
RIGHT JOIN table2
ON table1.id = table2.id;

-- 5.Cross Join
-- dot.product of both table
SELECT table1.id, table1.first_name, table1.last_name, table1.city, table1.phone_number, 
       table2.salary, table2.address
FROM table1
CROSS JOIN table2;

-- 6. left join with out intersection of both table

SELECT table1.id, table1.first_name, table1.last_name, table1.city, table1.phone_number, 
       table2.salary, table2.address
FROM table1
LEFT JOIN table2 
ON table1.id = table2.id
where table2.id is null;

-- Left jon with out intersection with table2
-- three different ways we will try to show data
-- we dont want comman data of both table
SELECT 
   table1.*,
   table2.*
FROM table1
LEFT JOIN table2 
ON table1.id = table2.id
where table2.id is null;

-- if dont want to show null values of table2 you can avoid table2.*
-- see below code

SELECT 
   table1.*
FROM table1
LEFT JOIN table2 
ON table1.id = table2.id
where table2.id is null;

-- we can write above code with short names (using alice)
SELECT t1.*
FROM table1 t1
LEFT JOIN table2 t2
ON t1.id = t2.id
WHERE t2.id IS NULL;

-- 7.RIGHT JOIN without intersection:
-- Show all columns from both tables, but exclude common data:
SELECT 
    table1.*,
    table2.*
FROM table1
RIGHT JOIN table2 
ON table1.id = table2.id
WHERE table1.id IS NULL;

-- showing only table2 data
SELECT 
    table2.*
FROM table1
RIGHT JOIN table2 
ON table1.id = table2.id
WHERE table1.id IS NULL;


-- Using aliases (short names) for readability:
-- it will show you all data of table 2(id) which is not common in both table
-- will exclude intersection 

SELECT t2.*
FROM table1 t1
RIGHT JOIN table2 t2
ON t1.id = t2.id
WHERE t1.id IS NULL;

















