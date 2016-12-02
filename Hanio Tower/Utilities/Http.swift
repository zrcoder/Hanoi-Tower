//
//  Http.swift
//  iOSBaseProject
//
//  Created by admin on 16/5/20.
//  Copyright © 2016年 Ding. All rights reserved.
//

import Foundation

/**
 HTTP method definitions.
 */
public enum HttpMethod: String {
    case GET, POST
}


public struct Http {
    
    /// default host
    static var host: String {
        if isDebug {
            return "https://www.test.com"
        }
        return "https://www.normal.com"
    }
    
    /**
     Http request
     - parameter method:     GET, POST and so on
     - parameter host:       host
     - parameter path:       can be connected by parameters, e.g. "/mobileserver/searchKey.Do?key=hell0"
     - parameter parameters: can be nil
     - parameter timeout:    default is 30 seconds
     - parameter completion: if failed, data will be nil and error be generated
     */
    public static func request(_ method:HttpMethod = .GET,
                       host:String = host,
                       path:String,
                       parameters:[String : AnyObject]? = nil,
                       timeout: TimeInterval = 30,
                       completion:@escaping (_ error:NSError?, _ data:[String : AnyObject]?)->Void) {
        
        request(method, absolutePath: host + path, parameters: parameters, completion: completion)
    }
    
    /**
     Http request
     - parameter method:       GET, POST and so on
     - parameter absolutePath: host + path
     - parameter parameters:   can be nil
     - parameter timeout:      default is 30 seconds
     - parameter completion:   if failed, error will be a hint message and data will be nil
     */
    public static func request(_ method:HttpMethod = .GET,
                               absolutePath:String,
                               parameters:[String : AnyObject]? = nil,
                               timeout: TimeInterval = 30,
                               completion:@escaping (_ error:NSError?, _ data:[String : AnyObject]?)->Void) {
        
        if let url = URL(string: absolutePath) {
            
            // You can implement with Apple's native api such as URLSession or some third library such as Alamofire
            
            //  Used Apple's native api here
            
            var request = URLRequest(url: url)
            request.timeoutInterval = timeout
            request.httpMethod = method.rawValue;
            if let parData = data(with: parameters as AnyObject?) {
                request.httpBody = parData
            }
            
            dLog(combinedString(with: absolutePath, parameters: parameters))
            
            let session = URLSession.shared
            let task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                DispatchQueue.main.async {
                    guard let _:Data = data, let _:URLResponse = response , error == nil else {
                        completion(error as NSError?, nil)
                        return
                    }
                    
                    if let dictionary = JSON(with: data) {
                        completion(nil, dictionary as? [String : AnyObject])
                    } else {
                        let hint = "can't parse response data -> dictionary"
                        let error = NSError(domain: hint, code: -2, userInfo: nil)
                        completion(error, nil)
                    }
                }
            }) 
            task.resume()
            
        } else {
            let error = NSError(domain: "url error", code: -1, userInfo: nil);
            completion(error, nil)
        }
    }
}

/**
 Combine URL and parameters as a String
 - parameter URLString:  e.g. "https://www.test.com"
 - parameter parameters: e.g. ["key": "value"]
 - returns: e.g. "https://www.test.com?key=value"
 */
public func combinedString(with URLString: String, parameters: [String: AnyObject]?) -> String {
    let parString = string(with: parameters as AnyObject?)
    var urlString = URLString
    if urlString.hasSuffix("/") {
        urlString = urlString[0...urlString.length - 2]
    }
    if parString == nil {
        return URLString
    }
    var parStr = parString!
    var result = URLString
    result.append("?" as Character)
    if parStr.hasPrefix("{") {
        parStr = parStr[1...parStr.length-1]
    }
    if parStr.hasSuffix("}") {
        parStr = parStr[0...parStr.length-2]
    }
    parStr = parStr.replacingOccurrences(of: ":", with: "=")
    parStr = parStr.replacingOccurrences(of: ",", with: "&")
    parStr = parStr.replacingOccurrences(of: "\"", with: "")
    result.append(parStr)
    return result
}

