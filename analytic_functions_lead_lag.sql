-- lesson 5
-- analytic functions
-- lead/lag

-- lead - next row
-- lag  - previous row
-- LEAD ( expression [, offset [, default] ] )
-- OVER ( [ query_partition_clause ] order_by_clause )
-- offset - is the number of rows forwarding from the current row from which to get the value. The default is 1.
-- default - If the offset goes beyond the scope of the partition, the function returns the default. If you skip default, then the function will return NULL.
select  first_name,
        last_name,
        hire_date,
        lead(hire_date, 1, date'5999-12-31') over (partition by department_id order by hire_date) - 1 as fire_date,
        department_id
from    employees
order by department_id,
         hire_date;
         

-- 1
select  first_name,
        last_name,
        hire_date,
        lead(last_name) over (order by hire_date) as next_last_name_empl,
        lead(first_name) over (order by hire_date) as next_first_name_empl
from    employees
order by hire_date;
         
-- 2
select  first_name,
        last_name,
        hire_date,
        lag(last_name, 2, 'didn''t come') over (order by hire_date) as next_last_name_empl,
        lag(first_name, 2, 'didn''t come') over (order by hire_date) as next_first_name_empl
from    employees
order by hire_date;
         
-- 3
select  department_id,
        first_name,
        last_name,
        hire_date,
        lag(last_name, 2, 'didn''t come') over (partition by department_id order by hire_date) as next_last_name_empl,
        lag(first_name, 2, 'didn''t come') over (partition by department_id order by hire_date) as next_first_name_empl
from    employees
order by department_id,
         hire_date;




