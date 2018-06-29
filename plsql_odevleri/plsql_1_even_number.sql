/*
    AUTHOR:       Taha Yasir Kıroğlu
    DATE:         21.06.2018
    DESCRIPTION : This code print even number in 0 .. 20 range
*/
BEGIN
    FOR i IN 0..20 LOOP
        IF
            MOD(i,2) = 0
        THEN
            dbms_output.put_lıne(i);
        END IF;
    END LOOP;
END;