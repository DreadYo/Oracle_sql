-- lesson 9

-- 1
drop view security.duty;

-- 2
drop table hr.duty;

-- 3
grant create sequence to security;

create table duty
(
    id  number generated as identity,
    employee_id     number,
    duty_date       date
);

-- 4
grant select on hr.employees to security with grant option;

-- 5

create or replace view duty_employees
as
select  emp.first_name,
        emp.last_name,
        emp.email,
        emp.phone_number,
        emp.hire_date,
        emp.job_id,
        emp.salary,
        emp.commission_pct,
        dut.duty_date
from    hr.employees emp
inner join security.duty dut
        on emp.employee_id = dut.employee_id   
;
