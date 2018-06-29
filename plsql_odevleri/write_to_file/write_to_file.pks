/*
    AUTHOR:       Taha Yasir Kiroglu
    DATE:         27.06.2018
    DESCRIPTION   package definition of write_to_file
    FILE NAME     write_to_file.pks
    VERSION:      1.0.0
    
*/
CREATE OR REPLACE PACKAGE  HR.WRITE_TO_FILE AS 
    PROCEDURE PRC_WRITE_EMPLOYEES(pis_file_path IN VARCHAR2, pis_file_name IN VARCHAR2);
END WRITE_TO_FILE;