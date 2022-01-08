declare
    -- random module
    -- random from 0 to 1
    -- v_random_val    number          := dbms_random.value;
    -- random from 0 to 10
    v_random_val    number          := dbms_random.value(0, 10);
    hw_random_val   number          := round(dbms_random.value(0, 5));
begin
    
    if v_random_val >= 5 then
        dbms_output.put_line('more');
    else
        dbms_output.put_line('less');
    end if;
    
    dbms_output.put_line(dbms_random.value(0, 10));
    dbms_output.put_line(dbms_random.value);
    
    
    -- with round
    dbms_output.put_line(round(dbms_random.value(0, 10)));
    
    -- with round - 2 symbols after comma
    dbms_output.put_line(round(dbms_random.value(0, 10), 2));
    
    
    -- hw
    dbms_output.put_line('Homework');
    -- 1
    dbms_output.put_line(dbms_random.value(0, 5));
    
    -- 2
    dbms_output.put_line(round(dbms_random.value(0, 5)));
    
    -- 3
    dbms_output.put_line('hw_random_val = ' || hw_random_val);
    if hw_random_val < 3 then
        dbms_output.put_line('First Go!');
    elsif hw_random_val > 2 then
        dbms_output.put_line('Second Go!');
    else
        dbms_output.put_line('Go! Go! Go!');
    end if;
    
    
end;