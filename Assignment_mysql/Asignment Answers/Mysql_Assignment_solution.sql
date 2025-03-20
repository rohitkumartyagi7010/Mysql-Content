-- Create the database
drop database if exists Company;
CREATE DATABASE Company;

-- Use the database
USE Company;

-- Create the Worker table
CREATE TABLE Worker (
    WORKER_ID INT,
    FIRST_NAME VARCHAR(50),
    LAST_NAME VARCHAR(50),
    DEPARTMENT VARCHAR(50),
    SALARY INT,
    JOINING_DATE DATE,
    EMAIL VARCHAR(100)
);

-- Insert data into Worker table
INSERT INTO Worker (WORKER_ID,FIRST_NAME, LAST_NAME, DEPARTMENT, SALARY, JOINING_DATE, EMAIL)
VALUES 
(1,'Minakshi', 'sharma', 'HR', 80000, '2014-02-15', 'Minakshi.b@company.com'),
(2,'Vipul', 'Kumar', 'IT', 90000, '2014-03-10', 'vipul.k@company.com'),
(3,'Satish', 'Sharma', 'Finance', 85000, '2014-02-28', 'satish.s@company.com'),
(4,'Amit', 'Singh', 'IT', 75000, '2014-02-05', 'amit.s@company.com'),
(5,'Rahul', 'Verma', 'HR', 60000, '2015-01-10', 'rahul.v@company.com'),
(6,'Mohit', 'Khan', 'IT', 120000, '2014-02-25', 'mohit.k@company.com'),
(7,'Rakesh', 'Sethi', 'Finance', 95000, '2016-05-15', 'rakesh.s@company.com'),
(4,'Amit', 'Singh', 'IT', 75000, '2014-02-05', 'amit.s@company.com'),
(5,'Rahul', 'Verma', 'HR', 60000, '2015-01-10', 'rahul.v@company.com'),
(8,'Vipul', 'Verma', 'IT', 50000, '2019-01-10', 'vipul.v@company.com'),
(9,'Mittali', 'Kaushal', 'IT', 95000, '2019-03-05', 'mittali.k@'),
(10,'Ajay', 'Chauhan', 'Finance', 86000, '2017-02-05', 'ajay.c@.com'),
(11,'Vikas', 'Dubey', 'HR', 86000, '2018-01-04', 'vikas.d@yahoo.com');

CREATE TABLE WorkerDetails (
    WORKER_ID INT,
    FIRST_NAME VARCHAR(50),
    CITY VARCHAR(50)
);

INSERT INTO WorkerDetails (WORKER_ID, FIRST_NAME, CITY)
VALUES
(1, 'Minakshi', 'Delhi'),
(2, 'Vipul', 'Mumbai'),
(3, 'Satish', 'Kolkata'),
(5, 'Rahul', 'Chennai'),
(6, 'Mohit', 'Delhi'),
(7, 'Rakesh', 'Bangalore'),
(8, 'Vipul', 'Pune'),
(9, 'Mittali', 'Kolkata');




select * from worker;

-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias
-- name as <WORKER_NAME> 
select 
  FIRST_NAME as WORKER_NAME 
from worker;

-- Q-2. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
select 
distinct department 
from worker;

-- Q-3. Write an SQL query to show the last 5 record from a table.
select *
from worker
order by worker_id desc
limit 5;

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker
-- table.

select 
substring(first_name,1,3)
  as FirstThreeChars
  from worker;

-- Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name
-- column ‘Minakshi’ from Worker table.
select
locate('a',First_Name)
as position 
from worker 
where first_Name='Minakshi';


 -- or
 select
   instr("Minakshi","a") 
   as position;
 
 -- or

-- what if we want to skip some initial index then solution will be--

SELECT 
   LOCATE('i', substring(first_name,3,10))+2
   AS position
   FROM Worker
   WHERE FIRST_NAME = 'Minakshi';

-- but above code can not be applided on all names so lets change it with variables
-- 3 (locate index of a and +1 becuase we want to strat the substring index from 3)
-- 10 (replace it with length of string)
-- 2 (2 is the position of i so we can replace it with locate("a",first_name))  
   
select locate("a",substring(first_name,locate("a",first_name)+1,length(first_name)))+locate("a",first_name) as position
from worker
where first_name = "ajay";   

 -- find highest salary of each department.
select department, max(salary)
from worker 
group by department;

-- Q-6. Write an SQL query to print the name of employees having the highest salary in each
-- department.

select 
	department,
    First_Name,
    Last_name,
    salary 
from worker as w1
where salary=(
       select max(salary)
       from worker as w2
       where w1.department=w2.department);
       
       
       
       
-- using groupby   

select 
     first_name,
     salary,
     department
from worker
where (department, salary) in(select department, max(salary)
							 from worker group by department);     
       
-- Q-7. Write an SQL query to print the FIRST_NAME from Worker table after removing
-- white spaces from the right side.

select 
   rtrim(First_Name) 
   As TrimmedFirstName 
   from worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker
-- table and prints its length.

select
  distinct department,
  length(department) 
  as DepartmentLength
  from worker;

