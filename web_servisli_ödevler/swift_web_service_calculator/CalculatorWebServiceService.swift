﻿import Foundation 
public class CalculatorWebServiceService {
    public var Url:String = "http://209.97.129.103:8090/CalculatorWebService/services/CalculatorWebService"
    public var Host:String = "209.97.129.103:8090"
    
    public func dataToBase64(data:NSData)->String{        
        let result = data.base64EncodedString(options: NSData.Base64EncodingOptions.init(rawValue: 0))
        return result;
    }
    
    public func dataToBase64(data: Data)->String {
        let result = data.base64EncodedString()
        return result
    }
    
    public func byteArrayToBase64(data:[UInt])->String{
        let nsdata = NSData(bytes: data, length: data.count)
        let data  = Data.init(referencing: nsdata)
        if let str = String.init(data: data, encoding: String.Encoding.utf8){
            return str
        }
        return "";
    }
    
    public func timeToString(date:Date)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    public func dateToString(date:Date)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    public func base64ToByteArray(base64String: String) -> [UInt8] {
        let data = Data.init(base64Encoded: base64String)
        let dataCount = data!.count
        var bytes = [UInt8].init(repeating: 0, count: dataCount)
        data!.copyBytes(to: &bytes, count: dataCount)
        return bytes
    }
    
    func stringFromXMLString(xmlToParse:String)->String {
    
        let xml = SWXMLHash.lazy(xmlToParse)
        let xmlResponse : XMLIndexer? = xml.children.first?.children.first?.children.first
        let xmlResult: XMLIndexer?  = xmlResponse?.children.last
        
        let xmlElement = xmlResult?.element
        let str = xmlElement?.text
        let xmlElementFirst = xmlElement?.children[0] as!TextElement
        return xmlElementFirst.text 
    }
    
    func stringFromXML(data:Data)-> String
    {    
        let xmlToParse :String? = String.init(data: data, encoding: String.Encoding.utf8)
    
        if xmlToParse == nil {
            return ""
        }
    
        if xmlToParse!.count == 0 {
            return ""
        }
    
        let  stringVal = stringFromXMLString(xmlToParse:  xmlToParse!)
        return stringVal        
    }
    
    func stringArrFromXMLString(xmlToParse :String)->[String?]{
        let xml  = SWXMLHash.lazy(xmlToParse)
        let xmlRoot  = xml.children.first
        let xmlBody = xmlRoot?.children.last
        let xmlResponse : XMLIndexer? =  xmlBody?.children.first
        let xmlResult : XMLIndexer?  = xmlResponse?.children.last
        
        var strList = [String?]()
        let childs = xmlResult!.children
        for child in childs {
            let text = child.element?.text
            strList.append(text)
        }
        
        return strList
    }
    
    func stringArrFromXML(data:Data)->[String?]{
        let xmlToParse :String? = String.init(data: data, encoding: String.Encoding.utf8)
    
        if xmlToParse == nil {
            return [String?]()
        }
    
        if xmlToParse!.count == 0 {
            return [String?]()
        }
        
        let  stringVal = stringArrFromXMLString(xmlToParse: xmlToParse!)
        return stringVal
    }
    
    func byteArrayToBase64(bytes: [UInt8]) -> String {
    
        let data = Data.init(bytes: bytes)
        let base64Encoded = data.base64EncodedString()
        return base64Encoded;   
    }
    
    func base64ToByteArray(base64String: String) -> [UInt8]? {
        if let data = Data.init(base64Encoded: base64String){
            var bytes = [UInt8](repeating: 0, count: data.count)
            data.copyBytes(to: &bytes, count: data.count)
            return bytes;
        }
        return nil // Invalid input
    }
      
