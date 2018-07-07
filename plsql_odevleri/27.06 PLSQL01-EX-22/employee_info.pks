/*
    AUTHOR:       Taha Yasir Kiroglu
    DATE:         29.06.2018
    DESCRIPTION   package definition for draw pyramid
    FILE NAME     employee_info.pks
    VERSION:      1.0.0
*/

CREATE OR REPLACE PACKAGE Hr.employee_info
AS
    FUNCTION get_employee_name (pin_employee_id IN HR.employees.employee_id%TYPE) RETURN Hr.employees.first_name%TYPE;    
END employee_info;
/