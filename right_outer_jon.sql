-- lesson 7
-- right outer join
-- or right join
select  *
from    locations loc
right outer join countries ctr
             on loc.country_id = ctr.country_id and
                ctr.country_id in ('US', 'JP')
;

select  *
from    regions rg
right outer join countries ct
             on rg.region_id = ct.region_id and
                rg.region_id in (1, 3)
;

-- 1
select  *
from    departments dep
right outer join locations loc
              on dep.location_id = loc.location_id
;

-- 2
select  *
from    job_history hst
right outer join jobs j
         on hst.job_id = j.job_id and
            j.job_id = 'IT_PROG'
;

-- 3
select  *
from    locations loc
right outer join
(
    select  reg.region_id,
            reg.region_name,
            ctr.country_id,
            ctr.country_name
    from    regions reg
    left outer join countries ctr
                 on reg.region_id = ctr.region_id
) base
         on loc.country_id = base.country_id and
            loc.country_id in ('CA', 'MX', 'US')
;


