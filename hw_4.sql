-- 1
select  distinct
        state_province,
        country_id
from    locations
;

-- 2
select  state_province,
        country_id
from    locations
group by state_province,
         country_id
having  count(1) > 1
;

-- 3
SELECT  country_id,
        count(city) as cnt_city
from    locations
group by country_id
having  count(city) > 2
;

with
    cnt_city_country
    as (SELECT  country_id,
        count(city) as cnt_city
        from    locations
        group by country_id),
    res
    as (select  *
        from    cnt_city_country
        where   cnt_city > 2)
select  *
from    res
;

