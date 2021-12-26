-- lesson 5
-- analytic functions
-- row_number() over (order by ... desc)
-- "order by" is requared in over() 
select  first_name,
        last_name,
        email,
        hire_date,
        department_id,
        salary,
        -- numerate rows in table
        row_number() over (order by hire_date desc) as rn
from    employees
;

-- row_number() over (partition by ... order by ... desc)
select  first_name,
        last_name,
        email,
        hire_date,
        department_id,
        salary,
        -- numerate rows in window by department_id
        row_number() over (partition by department_id order by hire_date desc) as rn
from    employees
;

-- row_number() over (partition by ... order by ... desc)
-- can make arithmetic operations with pseudo-column
select  first_name,
        last_name,
        email,
        hire_date,
        department_id,
        salary,
        -- numerate rows in window by department_id
        row_number() over (partition by department_id order by hire_date desc) + 6000 as rn
from    employees
;

select  location_id,
        count(1) as cnt
from    departments
group by location_id
having count(1) > 1;

select  distinct location_id
from   (select  location_id,
                department_name,
                row_number() over (partition by location_id order by department_id) as rn
        from    departments)
where rn != 1
;


-- 1
select  country_id,
        country_name,
        region_id,
        row_number() over (order by country_name) as rn
from    countries
;

-- 2
select  EMPLOYEE_ID,
        FIRST_NAME,
        LAST_NAME,
        EMAIL,
        PHONE_NUMBER,
        HIRE_DATE,
        JOB_ID,
        SALARY,
        COMMISSION_PCT,
        MANAGER_ID,
        DEPARTMENT_ID,
        row_number() over (partition by department_id order by first_name) as rn
from    employees
;

-- 3
select  max(DEPARTMENT_NAME)
from   (select  DEPARTMENT_ID,
                DEPARTMENT_NAME,
                MANAGER_ID,
                LOCATION_ID,
                row_number() over (partition by location_id order by department_id desc) as rn
        from    departments)
where   rn > 1        
;




