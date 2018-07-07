/*
    AUTHOR:       Taha Yasir Kiroglu
    DATE:         29.06.2018
    DESCRIPTION   get information from employee
    FILE NAME     employee_info.pkb
    VERSION:      1.0.0
*/

CREATE OR REPLACE PACKAGE BODY HR.employee_info
AS
    FUNCTION get_employee_name(pin_employee_id IN HR.employees.employee_id%TYPE ) 
        RETURN Hr.employees.first_name%TYPE
    IS
       vs_employee_name HR.employees.first_name%TYPE;
    BEGIN
       SELECT first_name INTO vs_employee_name FROM HR.employees WHERE employee_id = pin_employee_id;
       RETURN vs_employee_name;
    END get_employee_name;
END employee_info;
/