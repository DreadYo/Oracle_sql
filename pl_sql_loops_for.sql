begin
    for line in (select region_id,
                        region_name
                 from   regions) loop
        dbms_output.put_line(line.region_id);
        dbms_output.put_line(line.region_name);
    end loop;
    
    for row in (select country_id,
                        city,
                        street_address
                from    locations) loop
        dbms_output.put_line(row.country_id || ' ' || row.city);
        dbms_output.put_line(row.street_address);
        dbms_output.put_line('');
    end loop;
    

    -- 1
    dbms_output.put_line('');
    dbms_output.put_line('HomeWork 1');
    for row in (select  department_name
                from    departments) loop
        dbms_output.put_line(row.department_name);
    end loop;
    
    -- 2
    dbms_output.put_line('');
    dbms_output.put_line('HomeWork 2');
    for row in (select  c.country_id,
                        c.country_name
                from    countries c
                inner join regions reg
                        on c.region_id = reg.region_id
                where   reg.region_name = 'Europe') loop
        dbms_output.put_line(row.country_id || ' ' || row.country_name);
        dbms_output.put_line('');
    end loop;
    
    -- 3
    dbms_output.put_line('');
    dbms_output.put_line('HomeWork 3');
    for row in (select  emp.first_name,
                        emp.last_name,
                        j.job_title
                from    employees emp
                inner join jobs j
                        on emp.job_id = j.job_id) loop
        dbms_output.put_line(row.first_name ||' ' || row.last_name || ' ' || row.job_title);
    end loop;
    
end;