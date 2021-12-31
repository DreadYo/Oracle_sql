select  *
from    regions reg
inner join countries ct
        on reg.region_id = ct.region_id;
        
        
-- hint for optimizator
delete/insert/update/select --+ hint(parameters) hint(parameters) ...
delete/insert/update/select /*+ hint(parameters) hint(parameters) ...*/

;;

-- hint for optimizator using hash join instead of merge join
select  /*+ use_hash(reg, ct)*/*
from    regions reg
inner join countries ct
        on reg.region_id = ct.region_id;
        
        
-- hint for optimizator using nested loops instead of merge join
select  /*+ use_nl(reg, ct)*/*
from    regions reg
inner join countries ct
        on reg.region_id = ct.region_id;
        
        
        
select  *
from    regions reg
cross join countries ct;


-- using with
with
    reg_ct
    as (select  *
        from    regions reg
        inner join countries ct
                on reg.region_id = ct.region_id),
    loc
    as (select  *
        from    reg_ct rc
        left outer join locations loc
                     on loc.country_id = rc.country_id)
select  *
from    loc
;

-- hint for parallel process
/*+ parallel(4) */

-- hint for materialize data. Don't free memory and store old data in memory. Query will work faster, but more memory will use.
/*+ materialize */
with
    reg_ct
    as (select  /*+ materialize */*
        from    regions reg
        inner join countries ct
                on reg.region_id = ct.region_id),
    loc
    as (select  *
        from    reg_ct rc
        left outer join locations loc
                     on loc.country_id = rc.country_id)
select  *
from    loc
;

-- hint to put data in the end of disk (don't find empty spaces on disk) for fast insert
insert /*+ append */ into regions (region_id, region_name)
with
    reg_ct
    as (select  reg.region_id,
                reg.region_name,
                ct.country_id
        from    regions reg
        inner join countries ct
                on reg.region_id = ct.region_id),
    loc
    as (select  rc.region_id,
                rc.region_name
        from    reg_ct rc
        left outer join locations loc
                     on loc.country_id = rc.country_id)
select  region_id,
        region_name
from    loc
;


-- 1
select *
from job_history;

-- 2
select  *
from    job_history hst
inner join jobs j
        on j.job_id = hst.job_id;
    
-- 3
select count(1) over
       (partition by emp.department_id 
        order by j.job_title) as cnt
from job_history hst
inner join jobs j
    on j.job_id = hst.job_id
right outer join employees emp
          on j.job_id = emp.job_id;

-- 4
select *
from emp_details_view;


-- hw
-- 1
select  *
from    employees emp
inner join departments dep
        on emp.department_id = dep.department_id
inner join jobs j
        on emp.job_id = j.job_id
;

-- 2
-- first_rows
select  /*+ first_rows(10) */*
from    employees emp
inner join departments dep
        on emp.department_id = dep.department_id
inner join jobs j
        on emp.job_id = j.job_id
;

-- use_hash
select  /*+ use_hash(emp, j) */*
from    employees emp
inner join departments dep
        on emp.department_id = dep.department_id
inner join jobs j
        on emp.job_id = j.job_id
;

-- use_nl
select  /*+ use_nl(emp, j) */*
from    employees emp
inner join departments dep
        on emp.department_id = dep.department_id
inner join jobs j
        on emp.job_id = j.job_id
;

-- materialize
select  /*+ materialize */*
from    employees emp
inner join departments dep
        on emp.department_id = dep.department_id
inner join jobs j
        on emp.job_id = j.job_id
;

with
    emp_dep
    as (select  /*+ materialize */*
        from    employees emp
        inner join departments dep
                on emp.department_id = dep.department_id),
    res
    as (select  *
        from    emp_dep
        inner join jobs j
                on emp_dep.job_id = j.job_id)
select  *
from    res;

