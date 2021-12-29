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


