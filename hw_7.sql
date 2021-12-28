-- lesson 7
-- right outer join
-- full outer join
-- cross join

-- 1
select  j.job_title,
        j.job_id
from    job_history hst
inner join employees emp
        on hst.employee_id = emp.employee_id and
           emp.first_name = 'Jonathon' and
           last_name = 'Taylor'
full outer join jobs j
             on j.job_id = hst.job_id
where   emp.employee_id is null
;

-- 2
select  *
from
(
    select 'Jan' as month from dual
    union all
    select 'Feb' as month from dual
    union all
    select 'Mar' as month from dual
    union all
    select 'Apr' as month from dual
    union all
    select 'May' as month from dual
    union all
    select 'Jun' as month from dual
    union all
    select 'Jul' as month from dual
    union all
    select 'Aug' as month from dual
    union all
    select 'Sep' as month from dual
    union all
    select 'Oct' as month from dual
    union all
    select 'Nov' as month from dual
    union all
    select 'Dec' as month from dual
    ) m
cross join
(
    select '1 week' as week from dual
    union all
    select '2 week' as week from dual
    union all
    select '3 week' as week from dual
    union all
    select '4 week' as week from dual
    union all
    select '5 week' as week from dual
) w
cross join
(
    select 'Mon' as day from dual
    union all
    select 'Tue' as day from dual
    union all
    select 'Wed' as day from dual
    union all
    select 'Thu' as day from dual
    union all
    select 'Fri' as day from dual
    union all
    select 'Sat' as day from dual
    union all
    select 'Sun' as day from dual
) d
;

-- 3
select  rg.region_name,
        ct.country_name,
        ct.country_id,
        lc.city,
        dep.department_name,
        hst.job_id,
        j.job_title
from    regions rg
inner join countries ct
        on rg.region_id = ct.region_id and 
           rg.region_name = 'Europe'
left outer join locations lc
             on lc.country_id = ct.country_id
right outer join departments dep
             on lc.location_id = dep.location_id
full outer join job_history hst
             on hst.department_id = dep.department_id and
                hst.employee_id in (176, 200)
cross join jobs j
;

