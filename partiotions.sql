/*
Partition types:
 - by range
 - by list
 - by cash
 - composite
 
In auto partiotion:
 - numtoyminterval(n, interval_unit)
                for partition by month, year
                n - number
                interval_unit - 'year' or 'month'
                
 - numtodsinterval(n, interval_unit)
                for partition by 'DAY', 'HOUR', 'MINUTE', 'SECOND'
                n - number or expression
                interval_unit - 'day' or 'hour' or 'minute' or 'second'
*/

-- partition table by range by field <value_day>
create table transactions
(
    amount      number,
    type        varchar2(16),
    value_day   date
)
partition by range (value_day)
-- create partition tables for each month
(
    partition transactions_202001 values less than (date'2020-02-01'),
    partition transactions_202002 values less than (date'2020-03-01'),
    partition transactions_202003 values less than (date'2020-04-01'),
    partition transactions_202004 values less than (date'2020-05-01'),
    partition transactions_202005 values less than (date'2020-06-01'),
    partition transactions_202006 values less than (date'2020-07-01')
);


-- create table with partition's autogeneration (split by 1 month)
-- in this case oracle named partitions by itself
-- partition table by range by field <value_day>
create table transactions
(
    amount      number,
    type        varchar2(16),
    value_day   date
)
partition by range (value_day)
-- interval for partiotion's autogeneration
interval (numtoyminterval(1, 'month'))
-- create partition tables for each month
(partition p_min values less than (date'1900-01-01'));


insert into transactions (amount, type, value_day) values (100, 'income', date'2020-01-01');
insert into transactions (amount, type, value_day) values (911, 'outcome', date'2020-02-14');
insert into transactions (amount, type, value_day) values (585, 'income', date'2020-03-08');
insert into transactions (amount, type, value_day) values (345, 'income', date'2020-04-01');
insert into transactions (amount, type, value_day) values (888, 'income', date'2020-05-09');
insert into transactions (amount, type, value_day) values (156, 'outcome', date'2020-06-26');

commit;

-- select all
select  *
from    transactions;

-- select from specific partition
select  *
from    transactions partition (transactions_202005);

select  *
from    transactions partition (sys_p1343);

insert into transactions (amount, type, value_day) values (777, 'income', date'2020-07-04');

drop table transactions;


/*
Subpartitions
*/

-- create table with partition's autogeneration (split by 1 month)
-- in this case oracle named partitions by itself
-- partition table by range by field <value_day>
create table transactions
(
    amount      number,
    type        varchar2(16),
    value_day   date
)
partition by range (value_day)
-- interval for partiotion's autogeneration
interval (numtoyminterval(1, 'month'))
-- subpartitions (hoe to split)
subpartition by list (type)
-- subpartitions tempplate
subpartition template
(
    subpartition sp_income values ('income'),
    subpartition sp_outcome values ('outcome')
)
-- create partition tables for each month
(partition p_min values less than (date'1900-01-01'));



insert into transactions (amount, type, value_day) values (100, 'income', date'2020-01-01');
insert into transactions (amount, type, value_day) values (911, 'outcome', date'2020-01-14');
insert into transactions (amount, type, value_day) values (585, 'income', date'2020-02-08');
insert into transactions (amount, type, value_day) values (345, 'income', date'2020-03-01');
insert into transactions (amount, type, value_day) values (888, 'income', date'2020-04-09');
insert into transactions (amount, type, value_day) values (156, 'outcome', date'2020-04-26');
insert into transactions (amount, type, value_day) values (777, 'income', date'2020-04-04');

commit;


-- get all partitions for table <TRANSACTIONS>
select  *
from    all_tab_partitions
where   table_name = 'TRANSACTIONS';


-- get all subpartitions for table <TRANSACTIONS>
select  *
from    all_tab_subpartitions
where   table_name = 'TRANSACTIONS';


