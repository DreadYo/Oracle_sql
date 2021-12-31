create table maker
(
    id      number generated as identity,
    name    varchar2(32)
);


create unique index maker_pk on maker (id);

alter table maker add constraint maket_pk primary key (id);

create table model
(
    id          number generated as identity,
    name        varchar2(32),
    maker_id    number not null,
    foreign key (maker_id) references maker (id)    
);
