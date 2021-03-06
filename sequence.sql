-- create sequence
create sequence example_series;

-- next value in sequence
select example_series.nextval from dual;

-- current value in sequence
select example_series.currval from dual;

-- create table with field <id> autogenerated by sequence (incremented by 1 by default)
create table autoincrement_example
(
    id number generated as identity
);



/*
Requarements for trasactional systems
Transaction - sequence of operations performed (using one or more sql statements)
on a database as a single logical unit of work.
The effects of all the sql statements in a transaction can be either all committed (applied to database)
or all rolled back (undone from the database).

Properties of Transactions
ACID
 - Atomicity
            A transaction is a logical unit of work which must be either completed
            with all of its data modifications, or none of them is performed.
 - Consistency
            At the end of the transaction, all data must be left in a consistent state
            (without errors). 
 - Isolation
            Modifications of data performed by transaction must be independent of
            another transaction. Unless this happens, the outcome of a tramsaction
            may be erroneous.
 - Durability
            When the transaction is completed, effects of the modifications 
            performed by the transaction must be permanent in the system.
*/


-- 1
create sequence counter;

-- 2
select counter.nextval from dual;

-- 3
select counter.currval from dual;

-- 4
create table inventory
(
    equip_id    number generated as identity,
    employee_id number,
    equip_name  varchar2(256)
);