-- get all tables for chema <hr>
select  *
from    all_tables
where owner = 'HR';


-- select data by partition
select  *
from    transactions partition (SYS_P1432);

-- select data by subpartition
select  *
from    transactions subpartition (SYS_SUBP1431);

-- select data by subpartition
select  *
from    transactions subpartition (SYS_SUBP1430);


-- local index (only for partition tables)
create index transactions_amt on transactions (amount) local;

-- error. Unique index must include partition columns
create unique index transactions_pk on transactions (amount, type) local;

-- unique local index
create unique index transactions_pk on transactions (amount, type, value_day) local;


/*
CLEAR DATA IN PARTITIONS 
*/

-- truncate table transactions;

select  *
from    all_tab_partitions
where   table_name = 'TRANSACTIONS';

select * from transactions partition (SYS_P1432);

-- CLEAR PARTIOTION
alter table transactions truncate partitions SYS_P1432;

-- INSERT data in specific PARTITION
insert into transactions partition (SYS_P1432) (amount, type, value_day) values (888, 'income', date'2020-04-09');
insert into transactions partition (SYS_P1432) (amount, type, value_day) values (156, 'outcome', date'2020-04-26');
insert into transactions partition (SYS_P1432) (amount, type, value_day) values (777, 'income', date'2020-04-04');

commit;



-- hw
-- 1
create table accountant.cards
(
    card_number     varchar2(16),
    create_date     date,
    end_month       number,
    end_year        number,
    employee_id     number,
    foreign key (employee_id) references hr.employees (employee_id)
)
partition by range (create_date)
interval (numtoyminterval(1, 'month'))
(partition p_min values less than (date'1900-01-01'))
;


select USER,SYS_CONTEXT ('USERENV', 'SESSION_USER') from dual;

select * from hr.employees;

select * from accountant.cards;


-- drop table accountant.cards;
-- truncate table accountant.cards;

-- 2
insert into accountant.cards (card_number, create_date, end_month, end_year, employee_id) values (4255200100001111, date'2020-01-15', 06, 2025, 100);
insert into accountant.cards (card_number, create_date, end_month, end_year, employee_id) values (4255200100002222, date'2020-03-25', 07, 2024, 101);
insert into accountant.cards (card_number, create_date, end_month, end_year, employee_id) values (4255200100003333, date'2020-04-15', 08, 2023, 102);
insert into accountant.cards (card_number, create_date, end_month, end_year, employee_id) values (4255200100004444, date'2020-05-15', 09, 2022, 103);
insert into accountant.cards (card_number, create_date, end_month, end_year, employee_id) values (4255200100005555, date'2020-05-25', 10, 2026, 104);
insert into accountant.cards (card_number, create_date, end_month, end_year, employee_id) values (4255200100006666, date'2020-05-28', 11, 2025, 105);
insert into accountant.cards (card_number, create_date, end_month, end_year, employee_id) values (4255200100007777, date'2021-01-15', 12, 2024, 106);
insert into accountant.cards (card_number, create_date, end_month, end_year, employee_id) values (4255200100008888, date'2021-02-15', 01, 2023, 107);
insert into accountant.cards (card_number, create_date, end_month, end_year, employee_id) values (4255200100009999, date'2021-03-15', 02, 2025, 108);
insert into accountant.cards (card_number, create_date, end_month, end_year, employee_id) values (4255200111110000, date'2021-04-15', 03, 2024, 109);
insert into accountant.cards (card_number, create_date, end_month, end_year, employee_id) values (4255200111111111, date'2021-05-15', 04, 2023, 110);
insert into accountant.cards (card_number, create_date, end_month, end_year, employee_id) values (4255200111112222, date'2021-06-15', 05, 2022, 111);
insert into accountant.cards (card_number, create_date, end_month, end_year, employee_id) values (4255200111113333, date'2021-07-15', 06, 2025, 112);
insert into accountant.cards (card_number, create_date, end_month, end_year, employee_id) values (4255200111114444, date'2021-08-15', 07, 2024, 113);
insert into accountant.cards (card_number, create_date, end_month, end_year, employee_id) values (4255200111115555, date'2021-09-15', 08, 2023, 114);

