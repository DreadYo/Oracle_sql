-- lesson 7
-- cross join

select  *
from
(
    select 1 as id, 'A' as letter from dual
    union all
    select 2 as id, 'B' as letter from dual
    union all
    select 3 as id, 'C' as letter from dual
) t1
cross join
(
    select 9 as id, 'Z' as letter from dual
    union all
    select 1 as id, 'Y' as letter from dual
) t2
;

-- 1
select  *
from    employees emp
cross join regions reg;

-- 2
select  *
from    countries ct
cross join jobs j
cross join departments dep;

-- 3
select  *
from    job_history hst
cross join 
(
    select 1553 as id, 'print' as txt from dual
    union all
    select 1868 as id, 'type' as txt from dual
) base;