    public func add(x:Double, y:Double)-> Double{
        var soapReqXML:String = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
        
        soapReqXML += "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\""
        soapReqXML += "xmlns:cal=\"http://calculator.calculatorwebservice.com\">"
            soapReqXML += "<soapenv:Header/>"
            soapReqXML += " <soap:Body>"
                soapReqXML += "<cal:add >"
                    soapReqXML += "<cal:x>"
                        soapReqXML += String(x)
                    soapReqXML += "</cal:x>"
                    soapReqXML += "<cal:y>"
                        soapReqXML += String(y)
                    soapReqXML += "</cal:y>"
                soapReqXML += "</cal:add>"
            soapReqXML += "</soap:Body>"
        soapReqXML += "</soap:Envelope>"
    
        let soapAction :String = "http://calculator.calculatorwebservice.com/add"
    
        let responseData:Data = SoapHttpClient.callWS(Host : self.Host, WebServiceUrl:self.Url, SoapAction:soapAction, SoapMessage:soapReqXML)
        let strVal :String? = stringFromXML(data : responseData);
        
        if strVal == nil {
            return  0
        }
    
        let returnValue:Double = strVal!.toDouble()!
        return returnValue
    }
    
    public func log(base:Double, number:Double)-> Double{
        var soapReqXML:String = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
        soapReqXML += "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\""
        soapReqXML += "xmlns:cal=\"http://calculator.calculatorwebservice.com\">"
            soapReqXML += "<soapenv:Header/>"
            soapReqXML += " <soap:Body>"
                soapReqXML += "<cal:log>"
                    soapReqXML += "<cal:base>"
                        soapReqXML += String(base)
                    soapReqXML += "</cal:base>"
                    soapReqXML += "<cal:number>"
                        soapReqXML += String(number)
                    soapReqXML += "</cal:number>"
                soapReqXML += "</cal:log>"
            soapReqXML += "</soap:Body>"
        soapReqXML += "</soap:Envelope>"
        
        let soapAction :String = "http://calculator.calculatorwebservice.com/log"
        
        let responseData:Data = SoapHttpClient.callWS(Host : self.Host, WebServiceUrl:self.Url, SoapAction:soapAction, SoapMessage:soapReqXML)
        let strVal :String? = stringFromXML(data : responseData);
        
        if strVal == nil {
            return  0
        }
        
        let returnValue:Double = strVal!.toDouble()!
        return returnValue
    }
    
    public func mod(dividend:Double, divisor:Double)-> Double{
        var soapReqXML:String = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
        soapReqXML += "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\""
        soapReqXML += "xmlns:cal=\"http://calculator.calculatorwebservice.com\">"
            soapReqXML += "<soapenv:Header/>"
            soapReqXML += " <soap:Body>"
                soapReqXML += "<cal:mod >"
                    soapReqXML += "<cal:dividend>"
                        soapReqXML += String(dividend)
                    soapReqXML += "</cal:dividend>"
                    soapReqXML += "<cal:divisor>"
                        soapReqXML += String(divisor)
                    soapReqXML += "</cal:divisor>"
                soapReqXML += "</cal:mod>"
            soapReqXML += "</soap:Body>"
        soapReqXML += "</soap:Envelope>"
    
        let soapAction :String = "http://calculator.calculatorwebservice.com/mod"
    
        let responseData:Data = SoapHttpClient.callWS(Host : self.Host, WebServiceUrl:self.Url, SoapAction:soapAction, SoapMessage:soapReqXML)
        let strVal :String? = stringFromXML(data : responseData);
        if strVal == nil {
            return  0
        }
    
        let returnValue:Double = strVal!.toDouble()!
        return returnValue
    }
    
    public func multiply(x:Double, y:Double)-> Double{
       var soapReqXML:String = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
    
        soapReqXML += "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\""
        soapReqXML += "xmlns:cal=\"http://calculator.calculatorwebservice.com\">"
            soapReqXML += "<soapenv:Header/>"
            soapReqXML += " <soap:Body>"
                soapReqXML += "<cal:multiply>"
                    soapReqXML += "<cal:x>"
                        soapReqXML += String(x)
                    soapReqXML += "</cal:x>"
                    soapReqXML += "<cal:y>"
                        soapReqXML += String(y)
                    soapReqXML += "</cal:y>"
                soapReqXML += "</cal:multiply>"
            soapReqXML += "</soap:Body>"
        soapReqXML += "</soap:Envelope>"
    
        let soapAction :String = "http://calculator.calculatorwebservice.com/multiply"
    
        let responseData:Data = SoapHttpClient.callWS(Host : self.Host, WebServiceUrl:self.Url, SoapAction:soapAction, SoapMessage:soapReqXML)
        let strVal :String? = stringFromXML(data : responseData);
        if strVal == nil {
            return  0
        }
    
        let returnValue:Double = strVal!.toDouble()!
        return returnValue
    }
    
