/*
Text:
 - varchar     max 2000 byte
 - varcahr2    max 4000 byte
 - char        fixed length
 - clob        character large object (max 2 Gb)

Numbers:
 - number      (count of numbers before comma, count of numbers after comma) for numbers

Date:
 - to_date('20211228', 'yyyMMdd')
 - to_date('28.12.2021', 'dd.mm.yyyy')
 - date'2021-12-28'

 to_date('28.12.2021 16:20:07', 'dd.mm.yyyy hh24:mi:ss')


BLOB            for photo

*/

-- convert number to char
select to_char(123) as chr from dual;

-- convert number to char using mask for separate thousands
select to_char(6667, '9G999') as chr from dual;     -- output:  6,667


-- get current date (only for oracle)
select sysdate from dual;

-- get current date (standart ANSI)
select current_date from dual;

-- get current date and time
select current_timestamp from dual;


select to_char(sysdate, 'dd-MON/yyy') as chr from dual;

-- cut spaces from left and right
select trim('     sdfdsfdsf      ') as chr from dual;

-- cut spaces from left
select ltrim('     sdfdsfdsf      ') as chr from dual;

-- cut spaces from right
select rtrim('     sdfdsfdsf      ') as chr from dual;

-- convert to number
select to_number(to_char(sysdate, 'mm')) as mm from dual;


-- return date truncated to a specific unit of measure
-- 1st day of month
select trunc(sysdate, 'mm') as mm from dual;
-- 1st day of year
select trunc(sysdate, 'yyyy') as mm from dual;



-- 1
select to_number('55523') as num from dual;

-- 2
select to_number('Skillbox') as num from dual;

-- 3
select to_char(2432352, '$999,999,999.00') as chr from dual;

-- 4
select to_char(date'1930-08-02', 'dd.MON.yyyy') as chr from dual;

-- 5
select to_char(date'1922-08-02', 'dd.mon.yyyy') as chr from dual;

-- 6
select to_date('1812-08-26', 'yyyy-mm-dd') as dt from dual;


