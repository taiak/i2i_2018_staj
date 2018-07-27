/*
    AUTHOR        Taha Yasir Kiroglu
    DATE          10.07.2018
    DESCRIPTION   functions and procedures of STAJ_UTILITY
    FILE NAME     STAJ_UTILITY.pkb
    VERSION       1.0.0
    NOTE          This package use HR's employee table  
*/

CREATE OR REPLACE PACKAGE BODY HR.STAJ_UTILITIES
AS
    -- get emplooye name
    FUNCTION get_employe_name(pin_EmployeeID IN HR.EMPLOYEES.EMPLOYEE_ID%TYPE ) 
        RETURN HR.EMPLOYEES.first_name%TYPE
    IS
        vs_employee_name  HR.EMPLOYEES.FIRST_NAME%TYPE;
    BEGIN
        SELECT first_name INTO vs_employee_name 
            FROM employees
        WHERE employee_id = pin_EmployeeID;

        EXCEPTION
            WHEN no_data_found THEN
                DBMS_OUTPUT.PUT_LINE('ERROR: in HR.STAJ_UTILITY, in procedure print_employe_name');
                DBMS_OUTPUT.PUT_LINE('Data not found!');
            RAISE;

        RETURN vs_employee_name;
    END get_employe_name;

    -- print employee
    PROCEDURE print_employee_name (pin_employee_id IN HR.EMPLOYEES.EMPLOYEE_ID%TYPE)
    IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(get_employe_name(pin_employee_id));
    END print_employee_name;

end staj_utilities;