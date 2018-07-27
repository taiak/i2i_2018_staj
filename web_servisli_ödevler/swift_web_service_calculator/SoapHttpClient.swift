﻿import Foundation
public class SoapHttpClient {
    public static private(set) var StatusCode:Int?
    public static private(set) var ErrorString:String?
    public static private(set) var StatusDescription:String?
    
    public class func HasError()->Bool{
        return (self.StatusCode != nil) && (self.StatusCode !=  200);
    }
    public static private(set) var Error:Error?
    public static private(set) var ResponseString:String!
    public static private(set) var ResponseData:Data?
    
    public class func ConverToByteArray(data:NSData)->[UInt8]{
        
        let _uint8size = MemoryLayout<UInt8>.size
        //let count = data.length / sizeof(UInt8)
        let count = data.length / _uint8size
        
        // create an array of Uint8
        //var array = [UInt8](count: count, repeatedValue: 0)
        var array = [UInt8](repeating: 0, count: count)
        
        
        // copy bytes into array
        //data.getBytes(&array, length: count * sizeof(UInt8))
        data.getBytes(&array, length: count * _uint8size)
        return array;
    }
    
    
    public class func callWS(Host:String,WebServiceUrl:String, SoapAction:String, SoapMessage:String)-> Data{
        self.Error = nil;
        self.ErrorString = nil;
        self.StatusCode = nil;
        self.StatusDescription = nil;
        self.ResponseData = nil;
        self.ResponseString = nil;
        
        //let semaphore = dispatch_semaphore_create(0);
        let semaphore = DispatchSemaphore.init(value: 0)
        let url = URL.init(string: WebServiceUrl)
        //let req = NSMutableURLRequest(URL: NSURL(string: WebServiceUrl)!)
        let req = NSMutableURLRequest(url: url!)
        
        //let session = NSURLSession.sharedSession()
        let session = URLSession.shared
        req.httpMethod = "POST"
        //req.httpBody = SoapMessage.dataUsingEncoding(NSUTF8StringEncoding)
        req.httpBody = SoapMessage.data(using: String.Encoding.utf8, allowLossyConversion: false)
        req.addValue(Host, forHTTPHeaderField: "Host")
        req.addValue("text/xml;charset =utf-8", forHTTPHeaderField: "Content-Type")
        
	let contentLength = SoapMessage.utf8.count
        req.addValue(String(contentLength), forHTTPHeaderField: "Content-Length")
        req.addValue(SoapAction, forHTTPHeaderField: "SOAPAction")
        
        var responseData : Data = Data()
        let task_ = session.dataTask(with: req as URLRequest){ (data, response, error) in
            
            self.Error=error
            
            if let httpResponse = response as? HTTPURLResponse {
                //print("statusCode: \(httpResponse.statusCode)")
                self.StatusCode = httpResponse.statusCode
                
                if httpResponse.statusCode != 200 {
                    self.StatusCode=httpResponse.statusCode
                    self.ErrorString=httpResponse.description
                    
                    responseData = Data()
                    self.ResponseData = Data()
                }
                else
                {
                    responseData = data!
                    self.ResponseData = data
                    let responseString =  String.init(data: data!, encoding: String.Encoding.utf8)
                    //let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                    //self.ResponseString =  responseString as! String
                    self.ResponseString = responseString!
                }
            }
            semaphore.signal()
        }
        task_.resume()
        
//        var responseData:NSData=NSData()
//        let task = session.dataTaskWithRequest(req, completionHandler: {data, response, error -> Void in
//            self.Error = error
//            if let httpResponse = response as? NSHTTPURLResponse {
//                self.StatusCode=httpResponse.statusCode;
//                
//                if httpResponse.statusCode != 200 {
//                    self.StatusCode=httpResponse.statusCode
//                    self.ErrorString=httpResponse.description
//                    responseData=NSData()
//                    self.ResponseData = NSData()
//                }
//                else
//                {
//                    responseData = data!
//                    self.ResponseData = data
//                    let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
//                    self.ResponseString =  responseString as! String
//                }
//            }
//            dispatch_semaphore_signal(semaphore);
//        })
//        task.resume()
        
        semaphore.wait()
        //dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        return responseData
    }
    public class func downloadString(host:String, url:String, soapAction:String, soapMessage:String)->String{
        let responseData       = SoapHttpClient.callWS(Host : host,WebServiceUrl:url,SoapAction:soapAction, SoapMessage:soapMessage)
        //let responseString     = NSString(data: responseData , encoding: NSUTF8StringEncoding)
        let responseString = String.init(data: responseData, encoding: String.Encoding.utf8)
        let str:String = responseString!
        return str
    }
    public class func callWSAsync(Host:String,WebServiceUrl:String,SoapAction:String, SoapMessage:String, completion :@escaping ( Swift.Error?, Data?, String)->Void){
        self.Error = nil;
        self.ErrorString = nil;
        self.StatusCode = nil;
        self.StatusDescription = nil;
        self.ResponseData = nil;
        self.ResponseString = nil;
        
        let url = URL.init(string: WebServiceUrl)
        //let req = NSMutableURLRequest(URL: NSURL(string: WebServiceUrl)!)
        let req = NSMutableURLRequest(url: url!)
        
        //let session = NSURLSession.sharedSession()
        let session = URLSession.shared
        req.httpMethod = "POST"
        //req.httpBody = SoapMessage.dataUsingEncoding(NSUTF8StringEncoding)
        req.httpBody = SoapMessage.data(using: String.Encoding.utf8, allowLossyConversion: false)
        req.addValue(Host, forHTTPHeaderField: "Host")
        req.addValue("text/xml;charset =utf-8", forHTTPHeaderField: "Content-Type")
        //req.addValue(String(SoapMessage.characters.count), forHTTPHeaderField: "Content-Length")
        
	let contentLength = SoapMessage.utf8.count
        
	req.addValue(String(contentLength), forHTTPHeaderField: "Content-Length")
        
        req.addValue(SoapAction, forHTTPHeaderField: "SOAPAction")
        
        
        let task_ = session.dataTask(with: req as URLRequest){ (data, response, error) in
            self.Error=error
            var str = ""
            if let httpResponse = response as? HTTPURLResponse {
                //print("statusCode: \(httpResponse.statusCode)")
                self.StatusCode = httpResponse.statusCode
                
                if httpResponse.statusCode != 200 {
                    self.StatusCode=httpResponse.statusCode
                    self.ErrorString=httpResponse.description
                    self.ResponseData = Data()
                }
                else
                {
                    self.ResponseData = data
                    let responseString =  String.init(data: data!, encoding: String.Encoding.utf8)
                    //let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                    //self.ResponseString =  responseString as! String
                    self.ResponseString = responseString!
                    str = responseString!
                }
            }
            //completion(Error: error!,ResponseData: data!,ResponseString: str)
            //completion(error, data, str)
            completion(error, data, str)
        }
        task_.resume()
        
    }
}


