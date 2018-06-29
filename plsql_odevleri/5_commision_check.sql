/*
    AUTHOR:       Taha Yasir Kıroğlu
    DATE:         21.06.2018
    DESCRIPTION : This code     CHECKİNG 
*/

BEGIN
    SELECT
        last_name, salary, DECODE(nvl(commission_pct,0),0,'No','Yes')
    FROM
        hr.employees;
END;