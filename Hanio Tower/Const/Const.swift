//
//  Const.swift
//  DingGame
//
//  Created by admin on 2016/12/1.
//  Copyright © 2016年 Ding. All rights reserved.
//

import UIKit

struct HanioConst {
    static let polesCount = 3
    
    static let limitedDisks = 5
    static let diskColors = [Color.red, Color.yellow, Color.green, Color.blue, Color.purple]
    
    static let diskHeight: CGFloat = 15 * scale320
    
    static let starHeight = 40 * scale320
    static let sceneTopMargin = 20 * scale320
    
    
    static let poleColor = Color.cyan
    static let poleWidth: CGFloat = 5
}

struct CardsConst {
    static let offset: (x: CGFloat, y: CGFloat) = (2, 5)
    static let colors = [Color(hex: 0x1abc9c),
                         Color(hex: 0x1BA39C),
                         Color(hex: 0x3498D8),
                         Color(hex: 0x8e44ad),
                         Color(hex: 0xFDE3A7),]
}
