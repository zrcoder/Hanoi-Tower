//
//  UIView+Snapshot.swift
//  iOSBaseProject
//
//  Created by admin on 16/8/10.
//  Copyright © 2016年 Ding. All rights reserved.
//

import UIKit

public extension UIView {
    
    public var snapshot: UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        if let context = UIGraphicsGetCurrentContext() {
            layer.render(in: context)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
        }
        UIGraphicsEndImageContext()
        return nil        
    }
}

public extension UIScrollView {
    
    public var fullSnapshot: UIImage? {
        let originalFrame = frame
        frame.size.height = contentSize.height
        let image = snapshot
        frame = originalFrame
        return image
    }
}
