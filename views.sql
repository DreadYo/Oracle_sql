select  *
from    emp_details_view
;

select USER,SYS_CONTEXT ('USERENV', 'SESSION_USER') from dual;

-- create view
create or replace view countries_extended_v
as
select  ct.country_id,
        ct.country_name,
        rg.region_name
from    countries ct
inner join regions rg
        on rg.region_id = ct.region_id;
        

select * from hr.countries_extended_v;

-- give permissions to select data from view to accountant
grant select on hr.countries_extended_v to accountant;

-- give permission to user <security> to create views in <security> schema using table <employees> from schema <hr>
grant select on hr.employees to security with grant option;

-- cancel permission to select data from view <hr.countries_extended_v> from user <accountant>
revoke select on hr.countries_extended_v from accountant;

-- delete view
drop view hr.countries_extended_v;






-- 1
grant select on hr.accounts to accountant;

-- 2
create or replace view accounts_v
as
select  emp.employee_id,
        emp.account_num,
        emp.open_date,
        emp.close_date
from    hr.accounts emp;

-- 3
grant select on hr.duty to security;

grant select on hr.employee_cars to security;

-- 4
create or replace view duty_v
as
select  d.employee_id,
        d.duty_date
from    hr.duty d;

create or replace view cars_v
as
select  car.employee_id,
        car.car_number,
        car.car_maker,
        car.car_model
from    hr.employee_cars car;








