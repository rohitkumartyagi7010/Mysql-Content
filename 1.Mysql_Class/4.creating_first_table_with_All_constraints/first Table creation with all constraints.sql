drop database if exists sample2;
create database sample2;
use sample2;

create table customer(
      Id int primary key auto_increment,
      First_name varchar(50) not null,
      Last_name varchar(50),
      Phone varchar(10) not null,
      Age tinyint unsigned check(age>0),
      Country varchar(50) default 'India',
      Email varchar(100) unique,
      Address tinytext,
      Pincode varchar(6) default '201301',
      Date_inserted_at DATE DEFAULT (CURRENT_DATE),
      created_time TIME DEFAULT (CURRENT_TIME),
      created_at_datetime TIMESTAMP DEFAULT (CURRENT_TIMESTAMP));

select * from customer;
      
INSERT INTO customer (First_name, Last_name, Phone, Age, Email,Address) -- we will not mention default columns
VALUES 
('Amit', 'Sharma', '9876543210', 22, 'amit.sharma@example.com','A52 sector 6 Noida'),
('Priya', 'Verma', '9123456789', 28, 'priya.verma@example.com','C65 sector 43 Noida'),
('Rahul', 'Gupta', '9988776655', 35, 'rahul.gupta@example.com','A96 sector 4 Noida'),
('Sneha', 'Iyer', '9654321876', 26, 'sneha.iyer@example.com','B89 sector 126 Noida'),
('Vikram', 'Singh', '9345678901', 40, 'vikram.singh@example.com','A-94 Ring road Delhi 56');
      
      
      
      
CREATE TABLE customer_orders (
    Order_Id INT PRIMARY KEY AUTO_INCREMENT,
    Customer_Id INT,
    Order_Date DATE DEFAULT (CURRENT_DATE),
    Order_Amount DECIMAL(10,2) NOT NULL,
    Order_Status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (Customer_Id) REFERENCES customer(Id) ON DELETE CASCADE
);
-- The ENUM data type in MySQL is used to define a column that can store only predefined values.      
      
INSERT INTO customer_orders (Customer_Id, Order_Amount, Order_status)
VALUES 
(1, 1500.50, 'Shipped'),
(1, 2200.00, 'Pending'),
(2, 500.75, 'Delivered'),
(2, 1800.00, 'Cancelled'),
(3, 750.25, 'Shipped');
      
describe customer;  
describe customer_orders;

select * from customer;
select * from customer_orders;


insert into customer(First_name,Last_name,Phone,Age,Country,Email,Pincode)
values
('vishal','Tyagi','4536565767',25,'USA','vishal_new@gmail.com','123456');

insert into customer(First_name,Last_name,Phone,Age,Email)
values
('Aman','Tyagi','4536565767',25,'aman_new@gmail.com');

insert into customer(First_name,Last_name,Phone,Age,Country,Email,Pincode)
values
('Saima','Tyagi','4536565767',25,default,'Saima_new@gmail.com',default);

insert into customer values(6,'Rohit','Tyagi','4536565767',25,default,'Rohit_new@gmail.com',default);
select * from customer;
select * from customer_orders;
   