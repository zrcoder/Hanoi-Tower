//
//  BaseStyle.swift
//  iOSBaseProject
//
//  Created by admin on 16/8/29.
//  Copyright © 2016年 Ding. All rights reserved.
//

import UIKit

struct BaseStyle {
    // Mark: Navigation bar
    static let backButtonImageName = "arrowLeft"
    static let navigationBarTitleColorHexValue: UInt32 = 0x474747
    static let navigationBarTitleFontSize: CGFloat = 15
    static let navigationBarTitleTextAttributes = [NSForegroundColorAttributeName: Color(hex: navigationBarTitleColorHexValue),
                                                   NSFontAttributeName: UIFont.systemFont(ofSize: navigationBarTitleFontSize)]
    static let navigationBarBackgroundColorHexValue: UInt32 = 0xbbeebb
    static let navigationBarBackgroundColor = Color(hex: navigationBarBackgroundColorHexValue)
    static let navigationBarShadowImageColor = Color.clear
    
    // Mark: Colors
    static let myGreen     = Color(hex: 0x219580)
    static let myRed       = Color(hex: 0xf15352)
    static let myBlack     = Color(hex: 0x333333)
    static let myDarkGray  = Color(hex: 0x999999)
    static let myGray      = Color(hex: 0xe1e1e1)
    static let myLightGray = Color(hex: 0xf4f4f4)
}

