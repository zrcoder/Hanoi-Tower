//
//  String+Attribute.swift
//  iOSBaseProject
//
//  Created by admin on 16/8/9.
//  Copyright © 2016年 Ding. All rights reserved.
//

import UIKit

// MARK: - AttributedString from String
public extension String {
    
    /// Returns bold NSAttributedString
    public var bold: NSAttributedString {
        let boldString = NSMutableAttributedString(string: self, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)])
        return boldString
    }
    
    /// Returns underlined NSAttributedString
    public var underline: NSAttributedString {
        let underlineString = NSAttributedString(string: self, attributes: [NSUnderlineStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue])
        return underlineString
    }
    
    /// Returns italic NSAttributedString
    public var italic: NSAttributedString {
        let italicString = NSMutableAttributedString(string: self, attributes: [NSFontAttributeName: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)])
        return italicString
    }
    
    /// Returns NSAttributedString
    public func color(_ color: UIColor) -> NSAttributedString {
        let colorString = NSMutableAttributedString(string: self, attributes: [NSForegroundColorAttributeName: color])
        return colorString
    }
    
    /// Returns NSAttributedString
    public func colorSubString(_ subString: String, color: UIColor) -> NSMutableAttributedString {
        var start = 0
        var ranges: [NSRange] = []
        while true {
            let range = (self as NSString).range(of: subString, options: NSString.CompareOptions.literal, range: NSRange(location: start, length: (self as NSString).length - start))
            if range.location == NSNotFound {
                break
            } else {
                ranges.append(range)
                start = range.location + range.length
            }
        }
        let attrText = NSMutableAttributedString(string: self)
        for range in ranges {
            attrText.addAttribute(NSForegroundColorAttributeName, value: color, range: range)
        }
        return attrText
    }

}
