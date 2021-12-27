-- lesson 6
-- left outer join
-- or left join
select  emp.employee_id,
        emp.first_name,
        emp.last_name,
        emp.manager_id
from    employees emp
left outer join employees man
             on emp.manager_id = man.employee_id
where man.employee_id is null
;    
    

select  emp.employee_id,
        emp.first_name,
        emp.last_name,
        emp.manager_id,
        man.employee_id,
        man.first_name,
        man.last_name
from    employees emp
left outer join (select  man.employee_id,
                         man.first_name,
                         man.last_name
                 from    employees man
                 where rownum < 3) man
             on emp.manager_id = man.employee_id
; 


select  man.employee_id,
        man.first_name,
        man.last_name
from    employees man
where rownum < 3;

-- 1
select  *
from    countries ct
left outer join locations loc
             on ct.country_id = loc.country_id
;

-- 2
select  j_hist.employee_id,
        j_hist.start_date,
        j_hist.end_date,
        j_hist.job_id,
        j_hist.department_id,
        j.job_title,
        j.min_salary,
        j.max_salary
from    job_history j_hist
left outer join (select  *
                 from    jobs
                 where   rownum < 10) j
             on j_hist.job_id = j.job_id
;

-- 3
select  j_hist.employee_id,
        j_hist.start_date,
        j_hist.end_date,
        j_hist.job_id,
        j_hist.department_id,
        j.job_title,
        j.min_salary,
        j.max_salary
from    job_history j_hist
left outer join (select  *
                 from    jobs
                 where   rownum < 10) j
             on j_hist.job_id = j.job_id
where   j.job_id is null             
;            
             
-- 4
select  j_hist.employee_id,
        j_hist.start_date,
        j_hist.end_date,
        j_hist.job_id,
        j_hist.department_id,
        j.job_title,
        j.min_salary,
        j.max_salary
from    job_history j_hist
left outer join (select  *
                 from    jobs
                 where   rownum < 10) j
             on j_hist.job_id = j.job_id
where   j.job_id is not null             
;

