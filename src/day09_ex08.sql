CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INT DEFAULT 10)
RETURNS TABLE(fib_number INT) AS $$
DECLARE
    a INT := 0;  
    b INT := 1;  
    next_fib INT; 
BEGIN
    WHILE a < pstop LOOP
        fib_number := a;  
        RETURN NEXT;  
        next_fib := a + b;  
        a := b;  
        b := next_fib;  
    END LOOP;
END;
$$ LANGUAGE plpgsql;


select * from fnc_fibonacci(100);
select * from fnc_fibonacci();



