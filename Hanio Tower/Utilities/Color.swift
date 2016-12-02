//
//  Color.swift
//  iOSBaseProject
//
//  Created by admin on 16/5/19.
//  Copyright © 2016年 Ding. All rights reserved.
//


import UIKit

public typealias Color = UIColor

public extension Color {
    
    /**
     Creates a color from an hex integer (e.g. 0x3498db).
     - parameter hex: A hexa-decimal UInt32 that represents a color.
     - parameter alpha: alpha, default is 1
     */
    public convenience init(hex: UInt32, alpha: CGFloat = 1) {
        let mask = 0x000000FF
        
        let red = CGFloat(Int(hex >> 16) & mask) / 255
        let green = CGFloat(Int(hex >> 8) & mask) / 255
        let blue = CGFloat(Int(hex) & mask) / 255
        
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    /**
     Creates a color from an hex string (e.g. "3498db" or "#3498db").
     If the given hex string is invalid the initialiser will create a black color.
     - parameter hexString: A hexa-decimal color string representation.
     - parameter alpha: alpha, default is 1
     */
    public convenience init(hexString: String, alpha: CGFloat = 1) {
        let scanner   = Scanner(string: hexString)
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        
        if scanner.scanHexInt32(&color) {
            self.init(hex: color, alpha: alpha)
        } else {
            self.init(hex: 0x000000, alpha: alpha)
        }
    }
    
}



