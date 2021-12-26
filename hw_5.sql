-- lesson 5
-- analytic functions
-- hw

-- 1
select  row_number() over (order by employee_id) as row_number,
        EMPLOYEE_ID,
        FIRST_NAME,
        LAST_NAME,
        EMAIL,
        PHONE_NUMBER,
        HIRE_DATE,
        row_number() over (partition by department_id order by hire_date) as hire_rn,
        JOB_ID,
        SALARY,
        sum(salary) over (partition by manager_id order by phone_number) as cumulative_sum,
        COMMISSION_PCT,
        lag(commission_pct, 1, 0) over (partition by manager_id order by phone_number) as prev_commission_pct,
        MANAGER_ID,
        DEPARTMENT_ID 
from    employees
;

