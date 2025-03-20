DROP DATABASE if exists Update_delete;
CREATE DATABASE Update_delete;
USE Update_delete;

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code VARCHAR(10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL CHECK (total_amount > 0),
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO customers (first_name, last_name, email, phone, address, city, state, zip_code)
VALUES
('Arjun', 'Sharma', 'arjun.sharma@example.com', '9876543210', '123 MG Road', 'Mumbai', 'Maharashtra', '400001'),
('Rohit', 'Verma', 'rohit.verma@example.com', '9876543211', '456 Park Street', 'Delhi', 'Delhi', '110001'),
('Priya', 'Singh', 'priya.singh@example.com', '9876543212', '789 Main Road', 'Bangalore', 'Karnataka', '560001'),
('Anjali', 'Rao', 'anjali.rao@example.com', '9876543213', '101 Lake View', 'Hyderabad', 'Telangana', '500001'),
('Vikram', 'Patel', 'vikram.patel@example.com', '9876543214', '202 High Street', 'Ahmedabad', 'Gujarat', '380001');

INSERT INTO orders (customer_id, order_date, total_amount, status)
VALUES
(1, '2024-07-01', 1500.00, 'Pending'),
(2, '2024-07-02', 2500.00, 'Shipped'),
(3, '2024-07-03', 3500.00, 'Delivered'),
(4, '2024-07-04', 4500.00, 'Cancelled'),
(5, '2024-07-05', 5500.00, 'Pending');




-- 1. Update Operations
-- Update Phone Number for a Specific Customer
-- To update the phone number for the customer with customer_id 1:

UPDATE customers
SET phone = '1112223333'
WHERE customer_id = 1;

-- Update Email for Multiple Customers
-- To update the email addresses for customers living in Mumbai:

UPDATE customers
SET email = 'updated.email.mumbai@example.com'
WHERE customer_id = 1;

UPDATE customers
SET email = 'updated.email.mumbai@example.com'
WHERE city = 'Mumbai';  -- because there might be multiple records becuase this is not a uniqe or primary key. you might see a error
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  
-- To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.000 sec

-- How to disable safe mode (remember it is helpfull for accidental update so dont enable it )

-- option one to solve above issue
-- Go to Edit -> Preferences.
-- Navigate to the SQL Editor section:

-- Find the Safe Updates option and uncheck it.
-- Reconnect or restart mysql_workbench to the database and run your query again.


-- option 2 to resolve above safe mode issue
SET SQL_SAFE_UPDATES = 0; -- Turn off safe update mode for the current session:
UPDATE customers
SET email = 'updated.email.mumbai@example.com'
WHERE city = 'Mumbai';
SET SQL_SAFE_UPDATES = 1; -- Turn safe update mode back on if needed:


UPDATE customers
SET email = 'updated.email.mumbai@example.com'
WHERE customer_id = 1;

-- Add a Middle Name Column and Update Its Values
-- First, add the middle_name column:

ALTER TABLE customers ADD COLUMN middle_name VARCHAR(50);

-- Then, update the middle_name for each customers. 

UPDATE customers
SET middle_name = CASE
    WHEN customer_id = 1 THEN 'Raj'
    WHEN customer_id = 2 THEN 'Kumar'
    WHEN customer_id = 3 THEN 'Meera'
    WHEN customer_id = 4 THEN 'Lakshmi'
    WHEN customer_id = 5 THEN 'Ravi'
END;


-- Delete Operations

-- Delete a Specific Customer
-- To delete the customer with customer_id 2:

DELETE FROM customers
WHERE customer_id = 2;

-- Delete Customers from a Specific City
-- To delete all customers living in Bangalore:

DELETE FROM customers
WHERE city = 'Bangalore';


-- Delete and Truncate difference 

-- Delete All Customers
-- To delete all records from the customers table:
-- delete can roll back data if you start transaction. but once table is truncate it can not rollback data.

DELETE FROM customers;   -- will delete all data but can be rolled back.howwever will not let you delete data until you have primary key and safe mode enabled.

-- if you want to test this command either you need to delete primary key or disable safe mode

TRUNCATE TABLE customers; 
-- will delete all data but can not be rolled back. you will also see errors becuase you have relation this data to another table
-- Error Code: 1701. Cannot truncate a table referenced in a foreign key constraint (`update_delete`.`orders`, CONSTRAINT `orders_ibfk_1`)	0.000 sec
-- to delete this 


-- even though you disable safe mode and try you will still get a error Cannot truncate a table referenced in a foreign key constraint.
-- 
SET FOREIGN_KEY_CHECKS = 0; -- Disable foreign key checks:
TRUNCATE TABLE customers; 
SET FOREIGN_KEY_CHECKS = 1; -- Re-enable foreign key checks:


-- you can also try delete instead of truncate
SET SQL_SAFE_UPDATES = 0;
DELETE FROM customers;
SET SQL_SAFE_UPDATES = 1;

