-- lesson 10

-- 1
-- create user ods
create user ods
    identified by ods1
    default tablespace sysaux
    temporary tablespace temp
    account unlock;
    
-- give unlimited permission to disk drive
alter user ods
    quota unlimited on sysaux;
    
-- give access rights user
grant create session to ods;

-- give permissions to create tables for schema <ods>
grant create table to ods;

-- to generate id
grant create sequence to ods;

-- 4
create table clients
(
    id              number generated as identity,
    first_name      varchar2(64) not null,
    last_name       varchar2(64) not null,
    phone           number,
    date_birth      date,
    primary key (id)
);

-- 5
create table accounts
(
    id              number generated as identity,
    clients_id      number not null,
    account         number not null,
    open_date       date,
    close_date      date,
    primary key (id),
    foreign key (clients_id) references clients (id)
);

-- 6
create table cards
(
    id              number generated as identity,
    accounts_id     number not null,
    card_number     number not null,
    expire_month    number(2),
    expire_year     number(4),
    primary key (id),
    foreign key (accounts_id) references accounts (id)
);

-- 7
create table operations
(
    id              number generated as identity,
    date_op         date,
    amount          number,
    clients_id      number not null,
    card_id         number not null,
    primary key (id),
    foreign key (card_id) references cards (id)
);

-- 8
-- clients
insert into clients (first_name, last_name, phone, date_birth) values
(
    'Kurt',
    'Cobain',
    5556667777,
    to_date('20-02-1967', 'dd-mm-yyyy')
);

insert into clients (first_name, last_name, phone, date_birth) values
(
    'Johnny',
    'Depp',
    1114442222,
    to_date('09-06-1963', 'dd-mm-yyyy')
);

-- accounts
insert into accounts (clients_id, account, open_date) values
(
    1,
    111111111,
    to_date('01-02-1990', 'dd-mm-yyyy')
);

insert into accounts (clients_id, account, open_date) values
(
    1,
    222222222,
    to_date('10-08-1992', 'dd-mm-yyyy')
);

insert into accounts (clients_id, account, open_date, close_date) values
(
    2,
    333333333,
    to_date('10-12-1989', 'dd-mm-yyyy'),
    to_date('01-02-1998', 'dd-mm-yyyy')
);

insert into accounts (clients_id, account, open_date) values
(
    2,
    555555555,
    to_date('15-05-2020', 'dd-mm-yyyy')
);

-- cards
insert into cards (accounts_id, card_number, expire_month, expire_year) values
(
    4,
    4255000000005555,
    09,
    2025
);

insert into cards (accounts_id, card_number, expire_month, expire_year) values
(
    2,
    4255000000001111,
    01,
    1993
);

-- operations
insert into operations (date_op, amount, clients_id, card_id) values
(
    to_date('15-01-2021', 'dd-mm-yyyy'),
    50.08,
    2,
    1
);

insert into operations (date_op, amount, clients_id, card_id) values
(
    to_date('15-10-1992', 'dd-mm-yyyy'),
    10.20,
    1,
    2
);

commit;

select USER,SYS_CONTEXT ('USERENV', 'SESSION_USER') from dual;