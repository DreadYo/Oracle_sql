create table master_table (id number not null);

-- create index
create index master_table_id on master_table (id);

-- rowid - physical location of a row
-- The fastest way of locating a row, faster even than a primary key lookup.
-- The ROWID for a given record can change over the lifetime of a system, 
-- for instance through a table rebuild.
select  rowid,
        reg.*
from    regions reg
;



drop index master_table_id;

-- create unique index
create unique index master_table_id on master_table (id);

-- add primary key to table
alter table master_table add constraint master_table_pk primary key (id);


create table detail_table
(
    id          number not null,
    name        varchar2(64),
    master_id   number not null,
    -- primary key
    primary key (id),
    -- foreign key (field <master_id>) to field <id> to table <master_table>
    foreign key (master_id) references master_table (id)
);
