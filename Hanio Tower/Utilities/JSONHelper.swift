//
//  JSONHelper.swift
//  iOSBaseProject
//
//  Created by admin on 16/5/21.
//  Copyright © 2016年 Ding. All rights reserved.
//

import Foundation

/**
 Parse JSON (Array, Dictionary...) to NSData
 */
public func data(with JSON:AnyObject?) -> Data? {
    if let object = JSON {
        do {
            let data = try JSONSerialization.data(withJSONObject: object, options: JSONSerialization.WritingOptions())
            return data
        } catch let error as NSError {
            dLog("JSON->NSData failed:\(error)")
        }
    }
    return nil
}

/**
 Parse NSData to JSON (Array, Dictionary...)
 */
public func JSON(with data:Data?) -> AnyObject? {
    if let data = data {
        do {
            let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            return object as AnyObject?
        } catch let error as NSError {
            dLog("NSData->JSON failed:\(error)")
        }
    }
    return nil
}

/**
 Parse NSData to String
 */
public func string(with data:Data?) -> String? {
    if let data = data {
        return String(data: data, encoding: String.Encoding.utf8)
    }
    return nil
}

/**
 Parse String to NSData
 */
public func data(with string:String?) -> Data? {
    if let string = string {
        return string.data(using: String.Encoding.utf8)
    }
    return nil
}

/**
 Parse String to JSON (Array, Dictionary...)
 */
public func JSON(with string:String?) -> AnyObject? {
    let stringData = data(with: string)
    return JSON(with: stringData)
}

/**
 Parse JSON (Array, Dictionary...) to String
 */
public func string(with JSON:AnyObject?) -> String? {
    let jsonData = data(with: JSON)
    return string(with: jsonData)
}
