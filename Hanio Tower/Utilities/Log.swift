//
//  Log.swift
//  iOSBaseProject
//
//  Created by admin on 16/5/19.
//  Copyright © 2016年 Ding. All rights reserved.
//

import Foundation.NSString


/**
 print when debuging
 */
public func log(_ message: Any) {
    if isDebug {
        print("\(message)")
    }
}

/**
 print detail log (starts with file name, line number and method name) when debuging
 */
public func dLog(_ message: Any? = nil, file: String = #file, line: Int = #line, function: String = #function) {
    if isDebug {
        if let message = message {
            print("⭐️\((file as NSString).lastPathComponent)🔸\(line) 🌜\(function)🌛 \n\(message)")
        } else {
            print("⭐️\((file as NSString).lastPathComponent)🔸\(line) 🌜\(function)🌛")
        }
    }
}