-- Q-9.Write an SQL query to fetch nth max salaries from a table.

select distinct salary
       from worker 
       order by salary desc
       limit 1 offset 0;
       
-- Q-10. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’
-- with ‘A’.
       
       select replace(First_name,'A','a') 
       as FirstNameReplaced 
       from worker;
       
       
-- Q-11. Write an SQL query to print all Worker details from the Worker table order by
-- FIRST_NAME Ascending and DEPARTMENT Descending.
       
       select * from worker
       order by First_name ASC,
       Department desc;
       
       
-- Q-12. Write an SQL query to fetch the names of workers who earn the highest salary.

       select First_name,
       Last_name,
       salary
       from worker 
       where salary= (select max(salary)
       from worker);
       
       
-- Q-13. Write an SQL query to print details of workers excluding first names, “Vipul” and
-- “Satish” from Worker table.

select * from worker
where First_Name 
not in 
('Vipul','Satish') ;

-- Q-14. Write an SQL query to print details of the Workers whose FIRST_NAME ends with
-- ‘h’ and contains six alphabets.

select * from worker
where first_name 
like '_____h';



-- Q-15. Write a query to validate Email of Employee.

Select email
 FROM worker
WHERE email like "%_@_%.%";


-- Q-16. Write an SQL query to print details of the Workers who have joined in Feb’2014.

select * from worker
where joining_date
between 
'2014-02-01' AND '2014-02-28';


-- Q-17. Write an SQL query to fetch duplicate records having matching data in some fields of
-- a table.

select 
first_name,
Last_name,
email,
count(*)
from worker 
group by
    first_name,
    Last_name,
    email
having count(*)>1;

select * from worker;

-- Q-18. How to remove duplicate rows from Employees table.

-- Step 1: Create a temporary table with unique rows
CREATE TEMPORARY TABLE TempWorker AS
SELECT MIN(WORKER_ID) AS WORKER_ID, FIRST_NAME, LAST_NAME, DEPARTMENT, SALARY, JOINING_DATE, EMAIL
FROM Worker
GROUP BY FIRST_NAME, LAST_NAME, DEPARTMENT, SALARY, JOINING_DATE, EMAIL;

-- Step 2: Delete all rows from the original Worker table
DELETE FROM Worker;

-- Step 3: Insert the cleaned data back into the Worker table
INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, DEPARTMENT, SALARY, JOINING_DATE, EMAIL)
SELECT WORKER_ID, FIRST_NAME, LAST_NAME, DEPARTMENT, SALARY, JOINING_DATE, EMAIL
FROM TempWorker;

-- Step 4: Drop the temporary table
DROP TEMPORARY TABLE TempWorker;

select count(*)
from worker;

-- Q-19. Write an SQL query to show only odd rows from a table.

SET @row_number = 0;
SELECT WORKER_ID,
    FIRST_NAME,
    LAST_NAME,
    DEPARTMENT,
    SALARY,
    JOINING_DATE,
    EMAIL
FROM ( SELECT @row_number := @row_number + 1 
AS row_num, worker.* FROM worker )
 AS numbered_rows
 WHERE row_num % 2 = 1;
 
 select * from worker;


-- Q-20. Write an SQL query to clone a new table from another table.

Create table Worker1 LIKE worker;
INSERT INTO
worker1
SELECT * FROM worker;

select * from worker1;

-- Q-21. Find the city of workers from worker_details table on the basis of  worker_id.

-- SELECT W.WORKER_ID, W.FIRST_NAME
-- FROM Worker W
-- JOIN WorkerDetails WD
--     ON W.WORKER_ID = WD.WORKER_ID
--     AND W.FIRST_NAME = WD.FIRST_NAME;
--     
--     select * from WorkerDetails;
--     select * from worker;
    
SELECT W.WORKER_ID ,W.first_name, city
FROM Worker W
JOIN WorkerDetails WD
    ON W.WORKER_ID = WD.WORKER_ID;
    

-- Q-22. Write an SQL query to show records from one table that another table does not
-- have.

select worker.worker_id,worker.first_name
from worker
left join workerdetails
on worker.worker_id = workerdetails.worker_id
where workerdetails.worker_id is null;



-- Q-23. Write an SQL query to show the top n (say 10) records of a table.
select *
from worker
order by worker_id asc
limit 10;

select * from worker;

-- Q-24. Write an SQL query to determine the nth (say n=5) highest salary from a table.

select distinct salary
from worker 
order by salary desc
limit 5
offset 0;

-- Q-25. Write an SQL query to determine the 5th highest salary without using TOP or limit
-- method.

select distinct salary,first_name
from worker w1
where 4= (
  select count(distinct salary)
  from worker w2
  where w2.salary > w1.salary
  );
  
select distinct
salary,first_name
from worker 
order by salary desc
limit 1
offset 5;




-- Q-26. Write an SQL query to fetch the list of employees with the same salary.
SELECT Salary, GROUP_CONCAT(First_Name SEPARATOR ', ') AS worker
FROM worker
GROUP BY Salary
HAVING COUNT(*) > 1;



	










       
       
       
       
       
       















