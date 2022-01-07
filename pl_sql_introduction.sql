
declare
    -- declare const var and assign her a value
    v_name              constant varchar2(1024) := 'Albert';
    v_dep_name          constant varchar2(1024) := 'IT';
    -- declare variable
    v_cnt               number;
    v_salary            number;
    v_min_hire_date     date;
begin
    -- output
    dbms_output.put_line('Hello, ' || v_name || '!');
    dbms_output.put_line('Another sentence.');
    
    select  count(1)        as cnt,
            min(hire_date)  as min_hire_date
    into    v_cnt,
            v_min_hire_date
    from    employees;
    
    dbms_output.put_line('In company ' || v_cnt || ' employees.');
    dbms_output.put_line('The first person was hired ' || v_min_hire_date || '.');
    

    dbms_output.put_line('HomeWork');
    -- 1
    dbms_output.put_line('N1');
    dbms_output.put_line('Hello, world!');
    -- 2
    dbms_output.put_line('N2');
    dbms_output.put_line('Hello, ' || v_name || '!');
    -- 3
    dbms_output.put_line('N3');
    dbms_output.put_line('||');
    dbms_output.put_line('|' || v_name || '|');

    
    select  sum(emp.salary)
    into    v_salary
    from    employees emp
    inner join departments dep
            on emp.department_id = dep.department_id
    where dep.department_name = v_dep_name;
    
    dbms_output.put_line('Sum of the salary of the department ' || v_dep_name || ' equal to ' || v_salary || ' dollars.');
    
    
    
end;


