-- create user <name>
create user management
    -- password
    identified by management1
    -- main tablespace
    default tablespace sysaux
    -- temp tablespace
    temporary tablespace temp
    -- unlock account (permission to connect to this schema)
    account unlock;
    
-- give unlimited permission to disk drive
alter user management
    quota unlimited on sysaux;
    
-- give access rights user
grant create session to management;

-- give permissions to select data from view to accountant
grant select on hr.countries_extended_v to accountant;

-- give permission to user <security> to create views in <security> schema using table <employees> from schema <hr>
grant select on hr.employees to security with grant option;

-- cancel permission to select data from view <hr.countries_extended_v> from user <accountant>
revoke select on hr.countries_extended_v from accountant;

-- give permissions to create view for schema <security>
grant create view to security;

-- give permissions to create tables for schema <security>
grant create table to security;





select USER,SYS_CONTEXT ('USERENV', 'SESSION_USER') from dual;

-- 1
create user accountant
    identified by accountant1
    default tablespace sysaux
    temporary tablespace temp
    account unlock;
    
alter user accountant
    quota unlimited on sysaux;
    
grant create session to accountant;
    
-- 2
create user security
    identified by security1
    default tablespace sysaux
    temporary tablespace temp
    account unlock;
    
alter user security
    quota unlimited on sysaux;
    
grant create session to security;

