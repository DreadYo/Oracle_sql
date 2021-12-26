-- 1
select  *
from    employees
where   salary > 9000
;

-- 2
select  *
from   (select  *
        from    employees
        where   salary > 9000) empl
where   first_name = 'John'
;

-- 3
with
    empl
    as (select  *
        from    employees
        where   salary > 9000),
    empl_name
    as (select  *
        from    empl
        where   first_name = 'John')
select  * 
from    empl_name
;

-- 4
select  first_name,
        last_name,
        phone_number
from    employees
where   (department_id,
        job_id) in (select  department_id,
                            job_id
                    from    job_history
                    where   employee_id = 176)
;

