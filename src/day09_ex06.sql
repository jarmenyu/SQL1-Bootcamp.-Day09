CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson VARCHAR DEFAULT 'Dmitriy',
    pprice INT DEFAULT 500,
    pdate DATE DEFAULT '2022-01-08'
) RETURNS TABLE(pizzeria_name VARCHAR) AS $$
BEGIN
    RETURN QUERY
    SELECT DISTINCT pi.name
    FROM pizzeria as pi
    JOIN menu as m ON pi.id = m.pizzeria_id
    JOIN person_visits as pv ON pv.pizzeria_id = pi.id
    JOIN person as p ON p.id = pv.person_id
    WHERE p.name = pperson
      AND m.price < pprice
      AND pv.visit_date = pdate;
END;
$$ LANGUAGE plpgsql;

SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');
