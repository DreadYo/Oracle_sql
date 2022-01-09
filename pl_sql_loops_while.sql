declare
    v_month_cnt number  := 0;
    v_money_sum number  := 0;
    
    c_money_target constant number  := 78000;
    inc number  := 0;
    i   number  := 100;
begin
    while v_money_sum < c_money_target loop
        v_money_sum := v_money_sum + 10000;
        v_month_cnt := v_month_cnt + 1;
    end loop;
    
    dbms_output.put_line('Needed ' || v_month_cnt || ' months.');
    
    v_money_sum := 0;
    v_month_cnt := 0;
    
    loop
        v_money_sum := v_money_sum + 10000;
        v_month_cnt := v_month_cnt + 1;
        
        exit when v_money_sum >= c_money_target;
    end loop;
        
    dbms_output.put_line('Needed ' || v_month_cnt || ' months.');
    
     -- 1
    dbms_output.put_line('');
    dbms_output.put_line('HomeWork 1');
    while i >= 1 loop
        dbms_output.put_line(to_char(i) || ' ' || chr(i));
        i := i - 1;
    end loop;
    
    -- 2
    dbms_output.put_line('');
    dbms_output.put_line('HomeWork 2');
    i := 100;
    
    loop
        dbms_output.put_line(to_char(i) || ' ' || chr(i));
        i := i - 1;
        
        exit when i < 1;
    end loop;
    

end;