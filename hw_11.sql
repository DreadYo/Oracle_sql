-- lesson 11

-- 1
select  *
from    departments dep
inner join employees emp
        on dep.department_id = emp.department_id;
        

-- 2
create table employee_entrances
(
    id              number generated as identity,
    employee_id     number not null,
    entrance_date   date,
    primary key (id),
    foreign key (employee_id) references employees (employee_id)
)
partition by range (entrance_date)
interval (numtoyminterval(1, 'month'))
(partition p_min values less than (date'1900-01-01'))
;

-- 3
insert into hr.employee_entrances (employee_id, entrance_date) values (100, date'2021-01-10');
insert into hr.employee_entrances (employee_id, entrance_date) values (101, date'2021-02-10');
insert into hr.employee_entrances (employee_id, entrance_date) values (102, date'2021-03-10');
insert into hr.employee_entrances (employee_id, entrance_date) values (103, date'2021-04-10');
insert into hr.employee_entrances (employee_id, entrance_date) values (104, date'2021-05-10');
insert into hr.employee_entrances (employee_id, entrance_date) values (105, date'2021-06-10');
insert into hr.employee_entrances (employee_id, entrance_date) values (106, date'2021-06-15');
insert into hr.employee_entrances (employee_id, entrance_date) values (107, date'2021-06-21');
insert into hr.employee_entrances (employee_id, entrance_date) values (108, date'2021-07-10');
insert into hr.employee_entrances (employee_id, entrance_date) values (109, date'2021-08-10');
insert into hr.employee_entrances (employee_id, entrance_date) values (110, date'2021-09-10');

commit;

select * from hr.employee_entrances;

select  *
from    all_tab_partitions
where   table_name = 'EMPLOYEE_ENTRANCES';


select * from hr.employee_entrances partition (SYS_P1525);

select * from hr.employee_entrances partition (SYS_P1526);

-- 4
with
    dep_emp
    as (select  emp.employee_id,
                emp.first_name,
                emp.last_name,
                dep.department_name
        from    departments dep
        inner join employees emp
                on dep.department_id = emp.department_id),
    res
    as (select  dep_emp.*,
                ent.entrance_date
        from    dep_emp
        inner join employee_entrances ent
                on dep_emp.employee_id = ent.employee_id)
select  *
from    res;

-- 5
with
    dep_emp
    as (select  emp.employee_id,
                emp.first_name,
                emp.last_name,
                dep.department_name
        from    departments dep
        inner join employees emp
                on dep.department_id = emp.department_id),
    res
    as (select  dep_emp.*,
                ent.entrance_date
        from    dep_emp
        inner join employee_entrances ent
                on dep_emp.employee_id = ent.employee_id)
select  *
from    res;

-- materialize
with
    dep_emp
    as (select  /*+ materialize */emp.employee_id,
                emp.first_name,
                emp.last_name,
                dep.department_name
        from    departments dep
        inner join employees emp
                on dep.department_id = emp.department_id),
    res
    as (select  dep_emp.*,
                ent.entrance_date
        from    dep_emp
        inner join employee_entrances ent
                on dep_emp.employee_id = ent.employee_id)
select  *
from    res;

-- no_merge
with
    dep_emp
    as (select  /*+ no_merge */emp.employee_id,
                emp.first_name,
                emp.last_name,
                dep.department_name
        from    departments dep
        inner join employees emp
                on dep.department_id = emp.department_id),
    res
    as (select  dep_emp.*,
                ent.entrance_date
        from    dep_emp
        inner join employee_entrances ent
                on dep_emp.employee_id = ent.employee_id)
select  *
from    res;


-- use_hash
with
    dep_emp
    as (select  /*+ use_hash(dep, emp) */emp.employee_id,
                emp.first_name,
                emp.last_name,
                dep.department_name
        from    departments dep
        inner join employees emp
                on dep.department_id = emp.department_id),
    res
    as (select  dep_emp.*,
                ent.entrance_date
        from    dep_emp
        inner join employee_entrances ent
                on dep_emp.employee_id = ent.employee_id)
select  *
from    res;


-- parallel
with
    dep_emp
    as (select  /*+ parallel(4) */emp.employee_id,
                emp.first_name,
                emp.last_name,
                dep.department_name
        from    departments dep
        inner join employees emp
                on dep.department_id = emp.department_id),
    res
    as (select  dep_emp.*,
                ent.entrance_date
        from    dep_emp
        inner join employee_entrances ent
                on dep_emp.employee_id = ent.employee_id)
select  *
from    res;

-- use_nl
with
    dep_emp
    as (select  /*+ use_nl(dep, emp) */emp.employee_id,
                emp.first_name,
                emp.last_name,
                dep.department_name
        from    departments dep
        inner join employees emp
                on dep.department_id = emp.department_id),
    res
    as (select  dep_emp.*,
                ent.entrance_date
        from    dep_emp
        inner join employee_entrances ent
                on dep_emp.employee_id = ent.employee_id)
select  *
from    res;


-- 6
insert into /*+ append */ employees
with
    dep_emp
    as (select  emp.*,
                dep.department_name
        from    departments dep
        inner join employees emp
                on dep.department_id = emp.department_id),
    res
    as (select  dep_emp.*,
                ent.entrance_date
        from    dep_emp
        inner join employee_entrances ent
                on dep_emp.employee_id = ent.employee_id)
select  res.EMPLOYEE_ID EMPLOYEE_ID,
        res.FIRST_NAME FIRST_NAME,
        res.LAST_NAME LAST_NAME,
        res.EMAIL EMAIL,
        res.PHONE_NUMBER PHONE_NUMBER,
        res.HIRE_DATE HIRE_DATE,
        res.JOB_ID JOB_ID,
        res.SALARY SALARY,
        res.COMMISSION_PCT COMMISSION_PCT,
        res.MANAGER_ID MANAGER_ID_0,
        res.DEPARTMENT_ID
from    res;


