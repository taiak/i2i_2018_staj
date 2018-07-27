/*
    AUTHOR:       Taha Yasir Kiroglu
    DATE:         10.07.2018
    DESCRIPTION   usage of STAJ_UTILITY
    FILE NAME     STAJ_UTILITY.sql
    VERSION:      1.0.0
*/

@STAJ_UTILITY.pks
@STAJ_UTILITY.pkb

BEGIN
    HR.STAJ_UTILITY.print_employe_name(13);
    HR.STAJ_UTILITY.print_employe_name(100);
END;
/

