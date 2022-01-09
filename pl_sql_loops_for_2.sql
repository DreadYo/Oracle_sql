begin
    for i in 1..10 loop
        dbms_output.put_line(i);
    end loop;
    
    -- loop from 42 to 50
    -- chr(10) - new line
    for i in 42..50 loop
        dbms_output.put_line(to_char(i) || chr(10) || 'symbol '|| chr(i) || chr(10));
    end loop;
    
    -- loop from 50 to 42
    for i in reverse 42..50 loop
        dbms_output.put_line(to_char(i) || chr(10) || 'symbol '|| chr(i) || chr(10));
    end loop;
    
    for i in reverse 42..50 loop
        dbms_output.put_line(to_char(power(i, 2)));
    end loop;
    
    -- 1
    dbms_output.put_line('');
    dbms_output.put_line('HomeWork 1');
    for i in 1..100 loop
        dbms_output.put_line(to_char(i) || ' ' || chr(i));
    end loop;
    
    -- 2
    dbms_output.put_line('');
    dbms_output.put_line('HomeWork 2');
    for i in reverse 1..100 loop
        dbms_output.put_line(to_char(i) || ' ' || chr(i));
    end loop;
    
    -- 3
    dbms_output.put_line('');
    dbms_output.put_line('HomeWork 3');
    for i in 15..37 loop
        if mod(i, 2) = 1 then
            dbms_output.put_line(to_char(power(i, 3)));
        end if;
    end loop;
    
    
end;