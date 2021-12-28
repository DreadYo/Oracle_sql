-- lesson 8

-- 1
select  department_id,
        to_char(sum(salary), '$999,999,999.00') as total
from    employees
group by department_id
;

-- 2
select  emp.*,
        trunc(emp.hire_date, 'yyyy') as new_date
from    employees emp
;

-- 3
select  new_emp.*,
        to_char(new_emp.new_date, 'yyyy') as txt_date
from
(
    select  emp.*,
            trunc(emp.hire_date, 'yyyy') as new_date
    from    employees emp
) new_emp
;

-- 4
select  new_emp.*,
        to_number(to_char(new_emp.new_date, 'yyyy')) as num_date
from
(
    select  emp.*,
            trunc(emp.hire_date, 'yyyy') as new_date
    from    employees emp
) new_emp
;

-- 5
select  min(to_number(to_char(new_emp.new_date, 'yyyy'))) as min_date,
        max(to_number(to_char(new_emp.new_date, 'yyyy'))) as max_date,
        round(avg(to_number(to_char(new_emp.new_date, 'yyyy')))) as avg_date
from
(
    select  emp.*,
            trunc(emp.hire_date, 'yyyy') as new_date
    from    employees emp
) new_emp
;

-- 6
create table hurricane
(
    name        varchar2(64),
    report_year date,
    victims     number
);

-- 7
alter table hurricane modify name not null;

-- 8
truncate table hurricane;

-- 9
drop table hurricane;


-- test new branch

