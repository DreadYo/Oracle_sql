create or replace view employees_v
as
select  emp.employee_id,
        emp.first_name,
        emp.last_name,
        emp.email,
        emp.phone_number,
        emp.hire_date,
        emp.job_id,
        emp.manager_id,
        emp.department_id
from    hr.employees emp;


select * from security.employees_v;

select * from hr.duty;

select * from hr.employee_cars;


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

select * from security.duty_v;

select * from security.cars_v;

select USER,SYS_CONTEXT ('USERENV', 'SESSION_USER') from dual;

drop view security.duty_v;

create table duty
(
    id  number generated as identity,
    employee_id     number,
    duty_date       date
);

select * from HR.employees;


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


