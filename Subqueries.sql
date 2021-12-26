-- having
select country_id,
       count(state_province) as cnt_state
from   locations
group by country_id
having count(state_province) = 0
;

-- subquery
select *
from   (select country_id,
               count(state_province) as cnt_state
        from   locations
        group by country_id) state_counter
where cnt_state = 0
;

-- with (common table expression)
with
    state_counter
    as (select country_id,
               count(state_province) as cnt_state
        from   locations
        group by country_id)
select * 
from   state_counter
where  cnt_state = 0;

-- with 2 queries
with
    state_counter
    as (select country_id,
               count(state_province) as cnt_state
        from   locations
        group by country_id),
    result
    as (select *
        from   state_counter
        where  cnt_state = 0)
select * 
from   result;

-- subquery in
select *
from   countries
where  region_id in (select region_id
                     from   regions
                     where region_name = 'Europe')
;

-- subquery 2 fields
select *
from   employees
where (department_id, 
       manager_id) in (select department_id,
                              manager_id
                       from   departments
                       where  department_name = 'IT')
;


