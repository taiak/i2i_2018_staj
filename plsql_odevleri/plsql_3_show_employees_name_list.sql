/*
*   AUTHOR:       Taha Yasir Kıroğlu
*   DATE:         21.06.2018
*   DESCRIPTION : This code lists salaries high to low according to department name
*/

BEGIN
    FOR emp IN (
        SELECT
            *
        FROM
            hr.employees
    )
    LOOP
        dbms_output.put_lıne('Name - Surname = '
                               || initcap(emp.first_name
                                            || ' '
                                            || emp.last_name) );
    END LOOP;
END;