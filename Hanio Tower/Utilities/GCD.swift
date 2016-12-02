//
//  GCDWrapper.swift
//  iOSBaseProject
//
//  Created by admin on 16/8/9.
//  Copyright © 2016年 Ding. All rights reserved.
//

import Foundation

/// A little work of gcd wrapper, we can find a wonderful work with this link:
/// https://github.com/JohnEstropia/GCDKit

public typealias DispatchQueue = Dispatch.DispatchQueue

public var gcdMainQueue: DispatchQueue {
    return DispatchQueue.main
}

public func run(after seconds: Int, queue: DispatchQueue = DispatchQueue.main, action: @escaping ()->()) {
    let time = DispatchTime.now() + .seconds(seconds)
    queue.asyncAfter(deadline: time, execute: action)
}

public func run(after seconds: Double, queue: DispatchQueue = DispatchQueue.main, action: @escaping ()->()) {
    let time = DispatchTime.now() + Double(Int64(seconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    queue.asyncAfter(deadline: time, execute: action)    
}
