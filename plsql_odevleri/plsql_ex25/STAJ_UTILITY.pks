/*
    AUTHOR:       Taha Yasir Kiroglu
    DATE:         10.07.2018
    DESCRIPTION   package definition of STAJ_UTILITY
    FILE NAME     STAJ_UTILITY.pks
    VERSION:      1.0.0
    NOTE:         This package use HR's employee table
*/

CREATE OR REPLACE PACKAGE HR.STAJ_UTILITIES 
AS
  PROCEDURE print_employee_name (pin_employee_id IN HR.EMPLOYEES.EMPLOYEE_ID%TYPE);
END STAJ_UTILITIES;