-- update
update  locations
set     city = 'LA',
        postal_code = 90066
where street_address like '%Base%';

select  *
from    locations
where street_address like '_ Base%';

-- delete
delete
from    locations
where street_address like '_ Base%';


commit;

rollback;


-- 1
select USER,SYS_CONTEXT ('USERENV', 'SESSION_USER') from dual;

update  seller.maker
set     name = 'Lada'
where name = 'WAZ';

commit;

-- 2
select  count(1)
from    seller.maker;
-- output: 7

-- 3
delete
from    seller.maker
where name = 'Lada';

commit;

-- 4
select  count(1)
from    seller.maker;
-- output: 6

-- 5
insert into seller.maker (name)
values ('WAZ');

commit;

-- 6
commit;

select  *
from    seller.maker;

