create table person_audit (
    created TIMESTAMPTZ default CURRENT_TIMESTAMP not null,
    type_event char(1) default 'I' not null check (type_event in ('I', 'U', 'D')), 
    row_id bigint not null,
    name varchar,
    age integer,
    gender varchar,
    address varchar
);

create or replace function fnc_trg_person_insert_audit()
returns trigger as $$
begin
    insert into person_audit (created, type_event, row_id, name, age, gender, address)
    values (CURRENT_TIMESTAMP, 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    return new;
end;
$$ language plpgsql;

create trigger trg_person_insert_audit
after insert on person 
for each row 
execute function fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');