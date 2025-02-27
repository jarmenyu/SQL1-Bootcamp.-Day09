CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
    VALUES (CURRENT_TIMESTAMP, 'D', OLD.id, OLD.name, OLD.age, OLD.gender, OLD.address);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

create trigger trg_person_delete_audit
before delete on person
for each row
execute function fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;