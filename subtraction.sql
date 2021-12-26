select  country_id,
        country_name,
        region_id
from    countries
where   region_id in (select    region_id
                      from      regions
                      where     region_name = 'Americas')
minus
select  country_id,
        country_name,
        region_id
from   (select  'VZ'        as country_id,
                'Venezuela' as country_name,
                2           as region_id
        from    dual
        union all
        select  'BR'        as country_id,
                'Brazil'    as country_name,
                2           as region_id
        from    dual)

;

select  country_id,
        country_name,
        region_id
from   (select  'VZ'        as country_id,
                'Venezuela' as country_name,
                2           as region_id
        from    dual
        union all
        select  'BR'        as country_id,
                'Brazil'    as country_name,
                2           as region_id
        from    dual)
minus
select  country_id,
        country_name,
        region_id
from    countries
where   region_id in (select    region_id
                      from      regions
                      where     region_name = 'Americas')
;


-- 1
select  department_name        
from    departments
where   location_id = 1700
minus
select  department_name
from    departments
where location_id <> 1700
;

-- 2
select  department_name
from    departments
where location_id <> 1700
minus
select  department_name        
from    departments
where   location_id = 1700
;

-- 3
select  *
from    regions
minus
select  region_id,
        region_name
from
(
        select  3       as region_id,
                'Asia'  as region_name
        from    dual
        union all
        select  2           as region_id,
                'Americas'  as region_name
        from    dual
)
;
