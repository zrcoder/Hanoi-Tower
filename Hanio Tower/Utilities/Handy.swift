//
//  Handy.swift
//  iOSBaseProject
//
//  Created by admin on 16/8/9.
//  Copyright © 2016年 Ding. All rights reserved.
//

public var isDebug: Bool {
    #if DEBUG  //Tip : build settings -> Swift Compiler - Custom Flags -> Other Swift Flags -> debug = -D DEBUG
        return true
    #else
        return false
    #endif
}

public var isRelease: Bool {
    return !isDebug
}