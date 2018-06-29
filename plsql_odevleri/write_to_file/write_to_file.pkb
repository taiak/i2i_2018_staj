/*
    AUTHOR:       Taha Yasir Kiroglu
    DATE:         27.06.2018
    DESCRIPTION   write_to_file package
    FILE NAME     write_to_file.pks
    VERSION:      1.0.0  
*/
CREATE OR REPLACE PACKAGE BODY HR.WRITE_TO_FILE 
AS
    PROCEDURE PRC_WRITE_EMPLOYEES(
        pis_file_path IN VARCHAR2,
        pis_file_name IN VARCHAR2
    ) 
    IS
        vf_file_opener SYS.UTL_FILE.FILE_TYPE;
        CURSOR vc_employee_cursor IS (SELECT first_name, last_name FROM HR.Employees);
    BEGIN
        vf_file_opener := UTL_FILE.FOPEN(pis_file_path, pis_file_name, 'w');
        
        FOR rec IN vc_employee_cursor LOOP
            utl_file.put_line(vf_file_opener, rec.first_name||' '||rec.last_name);
        END LOOP;
        
        SYS.UTL_FILE.FCLOSE(vf_file_opener);
        
    END PRC_WRITE_EMPLOYEES;
END WRITE_TO_FILE;