-- inner join   or
-- join
select  ct.country_id,
        ct.country_name,
        reg.region_name
from    regions reg
inner join countries ct
        on (reg.region_id = ct.region_id)
where   reg.region_name = 'Asia'
;


-- 1
select  ct.country_id,
        ct.country_name,
        ct.region_id,
        loc.location_id,
        loc.street_address,
        loc.postal_code,
        loc.city,
        loc.state_province
from    countries ct
inner join locations loc
        on (ct.country_id = loc.country_id)
;

-- 2
select  j.job_id,
        j.job_title,
        j.max_salary,
        j.min_salary,
        j_hist.employee_id,
        j_hist.start_date,
        j_hist.end_date,
        j_hist.department_id
from    jobs j
inner join job_history j_hist
        on j.job_id = j_hist.job_id
;

-- 3
select  dep.department_id,
        dep.department_name,
        dep.manager_id,
        loc.*
from    departments dep
inner join locations loc
        on dep.location_id = loc.location_id;
        
-- 4
select  dep.department_id,
        dep.department_name,
        dep.manager_id,
        dep.location_id,
        j_hist.employee_id,
        j_hist.start_date,
        j_hist.end_date
from    departments dep
inner join job_history j_hist
        on dep.department_id = j_hist.department_id;





