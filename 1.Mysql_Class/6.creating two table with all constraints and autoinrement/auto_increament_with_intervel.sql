drop database if exists practice;
CREATE DATABASE practice;
USE practice;
CREATE TABLE department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
) auto_increment =1000;

set@@auto_increment_increment=5;
set@@auto_increment_offset = 1000;

CREATE TABLE employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department_id INT,
    hire_date DATE,
    CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department(department_id)
);

insert into department(department_name)
values
('rohit'),
('sachin'),
('vishal');

select * from department;