-- lesson 7
-- full outer join

select  *
from    regions rg
full outer join countries ct
             on rg.region_id = ct.region_id and
                rg.region_id in (1, 3)
;

-- 1
select  *
from    countries ct
full outer join locations lc
             on lc.country_id = ct.country_id and
                -- ct.country_name in ('Brazil', 'Argentina')
                lc.country_id in ('BR', 'AR')
;

-- 2
select  *
from    job_history hst
full outer join
(
    select  *
    from    jobs
    where   rownum < 10
) j
             on j.job_id = hst.job_id
;

-- 3
select  *
from    job_history hst
full outer join
(
    select  *
    from    jobs
    where   rownum < 10
) j
             on j.job_id = hst.job_id
where   hst.job_id is not null
;

-- 4
select  *
from    job_history hst
full outer join
(
    select  *
    from    jobs
    where   rownum < 10
) j
             on j.job_id = hst.job_id
where   j.job_id is not null
;

