drop database if exists commit_rollback;
CREATE DATABASE commit_rollback;
USE commit_rollback;

CREATE TABLE employee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO employee (first_name, last_name, city)
VALUES 
('Rahul', 'Kuamr', 'Delhi'),
('Sachin', 'Tyagi', 'Noida');

select * from employee;


START TRANSACTION;
select * from employee;

UPDATE employee SET first_name = 'Aditya'
where id = 1;
Select * from employee;

ROLLBACK;
Select * from employee;

-- lets create a table in which we dont have primany key and any restriction

CREATE TABLE employee1 (
    id INT ,
    first_name  VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO employee1 (id,first_name, last_name, city)
VALUES 
(1,'Rahul', 'Kuamr', 'Delhi'),
(2,'Sachin', 'Tyagi', 'Noida'),
(3,'abhisek', 'Kuamr', 'Delhi'),
(4,'vishal', 'Tyagi', 'Noida'),
(5,'shahil', 'Kuamr', 'Delhi'),
(6,'sachin', 'Tyagi', 'Noida'),
(7,'Rahul', 'Kuamr', 'Delhi'),
(8,'Nisha', 'Tyagi', 'Noida');

-- lets start trnasaction 

START TRANSACTION;

SELECT * from employee1;
-- it might give you error of safe mode 
-- we will delete entire data accidently becuase we did not use where clause
SET SQL_SAFE_UPDATES = 0;

Delete from employee1;

SELECT * from employee1;

SET SQL_SAFE_UPDATES = 1;

ROLLBACK;

SELECT * from employee1;

-- Now we will create different save points 

START TRANSACTION;

SAVEPOINT sp1;

INSERT INTO employee (first_name, last_name, city)
VALUES ('Vvvvvvv', 'Singh', 'Mumbai');

select * from employee;

SAVEPOINT sp2;

INSERT INTO employee (first_name, last_name, city)
VALUES ('Aaaaaaaa', 'Sharma', 'Bangalore');

SAVEPOINT sp3;
select * from employee;

ROLLBACK TO sp2;

select * from employee;
COMMIT;





