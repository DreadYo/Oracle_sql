-- lesson 5
-- analytic functions
-- using aggregate functions
-- over()
select  first_name,
        last_name,
        email,
        hire_date,
        department_id,
        salary,
        -- output all rows sum for each row
        sum(salary) over() as sum_sal
from    employees
order by department_id;
         
-- over(partition by ...)
select  first_name,
        last_name,
        email,
        hire_date,
        department_id,
        salary,
        -- group sum by field department_id
        -- output specific sum of department for each department
        sum(salary) over (partition by department_id) as sum_sal
from    employees
order by department_id;

-- over(partition by ... order by ...)
select  first_name,
        last_name,
        email,
        hire_date,
        department_id,
        salary,
        -- compute cumulative sum for each department_id in order by hire_date
        sum(salary) over (partition by department_id order by hire_date) as sum_sal
from    employees
order by department_id;
         
-- -- over(partition by ... order by ... desc)
select  first_name,
        last_name,
        email,
        hire_date,
        department_id,
        salary,
        sum(salary) over (partition by department_id order by hire_date desc) as sum_sal
from    employees
order by department_id,
         hire_date desc;


select  department_id,
        sum(salary) as sum_sal
from    employees
group by department_id
;


-- 1
SELECT  job_id,
        job_title,
        min_salary,
        max_salary,
        sum(min_salary) over() as sum_min_sal
from    jobs
;

-- 2
select  country_id,
        count(city) over (partition by country_id) as cnt_city
from    locations
order by country_id
;

select  country_id,
        count(city) as cnt_city
from    locations
group by country_id
order by country_id
;

-- 3
select  country_id,
        postal_code,
        count(city) over (partition by country_id order by postal_code) as cnt_city
from    locations
order by country_id
;