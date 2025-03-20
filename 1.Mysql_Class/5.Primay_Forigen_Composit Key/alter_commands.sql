DROP DATABASE IF EXISTS alter_database;
CREATE database alter_database;
use alter_database;
-- Step 1: Create the departments table
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (department_id)
);

-- Step 2: Create the example_table
CREATE TABLE example_table (
    id INT AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    middle_initial CHAR(1),
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE,
    email VARCHAR(100) UNIQUE,
    phone_number CHAR(10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    salary DECIMAL(10, 2) CHECK (salary > 0),
    department_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);




INSERT INTO departments (department_name) VALUES 
('Human Resources'), ('Finance'), ('Engineering'), ('Marketing'), ('Sales'),
('IT Support'), ('Product Development'), ('Customer Service'), ('Legal'),
('Operations'), ('Logistics'), ('Procurement'), ('Training'), ('Quality Assurance'),
('Research and Development'), ('Administration'), ('Design'), ('Strategy'),
('Business Development'), ('Communications'), ('Corporate Affairs'),
('Compliance'), ('Audit'), ('Internal Controls'), ('Health and Safety'),
('Public Relations');
INSERT INTO example_table (first_name, middle_initial, last_name, birth_date, email, phone_number, salary, department_id) VALUES 
('Aarav', 'K', 'Sharma', '1990-01-15', 'aarav.sharma@example.com', '9876543210', 55000.00, 1),
('Vivaan', 'S', 'Patel', '1988-02-20', 'vivaan.patel@example.com', '9876543211', 62000.00, 2),
('Aditya', 'R', 'Mehta', '1992-03-10', 'aditya.mehta@example.com', '9876543212', 58000.00, 3),
('Vihaan', 'M', 'Singh', '1991-04-25', 'vihaan.singh@example.com', '9876543213', 59000.00, 4),
('Arjun', 'D', 'Gupta', '1989-05-30', 'arjun.gupta@example.com', '9876543214', 60000.00, 5),
('Reyansh', 'N', 'Kumar', '1993-06-05', 'reyansh.kumar@example.com', '9876543215', 54000.00, 6),
('Sai', 'P', 'Reddy', '1994-07-15', 'sai.reddy@example.com', '9876543216', 53000.00, 7),
('Ishaan', 'G', 'Sharma', '1995-08-25', 'ishaan.sharma@example.com', '9876543217', 51000.00, 8),
('Kabir', 'J', 'Singh', '1996-09-10', 'kabir.singh@example.com', '9876543218', 50000.00, 9),
('Rekha', 'S', 'Bhatia', '1987-10-30', 'rekha.bhatia@example.com', '9876543219', 47000.00, 10),
('Ananya', 'V', 'Sharma', '1990-11-05', 'ananya.sharma@example.com', '9876543220', 56000.00, 11),
('Saanvi', 'L', 'Chopra', '1989-12-20', 'saanvi.chopra@example.com', '9876543221', 55000.00, 12),
('Kavya', 'J', 'Reddy', '1991-01-10', 'kavya.reddy@example.com', '9876543222', 58000.00, 13),
('Ira', 'P', 'Gupta', '1992-02-25', 'ira.gupta@example.com', '9876543223', 59000.00, 14),
('Mira', 'S', 'Sharma', '1993-03-30', 'mira.sharma@example.com', '9876543224', 57000.00, 15),
('Pooja', 'K', 'Patel', '1988-04-05', 'pooja.patel@example.com', '9876543225', 62000.00, 16),
('Neha', 'R', 'Kumar', '1994-05-10', 'neha.kumar@example.com', '9876543226', 54000.00, 17),
('Riya', 'G', 'Mehta', '1995-06-20', 'riya.mehta@example.com', '9876543227', 55000.00, 18),
('Aisha', 'N', 'Chopra', '1996-07-30', 'aisha.chopra@example.com', '9876543228', 53000.00, 19),
('Jiya', 'S', 'Singh', '1997-08-25', 'jiya.singh@example.com', '9876543229', 51000.00, 20),
('Sanya', 'L', 'Bhatia', '1990-09-15', 'sanya.bhatia@example.com', '9876543230', 48000.00, 21),
('Sneha', 'K', 'Sharma', '1989-10-20', 'sneha.sharma@example.com', '9876543231', 49000.00, 22),
('Aditi', 'V', 'Patel', '1992-11-05', 'aditi.patel@example.com', '9876543232', 55000.00, 23),
('Tara', 'J', 'Reddy', '1991-12-25', 'tara.reddy@example.com', '9876543233', 56000.00, 24),
('Srishti', 'P', 'Gupta', '1993-01-15', 'srishti.gupta@example.com', '9876543234', 57000.00, 25);







-- creating a primary key with two columns
CREATE TABLE order_items (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT,
    PRIMARY KEY (order_id, product_id)
);

select * from departments;
select * from example_table;

Describe departments;
Describe example_table;
