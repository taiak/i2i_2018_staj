/*
    AUTHOR:       Taha Yasir Kiroglu
    DATE:         08.07.2018
    DESCRIPTION   call a web service for calculate some number
    FILE NAME     web_service_calculator.pkb
    VERSION:      1.0.0  
*/

-- request creator
CREATE OR REPLACE PROCEDURE CALCULATOR(
                pin_number1   IN number, 
                pin_number2   IN number, 
                pis_operation IN varchar2 )
IS
    -- SOAP REQUESTS/RESPONSE
    vs_soap_request_msg    VARCHAR2 (2000);
    vs_soap_response_msg   VARCHAR2 (2000);

    -- HTTP REQUEST/RESPONSE
    vs_http_request        UTL_HTTP.req;
    vs_http_response       UTL_HTTP.resp;

    -- regex for scientific number
    VS_SCIENTIFIC_NUMBER_REGEX VARCHAR(37) := '[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)';
    vs_calculator_return varchar2(50);
BEGIN

    -- Create SOAP request via HTTP
    --
    vs_soap_request_msg :=
    '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cal="http://calculator.calculatorwebservice.com">
        <soapenv:Header/>
        <soapenv:Body>
            <cal:calculate>
                <cal:x>'|| pin_number1 ||'</cal:x>
                <cal:y>'|| pin_number2 ||'</cal:y>
                <cal:operation>'|| pis_operation ||'</cal:operation>
            </cal:calculate>
        </soapenv:Body>
    </soapenv:Envelope>';


    -- prepare  vs_http_request
    vs_http_request :=             
        UTL_HTTP.begin_request(
            'http://209.97.129.103:8080/CalculatorWebService/services/CalculatorWebService?wsdl',
            'POST',
            'HTTP/1.1'
        );


    -- set headers                      
    UTL_HTTP.set_header (vs_http_request, 'Content-Type', 'text/xml');
    UTL_HTTP.set_header (vs_http_request, 'Content-Length', LENGTH (vs_soap_request_msg));
    UTL_HTTP.set_header (vs_http_request, 'SOAPAction', '');
    UTL_HTTP.write_text (vs_http_request, vs_soap_request_msg);

    --
    -- Invoke Request and get Response.
    --
    vs_http_response := UTL_HTTP.get_response (vs_http_request);
    UTL_HTTP.read_text (vs_http_response, vs_soap_response_msg);
    UTL_HTTP.end_response (vs_http_response);

    -- get result from response message
    vs_calculator_return := REGEXP_SUBSTR (
                REGEXP_SUBSTR (
                    vs_soap_response_msg,
                    '<calculateReturn>'|| VS_SCIENTIFIC_NUMBER_REGEX ||'</calculateReturn>'
                ),
                VS_SCIENTIFIC_NUMBER_REGEX
    );
    dbms_output.put_line(vs_calculator_return);
END CALCULATOR;

/