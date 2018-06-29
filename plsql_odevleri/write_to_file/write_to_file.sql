/*
    AUTHOR:       Taha Yasir Kiroglu
    DATE:         27.06.2018
    DESCRIPTION   print employee table to file
    FILE NAME     write_to_file.pks
    VERSION:      1.0.0
*/
@write_to_file.pks
@write_to_file.pkb

BEGIN
     HR.WRITE_TO_FILE.PRC_WRITE_EMPLOYEES('TEMP', 'test_file.txt');
END;
/