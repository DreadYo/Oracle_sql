-- create table using select (duplicate structure)
create table new_regions
as
select * from regions;

select * from new_regions;


-- multiple insert using select
insert into new_regions
(
    region_id,
    region_name
)
select  region_id,
        region_name
from    regions;

commit;

-- 1
create table seller.model_tmp
as
select * from seller.model;

select * from seller.model;

select * from seller.model_tmp;

-- 2
insert into model_tmp (id, name, maker_id) values (8, 'Kalina', 21);
insert into model_tmp (id, name, maker_id) values (9, 'M3', 2);
insert into model_tmp (id, name, maker_id) values (10, '520', 2);
insert into model_tmp (id, name, maker_id) values (11, 'A6', 3);

-- 3
insert into seller.model (name, maker_id)
select  name,
        maker_id
from    seller.model_tmp;


