insert into locations 
(
    location_id,
    street_address,
    postal_code,
    city,
    state_province,
    country_id
) values
(
    1961,
    '1 Base street',
    99625,
    'San Diego',
    'California',
    'US'
);

select * from locations;

-- fix insert
commit;

-- to cancel
rollback;

select USER,SYS_CONTEXT ('USERENV', 'SESSION_USER') from dual;

-- 1
insert into maker (name) values ('WAZ');
insert into maker (name) values ('BMW');
insert into maker (name) values ('Audi');
insert into maker (name) values ('Ford');
insert into maker (name) values ('Huyndai');
insert into maker (name) values ('Peugeot');
insert into maker (name) values ('Ferrari');

-- 2
commit;


select * from maker;

    