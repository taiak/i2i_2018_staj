package com.example.webservice.service;

import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapPrimitive;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;

public class ServiceManager {
    static SoapObject soapObject;
    static SoapSerializationEnvelope soapSerializationEnvelope;
    static HttpTransportSE httpTransportSE;
    static MarshalDouble md = new MarshalDouble();

    public static String calculator(String firstNumber, String secondNumber, String operation) {
        String NAMESPACE   = "http://209.97.129.103:8080/CalculatorWebService/services/CalculatorWebService?wsdl";
        String METHOD_NAME = "calculate";
        String SOAP_ACTION = "http://209.97.129.103:8080/CalculatorWebService/services/CalculatorWebService?wsdl/" + METHOD_NAME;
        final String URL   = "http://209.97.129.103:8080/CalculatorWebService/services/CalculatorWebService?wsdl";
        String returnedData = "";
        soapObject = new SoapObject(NAMESPACE, METHOD_NAME);
        soapSerializationEnvelope = new SoapSerializationEnvelope(SoapEnvelope.VER11);
        md.register(soapSerializationEnvelope);
        soapSerializationEnvelope.dotNet = true;
        soapSerializationEnvelope.setOutputSoapObject(soapObject);

        soapObject.addProperty("x", Double.parseDouble(firstNumber));
        soapObject.addProperty("y", Double.parseDouble(secondNumber));
        soapObject.addProperty("operation", operation);

        System.out.println("YASIR SAID: buraya gada başarılı!");
        httpTransportSE = new HttpTransportSE(URL);
        httpTransportSE.debug = true;

        try {
            httpTransportSE.call(SOAP_ACTION, soapSerializationEnvelope);
            System.out.println("YASIR SAID: Burda da çalışıyor!");
            SoapPrimitive soapPrimitive = (SoapPrimitive) soapSerializationEnvelope.getResponse();
            System.out.println("YASIR SAID: Ha burda da çalışıyo!");
            returnedData = soapPrimitive.toString();
            System.out.println("YASIR SAID: calculator returned data:" + returnedData);

        } catch (Exception ex) {
            System.out.println("SIMON SAID: exception is: " + ex);
            System.out.println("YASIR SAID: GET THE FUCK UP SIMON!");
        }

        return returnedData;
    }
}
