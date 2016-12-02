//
//  Disk.swift
//  DingGame
//
//  Created by admin on 2016/12/1.
//  Copyright © 2016年 Ding. All rights reserved.
//

import UIKit

class Disk: UIView {
    
    /// 1 <= number <= limitedDisks
    var number: Int {
        get {
            return p_number
        }
        set {
            guard newValue != p_number else { return }
            p_number = newValue
            let color = HanioConst.diskColors[newValue - 1]
            layer.backgroundColor = color.cgColor
        }
    }
    private var p_number = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = frame.size.height * 0.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
