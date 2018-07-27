/*
    AUTHOR:       Taha Yasir Kiroglu
    DATE:         10.07.2018
    DESCRIPTION   usage example for web calculator
    FILE NAME     web_calculators.pks
    VERSION:      1.0.2
*/

@web_calculator.pks
@web_calculator.pkb

BEGIN
    DBMS_output.put_line('4 + 2 = '||SYS.WEB_CALCULATOR.CALCULATOR(4,2,'+'));
    DBMS_output.put_line('4 - 2 = '||SYS.WEB_CALCULATOR.CALCULATOR(4,2,'-'));
    DBMS_output.put_line('4 * 2 = '||SYS.WEB_CALCULATOR.CALCULATOR(4,2,'*'));
    DBMS_output.put_line('4 / 2 = '||SYS.WEB_CALCULATOR.CALCULATOR(4,2,'/'));
    DBMS_output.put_line('log4(2) = '||SYS.WEB_CALCULATOR.CALCULATOR(4,2,'log'));
    DBMS_output.put_line('5 % 1 = '||SYS.WEB_CALCULATOR.CALCULATOR(4,2,'%'));
END;

