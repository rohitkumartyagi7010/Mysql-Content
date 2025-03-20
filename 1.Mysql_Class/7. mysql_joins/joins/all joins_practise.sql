use join_database;

select * from table1;

SELECT *
FROM table1
INNER JOIN table2 
ON table1.id = table2.id;


SELECT table1.id, table1.first_name, table1.last_name, table1.city, table1.phone_number, 
       table2.salary, table2.address
FROM table1
LEFT JOIN table2 
ON table1.id = table2.id;

SELECT table1.id,table2.id, table1.first_name, table1.last_name, table1.city, table1.phone_number, 
       table2.salary, table2.address
FROM table1
RIGHT JOIN table2 
ON table1.id = table2.id;
SELECT table1.id, table1.first_name, table1.last_name, table1.city, table1.phone_number, 
       table2.salary, table2.address
FROM table1
LEFT JOIN table2 ON table1.id = table2.id

UNION All

SELECT table2.id, table1.first_name, table1.last_name, table1.city, table1.phone_number, 
       table2.salary, table2.address
FROM table1
RIGHT JOIN table2 ON table1.id = table2.id;

SELECT *
FROM table1
left JOIN table2 
ON table1.id = table2.id






where table2.id is null;

SELECT table1.id, table1.first_name, table1.last_name, table1.city, table1.phone_number, 
       table2.salary, table2.address
FROM table1
CROSS JOIN table2;






