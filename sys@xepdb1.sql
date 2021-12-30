select USER,SYS_CONTEXT ('USERENV', 'SESSION_USER') from dual;

-- give permissions to create view for schema <security>
grant create view to security;

-- give permissions to create tables for schema <security>
grant create table to security;

-- give permissions to create view for schema <accountant>
grant create view to accountant;

-- give permissions to create tables for schema <accountant>
grant create table to accountant;


grant create sequence to security;

grant select on hr.employees to security with grant option;


grant select on seller.maker to security with grant option;

revoke select on seller.maker from security;