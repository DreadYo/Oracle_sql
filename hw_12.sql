-- lesson 12
declare
    v_random_apples number  := round(dbms_random.value(1, 5));
begin
    -- 1
        dbms_output.put_line('Исправления вечны');
        dbms_output.put_line('');
    
    -- 2
    if round(dbms_random.value(0, 10), 2) <= 3 then
        dbms_output.put_line('BS1');
    elsif round(dbms_random.value(0, 10), 2) = 5 then
        dbms_output.put_line('BS2');
    else
        dbms_output.put_line('account');
    end if;
    
    dbms_output.put_line('');
    
    -- 3
    dbms_output.put_line(v_random_apples);
    
    if mod(v_random_apples, 2) = 0 then
        dbms_output.put_line('even number of apples');
    else
        dbms_output.put_line('odd number of apples');
    end if;


end;
