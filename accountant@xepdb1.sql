select * from hr.countries_extended_v;

select * from hr.countries;

select * from hr.accounts;

create or replace view accounts_v
as
select  emp.employee_id,
        emp.account_num,
        emp.open_date,
        emp.close_date
from    hr.accounts emp;


select * from accountant.accounts_v;