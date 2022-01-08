declare
    v_color         varchar2(64)    := 'Yellow';
    v_num           number          := 3;
    v_num_1         number          := 5;
begin
    -- if loop
    if lower(v_color) = lower('red') then
        dbms_output.put_line(upper('Quick'));
    elsif lower(v_color) = lower('yellow') then
        dbms_output.put_line(upper('Sour'));
    else
        dbms_output.put_line(upper('Slow'));
    end if;
    
    if v_num < 5 then
        dbms_output.put_line('less');
    end if;
    
    dbms_output.put_line('Tom''s apple');
    
    -- 1
    if v_num_1 = 5 then
        dbms_output.put_line('Hello world!');
    end if;
    dbms_output.put_line('I''ve done!');
    
    -- 3
    if v_num_1 !=5 then
        dbms_output.put_line('Hello world!');
    end if;
    dbms_output.put_line('I''ve done!');
    
end;