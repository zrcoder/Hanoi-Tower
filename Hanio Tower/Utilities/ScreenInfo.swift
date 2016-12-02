//
//  ScreenInfo.swift
//  iOSBaseProject
//
//  Created by admin on 16/8/9.
//  Copyright © 2016年 Ding. All rights reserved.
//

import UIKit

/// Bounds of the main screen
public var screenBounds: CGRect {
    return UIScreen.main.bounds
}

/// Size of the main screen
public var screenSize: CGSize {
    return screenBounds.size
}

/// Width of the main screen
public var screenWidth: CGFloat {
    return screenSize.width
}


/// Used to transform size designed in 320 * 480 to actual size
public var scale320: CGFloat {
    return screenWidth / 320
}

/// Height of the main screen
public var screenHeight: CGFloat {
    return screenSize.height
}

/// Heitht of the status bar
public var statusBarHeight: CGFloat {
    return UIApplication.shared.statusBarFrame.height
}
