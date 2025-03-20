-- Create the database
drop database if exists Company;
CREATE DATABASE Company;

-- Use the database
USE Company;

-- Create the Worker table
CREATE TABLE Worker (
    WORKER_ID INT AUTO_INCREMENT PRIMARY KEY,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    DEPARTMENT VARCHAR(50),
    SALARY INT,
    JOINING_DATE DATE,
    EMAIL VARCHAR(100)
);

-- Insert data into Worker table
INSERT INTO Worker (FIRST_NAME, LAST_NAME, DEPARTMENT, SALARY, JOINING_DATE, EMAIL)
VALUES 
('Amitabh', 'Bachchan', 'HR', 80000, '2014-02-15', 'amitabh.b@company.com'),
('Vipul', 'Kumar', 'IT', 90000, '2014-03-10', 'vipul.k@company.com'),
('Satish', 'Sharma', 'Finance', 85000, '2014-02-28', 'satish.s@company.com'),
('Amit', 'Singh', 'IT', 75000, '2014-02-05', 'amit.s@company.com'),
('Rahul', 'Verma', 'HR', 60000, '2015-01-10', 'rahul.v@company.com'),
('Mohit', 'Khan', 'IT', 120000, '2014-02-25', 'mohit.k@company.com'),
('Rakesh', 'Sethi', 'Finance', 95000, '2016-05-15', 'rakesh.s@company.com');
