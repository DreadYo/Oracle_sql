-- 1
create user seller
    identified by seller1
    default tablespace sysaux
    temporary tablespace temp
    account unlock
;

alter user seller
    quota unlimited on sysaux;
    
grant create session to seller;

grant create table to seller;

grant create view to seller;

grant create sequence to seller;

-- 2
create table maker
(
    id      number generated as identity,
    name    varchar2(32)
);

-- 3
create unique index maker_pk on maker (id);

-- 4
alter table maker add constraint maket_pk primary key (id);

-- 5
create table model
(
    id          number generated as identity,
    name        varchar2(32),
    maker_id    number not null,
    foreign key (maker_id) references maker (id)    
);