commit;

rollback;

-- 3
select * from accountant.cards;

SELECT TABLE_NAME,PARTITION_NAME, PARTITION_POSITION, HIGH_VALUE FROM USER_TAB_PARTITIONS WHERE TABLE_NAME ='CARDS';

select * from accountant.cards partition (sys_p1411);

select * from accountant.cards partition (SYS_P1403);

select * from accountant.cards partition (SYS_P1412);

--
select  card.card_number,
        card.create_date,
        card.end_month,
        card.end_year,
        emp.first_name,
        emp.last_name
from    accountant.cards card
inner join hr.employees emp
        on emp.employee_id = card.employee_id
;

select  card.card_number,
        card.create_date,
        card.end_month,
        card.end_year,
        emp.first_name,
        emp.last_name
from    accountant.cards partition (SYS_P1403) card
inner join hr.employees emp
        on emp.employee_id = card.employee_id
;

select  card.card_number,
        card.create_date,
        card.end_month,
        card.end_year,
        emp.first_name,
        emp.last_name
from    accountant.cards partition (SYS_P1412) card
inner join hr.employees emp
        on emp.employee_id = card.employee_id
;


-- hw 2
-- 1
create table seller.maker_history
(
    id          number generated as identity,
    name        varchar2(32),
    start_date  date,
    end_date    date
)
partition by range (start_date)
interval (numtoyminterval(1, 'month'))
(partition p_min values less than (date'1900-01-01'))
;


-- 2
create unique index maker_history_pk on maker_history (id, start_date) local;

-- 3
insert into seller.maker_history (name, start_date, end_date) values ('Company 1', date'1990-02-15', date'2000-05-25');
insert into seller.maker_history (name, start_date, end_date) values ('Company 2', date'2021-01-15', date'2021-05-25');
insert into seller.maker_history (name, start_date, end_date) values ('Company 3', date'2021-01-20', date'2021-05-25');
insert into seller.maker_history (name, start_date, end_date) values ('Company 4', date'2021-02-15', date'2021-05-25');
insert into seller.maker_history (name, start_date, end_date) values ('Company 5', date'2021-03-15', date'2021-05-25');
insert into seller.maker_history (name, start_date, end_date) values ('Company 6', date'2021-04-15', date'2021-05-25');
insert into seller.maker_history (name, start_date, end_date) values ('Company 7', date'2021-05-15', date'2021-05-25');
insert into seller.maker_history (name, start_date, end_date) values ('Company 8', date'2021-06-15', date'2021-09-25');
insert into seller.maker_history (name, start_date, end_date) values ('Company 9', date'2021-07-15', date'2021-10-25');
insert into seller.maker_history (name, start_date, end_date) values ('Company 10', date'2021-07-20', date'2021-11-25');

commit;

select * from seller.maker_history;

select  *
from    all_tab_partitions
where   table_name = 'MAKER_HISTORY';

select * from seller.maker_history partition (SYS_P1441);

select * from seller.maker_history partition (SYS_P1442);

select * from seller.maker_history partition (SYS_P1448);


-- hw 3
-- 1
insert into seller.maker_history (name, start_date) values ('Maker 1', date'2028-01-01');
commit;

select * from seller.maker_history;

-- 2
select  *
from    all_tab_partitions
where   table_name = 'MAKER_HISTORY';
-- SYS_P1461

-- 3
select * from seller.maker_history partition (SYS_P1461);

-- 4
alter table seller.maker_history truncate partitions SYS_P1461;


-- 5
insert into seller.maker_history partition (SYS_P1461) (name, start_date) values ('NewMaker 1', date'2028-01-10');

