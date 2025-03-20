drop database if exists view_database ;
CREATE DATABASE view_database;
USE view_database;

CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Major VARCHAR(50)
);

CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100),
    Credits INT
);


CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Semester VARCHAR(10),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Students (FirstName, LastName, Age, Major) VALUES
('Ashish', 'Kumar', 20, 'Computer Science'),
('sachin', 'Tyagi', 22, 'Mathematics'),
('Abhishek', 'Johnson', 21, 'Physics');


INSERT INTO Courses (CourseName, Credits) VALUES
('Database Systems', 4),
('Algorithms', 3),
('Physics 101', 4);

INSERT INTO Enrollments (StudentID, CourseID, Semester) VALUES
(1, 1, 'Fall2023'),
(2, 2, 'Fall2023'),
(3, 3, 'Fall2023'),
(1, 2, 'Spring2024');


-- create a simple view (non updatable )

CREATE VIEW simple_student_view AS
SELECT StudentID, Age, Major
FROM Students;

-- view simple_student_view is based on the Students table and does not include all columns from that table. Specifically, columns FirstName and 
-- LastName are excluded. If you attempt to insert into the view, MySQL will not know what to do with these missing columns.

-- search operation in view
select studentid from simple_student_view;


-- updatable view
CREATE VIEW updatable_student_view AS
SELECT StudentID, FirstName, LastName, Age, Major
FROM Students;

-- now lets insert data with view 
insert into updatable_student_view values(4,'newname','newlastname',25,'science');

-- Why This View Is Updatable
-- It includes all columns required for inserts or updates (StudentID, FirstName, LastName, Age, Major).
-- It directly maps to the Students table without any transformations or aggregate functions.



-- In MySQL, not all views are updatable. Whether a view is updatable depends on the 
-- operations involved in its definition. Here's a detailed explanation of non-updatableviews:

-- 1. Views with Aggregate Functions If a view includes aggregate functions like SUM, COUNT, AVG, MAX, or MIN,
--  it cannot be updated because these functions summarize data across multiple rows.

-- Example  

CREATE VIEW TotalCredits AS
SELECT StudentID, SUM(Credits) AS TotalCredits
FROM Enrollments
JOIN Courses 
ON Enrollments.CourseID = Courses.CourseID
GROUP BY StudentID;

-- Reason: SUM(Credits) represents aggregated data, which doesn’t directly map to a specific row in the base table.


-- 2. Views with DISTINCT
-- A view using the DISTINCT keyword is not updatable because the rows in the view may not correspond directly to rows in the base table.
CREATE VIEW UniqueMajors AS
SELECT DISTINCT Major
FROM Students;
-- Reason: The DISTINCT keyword removes duplicates, so there’s no one-to-one mapping between rows in the view and rows in the base table.

-- 3. Views with Joins
-- A view involving joins is typically not updatable because it combines data from multiple tables, making it unclear which table should be updated.

CREATE VIEW StudentEnrollments AS
SELECT
    Students.StudentID,
    Students.FirstName,
    Courses.CourseName,
    Enrollments.Semester
FROM
    Students
JOIN
    Enrollments ON Students.StudentID = Enrollments.StudentID
JOIN
    Courses ON Enrollments.CourseID = Courses.CourseID;
    
-- 4. Views with Subqueries
-- If a view includes subqueries in its SELECT statement, it is not updatable.   

CREATE VIEW StudentsWithEnrollments AS
SELECT StudentID, (SELECT COUNT(*) FROM Enrollments WHERE Enrollments.StudentID = Students.StudentID) AS EnrollmentCount
FROM Students;


-- 5. Views with GROUP BY or HAVING
-- A view using GROUP BY or HAVING clauses cannot be updated because these clauses group rows and filter aggregated results. 

CREATE VIEW CourseEnrollmentCount AS
SELECT CourseID, COUNT(StudentID) AS TotalStudents
FROM Enrollments
GROUP BY CourseID;

-- 6. Views with UNION or UNION ALL
-- Views combining data with UNION or UNION ALL are not updatable because the rows may originate from multiple tables or subqueries.


CREATE VIEW AllMajors AS
SELECT Major FROM Students
UNION
SELECT Major FROM Alumni;


-- 7. Views with Non-Updatable Columns
-- If a view contains computed or derived columns, it is not updatable because these columns do not directly exist in the base table.


CREATE VIEW StudentDetails AS
SELECT
    StudentID,
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM Students;


-- 8. Views Using LIMIT or OFFSET
-- If a view limits the number of rows displayed using LIMIT or OFFSET, it is not updatable.

CREATE VIEW TopStudents AS
SELECT * FROM Students
LIMIT 10;



-- Summary of Non-Updatable Features
-- A view is not updatable if it contains:

-- 1. Aggregate functions (SUM, AVG, etc.).
-- 2. DISTINCT.
-- 3. Joins.
-- 4. Subqueries in the SELECT list.
-- 5. GROUP BY or HAVING.
-- 6. UNION or UNION ALL.
-- 7. Derived or computed columns.
-- 8. LIMIT or OFFSET.

-- Create a complex veiw

CREATE VIEW StudentEnrollments AS
SELECT
    Students.StudentID,
    Students.FirstName,
    Students.LastName,
    Students.Major,
    Courses.CourseName,
    Enrollments.Semester
FROM
    Students
JOIN
    Enrollments ON Students.StudentID = Enrollments.StudentID
JOIN
    Courses ON Enrollments.CourseID = Courses.CourseID;
    

  
    
-- Dropping a View    

DROP VIEW IF EXISTS StudentEnrollments;

-- how to see views 
SHOW FULL TABLES WHERE Table_type = 'VIEW';

-- see veiws from particular table 

SELECT TABLE_NAME 
FROM information_schema.VIEWS 
WHERE TABLE_SCHEMA = 'your_database_name';

