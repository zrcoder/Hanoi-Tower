//
//  String+TextSize.swift
//  iOSBaseProject
//
//  Created by admin on 16/8/9.
//  Copyright © 2016年 Ding. All rights reserved.
//

import UIKit

public extension String {
    /// Returns hight of rendered string
    public func height(_ width: CGFloat, font: UIFont, lineBreakMode: NSLineBreakMode?) -> CGFloat {
        var attributes: [String: AnyObject] = [NSFontAttributeName: font]
        if lineBreakMode != nil {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineBreakMode = lineBreakMode!
            attributes.updateValue(paragraphStyle, forKey: NSParagraphStyleAttributeName)
        }
        let size = CGSize(width: width, height: CGFloat(DBL_MAX))
        return ceil((self as NSString).boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes:attributes, context: nil).height)
    }

}
