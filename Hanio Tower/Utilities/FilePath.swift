//
//  FilePath.swift
//  iOSBaseProject
//
//  Created by admin on 16/8/10.
//  Copyright © 2016年 Ding. All rights reserved.
//

import Foundation

/**
 *  Path of file in the main bundle
 */
public func bundlePath(for fileName: String) -> String {
    return (Bundle.main.bundlePath as NSString).appendingPathComponent(fileName)
}
/**
 *  Path of file in the sand box // document
 */
public func documentPath(for fileName: String) -> String {
    return (documentPath as NSString).appendingPathComponent(fileName)
}

/// Document path in the sand box
public var documentPath: String {
    return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
}


public func appGroupDocumentPath(id appGroupId: String) -> String? {
    let url = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroupId)
    let path = url?.absoluteString.replacingOccurrences(of: "file:", with: "", options: .literal, range: nil)
    return path
}
