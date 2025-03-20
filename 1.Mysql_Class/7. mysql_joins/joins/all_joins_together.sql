CREATE DATABASE join_database;
USE join_database;




-- 1.
-- INNER JOIN: Returns records that have matching values in both tables.
SELECT *
FROM join_database.table1 AS t1
INNER JOIN join_database.table2 AS t2
ON t1.id = t2.id;


-- or you can write below query as below if you are in same database

use join_database;
SELECT *
FROM table1
INNER JOIN table2
ON table1.id = table2.id;

-- 2.
-- LEFT JOIN (or LEFT OUTER JOIN): Returns all records from the left table, and the matched records from the right table. 
-- The result is NULL from the right side if there is no match.

SELECT *
FROM join_database.table1 AS t1
LEFT JOIN join_database.table2 AS t2
ON t1.id = t2.id;

-- or 
use join_database;
SELECT *
FROM table1
LEFT JOIN table2
ON table1.id = table2.id;

-- 3.
-- RIGHT JOIN (or RIGHT OUTER JOIN): Returns all records from the right table, and the matched records from the left table.
-- The result is NULL from the left side when there is no match.

SELECT *
FROM join_database.table1 AS t1
RIGHT JOIN join_database.table2 AS t2
ON t1.id = t2.id;


-- or 
use join_database;
SELECT *
FROM table1
RIGHT JOIN table2
ON table1.id = table2.id;

-- 4.
-- FULL JOIN (or FULL OUTER JOIN): Returns all records when there is a match in either left or right table. Note that MySQL does not support FULL OUTER JOIN directly. 
-- You can achieve this using a combination of LEFT JOIN, RIGHT JOIN, and UNION.

SELECT *
FROM join_database.table1 AS t1
LEFT JOIN join_database.table2 AS t2
ON t1.id = t2.id
UNION
SELECT *
FROM join_database.table1 AS t1
RIGHT JOIN join_database.table2 AS t2
ON t1.id = t2.id;

-- or 

use join_database;
SELECT *
FROM table1
LEFT JOIN table2
ON table1.id = table2.id
UNION
SELECT *
FROM table1
RIGHT JOIN table2
ON table1.id = table2.id;


-- 5.
-- CROSS JOIN: Returns the Cartesian product of the two tables, i.e., it returns all possible combinations of rows.
-- for example if you have 4 records in each table it will return 4*4= 16 records after cross join.
use join_database;
SELECT *
FROM table1
CROSS JOIN table2;

-- lets check total number of records after cross join
SELECT count(*)
FROM table1
CROSS JOIN table2;

-- or you can type with database name like you did above
SELECT *
FROM join_database.table1 AS t1
CROSS JOIN join_database.table2 AS t2;

-- 6
-- self join 
-- SELF JOIN: A regular join but the table is joined with itself.

SELECT a.*, b.*
FROM join_database.table1 AS a
INNER JOIN join_database.table1 AS b
ON a.id = b.id;

-- or 
-- or you can use where clause
SELECT a.*, b.*
FROM table1 a, table2 b
WHERE a.id = b.id;















