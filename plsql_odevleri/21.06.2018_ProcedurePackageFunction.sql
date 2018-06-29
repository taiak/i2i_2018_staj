/*
    AUTHOR:       Taha Yasir Kıroğlu
    DATE:         21.06.2018
    DESCRIPTION : it contain staj utilities package
*/

CREATE OR REPLACE PACKAGE HR.STAJ_UTILITIES 
AS
  PROCEDURE print_day;
  PROCEDURE get_and_print_day;
  PROCEDURE print_all_employees;
  PROCEDURE print_employee (pin_employee_id IN HR.EMPLOYEES.EMPLOYEE_ID%TYPE);
END STAJ_UTILITIES;
/

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
        
        RETURN vs_employee_name;
    END get_employe_name;
    
    -- 1.question
    PROCEDURE print_day
    IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(TO_CHAR(SYSDATE,'Day'));
    END print_day;
    
    -- get day 2. question
    FUNCTION get_day (pid_inputdate IN DATE) RETURN VARCHAR2
    IS
    BEGIN
        RETURN TO_CHAR(pid_inputdate, 'Day');
    END get_day;
    
    -- 2.question
    procedure get_and_print_day
    IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(get_day(sysdate));
    END get_and_print_day;

    -- print employee
    PROCEDURE print_employee (pin_employee_id IN HR.EMPLOYEES.EMPLOYEE_ID%TYPE)
    IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE(get_employe_name(pin_employee_id));
    END print_employee;

    -- print all employees
    PROCEDURE print_all_employees
    IS
    BEGIN
        FOR EMP IN ( SELECT HR.EMPLOYEES.FIRST_NAME FIRST_NAME FROM HR.EMPLOYEES )
        LOOP
            DBMS_OUTPUT.PUT_LINE(EMP.FIRST_NAME);
        END LOOP;
    END print_all_employees;
end staj_utilities;
/

BEGIN
    -- print_day
    -- odev 8
    HR.STAJ_UTILITIES.PRINT_DAY;
    
    -- print day with function call in procedure
    -- odev 9
    HR.STAJ_UTILITIES.GET_AND_PRINT_DAY;
    
    -- print employee from employee id
    -- odev 11
    HR.STAJ_UTILITIES.PRINT_EMPLOYEE(100);
    
    -- print all emplooyes
    -- odev12
    HR.STAJ_UTILITIES.PRINT_ALL_EMPLOYEES;
END;
/
