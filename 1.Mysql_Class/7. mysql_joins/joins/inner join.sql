-- inner join also you can write join
-- use sql_store;
select *
from orders 
inner join customers
on orders.customer_id = customers.customer_id;

-- lets get only three columns
select order_id,first_name,last_name
from orders 
inner join customers
on orders.customer_id = customers.customer_id;

-- below command will through an error because customer id is available in both table. so you need to tell which table to choose
select order_id,first_name,last_name,customers_id
from orders 
inner join customers
on orders.customer_id = customers.customer_id;

select order_id,first_name,last_name,orders.customer_id
from orders 
inner join customers
on orders.customer_id = customers.customer_id;

-- lets specify both table customer_id a

select order_id,first_name,last_name,orders.customer_id as order_table_order_id,customers.customer_id as customer_table_order_id
from orders 
inner join customers
on orders.customer_id = customers.customer_id;

-- we can also use alias
-- customers table as c
-- orders table as o

select order_id,first_name,last_name,o.customer_id as order_table_order_id,c.customer_id as customer_table_order_id
from orders o
inner join customers c
on o.customer_id = c.customer_id;



