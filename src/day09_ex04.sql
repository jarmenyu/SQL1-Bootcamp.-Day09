CREATE OR REPLACE FUNCTION fnc_persons_female()
RETURNS TABLE(person_id bigint, person_name VARCHAR, person_age INT, person_gender VARCHAR, person_address VARCHAR) AS $$
BEGIN   
    RETURN QUERY
    SELECT p.id, p.name, p.age, p.gender, p.address
    FROM person AS p
    WHERE p.gender = 'female';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION fnc_persons_male()
RETURNS TABLE(person_id bigint, person_name VARCHAR, person_age INT, person_gender VARCHAR, person_address VARCHAR) AS $$
BEGIN   
    RETURN QUERY
    SELECT p.id, p.name, p.age, p.gender, p.address
    FROM person AS p
    WHERE p.gender = 'male';
END;
$$ LANGUAGE plpgsql;


SELECT *
FROM fnc_persons_female();

SELECT *
FROM fnc_persons_male();
