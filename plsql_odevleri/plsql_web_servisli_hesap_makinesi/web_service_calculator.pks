/*
    AUTHOR:       Taha Yasir Kiroglu
    DATE:         08.07.2018
    DESCRIPTION   call a web service for calculate some number
    FILE NAME     web_service_calculator.pks
    VERSION:      1.0.0  
*/

CREATE OR REPLACE PACKAGE HR.WEB_CALCULATOR
AS
    PROCEDURE CALCULATOR(pin_number IN number, pin_number2 IN number, pis_operation IN varchar2);
END WEB_CALCULATOR;
/