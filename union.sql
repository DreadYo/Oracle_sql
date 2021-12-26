select * from dual;

select count(1) as cnt, txt from(
select 1 as id, 's' as txt from dual
union all
select 2 as id, 'a' as txt from dual
union all
select 3 as id, 'a' as txt from dual
union all
select 4 as id, 'b' as txt from dual
union all
select 5 as id, 'c' as txt from dual
union all
select 6 as id, 'd' as txt from dual)
group by txt
;

-- 1
select  1 as id,
        11 as code,
        'Texas' as name,
        29730 as population
from    dual
union all
select  2 as id,
        22 as code,
        'California' as name,
        39613 as population
from    dual
union all
select  3 as id,
        33 as code,
        'Florida' as name,
        21944 as population
from    dual
union all
select  4 as id,
        44 as code,
        'New York' as name,
        19299 as population
from    dual
;

-- 2
select  country_id,
        country_name
from    countries
where   region_id = 1
union all
select  'SI' as country_id,
        'Slovenia' as country_name
from    dual
union all
select  'SK' as country_id,
        'Slovakia' as country_name
from    dual
;

-- 3
select  employee_id,
        department_id,
        hire_date
from    employees
where   employee_id = 101
union all
select  employee_id,
        department_id,
        start_date
from    job_history
where   employee_id = 101
;