    public func sub(x:Double, y:Double)-> Double{
        var soapReqXML:String = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
        soapReqXML += "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\""
        soapReqXML += "xmlns:cal=\"http://calculator.calculatorwebservice.com\">"
            soapReqXML += "<soapenv:Header/>"
            soapReqXML += " <soap:Body>"
                soapReqXML += "<cal:sub>"
                    soapReqXML += "<cal:x>"
                        soapReqXML += String(x)
                    soapReqXML += "</cal:x>"
                    soapReqXML += "<cal:y>"
                        soapReqXML += String(y)
                    soapReqXML += "</cal:y>"
                soapReqXML += "</cal:sub>"
            soapReqXML += "</soap:Body>"
        soapReqXML += "</soap:Envelope>"
    
        let soapAction :String = "http://calculator.calculatorwebservice.com/sub"
    
        let responseData:Data = SoapHttpClient.callWS(Host : self.Host, WebServiceUrl:self.Url, SoapAction:soapAction, SoapMessage:soapReqXML)
        let strVal :String? = stringFromXML(data : responseData);
        if strVal == nil {
            return  0
        }
        let returnValue:Double = strVal!.toDouble()!
        return returnValue
    }
    
    public func div(dividend:Double, divisor:Double)-> Double{
        var soapReqXML:String = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
        soapReqXML += "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\""
        soapReqXML += "xmlns:cal=\"http://calculator.calculatorwebservice.com\">"
            soapReqXML += "<soapenv:Header/>"
            soapReqXML += " <soap:Body>"
                soapReqXML += "<cal:div>"
                    soapReqXML += "<cal:dividend>"
                        soapReqXML += String(dividend)
                    soapReqXML += "</cal:dividend>"
                    soapReqXML += "<cal:divisor>"
                        soapReqXML += String(divisor)
                    soapReqXML += "</cal:divisor>"
                soapReqXML += "</cal:div>"
            soapReqXML += "</soap:Body>"
        soapReqXML += "</soap:Envelope>"
    
        let soapAction :String = "http://calculator.calculatorwebservice.com/div"
    
        let responseData:Data = SoapHttpClient.callWS(Host : self.Host, WebServiceUrl:self.Url, SoapAction:soapAction, SoapMessage:soapReqXML)
        let strVal :String? = stringFromXML(data : responseData);
        if strVal == nil {
            return  0
        }
    
        let returnValue:Double = strVal!.toDouble()!
        return returnValue
    }
        
    public func calculate(x:Double, y:Double, operation:String)-> Double{
        var soapReqXML:String = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
        soapReqXML += "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\""
        soapReqXML += "xmlns:cal=\"http://calculator.calculatorwebservice.com\">"
            soapReqXML += "<soapenv:Header/>"
            soapReqXML += " <soap:Body>"
                soapReqXML += "<cal:calculate>"
                    soapReqXML += "<cal:x>"
                        soapReqXML += String(x)
                    soapReqXML += "</cal:x>"
                    soapReqXML += "<cal:y>"
                        soapReqXML += String(y)
                    soapReqXML += "</cal:y>"
                    soapReqXML += "<cal:operation>"
                        soapReqXML += operation
                    soapReqXML += "</cal:operation>"
                soapReqXML += "</cal:calculate>"
            soapReqXML += "</soap:Body>"
        soapReqXML += "</soap:Envelope>"
    
        let soapAction :String = "http://calculator.calculatorwebservice.com/calculate"
    
        let responseData:Data = SoapHttpClient.callWS(Host : self.Host, WebServiceUrl:self.Url, SoapAction:soapAction, SoapMessage:soapReqXML)
        let strVal :String? = stringFromXML(data : responseData);
        if strVal == nil {
            return  0
        }
    
        let returnValue:Double = strVal!.toDouble()!
        return returnValue
    }
}