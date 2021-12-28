-- create
create table friends (name          varchar2(64),
                      age           number,
                      birth_date    date);
                      
-- alter
alter table friends add last_name varchar2(128);

alter table friends modify name not null;

-- comment table
comment on table friends is  'Friends';

-- comment column
comment on column friends.name          is 'Name';
comment on column friends.age           is 'Age';
comment on column friends.birth_date    is 'Birth date';
comment on column friends.last_name     is 'Lastname';

-- truncate
truncate table friends;


-- drop
drop table friends;


select  *
from    friends;



-- 1
create table accounts
(
    employee_id     number,
    account_num     varchar2(20),
    open_date       date,
    close_date      date
);

-- 2
create table duty
(
    employee_id     number,
    duty_date       date
);

-- 3
create table employee_cars
(
    employee_id     number,
    car_number      varchar2(16),
    car_maker      varchar2(32),
    car_model      varchar2(64)
);


