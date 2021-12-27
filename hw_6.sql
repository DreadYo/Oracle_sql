-- lesson 6
-- union all
-- union
-- minus
-- inner join
-- left outer join
-- hw 6

-- 1
select  count(1)
from    
(
    select  department_id,
            department_name,
            manager_id,
            location_id
    from    departments
    minus
    select  department_id,
            department_name,
            manager_id,
            location_id
    from    departments
    where   manager_id is null
)
;

-- 2
select  loc.street_address,
        loc.postal_code,
        loc.city,
        loc.state_province,
        cntr.country_name,
        reg.region_name
from    locations loc
inner join countries cntr
        on loc.country_id = cntr.country_id
inner join regions reg
        on cntr.region_id = reg.region_id
;

select  *
from    job_history;


select  *
from    employees;


select  *
from    employees
where   first_name = 'Jennifer' and
        last_name = 'Whalen'
        ;
-- 3
select  emp.first_name,
        emp.last_name,
        base.start_date,
        dep.department_name,
        j.job_title,
        emp.email,
        emp.phone_number,
        emp.hire_date,
        emp.salary,
        man.first_name as manager_first_name,
        man.last_name  as manager_last_name
from
(
    select  hst.employee_id,
            hst.start_date,
            hst.job_id,
            hst.department_id
    from    job_history hst
    inner join (select  *
                from    employees
                where   first_name = 'Jennifer' and
                        last_name = 'Whalen') emp
            on hst.employee_id = emp.employee_id
    union all
    select  emp.employee_id,
            emp.hire_date,
            emp.job_id,
            emp.department_id
    from    employees emp
    where   emp.first_name = 'Jennifer' and
            emp.last_name = 'Whalen'
) base
inner join employees emp
        on emp.employee_id = base.employee_id
inner join jobs j
        on base.job_id = j.job_id
inner join departments dep
        on base.department_id = dep.department_id
inner join employees man
        on emp.manager_id = man.employee_id
order by base.start_date
;



