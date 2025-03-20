drop database if exists trigger_database;
create database trigger_database;
use trigger_database;

create table customer (
acc_no integer primary key, 
cust_name varchar(20), 
avail_balance decimal
);


CREATE TABLE mini_statement (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    acc_no INTEGER, 
    avail_balance DECIMAL, 
    updated_balance DECIMAL, 
    transaction_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(acc_no) REFERENCES customer(acc_no) ON DELETE CASCADE
);


insert into customer values (1000, "Fanny", 7000);
insert into customer values (1001, "Peter", 12000);

select * from customer;
-- now we have a query where we have only two records 
-- now we want to create a trigger before update
-- if we update anything in customer table it should be inserted automatically in mini statememt table

DELIMITER //
CREATE TRIGGER update_cus
BEFORE UPDATE ON customer
FOR EACH ROW
BEGIN
    INSERT INTO mini_statement (acc_no, avail_balance, updated_balance, transaction_time)
    VALUES (OLD.acc_no, OLD.avail_balance, NEW.avail_balance, NOW());
END; //
DELIMITER ;

-- In MySQL triggers, OLD and NEW are used to reference the values before and after an operation (like an UPDATE, INSERT, or DELETE) on a table.
-- Here’s what they mean in the context of your trigger:

-- 1. OLD:
-- OLD refers to the previous values (before the update) of the fields in the table.

-- It is only available in BEFORE UPDATE, AFTER UPDATE, and DELETE triggers, where it allows you to access the data that is currently in the row,
-- before the update or deletion happens.

-- OLD.acc_no: This refers to the account number before the update. Since the account number (acc_no) usually doesn't change, it's likely
--  the same before and after the update.

-- OLD.avail_balance: 
-- This refers to the available balance in the customer table before the update. In the context of your trigger,
-- This value is inserted into the mini_statement table to store the old balance.

-- 2. NEW:
-- NEW refers to the new values (after the update) of the fields in the table.

-- It is available in INSERT and UPDATE triggers. It allows you to access the new data that is being inserted or the updated data after the change.

-- NEW.avail_balance: This refers to the updated balance in the customer table. After the update happens,
-- this new balance is what will be in the customer table. In your trigger, you are capturing this updated balance and inserting it into the mini_statement table.
 

-- check triggers on database if any

SELECT TRIGGER_NAME, EVENT_MANIPULATION, EVENT_OBJECT_TABLE, ACTION_TIMING, ACTION_STATEMENT
FROM INFORMATION_SCHEMA.TRIGGERS
WHERE TRIGGER_SCHEMA = 'trigger_database';

-- Lets test trigger 
-- we created trigger on update command so lets test it
-- we will update balance (we will add 3000 extra)
select * from customer;
select * from mini_statement;

update customer set avail_balance = avail_balance + 3000 where acc_no = 1001;
update customer set avail_balance = avail_balance + 100 where acc_no = 1000; 

select * from customer;
select * from mini_statement;

-- let also test on delete casecade 
-- if we delete data from customer table it should delete data automatically from mini_statement becuase of on delete cascade

delete from customer
where acc_no=1000;

select * from customer;
select * from mini_statement;

-- drop trigger 

DROP TRIGGER IF EXISTS update_cus;

