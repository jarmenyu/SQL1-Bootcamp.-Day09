create or replace function fnc_trg_person_audit()
returns trigger as $$
begin
    if (TG_OP = 'INSERT') then 
        insert into person_audit (created, type_event, row_id, name, age, gender, address)
        values (CURRENT_TIMESTAMP, 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);

    elsif (TG_OP = 'UPDATE') then 
        INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
        VALUES (CURRENT_TIMESTAMP, 'U', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);

    elsif (TG_OP = 'DELETE') then 
        INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
        VALUES (CURRENT_TIMESTAMP, 'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);

    end if;

    return null;
end;
$$ language plpgsql;

CREATE TRIGGER trg_person_audit
AFTER INSERT OR UPDATE OR DELETE ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;
    