/*
    AUTHOR:       Taha Yasir Kiroglu
    DATE:         10.07.2018
    DESCRIPTION   package of WEB_CALCULATOR
    FILE NAME     web_calculator.pkb
    VERSION:      1.0.2
*/

CREATE OR REPLACE PACKAGE BODY SYS.WEB_CALCULATOR
AS
    PROCEDURE SOAP_REQUEST_MESSAGE(
        pin_number1   IN  NUMBER, 
        pin_number2   IN  NUMBER, 
        pis_operation IN  VARCHAR2,
        vs_soap_msg   OUT VARCHAR2)
    IS
    BEGIN
        vs_soap_msg :=
        '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cal="http://calculator.calculatorwebservice.com">
            <soapenv:Header/>
            <soapenv:Body>
                <cal:calculate>
                    <cal:x>'|| TO_CHAR(pin_number1) ||'</cal:x>
                    <cal:y>'|| TO_CHAR(pin_number2) ||'</cal:y>
                    <cal:operation>'|| pis_operation ||'</cal:operation>
                </cal:calculate>
            </soapenv:Body>
        </soapenv:Envelope>';
    END SOAP_REQUEST_MESSAGE;

    PROCEDURE GET_HTTP_REQUEST_SETTINGS(http_req OUT UTL_HTTP.req)
    IS
    BEGIN
        http_req := 
            UTL_HTTP.begin_request(
                          'http://209.97.129.103:8080/CalculatorWebService/services/CalculatorWebService?wsdl',
                          'POST',
                          'HTTP/1.1');             
    END GET_HTTP_REQUEST_SETTINGS;

    FUNCTION CALCULATOR(
        pin_number1   IN NUMBER, 
        pin_number2   IN NUMBER, 
        pis_operation IN VARCHAR2 )
    RETURN VARCHAR2
    IS
        -- SOAP REQUESTS/RESPONSE
        vs_soap_msg    VARCHAR2 (2000);

        -- HTTP REQUEST/RESPONSE
        http_req    UTL_HTTP.req;
        http_resp   UTL_HTTP.resp;
       
        -- regex for scientific number
        SCIENTIFIC_NUMBER_REGEX VARCHAR(35) := '[-+]?(\d*\.?\d+)([eE][-+]?\d+)?';
        vs_result varchar2(50);
    BEGIN
        -- Create SOAP request via HTTP
        soap_request_message(pin_number1, pin_number2, pis_operation, vs_soap_msg );
        
        --
        GET_HTTP_REQUEST_SETTINGS(http_req);
    
        -- set headers                      
        UTL_HTTP.set_header (http_req, 'Content-Type', 'text/xml');
        UTL_HTTP.set_header (http_req, 'Content-Length', LENGTH (vs_soap_msg));
        UTL_HTTP.set_header (http_req, 'SOAPAction', '');
        UTL_HTTP.write_text (http_req, vs_soap_msg);
        
        -- Invoke Request and get Response.
        http_resp := UTL_HTTP.get_response (http_req);
        UTL_HTTP.read_text (http_resp, vs_soap_msg);
        UTL_HTTP.end_response (http_resp);
        
        -- get result from response message
        vs_result := REGEXP_SUBSTR(
                    REGEXP_SUBSTR(
                        vs_soap_msg, 
                        '<calculateReturn>'|| SCIENTIFIC_NUMBER_REGEX ||'</calculateReturn>'
                    ),
                    SCIENTIFIC_NUMBER_REGEX
        );
        RETURN vs_result;
    END CALCULATOR;

END WEB_CALCULATOR;
