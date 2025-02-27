DROP FUNCTION IF EXISTS fnc_persons_female();
DROP FUNCTION IF EXISTS fnc_persons_male();

create or replace function fnc_persons(pgender varchar default 'female')
returns table(id bigint, name VARCHAR, age INT, gender VARCHAR, address VARCHAR) as $$
    select p.id, p.name, p.age, p.gender, p.address
    from person as p 
    where p.gender = pgender;
$$ language sql;


SELECT *
FROM fnc_persons('male'); 

SELECT *
FROM fnc_persons();  



